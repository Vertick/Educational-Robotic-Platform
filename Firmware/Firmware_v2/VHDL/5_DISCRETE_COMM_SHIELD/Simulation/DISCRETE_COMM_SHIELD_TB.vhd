----------------------------------------------------------------------------------------------------
-- Block name: DISCRETE_COMM_SHIELD_TB                                                            --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: DISCRETE_COMM_SHIELD                                                             --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 24/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity DISCRETE_COMM_SHIELD_TB is

end DISCRETE_COMM_SHIELD_TB;

architecture BHV of DISCRETE_COMM_SHIELD_TB is

----------------------------------------------------------------------------------------------------
-- COMPONENT DECLARATIONS                                                                         --
----------------------------------------------------------------------------------------------------

component DISCRETE_COMM_SHIELD is
  port (-- Clock and Reset signals
    CLK_50MHZ         : in  std_logic;                    -- 32 MHz clock
    nRESET            : in  std_logic;                    -- Asynchronous reset (Active LOW)
    -- FPGA_MAIN_MODULE ports interface
    DISC_IN_1_SH_D2   : in  std_logic;                     -- Arduino Shield digital port D2. Discrete Input 1.
    DISC_IN_2_SH_D4   : in  std_logic;                     -- Arduino Shield digital port D4. Discrete Input 2.
    DISC_IN_3_SH_D7   : in  std_logic;                     -- Arduino Shield digital port D7. Discrete Input 3.
    PWM_1_SH_D3       : out std_logic;                     -- Arduino Shield digital port D3. PWM port 1.
    PWM_2_SH_D5       : out std_logic;                     -- Arduino Shield digital port D5. PWM port 2.
    PWM_3_SH_D6       : out std_logic;                     -- Arduino Shield digital port D6. PWM port 3.
    DISC_OUT_1_SH_D8  : out std_logic;                     -- Arduino Shield digital port D8. Discrete Ouput 1.
    DISC_OUT_2_SH_D12 : out std_logic;                     -- Arduino Shield digital port D8. Discrete Ouput 1.
    DISC_OUT_3_SH_D13 : out std_logic;                     -- Arduino Shield digital port D8. Discrete Ouput 1.
    PWM_4_SH_D9       : out std_logic;                     -- Arduino Shield digital port D9. PWM port 4.
    PWM_5_SH_D10      : out std_logic;                     -- Arduino Shield digital port D10. PWM port 5.
    PWM_6_SH_D11      : out std_logic;                     -- Arduino Shield digital port D11. PWM port 6.
    -- MAIN_PROCESSOR ports interface
    DISC_OUT_SH_LEVEL : in  std_logic_vector(8 downto 0);  -- Commanded level for discrete outputs.
    DISC_IN_SH_EDGE   : out std_logic_vector(2 downto 0)); -- Edge detected in discrete inputs.
end component;

----------------------------------------------------------------------------------------------------
-- SIGNAL DECLARATIONS                                                                            --
----------------------------------------------------------------------------------------------------

-- Clock and Reset signals
signal CLK_50MHZ         : std_logic := '0';             -- 32 MHz clock
signal nRESET            : std_logic := '0';             -- Asynchronous reset (Active LOW)
-- FPGA_MAIN_MODULE ports interface
signal DISC_IN_1_SH_D2   : std_logic;                    -- Arduino Shield digital port D2. Discrete Input 1.
signal DISC_IN_2_SH_D4   : std_logic;                    -- Arduino Shield digital port D4. Discrete Input 2.
signal DISC_IN_3_SH_D7   : std_logic;                    -- Arduino Shield digital port D7. Discrete Input 3.
signal PWM_1_SH_D3       : std_logic;                    -- Arduino Shield digital port D3. PWM port 1.
signal PWM_2_SH_D5       : std_logic;                    -- Arduino Shield digital port D5. PWM port 2.
signal PWM_3_SH_D6       : std_logic;                    -- Arduino Shield digital port D6. PWM port 3.
signal DISC_OUT_1_SH_D8  : std_logic;                    -- Arduino Shield digital port D8. Discrete Ouput 1.
signal DISC_OUT_2_SH_D12 : std_logic;                    -- Arduino Shield digital port D8. Discrete Ouput 1.
signal DISC_OUT_3_SH_D13 : std_logic;                    -- Arduino Shield digital port D8. Discrete Ouput 1.
signal PWM_4_SH_D9       : std_logic;                    -- Arduino Shield digital port D9. PWM port 4.
signal PWM_5_SH_D10      : std_logic;                    -- Arduino Shield digital port D10. PWM port 5.
signal PWM_6_SH_D11      : std_logic;                    -- Arduino Shield digital port D11. PWM port 6.
-- MAIN_PROCESSOR ports interface
signal DISC_OUT_SH_LEVEL : std_logic_vector(8 downto 0); -- Commanded level for discrete outputs.
signal DISC_IN_SH_EDGE   : std_logic_vector(2 downto 0); -- Edge detected in discrete inputs.

-- Test Bench local signals
signal SYSTEM_TIME       : string(1 to 17) := (others => ' '); -- Signal to store the system time
signal END_OF_SIMULATION : std_logic := '0'; -- Signal to assert the end of simulation
signal ERROR_DETECTED    : integer := 0; -- This signal is incremented when an error is detected

----------------------------------------------------------------------------------------------------
-- CONSTANT DECLARATIONS                                                                          --
----------------------------------------------------------------------------------------------------

constant CLK_50MHZ_PERIOD : time := 20 ns;

begin
  
  UUT_DISCRETE_COMM_SHIELD: DISCRETE_COMM_SHIELD
    port map (
      -- Clock and Reset signals
      CLK_50MHZ         => CLK_50MHZ,
      nRESET            => nRESET,
      -- FPGA_MAIN_MODULE ports interface
      DISC_IN_1_SH_D2   => DISC_IN_1_SH_D2,
      DISC_IN_2_SH_D4   => DISC_IN_2_SH_D4,
      DISC_IN_3_SH_D7   => DISC_IN_3_SH_D7,
      PWM_1_SH_D3       => PWM_1_SH_D3,
      PWM_2_SH_D5       => PWM_2_SH_D5,
      PWM_3_SH_D6       => PWM_3_SH_D6,
      DISC_OUT_1_SH_D8  => DISC_OUT_1_SH_D8,
      DISC_OUT_2_SH_D12 => DISC_OUT_2_SH_D12,
      DISC_OUT_3_SH_D13 => DISC_OUT_3_SH_D13,
      PWM_4_SH_D9       => PWM_4_SH_D9,
      PWM_5_SH_D10      => PWM_5_SH_D10,
      PWM_6_SH_D11      => PWM_6_SH_D11,
      -- MAIN_PROCESSOR ports interface
      DISC_OUT_SH_LEVEL => DISC_OUT_SH_LEVEL,
      DISC_IN_SH_EDGE   => DISC_IN_SH_EDGE);

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

      file_open(FILE_RESULTS, "../../Simulation/DISCRETE_COMM_SHIELD_RESULTS.txt", write_mode);
      write(LINE_TO_WRITE, string'("Simulation started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      DISC_IN_1_SH_D2   <= '0';
      DISC_IN_2_SH_D4   <= '0';
      DISC_IN_3_SH_D7   <= '0';
      DISC_OUT_SH_LEVEL <= (others => '0');

      wait for 4*CLK_50MHZ_period;

      write(LINE_TO_WRITE, string'("Testing output ports reset value..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      -- Check the output port reset value
      if DISC_IN_SH_EDGE /= "000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      -- Check the output port reset value
      if DISC_OUT_1_SH_D8 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      -- Check the output port reset value
      if DISC_OUT_2_SH_D12 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      -- Check the output port reset value
      if DISC_OUT_3_SH_D13 /= '0' then
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

      write(LINE_TO_WRITE, string'("Testing the discrete inputs edge detection level..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the discrete inputs to high level
      DISC_IN_1_SH_D2 <= '1';

      wait until DISC_IN_SH_EDGE(0) = '1';
      wait for 2*CLK_50MHZ_period;

      DISC_IN_1_SH_D2 <= '0';

      wait until DISC_IN_SH_EDGE(0) = '1';
      wait for 2*CLK_50MHZ_period;

      DISC_IN_2_SH_D4 <= '1';

      wait until DISC_IN_SH_EDGE(1) = '1';
      wait for 2*CLK_50MHZ_period;

      DISC_IN_2_SH_D4 <= '0';

      wait until DISC_IN_SH_EDGE(1) = '1';
      wait for 2*CLK_50MHZ_period;

      DISC_IN_3_SH_D7 <= '1';

      wait until DISC_IN_SH_EDGE(2) = '1';
      wait for 2*CLK_50MHZ_period;

      DISC_IN_3_SH_D7 <= '0';

      wait until DISC_IN_SH_EDGE(2) = '1';
      wait for 2*CLK_50MHZ_period;

      write(LINE_TO_WRITE, string'("Testing the commanded level for discrete outputs..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the discrete outputs to high level
      DISC_OUT_SH_LEVEL(0) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_1_SH_D3 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(0) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_1_SH_D3 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(1) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_2_SH_D5 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(1) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_2_SH_D5 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(2) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_3_SH_D6 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(2) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_3_SH_D6 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(3) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if DISC_OUT_1_SH_D8 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(3) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if DISC_OUT_1_SH_D8 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(4) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if DISC_OUT_2_SH_D12 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(4) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if DISC_OUT_2_SH_D12 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(5) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if DISC_OUT_3_SH_D13 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(5) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if DISC_OUT_3_SH_D13 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(6) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_4_SH_D9 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(6) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_4_SH_D9 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(7) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_5_SH_D10 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(7) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_5_SH_D10 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(8) <= '1';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_6_SH_D11 /= '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      DISC_OUT_SH_LEVEL(8) <= '0';

      wait for CLK_50MHZ_PERIOD;

      -- Check the output port reset value
      if PWM_6_SH_D11 /= '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("Commanded level for discrete outputs test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("Commanded level for discrete outputs test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait for 1 us;

      write(LINE_TO_WRITE, string'("Simulation finished at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      file_close(FILE_RESULTS);

      END_OF_SIMULATION <= '1';

      wait for 2 ms;

  end process STIM_PROC;

end BHV;