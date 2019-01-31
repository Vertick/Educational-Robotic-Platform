----------------------------------------------------------------------------------------------------
-- Block name: DISCRETE_COMM_SHIELD                                                               --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: None.                                                                            --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 09/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DISCRETE_COMM_SHIELD is
  port (
    -- Clock and Reset signals
    CLK_50MHZ         : in  std_logic;                     -- 50 MHz clock.
    nRESET            : in  std_logic;                     -- Asynchronous reset (Active LOW).
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
end DISCRETE_COMM_SHIELD;

architecture RTL of DISCRETE_COMM_SHIELD is

  ----------------------------------------------------------------------------------------------------
  -- COMPONENT DECLARATIONS                                                                         --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- SIGNAL DECLARATIONS                                                                            --
  ----------------------------------------------------------------------------------------------------

  -- Edge detector
  signal DISC_IN_1_SH_D2_FF : std_logic; -- Discrete Input 1 register
  signal DISC_IN_2_SH_D4_FF : std_logic; -- Discrete Input 2 register
  signal DISC_IN_3_SH_D7_FF : std_logic; -- Discrete Input 3 register

  begin
  
    ----------------------------------------------------------------------------------------------------
    -- COMPONENT INSTANTIATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------
    -- None.

    -- Discrete Input edge detector
    DISCRETE_INPUT_EDGE_DET: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            DISC_IN_1_SH_D2_FF <= '0';
            DISC_IN_2_SH_D4_FF <= '0';
            DISC_IN_3_SH_D7_FF <= '0';
            DISC_IN_SH_EDGE <= (others => '0');
          else
            DISC_IN_1_SH_D2_FF <= DISC_IN_1_SH_D2;
            DISC_IN_2_SH_D4_FF <= DISC_IN_2_SH_D4;
            DISC_IN_3_SH_D7_FF <= DISC_IN_3_SH_D7;
            DISC_IN_SH_EDGE(0) <= DISC_IN_1_SH_D2 xor DISC_IN_1_SH_D2_FF;
            DISC_IN_SH_EDGE(1) <= DISC_IN_2_SH_D4 xor DISC_IN_2_SH_D4_FF;
            DISC_IN_SH_EDGE(2) <= DISC_IN_3_SH_D7 xor DISC_IN_3_SH_D7_FF;
          end if;
        end if;
    end process DISCRETE_INPUT_EDGE_DET;

    -- Discrete Output register
    DISCRETE_OUTPUT_REG: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            PWM_1_SH_D3       <= '0';
            PWM_2_SH_D5       <= '0';
            PWM_3_SH_D6       <= '0';
            DISC_OUT_1_SH_D8  <= '0';
            DISC_OUT_2_SH_D12 <= '0';
            DISC_OUT_3_SH_D13 <= '0';
            PWM_4_SH_D9       <= '0';
            PWM_5_SH_D10      <= '0';
            PWM_6_SH_D11      <= '0';
          else
            PWM_1_SH_D3       <= DISC_OUT_SH_LEVEL(0);
            PWM_2_SH_D5       <= DISC_OUT_SH_LEVEL(1);
            PWM_3_SH_D6       <= DISC_OUT_SH_LEVEL(2);
            DISC_OUT_1_SH_D8  <= DISC_OUT_SH_LEVEL(3);
            DISC_OUT_2_SH_D12 <= DISC_OUT_SH_LEVEL(4);
            DISC_OUT_3_SH_D13 <= DISC_OUT_SH_LEVEL(5);
            PWM_4_SH_D9       <= DISC_OUT_SH_LEVEL(6);
            PWM_5_SH_D10      <= DISC_OUT_SH_LEVEL(7);
            PWM_6_SH_D11      <= DISC_OUT_SH_LEVEL(8);
          end if;
        end if;
    end process DISCRETE_OUTPUT_REG;

end RTL;