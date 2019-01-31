----------------------------------------------------------------------------------------------------
-- Block name: UART_TX_MACHINE_TB                                                                 --
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

entity UART_TX_MACHINE_TB is

end UART_TX_MACHINE_TB;

architecture BHV of UART_TX_MACHINE_TB is

----------------------------------------------------------------------------------------------------
-- COMPONENT DECLARATIONS                                                                         --
----------------------------------------------------------------------------------------------------

component UART_TX_MACHINE is
  port (-- Clock and Reset signals
    CLK_50MHZ      : in  std_logic;                    -- 32 MHz clock
    nRESET         : in  std_logic;                    -- Asynchronous reset (Active LOW)
    -- Input signals
    UART_OUT_FRAME : in  std_logic_vector(7 downto 0); -- Frame data to be transmited.
    UART_OUT_SEND  : in  std_logic;                    -- Command to start the transmission of a frame.
    -- Ouput signals
    UART_TX        : out std_logic);                   -- UART transmission line.
end component;

----------------------------------------------------------------------------------------------------
-- SIGNAL DECLARATIONS                                                                            --
----------------------------------------------------------------------------------------------------

-- Clock and Reset signals
signal CLK_50MHZ      : std_logic := '0';             -- 32 MHz clock
signal nRESET         : std_logic := '0';             -- Asynchronous reset (Active LOW)
-- Input signals
signal UART_OUT_FRAME : std_logic_vector(7 downto 0); -- Frame data to be transmited.
signal UART_OUT_SEND  : std_logic;                    -- Command to start the transmission of a frame.
-- Ouput signals
signal UART_TX        : std_logic;                    -- UART transmission line.

-- Test Bench local signals
signal SYSTEM_TIME       : string(1 to 17) := (others => ' '); -- Signal to store the system time
signal END_OF_SIMULATION : std_logic := '0'; -- Signal to assert the end of simulation
signal DATA_RCV          : std_logic_vector(7 downto 0) := (others => '0'); -- Data received from the UUT
signal ERROR_DETECTED    : integer := 0; -- This signal is incremented when an error is detected

----------------------------------------------------------------------------------------------------
-- CONSTANT DECLARATIONS                                                                          --
----------------------------------------------------------------------------------------------------

constant CLK_50MHZ_PERIOD : time := 20 ns;

begin
  
  UUT_UART_TX_MACHINE: UART_TX_MACHINE
    port map (
      -- Clock and Reset signals
      CLK_50MHZ      => CLK_50MHZ,
      nRESET         => nRESET,
      -- Input signals
      UART_OUT_FRAME => UART_OUT_FRAME,
      UART_OUT_SEND  => UART_OUT_SEND,
      -- Ouput signals
      UART_TX        => UART_TX);

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

      file_open(FILE_RESULTS, "../../Simulation/UART_TX_MACHINE_RESULTS.txt", write_mode);
      write(LINE_TO_WRITE, string'("Simulation started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      UART_OUT_FRAME <= (others => '0');
      UART_OUT_SEND <= '0';

      wait for 4*CLK_50MHZ_period;

      write(LINE_TO_WRITE, string'("Testing output ports reset value..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      -- Check the output port reset value
      if UART_TX = '0' then
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


        -- Set the frame to be sent and assert the command to start the sent
        UART_OUT_FRAME <= std_logic_vector(to_unsigned(I, 8));
        UART_OUT_SEND <= '1';

        wait for CLK_50MHZ_PERIOD;
        UART_OUT_SEND <= '0';

        wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

        -- Check the start bit
        if UART_TX = '1' then -- If start bit is not set an error is asserted
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;

        wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

        -- Acquire trasnmitted data from UUT
        for I in 0 to 7 loop  -- This loop cover the 8 bits to send
          DATA_RCV(I) <= UART_TX;
          wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
        end loop;

        wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

        -- Check the stop bit
        if UART_TX = '0' then -- If stop bit is not set an error is asserted
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;
  
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

        -- Check the idle state for UART_TX line
        if UART_TX = '0' then -- If stop bit is not set an error is asserted
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;

        -- Check the received data
        if DATA_RCV /= UART_OUT_FRAME then -- If received data matches with commanded
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