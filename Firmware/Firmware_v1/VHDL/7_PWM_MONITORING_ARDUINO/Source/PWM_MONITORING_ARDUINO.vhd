----------------------------------------------------------------------------------------------------
-- Block name: PWM_MONITORING_ARDUINO                                                             --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: FPGA_MAIN_MODULE_Package.                                                        --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 09/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.FPGA_MAIN_MODULE_Package.all;

entity PWM_MONITORING_ARDUINO is
  port (
    -- Clock and Reset signals
    CLK_50MHZ       : in  std_logic;           -- 50 MHz clock.
    nRESET          : in  std_logic;           -- Asynchronous reset (Active LOW).
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

end PWM_MONITORING_ARDUINO;

architecture RTL of PWM_MONITORING_ARDUINO is

  ----------------------------------------------------------------------------------------------------
  -- COMPONENT DECLARATIONS                                                                         --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- SIGNAL DECLARATIONS                                                                            --
  ----------------------------------------------------------------------------------------------------

  -- Edge detector
  signal PWM_AR_FF_1         : std_logic_vector(PWM_AR_PORTS-1 downto 0); -- PWM port first register.
  signal PWM_AR_FF_2         : std_logic_vector(PWM_AR_PORTS-1 downto 0); -- PWM port second register.
  signal PWM_AR_RISE_EDGE    : std_logic_vector(PWM_AR_PORTS-1 downto 0); -- PWM port rising edge.
  signal PWM_AR_FALL_EDGE    : std_logic_vector(PWM_AR_PORTS-1 downto 0); -- PWM port falling edge.
  -- Timer reference 1 millisecond
  signal TIME_REF_1MS_COUNT  : integer range 1 to TIME_REF_1MS_COUNT_LIMIT; -- Timer counter for 1 millisecond reference.
  signal TIME_REF_1MS        : std_logic;  -- Time refence signal for 1 millisecond.
  -- Pulse lenght count
  signal PWM_PULSE_COUNT     : PWM_PULSE_COUNT_ARRAY; -- PWM pulse lenght counters.

  begin
  
    ----------------------------------------------------------------------------------------------------
    -- COMPONENT INSTANTIATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------
    -- None.

    -- Discrete Input edge detector
    PWM_PORT_REG: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            PWM_AR_FF_1 <= (others => '0');
            PWM_AR_FF_2 <= (others => '0');
          else
            PWM_AR_FF_1(0) <= PWM_1_AR_D3;
            PWM_AR_FF_1(1) <= PWM_2_AR_D5;
            PWM_AR_FF_1(2) <= PWM_3_AR_D6;
            PWM_AR_FF_1(3) <= PWM_4_AR_D9;
            PWM_AR_FF_1(4) <= PWM_5_AR_D10;
            PWM_AR_FF_1(5) <= PWM_6_AR_D11;
            PWM_AR_FF_2    <= PWM_AR_FF_1;
          end if;
        end if;
    end process PWM_PORT_REG;

    -- Time reference for 1 millisecond
    TIME_REF_1MS_COUNTER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            TIME_REF_1MS_COUNT <= 1;
            TIME_REF_1MS <= '0';
          else
            if TIME_REF_1MS_COUNT = TIME_REF_1MS_COUNT_LIMIT then -- End of count reached
              TIME_REF_1MS_COUNT <= 1;
              TIME_REF_1MS <= '1';
            else
              TIME_REF_1MS_COUNT <= TIME_REF_1MS_COUNT + 1;
              TIME_REF_1MS <= '0';
            end if;
          end if;
        end if;
    end process TIME_REF_1MS_COUNTER;

    PULSE_SAMPLING_GEN: for I in 0 to PWM_AR_PORTS-1 generate
      -- Rising and falling edge detection
      EDGE_DETETION: process(CLK_50MHZ)
        begin
          if rising_edge(CLK_50MHZ) then
            if nRESET = '0' then
              PWM_AR_RISE_EDGE(I) <= '0';
              PWM_AR_FALL_EDGE(I) <= '0';
            else
              PWM_AR_RISE_EDGE(I) <= PWM_AR_FF_1(I) and (not PWM_AR_FF_2(I));
              PWM_AR_FALL_EDGE(I) <= (not PWM_AR_FF_1(I)) and PWM_AR_FF_2(I);
            end if;
          end if;
      end process EDGE_DETETION;
      -- PWM level pulse count
      PWM_COUNTER: process(CLK_50MHZ)
        begin
          if rising_edge(CLK_50MHZ) then
            if nRESET = '0' then
              PWM_PULSE_COUNT(I) <= 0;
            else
              if PWM_AR_RISE_EDGE(I) = '1' or PWM_AR_FALL_EDGE(I)= '1' then -- After an edge the level count has finished
                PWM_PULSE_COUNT(I) <= 0;
              elsif PWM_PULSE_COUNT(I) /= 2**(PWM_PULSE_LENGHT-1) then
                if TIME_REF_1MS = '1' then
                  PWM_PULSE_COUNT(I) <= PWM_PULSE_COUNT(I) + 1;
                end if;
              end if;
            end if;
          end if;
      end process PWM_COUNTER;
      -- PWM pulses register
      PWM_PULSE_LENGHT_OUTPUT_REG: process(CLK_50MHZ)
        begin
          if rising_edge(CLK_50MHZ) then
            if nRESET = '0' then
              PWM_AR_PULSE_HI(I) <= (others => '0');
              PWM_AR_PULSE_LO(I) <= (others => '0');
            else
              if PWM_AR_FALL_EDGE(I) = '1' then -- Result is registered after high level count has finished
                PWM_AR_PULSE_HI(I) <= std_logic_vector(to_unsigned(PWM_PULSE_COUNT(I), 8));
              end if;
              if PWM_AR_RISE_EDGE(I) = '1' then -- Result is registered after low level count has finished
                PWM_AR_PULSE_LO(I) <= std_logic_vector(to_unsigned(PWM_PULSE_COUNT(I), 8));
              end if;
            end if;
          end if;
      end process PWM_PULSE_LENGHT_OUTPUT_REG;
    end generate PULSE_SAMPLING_GEN;

end RTL;