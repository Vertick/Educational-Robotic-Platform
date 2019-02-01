----------------------------------------------------------------------------------------------------
-- Block name: UART_RX_MACHINE_TB                                                                 --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: UART_TX_MACHINE; RS232_Package                                                   --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 24/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.RS232_Package.all;

entity UART_RX_MACHINE_TB is

end UART_RX_MACHINE_TB;

architecture BHV of UART_RX_MACHINE_TB is

----------------------------------------------------------------------------------------------------
-- COMPONENT DECLARATIONS                                                                         --
----------------------------------------------------------------------------------------------------

component UART_RX_MACHINE is
  port (-- Clock and Reset signals
    CLK_50MHZ        : in  std_logic;                    -- 32 MHz clock
    nRESET           : in  std_logic;                    -- Asynchronous reset (Active LOW)
    -- Input signals
    UART_RX          : in std_logic;                     -- UART reception line.
    -- Ouput signals
    UART_IN_FRAME    : out std_logic_vector(7 downto 0); -- Received frame data.
    UART_IN_RECEIVED : out std_logic);                   -- New frame data received.
end component;

----------------------------------------------------------------------------------------------------
-- SIGNAL DECLARATIONS                                                                            --
----------------------------------------------------------------------------------------------------

-- Clock and Reset signals
signal CLK_50MHZ        : std_logic := '0';                 -- 32 MHz clock
signal nRESET           : std_logic := '0';                 -- Asynchronous reset (Active LOW)
-- Input signals
signal UART_RX          : std_logic;                     -- UART reception line.
-- Ouput signals
signal UART_IN_FRAME    : std_logic_vector(7 downto 0); -- Received frame data.
signal UART_IN_RECEIVED : std_logic;                    -- New frame data received.

-- Test Bench local signals
signal SYSTEM_TIME       : string(1 to 17) := (others => ' '); -- Signal to store the system time
signal END_OF_SIMULATION : std_logic := '0'; -- Signal to assert the end of simulation
signal DATA_SNT          : std_logic_vector(7 downto 0) := (others => '0'); -- Data sent from the UUT
signal ERROR_DETECTED    : integer := 0; -- This signal is incremented when an error is detected

----------------------------------------------------------------------------------------------------
-- CONSTANT DECLARATIONS                                                                          --
----------------------------------------------------------------------------------------------------

constant CLK_50MHZ_PERIOD : time := 20 ns;

begin
  
  UUT_UART_RX_MACHINE: UART_RX_MACHINE
    port map (
      -- Clock and Reset signals
      CLK_50MHZ        => CLK_50MHZ,
      nRESET           => nRESET,
      -- Input signals
      UART_RX          => UART_RX,
      -- Ouput signals
      UART_IN_FRAME    => UART_IN_FRAME,
      UART_IN_RECEIVED => UART_IN_RECEIVED);

  CLK_50MHZ_GEN: process
    begin
      wait for CLK_50MHZ_period/2;
      CLK_50MHZ <= not CLK_50MHZ;
  end process CLK_50MHZ_GEN;

  
  nRESET_GEN: process
    begin
      wait for 300 ns;
      nRESET <= not nRESET;
      wait;
  end process nRESET_GEN;

  -- Stimulus process
  STIM_PROC: process
    file   FILE_RESULTS    : text;
    variable LINE_TO_WRITE : line;

    begin

      file_open(FILE_RESULTS, "../../Simulation/UART_RX_MACHINE_RESULTS.txt", write_mode);
      write(LINE_TO_WRITE, string'("Simulation started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      UART_RX <= '1';

      wait for 4*CLK_50MHZ_period;

      write(LINE_TO_WRITE, string'("Testing output ports reset value..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      -- Check the output port reset value
      if UART_IN_FRAME /= "00000000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      -- Check the output port reset value
      if UART_IN_RECEIVED /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("Output ports reset value has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("Output ports reset value has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait until nRESET = '1';

      wait for 1 us;

      for I in 0 to 255 loop  -- This loop cover the 8 bits to send

        write(LINE_TO_WRITE, string'("Testing the frame message " & integer'image(I) & "..."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);

        DATA_SNT <= std_logic_vector(to_unsigned(I, 8));

        wait for CLK_50MHZ_period;

        wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

        UART_RX <= '0';

        wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

        -- Acquire trasnmitted data from UUT
        for I in 0 to 7 loop  -- This loop cover the 8 bits to send
          UART_RX <= DATA_SNT(I);
          wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
        end loop;

        UART_RX <= '1';

        wait until UART_IN_RECEIVED = '1';

        wait for CLK_50MHZ_period;

        -- Check the received data
        if UART_IN_FRAME /= DATA_SNT then -- If received data matches with commanded
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;

        if ERROR_DETECTED = 0 then
          write(LINE_TO_WRITE, string'("The frame message " & integer'image(I) & " test has been passed."));
          writeline(FILE_RESULTS, LINE_TO_WRITE);
        else
          write(LINE_TO_WRITE, string'("The frame message " & integer'image(I) & " test has been failed."));
          writeline(FILE_RESULTS, LINE_TO_WRITE);
          ERROR_DETECTED <= 0;
        end if;

      end loop;

      write(LINE_TO_WRITE, string'("Simulation finished at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      file_close(FILE_RESULTS);

      END_OF_SIMULATION <= '1';

      wait for 2 ms;

  end process STIM_PROC;

end BHV;