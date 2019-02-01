----------------------------------------------------------------------------------------------------
-- Block name: UART_BLUETOOTH_TB                                                                  --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: UART_BLUETOOTH; UART_RX_MACHINE; UART_TX_MACHINE; RS232_Package                  --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 24/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.RS232_Package.all;

entity UART_BLUETOOTH_TB is

end UART_BLUETOOTH_TB;

architecture BHV of UART_BLUETOOTH_TB is

----------------------------------------------------------------------------------------------------
-- COMPONENT DECLARATIONS                                                                         --
----------------------------------------------------------------------------------------------------

component UART_BLUETOOTH is
  port (-- Clock and Reset signals
    CLK_50MHZ           : in  std_logic;                    -- 32 MHz clock
    nRESET              : in  std_logic;                    -- Asynchronous reset (Active LOW)
    -- FPGA_MAIN_MODULE ports interface
    UART_BT_RX          : in  std_logic;                    -- UART Bluetooth reception line.
    UART_BT_TX          : out std_logic;                    -- UART Bluetooth transmission line.
    -- MAIN_PROCESSOR ports interface
    UART_BT_IN_FRAME    : out std_logic_vector(7 downto 0); -- Received frame data.
    UART_BT_IN_RECEIVED : out std_logic;                    -- New frame data received.
    UART_BT_OUT_FRAME   : in  std_logic_vector(7 downto 0); -- Frame data to be transmited.
    UART_BT_OUT_SEND    : in  std_logic);                   -- Command to start the transmission of a frame.
end component;

----------------------------------------------------------------------------------------------------
-- SIGNAL DECLARATIONS                                                                            --
----------------------------------------------------------------------------------------------------

-- Clock and Reset signals
signal CLK_50MHZ           : std_logic := '0';             -- 32 MHz clock
signal nRESET              : std_logic := '0';             -- Asynchronous reset (Active LOW)
-- FPGA_MAIN_MODULE ports interface
signal UART_BT_RX          : std_logic;                    -- UART Bluetooth reception line.
signal UART_BT_TX          : std_logic;                    -- UART Bluetooth transmission line.
-- MAIN_PROCESSOR ports interface
signal UART_BT_IN_FRAME    : std_logic_vector(7 downto 0); -- Received frame data.
signal UART_BT_IN_RECEIVED : std_logic;                    -- New frame data received.
signal UART_BT_OUT_FRAME   : std_logic_vector(7 downto 0); -- Frame data to be transmited.
signal UART_BT_OUT_SEND    : std_logic;                   -- Command to start the transmission of a frame.
-- Test Bench local signals
signal SYSTEM_TIME       : string(1 to 17) := (others => ' '); -- Signal to store the system time
signal END_OF_SIMULATION : std_logic := '0'; -- Signal to assert the end of simulation
signal TEST_FRAME        : std_logic_vector(7 downto 0); -- Frame data to test the UUT.
signal ERROR_DETECTED    : integer := 0; -- This signal is incremented when an error is detected

----------------------------------------------------------------------------------------------------
-- CONSTANT DECLARATIONS                                                                          --
----------------------------------------------------------------------------------------------------

constant CLK_50MHZ_PERIOD : time := 20 ns;

begin

  UUT_UART_BLUETOOTH: UART_BLUETOOTH
    port map (
      -- Clock and Reset signals
      CLK_50MHZ           => CLK_50MHZ,
      nRESET              => nRESET,
      -- FPGA_MAIN_MODULE ports interface
      UART_BT_RX          => UART_BT_RX,
      UART_BT_TX          => UART_BT_TX,
      -- MAIN_PROCESSOR ports interface
      UART_BT_IN_FRAME    => UART_BT_IN_FRAME,
      UART_BT_IN_RECEIVED => UART_BT_IN_RECEIVED,
      UART_BT_OUT_FRAME   => UART_BT_OUT_FRAME,
      UART_BT_OUT_SEND    => UART_BT_OUT_SEND);

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

  SERIAL_COMM_LINK: process
    begin
      wait for 5 ns;
      UART_BT_RX <= UART_BT_TX;
  end process SERIAL_COMM_LINK;

  -- Stimulus process
  STIM_PROC: process
    file   FILE_RESULTS    : text;
    variable LINE_TO_WRITE : line;

    begin

      file_open(FILE_RESULTS, "../../Simulation/UART_BLUETOOTH_RESULTS.txt", write_mode);
      write(LINE_TO_WRITE, string'("Simulation started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      TEST_FRAME <= (others => '0');

      UART_BT_OUT_FRAME <= (others => '0');
      UART_BT_OUT_SEND <= '0';

      write(LINE_TO_WRITE, string'("Testing output ports reset value..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Check the output port reset value
      if UART_BT_TX = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      -- Check the output port reset value
      if UART_BT_IN_FRAME = "00000000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      -- Check the output port reset value
      if UART_BT_IN_RECEIVED = '0' then
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
        TEST_FRAME <= std_logic_vector(to_unsigned(I, 8));

        wait for CLK_50MHZ_period;

        -- Set the frame to be sent and assert the command to start the sent
        UART_BT_OUT_FRAME <= TEST_FRAME;
        UART_BT_OUT_SEND <= '1';

        wait for CLK_50MHZ_PERIOD;
        UART_BT_OUT_SEND <= '0';

        wait until UART_BT_IN_RECEIVED = '1';

        -- Check the start bit
        if UART_BT_IN_FRAME /= TEST_FRAME then -- If received data is not equal to TEST_FRAME an error is asserted
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
      wait for 1 us;

      write(LINE_TO_WRITE, string'("Simulation finished at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      file_close(FILE_RESULTS);

      END_OF_SIMULATION <= '1';

      wait for 2 ms;
     
  end process STIM_PROC;

end BHV;