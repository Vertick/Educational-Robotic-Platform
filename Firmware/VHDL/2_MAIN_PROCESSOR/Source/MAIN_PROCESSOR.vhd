----------------------------------------------------------------------------------------------------
-- Block name: MAIN_PROCESSOR                                                                     --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: FPGA_MAIN_MODULE_Package; RS232_Package.                                         --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 25/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.FPGA_MAIN_MODULE_Package.all;
use work.RS232_Package.all;

entity MAIN_PROCESSOR is
  port (
    -- Clock and Reset signals
    CLK_50MHZ           : in  std_logic;                                            -- 32 MHz clock
    nRESET              : in  std_logic;                                            -- Asynchronous reset (Active LOW)
    -- UART_BLUETOOTH ports interface
    UART_BT_IN_FRAME    : in  std_logic_vector(7 downto 0);                         -- Received frame data.
    UART_BT_IN_RECEIVED : in  std_logic;                                            -- New frame data received.
    UART_BT_OUT_FRAME   : out std_logic_vector(7 downto 0);                         -- Frame data to be transmited.
    UART_BT_OUT_SEND    : out std_logic;                                            -- Command to start the transmission of a frame.
    -- UART_SHIELD ports interface
    UART_SH_IN_FRAME    : in  std_logic_vector(7 downto 0);                         -- Received frame data.
    UART_SH_IN_RECEIVED : in  std_logic;                                            -- New frame data received.
    UART_SH_OUT_FRAME   : out std_logic_vector(7 downto 0);                         -- Frame data to be transmited.
    UART_SH_OUT_SEND    : out std_logic;                                            -- Command to start the transmission of a frame.
    -- UART_ARDUINO ports interface
    UART_AR_IN_FRAME    : in  ARDUINO_FRAME_ARRAY;                                  -- Received frame data.
    UART_AR_IN_RECEIVED : in  std_logic_vector(ARDUINO_BOARDS-1 downto 0);          -- New frame data received.
    UART_AR_OUT_FRAME   : out ARDUINO_FRAME_ARRAY;                                  -- Frame data to be transmited.
    UART_AR_OUT_SEND    : out std_logic_vector(ARDUINO_BOARDS-1 downto 0);          -- Command to start the transmission of a frame.
    -- DISCRETE_COMM_SHIELD ports interface
    DISC_IN_SH_EDGE     : in  std_logic_vector(2 downto 0);                         -- Edge detected in discrete inputs.
    DISC_OUT_SH_LEVEL   : out std_logic_vector(8 downto 0);                         -- Commanded level for discrete outputs.
    -- PWM_MONITORING_ARDUINO ports interface
    PWM_AR_PULSE_HI     : in  PWM_ARDUINO_PULSE_ARRAY;                              -- PWM high level pulse in milliseconds.
    PWM_AR_PULSE_LO     : in  PWM_ARDUINO_PULSE_ARRAY;                              -- PWM low level pulse in milliseconds.
    -- DISCRETE_COMM_ARDUINO ports interface
    DISC_IN_AR_EDGE     : in  std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0);  -- Edge detected in discrete inputs.
    DISC_OUT_AR_LEVEL   : out std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0)); -- Commanded level for discrete outputs.

end MAIN_PROCESSOR;

architecture RTL of MAIN_PROCESSOR is

  ----------------------------------------------------------------------------------------------------
  -- COMPONENT DECLARATIONS                                                                         --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- SIGNAL DECLARATIONS                                                                            --
  ----------------------------------------------------------------------------------------------------

  -- UART BT control
  signal BT_TRANSFER_TIMER : integer range 1 to BT_TRANSFER_TIMER_LIMIT; -- Timer to control the UART transmission.
  signal UART_BT_STATE     : UART_BT_STATE_TYPE; -- Current state for UART FSM.
  signal BT_DATA_COUNTER   : integer range 0 to UART_BT_MSG_LENGTH; -- Counter to control the transmited data.
  signal UART_BT_MSG2SEND  : UART_BT_MSG2SEND_TYPE := UART_BT_START_RESPONSE; -- Message to be sent.
  signal BT_TX_ACTIVE      : std_logic; -- BT UART transmission active flag.
  signal BT_CHAR_2_SEND    : std_logic_vector(7 downto 0); -- Character to be sent.
  signal SHIELD_STATUS_CHAR : UART_BT_MSG2SEND_TYPE; -- SHIELD status data in char format.
  signal ARDUINO_STATUS_CHAR : UART_BT_MSG2SEND_TYPE; -- ARDUINO status data in char format.
  signal SHIELD_STATUS_UPDATED : std_logic; -- Signal to indicate that SHIELD has been updated.
  signal ARDUINO_STATUS_UPDATED : std_logic; -- Signal to indicate that ARDUINO has been updated.
  -- UART control
  signal TRANSFER_TIMER   : integer range 1 to TRANSFER_TIMER_LIMIT;   -- Timer to control the UART transmission.
  signal UART_STATE       : UART_STATE_TYPE;                           -- Current state for UART FSM.
  signal DATA_COUNTER     : integer range 0 to UART_MSG_LENGTH;        -- Counter to control the transmited data.
  signal UART_MSG2SEND    : UART_MSG2SEND_TYPE; -- Message to be sent.
  signal TX_ACTIVE        : std_logic; -- UART transmission active flag.
  signal CHAR_2_SEND      : std_logic_vector(7 downto 0);              -- Character to be sent.
  -- Discrete signals control
  signal s_DISC_OUT_SH_LEVEL : std_logic_vector(8 downto 0); -- Signal to use assigned value for commanded level for discrete outputs.
  signal s_DISC_OUT_AR_LEVEL : std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0); -- Signal to use assigned value for commanded level for discrete outputs.

  begin

    ----------------------------------------------------------------------------------------------------
    -- COMPONENT INSTANTIATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------
    -- None.

    ----------------------------------------------------------------------------------------------------
    -- LOCAL RTL/FUNCTIONS AND PROCEDURES                                                             --
    ----------------------------------------------------------------------------------------------------

    ----------------------------------------------------------------------------------------------------
    -- BT SERIAL COMMUNICATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------

    -- SHIELD status data

    START_SHIELD_STATUS_TO_ASCII_GEN: for I in 0 to 15 generate
      SHIELD_STATUS_CHAR(I) <= UART_BT_SHIELD_DATA(I);
    end generate START_SHIELD_STATUS_TO_ASCII_GEN;

    SHIELD_STATUS_CHAR(16) <= UART_SH_IN_FRAME;
    SHIELD_STATUS_CHAR(17 to 18) <= (CHAR_LINE_FEED, CHAR_CR);

    SHIELD_STATUS_TO_ASCII_GEN: for I in 0 to 2 generate
      SHIELD_STATUS_TO_ASCII: process(CLK_50MHZ)
        begin
          if rising_edge(CLK_50MHZ) then
            if nRESET = '0' then
              SHIELD_STATUS_CHAR(2*I+19 to 2*I+20) <= (CHAR_ZERO, CHAR_SPACE);
            else
              if DISC_IN_SH_EDGE(I) = '1' then
                SHIELD_STATUS_CHAR(2*I+19 to 2*I+20) <= (CHAR_ONE, CHAR_SPACE);
              else
                SHIELD_STATUS_CHAR(2*I+19 to 2*I+20) <= (CHAR_ZERO, CHAR_SPACE);
              end if;
            end if;
          end if;
      end process SHIELD_STATUS_TO_ASCII;
    end generate SHIELD_STATUS_TO_ASCII_GEN;

    SHIELD_STATUS_CHAR(25 to 26) <= (CHAR_LINE_FEED, CHAR_CR);

    END_SHIELD_STATUS_TO_ASCII_GEN: for I in 27 to UART_BT_MSG_LENGTH-1 generate
      SHIELD_STATUS_CHAR(I) <= CHAR_SPACE;
    end generate END_SHIELD_STATUS_TO_ASCII_GEN;

    -- ARDUINO status data

    START_ARDUINO_STATUS_TO_ASCII_GEN: for I in 0 to 16 generate
      ARDUINO_STATUS_CHAR(I) <= UART_BT_ARDUINO_DATA(I);
    end generate START_ARDUINO_STATUS_TO_ASCII_GEN;

    FRAME_ARDUINO_STATUS_TO_ASCII_GEN: for I in 0 to ARDUINO_BOARDS-1 generate
      ARDUINO_STATUS_CHAR(I+17) <= UART_AR_IN_FRAME(I);
    end generate FRAME_ARDUINO_STATUS_TO_ASCII_GEN;

    ARDUINO_STATUS_CHAR(21 to 22) <= (CHAR_LINE_FEED, CHAR_CR);

    ARDUINO_PWM_STATUS_TO_ASCII_GEN: for I in 0 to ARDUINO_BOARDS*PWM_AR_PORTS-1 generate
      ARDUINO_PWM_STATUS_TO_ASCII: process(CLK_50MHZ)
        begin
          if rising_edge(CLK_50MHZ) then
            if nRESET = '0' then
              ARDUINO_STATUS_CHAR(4*I+23 to 4*I+26) <= (CHAR_ZERO, CHAR_SPACE, CHAR_ZERO, CHAR_SPACE);
            else
              ARDUINO_STATUS_CHAR(4*I+23 to 4*I+26) <= (PWM_AR_PULSE_HI(I), CHAR_SPACE,
                                                        PWM_AR_PULSE_LO(I),CHAR_SPACE);
            end if;
          end if;
      end process ARDUINO_PWM_STATUS_TO_ASCII;
    end generate ARDUINO_PWM_STATUS_TO_ASCII_GEN;

    ARDUINO_STATUS_CHAR(119 to 120) <= (CHAR_LINE_FEED, CHAR_CR);

    ARDUINO_DISC_STATUS_TO_ASCII_GEN: for I in 0 to ARDUINO_DISCRETE_PORTS-1 generate
      ARDUINO_DISC_STATUS_TO_ASCII: process(CLK_50MHZ)
        begin
          if rising_edge(CLK_50MHZ) then
            if nRESET = '0' then
              ARDUINO_STATUS_CHAR(2*I+121 to 2*I+122) <= (CHAR_ZERO, CHAR_SPACE);
            else
              if DISC_IN_AR_EDGE(I) = '1' then
                ARDUINO_STATUS_CHAR(2*I+121 to 2*I+122) <= (CHAR_ONE, CHAR_SPACE);
              else
                ARDUINO_STATUS_CHAR(2*I+121 to 2*I+122) <= (CHAR_ZERO, CHAR_SPACE);
              end if;
            end if;
          end if;
      end process ARDUINO_DISC_STATUS_TO_ASCII;
    end generate ARDUINO_DISC_STATUS_TO_ASCII_GEN;

    ARDUINO_STATUS_CHAR(145 to 146) <= (CHAR_LINE_FEED, CHAR_CR);

    -- FSM for transmission by UART_BT
    UART_BT_FSM: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_BT_STATE <= IDLE;
            UART_BT_MSG2SEND <= UART_BT_START_RESPONSE;
            UART_BT_OUT_SEND <= '0';
          else
            case UART_BT_STATE is
              when IDLE => -- UART_BT is waiting to start a transmission
                if UART_BT_IN_RECEIVED = '1' then -- A data has been received from UART_BT
                  UART_BT_STATE <= START_RESPONSE;
                  UART_BT_MSG2SEND <= UART_BT_START_RESPONSE; -- Message is loaded with UART_BT_START_RESPONSE
                  UART_BT_OUT_SEND <= '1';
                elsif SHIELD_STATUS_UPDATED = '1' then -- SHIELD status has been updated
                  UART_BT_STATE <= SHIELD_STATUS_DATA;
                  UART_BT_MSG2SEND <= SHIELD_STATUS_CHAR; -- Message is loaded with SHIELD status
                  UART_BT_OUT_SEND <= '1';
                elsif ARDUINO_STATUS_UPDATED = '1' then -- ARDUINO status has been updated
                  UART_BT_STATE <= ARDUINO_STATUS_DATA;
                  UART_BT_MSG2SEND <= ARDUINO_STATUS_CHAR; -- Message is loaded with ARDUINO status
                  UART_BT_OUT_SEND <= '1';
                else
                  UART_BT_STATE <= IDLE;
                  UART_BT_OUT_SEND <= '0';
                end if;
              when START_RESPONSE => -- UART_BT is sending start response
                if BT_TX_ACTIVE = '0' then
                  UART_BT_STATE <= IDLE; -- The transmission has finished
                else
                  UART_BT_STATE <= START_RESPONSE;
                  if BT_TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
                    UART_BT_OUT_SEND <= '1';
                  else
                    UART_BT_OUT_SEND <= '0';
                  end if;
                end if;
              when SHIELD_STATUS_DATA => -- UART_BT is sending new data from SHIELD
                UART_BT_OUT_SEND <= '0';
                if BT_TX_ACTIVE = '0' then
                  UART_BT_STATE <= IDLE; -- The transmission has finished
                else
                  UART_BT_STATE <= SHIELD_STATUS_DATA;
                  if BT_TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
                    UART_BT_OUT_SEND <= '1';
                  else
                    UART_BT_OUT_SEND <= '0';
                  end if;
                end if;
              when ARDUINO_STATUS_DATA => -- UART_BT is sending new data from ARDUINO
                UART_BT_OUT_SEND <= '0';
                if BT_TX_ACTIVE = '0' then
                  UART_BT_STATE <= IDLE; -- The transmission has finished
                else
                  UART_BT_STATE <= ARDUINO_STATUS_DATA;
                  if BT_TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
                    UART_BT_OUT_SEND <= '1';
                  else
                    UART_BT_OUT_SEND <= '0';
                  end if;
                end if;
            end case;
          end if;
        end if;
    end process UART_BT_FSM;

  -- When data is received is driven to the TX Machine
  BT_LOAD_DATA_2_SEND: process(CLK_50MHZ)
    begin
      if rising_edge(CLK_50MHZ) then
        if nRESET = '0' then
          UART_BT_OUT_FRAME <= (others => '0');
        else
          if UART_BT_STATE = START_RESPONSE then
            UART_BT_OUT_FRAME <= BT_CHAR_2_SEND;
          elsif UART_BT_STATE = SHIELD_STATUS_DATA then
            UART_BT_OUT_FRAME <= BT_CHAR_2_SEND;
          elsif UART_BT_STATE = ARDUINO_STATUS_DATA then
            UART_BT_OUT_FRAME <= BT_CHAR_2_SEND;
          elsif TRANSFER_TIMER = TRANSFER_TIMER_LIMIT and DATA_COUNTER < UART_MSG_LENGTH then
            UART_BT_OUT_FRAME <= BT_CHAR_2_SEND;
          end if;
        end if;
      end if;
  end process BT_LOAD_DATA_2_SEND;

  BT_START_TX: process(CLK_50MHZ)
    begin
      if rising_edge(CLK_50MHZ) then
        if nRESET = '0' then
          BT_TX_ACTIVE <= '0';
        else
          if UART_BT_IN_RECEIVED = '1' then -- A transmission is active when data has been received from UART_BT
            BT_TX_ACTIVE <= '1';
          elsif SHIELD_STATUS_UPDATED = '1' then -- A transmission is active when SHIELD status has been updated
            BT_TX_ACTIVE <= '1';
          elsif ARDUINO_STATUS_UPDATED = '1' then -- A transmission is active when ARDUINO status has been updated
            BT_TX_ACTIVE <= '1';
          elsif BT_DATA_COUNTER = UART_BT_MSG_LENGTH-1 then
            BT_TX_ACTIVE <= '0';  -- A transmission has finished when all data has been sent
          end if;
        end if;
      end if;
  end process BT_START_TX;

  -- Timer Count, 100 us
  BT_TRANSFER_GEN_TIMER: process(CLK_50MHZ)
    begin
      if rising_edge(CLK_50MHZ) then
        if nRESET = '0' then
          BT_TRANSFER_TIMER <= 1;
        else
          if BT_TX_ACTIVE = '1' then
            if BT_TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
              BT_TRANSFER_TIMER <= 1;
            else
              BT_TRANSFER_TIMER <= BT_TRANSFER_TIMER + 1;
            end if;
          else
            BT_TRANSFER_TIMER <= 1;
          end if;
        end if;
      end if;
  end process BT_TRANSFER_GEN_TIMER;

  BT_DATA_GEN_COUNTER: process(CLK_50MHZ)
    begin
      if rising_edge(CLK_50MHZ) then
        if nRESET = '0' then
          BT_DATA_COUNTER <= 0;  
        else
          if UART_BT_STATE = IDLE then
            BT_DATA_COUNTER <= 0;
          elsif BT_TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
            BT_DATA_COUNTER <= BT_DATA_COUNTER + 1;
          end if;
        end if;
      end if;
  end process BT_DATA_GEN_COUNTER;

  BT_CHAR_2_SEND <= (others => '0') when BT_DATA_COUNTER = UART_BT_MSG_LENGTH
               else UART_BT_MSG2SEND(BT_DATA_COUNTER);

    ----------------------------------------------------------------------------------------------------
    -- SHIELD & ARDUINO SERIAL COMMUNICATIONS                                                         --
    ----------------------------------------------------------------------------------------------------

    -- FSM for transmission by UART_SH or UART_AR
    UART_FSM: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_STATE <= IDLE;
            UART_SH_OUT_SEND <= '0';
            UART_AR_OUT_SEND <= (others => '0');
          else
            case UART_STATE is
              when IDLE => -- UART_BT is waiting to start a transmission
                if UART_SH_IN_RECEIVED = '1' then -- A data has been received from UART_SH
                  UART_STATE <= RESPONSE_TO_SHIELD;
                  UART_SH_OUT_SEND <= '1';
                elsif UART_AR_IN_RECEIVED(0) = '1' then -- A data has been received from UART_AR 1
                  UART_STATE <= RESPONSE_TO_ARDUINO_1;
                  UART_AR_OUT_SEND(0) <= '1';
                elsif UART_AR_IN_RECEIVED(1) = '1' then -- A data has been received from UART_AR 2
                  UART_STATE <= RESPONSE_TO_ARDUINO_2;
                  UART_AR_OUT_SEND(1) <= '1';
                elsif UART_AR_IN_RECEIVED(2) = '1' then -- A data has been received from UART_AR 3
                  UART_STATE <= RESPONSE_TO_ARDUINO_3;
                  UART_AR_OUT_SEND(2) <= '1';
                elsif UART_AR_IN_RECEIVED(3) = '1' then -- A data has been received from UART_AR 4
                  UART_STATE <= RESPONSE_TO_ARDUINO_4;
                  UART_AR_OUT_SEND(3) <= '1';
                else
                  UART_STATE <= IDLE;
                  UART_SH_OUT_SEND <= '0';
                  UART_AR_OUT_SEND <= (others => '0');
                end if;
              when RESPONSE_TO_SHIELD => -- UART_SH is sending start response
                UART_SH_OUT_SEND <= '0';
                if TX_ACTIVE = '0' then
                  UART_STATE <= IDLE; -- The transmission has finished
                else
                  UART_STATE <= RESPONSE_TO_SHIELD;
                  if TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
                    UART_SH_OUT_SEND <= '1';
                  else
                    UART_SH_OUT_SEND <= '0';
                  end if;
                end if;
              when RESPONSE_TO_ARDUINO_1 => -- UART_AR_1 is sending start response
                UART_AR_OUT_SEND(0) <= '0';
                if TX_ACTIVE = '0' then
                  UART_STATE <= IDLE; -- The transmission has finished
                else
                  UART_STATE <= RESPONSE_TO_ARDUINO_1;
                  if TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
                    UART_AR_OUT_SEND(0) <= '1';
                  else
                    UART_AR_OUT_SEND(0) <= '0';
                  end if;
                end if;
              when RESPONSE_TO_ARDUINO_2 => -- UART_AR_2 is sending start response
                UART_AR_OUT_SEND(1) <= '0';
                if TX_ACTIVE = '0' then
                  UART_STATE <= IDLE; -- The transmission has finished
                else
                  UART_STATE <= RESPONSE_TO_ARDUINO_2;
                  if TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
                    UART_AR_OUT_SEND(1) <= '1';
                  else
                    UART_AR_OUT_SEND(1) <= '0';
                  end if;
                end if;
              when RESPONSE_TO_ARDUINO_3 => -- UART_AR_3 is sending start response
                UART_AR_OUT_SEND(2) <= '0';
                if TX_ACTIVE = '0' then
                  UART_STATE <= IDLE; -- The transmission has finished
                else
                  UART_STATE <= RESPONSE_TO_ARDUINO_3;
                  if TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
                    UART_AR_OUT_SEND(2) <= '1';
                  else
                    UART_AR_OUT_SEND(2) <= '0';
                  end if;
                end if;
              when RESPONSE_TO_ARDUINO_4 => -- UART_AR_4 is sending start response
                UART_AR_OUT_SEND(3) <= '0';
                if TX_ACTIVE = '0' then
                  UART_STATE <= IDLE; -- The transmission has finished
                else
                  UART_STATE <= RESPONSE_TO_ARDUINO_4;
                  if TRANSFER_TIMER = BT_TRANSFER_TIMER_LIMIT then
                    UART_AR_OUT_SEND(3) <= '1';
                  else
                    UART_AR_OUT_SEND(3) <= '0';
                  end if;
                end if;
            end case;
          end if;
        end if;
    end process UART_FSM;

    UART_MSG2SEND <= UART_ACK_RESPONSE; -- Message is loaded with UART_ACK_RESPONSE

    -- When data is received is driven to the TX Machine
    LOAD_DATA_2_SEND: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_SH_OUT_FRAME <= (others => '0');
            UART_AR_OUT_FRAME <= ((others => '0'), (others => '0'), (others => '0'), (others => '0'));
          else
            if UART_STATE = RESPONSE_TO_SHIELD then
              UART_SH_OUT_FRAME <= CHAR_2_SEND;
            elsif UART_STATE = RESPONSE_TO_ARDUINO_1 then
              UART_AR_OUT_FRAME(0) <= CHAR_2_SEND;
            elsif UART_STATE = RESPONSE_TO_ARDUINO_2 then
              UART_AR_OUT_FRAME(1) <= CHAR_2_SEND;
            elsif UART_STATE = RESPONSE_TO_ARDUINO_3 then
              UART_AR_OUT_FRAME(2) <= CHAR_2_SEND;
            elsif UART_STATE = RESPONSE_TO_ARDUINO_4 then
              UART_AR_OUT_FRAME(3) <= CHAR_2_SEND;
            elsif TRANSFER_TIMER = TRANSFER_TIMER_LIMIT and DATA_COUNTER < UART_MSG_LENGTH then
              UART_SH_OUT_FRAME <= CHAR_2_SEND;
              UART_AR_OUT_FRAME(0) <= CHAR_2_SEND;
              UART_AR_OUT_FRAME(1) <= CHAR_2_SEND;
              UART_AR_OUT_FRAME(2) <= CHAR_2_SEND;
              UART_AR_OUT_FRAME(3) <= CHAR_2_SEND;
            end if;
          end if;
        end if;
    end process LOAD_DATA_2_SEND;

    START_TX: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            TX_ACTIVE <= '0';
          else
            if UART_SH_IN_RECEIVED = '1' then -- A transmission is active when SHIELD status has been updated
              TX_ACTIVE <= '1';
            elsif UART_AR_IN_RECEIVED(0) = '1' or UART_AR_IN_RECEIVED(1) = '1'
               or UART_AR_IN_RECEIVED(2) = '1' or UART_AR_IN_RECEIVED(3) = '1' then -- A transmission is active when ARDUINO status has been updated
              TX_ACTIVE <= '1';
            elsif DATA_COUNTER = UART_MSG_LENGTH-1 then
              TX_ACTIVE <= '0';  -- A transmission has finished when all data has been sent
            end if;
          end if;
        end if;
    end process START_TX;

    -- Timer Count, 100 us
    TRANSFER_GEN_TIMER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            TRANSFER_TIMER <= 1;
          else
            if TX_ACTIVE = '1' then
              if TRANSFER_TIMER = TRANSFER_TIMER_LIMIT then
                TRANSFER_TIMER <= 1;
              else
                TRANSFER_TIMER <= TRANSFER_TIMER + 1;
              end if;
            else
              TRANSFER_TIMER <= 1;
            end if;
          end if;
        end if;
    end process TRANSFER_GEN_TIMER;

    DATA_GEN_COUNTER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            DATA_COUNTER <= 0;  
          else
            if UART_STATE = IDLE then
              DATA_COUNTER <= 0;
            elsif TRANSFER_TIMER = TRANSFER_TIMER_LIMIT then
              DATA_COUNTER <= DATA_COUNTER + 1;
            end if;
          end if;
        end if;
    end process DATA_GEN_COUNTER;

    CHAR_2_SEND <= (others => '0') when DATA_COUNTER = UART_MSG_LENGTH
              else UART_MSG2SEND(DATA_COUNTER);

    ----------------------------------------------------------------------------------------------------
    -- DISCRETE  COMMUNICATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------

    DISCRETE_INPUT_SH_ROUTING_GEN: for I in 0 to 2 generate
      -- SHIELD discrete communications
      DISCRETE_INPUT_SH_ROUTING: process(CLK_50MHZ)
        begin
          if rising_edge(CLK_50MHZ) then
            if nRESET = '0' then
              s_DISC_OUT_SH_LEVEL(3*I+2 downto 3*I) <= (others => '0');
              DISC_OUT_SH_LEVEL(3*I+2 downto 3*I) <= (others => '0');
            else
              if DISC_IN_SH_EDGE(I) = '1' then
                s_DISC_OUT_SH_LEVEL(3*I) <= not s_DISC_OUT_SH_LEVEL(3*I);
                s_DISC_OUT_SH_LEVEL(3*I+1) <= not s_DISC_OUT_SH_LEVEL(3*I+1);
                s_DISC_OUT_SH_LEVEL(3*I+2) <= not s_DISC_OUT_SH_LEVEL(3*I+2);
              end if;
              DISC_OUT_SH_LEVEL(3*I+2 downto 3*I) <= s_DISC_OUT_SH_LEVEL(3*I+2 downto 3*I);
            end if;
          end if;
      end process DISCRETE_INPUT_SH_ROUTING;
    end generate DISCRETE_INPUT_SH_ROUTING_GEN;

    -- ARDUINO discrete communications
    DISCRETE_INPUT_AR_ROUTING: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            s_DISC_OUT_AR_LEVEL <= (others => '0');
            DISC_OUT_AR_LEVEL <= (others => '0');
          else
            if DISC_IN_AR_EDGE(0) = '1' then
              s_DISC_OUT_AR_LEVEL(3) <= not s_DISC_OUT_AR_LEVEL(3); -- Discrete Input 1 from AR 1 is sent to Discrete Output 1 of AR 2
            end if;
            if DISC_IN_AR_EDGE(3) = '1' then
              s_DISC_OUT_AR_LEVEL(6) <= not s_DISC_OUT_AR_LEVEL(6); -- Discrete Input 1 from AR 2 is sent to Discrete Output 1 of AR 3
            end if;
            if DISC_IN_AR_EDGE(6) = '1' then
              s_DISC_OUT_AR_LEVEL(9) <= not s_DISC_OUT_AR_LEVEL(9); -- Discrete Input 1 from AR 3 is sent to Discrete Output 1 of AR 4
            end if;
            if DISC_IN_AR_EDGE(9) = '1' then
              s_DISC_OUT_AR_LEVEL(0) <= not s_DISC_OUT_AR_LEVEL(0); -- Discrete Input 1 from AR 4 is sent to Discrete Output 1 of AR 1
            end if;
            if DISC_IN_AR_EDGE(10) = '1' then
              s_DISC_OUT_AR_LEVEL(7) <= not s_DISC_OUT_AR_LEVEL(7); -- Discrete Input 2 from AR 4 is sent to Discrete Output 2 of AR 3
            end if;
            if DISC_IN_AR_EDGE(7) = '1' then
              s_DISC_OUT_AR_LEVEL(4) <= not s_DISC_OUT_AR_LEVEL(4); -- Discrete Input 2 from AR 3 is sent to Discrete Output 2 of AR 2
            end if;
            if DISC_IN_AR_EDGE(4) = '1' then
              s_DISC_OUT_AR_LEVEL(1) <= not s_DISC_OUT_AR_LEVEL(1); -- Discrete Input 2 from AR 2 is sent to Discrete Output 2 of AR 1
            end if;
            if DISC_IN_AR_EDGE(1) = '1' then
              s_DISC_OUT_AR_LEVEL(10) <= not s_DISC_OUT_AR_LEVEL(10); -- Discrete Input 2 from AR 1 is sent to Discrete Output 2 of AR 4
            end if;
            if DISC_IN_AR_EDGE(2) = '1' then
              s_DISC_OUT_AR_LEVEL(8) <= not s_DISC_OUT_AR_LEVEL(8); -- Discrete Input 3 from AR 1 is sent to Discrete Output 3 of AR 3
            end if;
            if DISC_IN_AR_EDGE(5) = '1' then
              s_DISC_OUT_AR_LEVEL(11) <= not s_DISC_OUT_AR_LEVEL(11); -- Discrete Input 3 from AR 2 is sent to Discrete Output 3 of AR 4
            end if;
            if DISC_IN_AR_EDGE(8) = '1' then
              s_DISC_OUT_AR_LEVEL(2) <= not s_DISC_OUT_AR_LEVEL(2); -- Discrete Input 3 from AR 3 is sent to Discrete Output 3 of AR 1
            end if;
            if DISC_IN_AR_EDGE(11) = '1' then
              s_DISC_OUT_AR_LEVEL(5) <= not s_DISC_OUT_AR_LEVEL(5); -- Discrete Input 3 from AR 4 is sent to Discrete Output 3 of AR 2
            end if;
            DISC_OUT_AR_LEVEL <= s_DISC_OUT_AR_LEVEL;
          end if;
        end if;
    end process DISCRETE_INPUT_AR_ROUTING;

    ----------------------------------------------------------------------------------------------------
    -- SHIELD & ARDUINO status update detection                                                        --
    ----------------------------------------------------------------------------------------------------

  SHIELD_STATUS_UPDATED <= UART_SH_IN_RECEIVED
                          or DISC_IN_SH_EDGE(0) or DISC_IN_SH_EDGE(1)or DISC_IN_SH_EDGE(2);

  ARDUINO_STATUS_UPDATED <= UART_AR_IN_RECEIVED(0) or UART_AR_IN_RECEIVED(1) or UART_AR_IN_RECEIVED(2) or UART_AR_IN_RECEIVED(3)
                          or DISC_IN_AR_EDGE(0) or DISC_IN_AR_EDGE(1)or DISC_IN_AR_EDGE(2) or DISC_IN_AR_EDGE(3)
                          or DISC_IN_AR_EDGE(4) or DISC_IN_AR_EDGE(5)or DISC_IN_AR_EDGE(6) or DISC_IN_AR_EDGE(7)
                          or DISC_IN_AR_EDGE(8) or DISC_IN_AR_EDGE(9)or DISC_IN_AR_EDGE(10) or DISC_IN_AR_EDGE(11);

end RTL;