----------------------------------------------------------------------------------------------------
-- Block name: UART_TX_MACHINE                                                                    --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: RS232_Package                                                                    --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 08/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RS232_Package.all;

entity UART_TX_MACHINE is
  port (-- Clock and Reset signals
    CLK_50MHZ      : in  std_logic;                    -- 32 MHz clock
    nRESET         : in  std_logic;                    -- Asynchronous reset (Active LOW)
    -- Input signals
    UART_OUT_FRAME : in  std_logic_vector(7 downto 0); -- Frame data to be transmited.
    UART_OUT_SEND  : in  std_logic;                    -- Command to start the transmission of a frame.
    -- Ouput signals
    UART_TX        : out std_logic);                   -- UART transmission line.
end UART_TX_MACHINE;

architecture RTL of UART_TX_MACHINE is

  ----------------------------------------------------------------------------------------------------
  -- COMPONENT DECLARATIONS                                                                         --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- SIGNAL DECLARATIONS                                                                            --
  ----------------------------------------------------------------------------------------------------

  -- Counter to generate the specified Baud Rate
  signal BAUD_RATE_COUNT  : integer range 1 to BAUD_RATE_LIMIT;
  signal UART_FRAME_COUNT : integer range 0 to RS232_FRAME_LIMIT;
  -- Frame to send
  signal FRAME2SEND       : std_logic_vector(9 downto 0);
  -- Transmission state
  signal UART_TX_ACTIVE   : std_logic;
  signal DATA_TRANSMITTED : std_logic;

  begin

    ----------------------------------------------------------------------------------------------------
    -- COMPONENT INSTANTIATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------
    --None

    ----------------------------------------------------------------------------------------------------
    -- LOCAL RTL/FUNCTIONS AND PROCEDURES                                                             --
    ----------------------------------------------------------------------------------------------------

    START_TX_MACH: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_TX_ACTIVE <= '0';
          else
            if UART_OUT_SEND = '1' then -- A transmission is active when a Send Request command is detected
              UART_TX_ACTIVE <= '1';
            elsif DATA_TRANSMITTED = '1' then
              UART_TX_ACTIVE <= '0';  -- A transmission has finished when all data has been sent
            end if;
          end if;
        end if;
    end process START_TX_MACH;

    FRAME2SEND(0) <= '0';
    FRAME2SEND(9) <= '1';

    -- The present message is stored in a register to be sent
    SERIAL_MESSAGE_LOAD: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            FRAME2SEND(8 downto 1) <= (others => '0');
          else
            if UART_OUT_SEND = '1' then
              FRAME2SEND(8 downto 1) <= UART_OUT_FRAME;
            end if;
          end if;
        end if;
    end process SERIAL_MESSAGE_LOAD;

    BAUD_RATE_COUNTER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            BAUD_RATE_COUNT <= 1;
          else
            if UART_TX_ACTIVE = '0' then
              BAUD_RATE_COUNT <= 1;
            elsif BAUD_RATE_COUNT = BAUD_RATE_LIMIT then
              BAUD_RATE_COUNT <= 1;
            else
              BAUD_RATE_COUNT <= BAUD_RATE_COUNT + 1;
            end if; 
          end if;
        end if;
    end process BAUD_RATE_COUNTER;

    UART_FRAME_COUNTER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_FRAME_COUNT <= 1;
          else
            -- Count is carried out when a transmission is active and it is increased when COM cycle is finished
            if UART_TX_ACTIVE = '0' then
              UART_FRAME_COUNT <= 1;
            else
              if UART_FRAME_COUNT = RS232_FRAME_LIMIT then
                 UART_FRAME_COUNT <= UART_FRAME_COUNT;
              elsif BAUD_RATE_COUNT = BAUD_RATE_LIMIT then
                UART_FRAME_COUNT <= UART_FRAME_COUNT + 1;
              end if;
            end if;
          end if;
        end if;
    end process UART_FRAME_COUNTER;

    DATA_TRANSMITTED_DET: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            DATA_TRANSMITTED <= '0';
          else
            -- Count is carry out when a transmission is active and it is increased when COM cycle is finished
            if (UART_TX_ACTIVE = '1') and ((BAUD_RATE_COUNT = BAUD_RATE_LIMIT)) and UART_FRAME_COUNT = RS232_FRAME_LIMIT then
              DATA_TRANSMITTED <= '1';
            else
              DATA_TRANSMITTED <= '0';
            end if;
          end if;
        end if;
    end process DATA_TRANSMITTED_DET;

    OUTPUT_REGISTER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_TX <= '1';
          else
            if (UART_TX_ACTIVE = '1') then -- Frame is serialized when a transmission is active
              UART_TX <= FRAME2SEND(UART_FRAME_COUNT-1);
            else
              UART_TX <= '1';
            end if;
          end if;
        end if;
    end process OUTPUT_REGISTER;

end RTL;