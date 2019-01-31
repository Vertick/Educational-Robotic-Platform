----------------------------------------------------------------------------------------------------
-- Block name: UART_RX_MACHINE                                                                    --
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

entity UART_RX_MACHINE is
  port (
    -- Clock and Reset signals
    CLK_50MHZ        : in  std_logic;                    -- 50 MHz clock.
    nRESET           : in  std_logic;                    -- Asynchronous reset (Active LOW).
    -- Input signals
    UART_RX          : in std_logic;                     -- UART reception line.
    -- Ouput signals
    UART_IN_FRAME    : out std_logic_vector(7 downto 0); -- Received frame data.
    UART_IN_RECEIVED : out std_logic);                   -- New frame data received.
end UART_RX_MACHINE;

architecture RTL of UART_RX_MACHINE is

  ----------------------------------------------------------------------------------------------------
  -- COMPONENT DECLARATIONS                                                                         --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- SIGNAL DECLARATIONS                                                                            --
  ----------------------------------------------------------------------------------------------------

  -- Counter to generate the specified Baud Rate
  signal BAUD_RATE_COUNT    : integer range 1 to BAUD_RATE_LIMIT;
  signal UART_FRAME_COUNT   : integer range 0 to RS232_FRAME_LIMIT;
  -- New Frame edge detector
  signal UART_RX_FF         : std_logic;
  signal UART_RX_FALL_EDGE  : std_logic;
  -- Reception state
  signal UART_RX_ACTIVE     : std_logic;
  signal DATA_RECEIVED      : std_logic;

  begin

    ----------------------------------------------------------------------------------------------------
    -- COMPONENT INSTANTIATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------
    --None

    ----------------------------------------------------------------------------------------------------
    -- LOCAL RTL/FUNCTIONS AND PROCEDURES                                                             --
    ----------------------------------------------------------------------------------------------------

    -- New reception detection, only when reception is enabled
    NEW_FRAME_EDGE_DET: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_RX_FF <= '0';
            UART_RX_FALL_EDGE <= '0';
          else
            UART_RX_FF <= UART_RX;
            UART_RX_FALL_EDGE <= (not UART_RX) and UART_RX_FF; 
          end if;
        end if;
    end process NEW_FRAME_EDGE_DET;

    -- New reception detection, only when reception is enabled
    RX_STATUS: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_RX_ACTIVE <= '0';
          else
            if UART_RX_FALL_EDGE = '1' then
              UART_RX_ACTIVE <= '1';
            elsif DATA_RECEIVED = '1' then
              UART_RX_ACTIVE <= '0';
            end if;
          end if;
        end if;
    end process RX_STATUS;

    BAUD_RATE_COUNTER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            BAUD_RATE_COUNT <= 1;
          else
            if UART_RX_ACTIVE = '0' then
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
            -- Count is carry out when a transmission is active and it is increased when COM cycle is finished
            if UART_RX_ACTIVE = '0' then
              UART_FRAME_COUNT <= 0;
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

    DATA_RECEIVED_DET: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            DATA_RECEIVED <= '0';
          else
            -- Count is carry out when a transmission is active and it is increased when COM cycle is finished
            if (UART_RX_ACTIVE = '1') and ((BAUD_RATE_COUNT = BAUD_RATE_HALF_LIMIT)) and UART_FRAME_COUNT = RS232_FRAME_LIMIT then
              DATA_RECEIVED <= '1';
            else
              DATA_RECEIVED <= '0';
            end if;
          end if;
        end if;
    end process DATA_RECEIVED_DET;

    -- Output is converted from serial to parallel and a flag is raised
    OUTPUT_REGISTER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            UART_IN_FRAME <= (others => '0');
            UART_IN_RECEIVED <= '0';
          else
            if (UART_RX_ACTIVE = '1') and ((BAUD_RATE_COUNT = BAUD_RATE_HALF_LIMIT)) and UART_FRAME_COUNT < RS232_FRAME_LIMIT then
              if (UART_FRAME_COUNT > 0) then 
                UART_IN_FRAME(UART_FRAME_COUNT-1) <= UART_RX_FF;
              end if;
            end if;
            UART_IN_RECEIVED <= DATA_RECEIVED;
          end if;
        end if;
    end process OUTPUT_REGISTER;

end RTL;