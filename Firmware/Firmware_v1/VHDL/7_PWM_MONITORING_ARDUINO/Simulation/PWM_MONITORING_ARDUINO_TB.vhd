----------------------------------------------------------------------------------------------------
-- Block name: PWM_MONITORING_ARDUINO_TB                                                          --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: PWM_MONITORING_ARDUINO; FPGA_MAIN_MODULE_Package; RS232_Package                  --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 24/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.FPGA_MAIN_MODULE_Package.all;

entity PWM_MONITORING_ARDUINO_TB is

end PWM_MONITORING_ARDUINO_TB;

architecture BHV of PWM_MONITORING_ARDUINO_TB is

----------------------------------------------------------------------------------------------------
-- COMPONENT DECLARATIONS                                                                         --
----------------------------------------------------------------------------------------------------

component PWM_MONITORING_ARDUINO is
  port (-- Clock and Reset signals
    CLK_50MHZ       : in  std_logic;           -- 32 MHz clock
    nRESET          : in  std_logic;           -- Asynchronous reset (Active LOW)
    -- FPGA_MAIN_MODULE ports interface
    PWM_1_AR_D3     : in  std_logic;           -- Arduino Nano digital port D3. PWM port 1.
    PWM_2_AR_D5     : in  std_logic;           -- Arduino Nano digital port D5. PWM port 2.
    PWM_3_AR_D6     : in  std_logic;           -- Arduino Nano digital port D6. PWM port 3.
    PWM_4_AR_D9     : in  std_logic;           -- Arduino Nano digital port D9. PWM port 4.
    PWM_5_AR_D10    : in  std_logic;           -- Arduino Nano digital port D10. PWM port 5.
    PWM_6_AR_D11    : in  std_logic;           -- Arduino Nano digital port D11. PWM port 6.
    -- MAIN_PROCESSOR ports interface
    PWM_AR_PULSE_HI : out PWM_AR_PULSE_ARRAY;  -- PWM high level pulse in milliseconds.
    PWM_AR_PULSE_LO : out PWM_AR_PULSE_ARRAY); -- PWM low level pulse in milliseconds.
end component;

----------------------------------------------------------------------------------------------------
-- SIGNAL DECLARATIONS                                                                            --
----------------------------------------------------------------------------------------------------

-- Clock and Reset signals
signal CLK_50MHZ       : std_logic := '0';              -- 32 MHz clock
signal nRESET          : std_logic := '0';              -- Asynchronous reset (Active LOW)
-- FPGA_MAIN_MODULE ports interface
signal PWM_1_AR_D3     : std_logic;          -- Arduino Nano digital port D3. PWM port 1.
signal PWM_2_AR_D5     : std_logic;          -- Arduino Nano digital port D5. PWM port 2.
signal PWM_3_AR_D6     : std_logic;          -- Arduino Nano digital port D6. PWM port 3.
signal PWM_4_AR_D9     : std_logic;          -- Arduino Nano digital port D9. PWM port 4.
signal PWM_5_AR_D10    : std_logic;          -- Arduino Nano digital port D10. PWM port 5.
signal PWM_6_AR_D11    : std_logic;          -- Arduino Nano digital port D11. PWM port 6.
-- MAIN_PROCESSOR ports interface
signal PWM_AR_PULSE_HI : PWM_AR_PULSE_ARRAY; -- PWM high level pulse in milliseconds.
signal PWM_AR_PULSE_LO : PWM_AR_PULSE_ARRAY; -- PWM low level pulse in milliseconds.

-- Test Bench local signals
signal SYSTEM_TIME       : string(1 to 17) := (others => ' '); -- Signal to store the system time
signal END_OF_SIMULATION : std_logic := '0'; -- Signal to assert the end of simulation
signal ERROR_DETECTED    : integer := 0; -- This signal is incremented when an error is detected
signal TIME_PULSE : integer := 0; -- This signal is used to set the PWM level wait
signal TEST_PULSE : std_logic_vector(PWM_PULSE_LENGHT-1 downto 0) := (others => '0'); -- This signal is used to get the PWM level lenght

----------------------------------------------------------------------------------------------------
-- CONSTANT DECLARATIONS                                                                          --
----------------------------------------------------------------------------------------------------

constant CLK_50MHZ_PERIOD : time := 20 ns;

begin
  
  UUT_PWM_MONITORING_ARDUINO: PWM_MONITORING_ARDUINO
    port map (
      -- Clock and Reset signals
      CLK_50MHZ       => CLK_50MHZ,
      nRESET          => nRESET,
      -- FPGA_MAIN_MODULE ports interface
      PWM_1_AR_D3     => PWM_1_AR_D3,
      PWM_2_AR_D5     => PWM_2_AR_D5,
      PWM_3_AR_D6     => PWM_3_AR_D6,
      PWM_4_AR_D9     => PWM_4_AR_D9,
      PWM_5_AR_D10    => PWM_5_AR_D10,
      PWM_6_AR_D11    => PWM_6_AR_D11,
      -- MAIN_PROCESSOR ports interface
      PWM_AR_PULSE_HI => PWM_AR_PULSE_HI,
      PWM_AR_PULSE_LO => PWM_AR_PULSE_LO);

  CLK_50MHZ_GEN: process
    begin
      wait for CLK_50MHZ_period/2;
      CLK_50MHZ <= not CLK_50MHZ;
  end process CLK_50MHZ_GEN;

  
  nRESET_GEN: process
    begin
      wait for 600 ns;
      nRESET <= not nRESET;
      wait;
  end process nRESET_GEN;

  -- Stimulus process
  STIM_PROC: process
    file   FILE_RESULTS    : text;
    variable LINE_TO_WRITE : line;

    begin

      file_open(FILE_RESULTS, "../../Simulation/PWM_MONITORING_ARDUINO_RESULTS.txt", write_mode);
      write(LINE_TO_WRITE, string'("Simulation started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      PWM_1_AR_D3  <= '0';
      PWM_2_AR_D5  <= '0';
      PWM_3_AR_D6  <= '0';
      PWM_4_AR_D9  <= '0';
      PWM_5_AR_D10 <= '0';
      PWM_6_AR_D11 <= '0';

      wait for 4*CLK_50MHZ_period;

      write(LINE_TO_WRITE, string'("Testing output ports reset value..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      for I in 0 to PWM_AR_PORTS-1 loop

        -- Check the output port reset value
        if PWM_AR_PULSE_HI(I) /= "00000000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
        end if;

      end loop;

      for I in 0 to PWM_AR_PORTS-1 loop

        -- Check the output port reset value
        if PWM_AR_PULSE_LO(I) /= "00000000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
        end if;

      end loop;

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

      PWM_1_AR_D3 <= '1';

      TIME_PULSE <= 5;

      write(LINE_TO_WRITE, string'("Testing a time pulse of " & integer'image(TIME_PULSE) & "ms..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 5 ms;

      TEST_PULSE <= std_logic_vector(to_unsigned(TIME_PULSE, 8));

      PWM_1_AR_D3 <= '0';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_HI(0) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      wait for 5 ms;

      PWM_1_AR_D3 <= '1';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_LO(0) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait for 1 us;

      PWM_2_AR_D5 <= '1';

      TIME_PULSE <= 6;

      write(LINE_TO_WRITE, string'("Testing a time pulse of " & integer'image(TIME_PULSE) & "ms..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 6 ms;

      TEST_PULSE <= std_logic_vector(to_unsigned(TIME_PULSE, 8));

      PWM_2_AR_D5 <= '0';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_HI(1) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      wait for 6 ms;

      PWM_2_AR_D5 <= '1';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_LO(1) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait for 1 us;

      PWM_3_AR_D6 <= '1';

      TIME_PULSE <= 7;

      write(LINE_TO_WRITE, string'("Testing a time pulse of " & integer'image(TIME_PULSE) & "ms..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 7 ms;

      TEST_PULSE <= std_logic_vector(to_unsigned(TIME_PULSE, 8));

      PWM_3_AR_D6 <= '0';

       wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_HI(2) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      wait for 7 ms;

      PWM_3_AR_D6 <= '1';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_LO(2) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait for 1 us;

      PWM_4_AR_D9 <= '1';

      TIME_PULSE <= 8;

      write(LINE_TO_WRITE, string'("Testing a time pulse of " & integer'image(TIME_PULSE) & "ms..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 8 ms;

      TEST_PULSE <= std_logic_vector(to_unsigned(TIME_PULSE, 8));

      PWM_4_AR_D9 <= '0';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_HI(3) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      wait for 8 ms;

      PWM_4_AR_D9 <= '1';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_LO(3) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait for 1 us;

      PWM_5_AR_D10 <= '1';

      TIME_PULSE <= 9;

      write(LINE_TO_WRITE, string'("Testing a time pulse of " & integer'image(TIME_PULSE) & "ms..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 9 ms;

      TEST_PULSE <= std_logic_vector(to_unsigned(TIME_PULSE, 8));

      PWM_5_AR_D10 <= '0';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_HI(4) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      wait for 9 ms;

      PWM_5_AR_D10 <= '1';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_LO(4) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait for 1 us;

      PWM_6_AR_D11 <= '1';

      TIME_PULSE <= 10;

      write(LINE_TO_WRITE, string'("Testing a time pulse of " & integer'image(TIME_PULSE) & "ms..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 10 ms;

      TEST_PULSE <= std_logic_vector(to_unsigned(TIME_PULSE, 8));

      PWM_6_AR_D11 <= '0';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_HI(5) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      wait for 10 ms;

      PWM_6_AR_D11 <= '1';

      wait for 5*CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_AR_PULSE_LO(5) /= TEST_PULSE then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The time pulse of " & integer'image(TIME_PULSE) & " test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      write(LINE_TO_WRITE, string'("Simulation finished at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      file_close(FILE_RESULTS);

      END_OF_SIMULATION <= '1';

      wait for 2 ms;

  end process STIM_PROC;

end BHV;