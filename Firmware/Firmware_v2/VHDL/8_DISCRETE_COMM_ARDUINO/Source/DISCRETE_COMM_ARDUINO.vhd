----------------------------------------------------------------------------------------------------
-- Block name: DISCRETE_COMM_ARDUINO                                                              --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: None.                                                                            --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 08/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DISCRETE_COMM_ARDUINO is
  port (
    -- Clock and Reset signals
    CLK_50MHZ         : in  std_logic;                     -- 50 MHz clock.
    nRESET            : in  std_logic;                     -- Asynchronous reset (Active LOW).
    -- FPGA_MAIN_MODULE ports interface
    DISC_IN_1_AR_D2   : in  std_logic;                     -- Arduino Nano digital port D2. Discrete Input 1.
    DISC_IN_2_AR_D4   : in  std_logic;                     -- Arduino Nano digital port D4. Discrete Input 2.
    DISC_IN_3_AR_D7   : in  std_logic;                     -- Arduino Nano digital port D7. Discrete Input 3.
    DISC_OUT_1_AR_D8  : out std_logic;                     -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_2_AR_D12 : out std_logic;                     -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_3_AR_D13 : out std_logic;                     -- Arduino Nano digital port D8. Discrete Ouput 1.
    -- MAIN_PROCESSOR ports interface
    DISC_OUT_AR_LEVEL : in  std_logic_vector(2 downto 0);  -- Commanded level for discrete outputs.
    DISC_IN_AR_EDGE   : out std_logic_vector(2 downto 0)); -- Edge detected in discrete inputs.
end DISCRETE_COMM_ARDUINO;

architecture RTL of DISCRETE_COMM_ARDUINO is

  ----------------------------------------------------------------------------------------------------
  -- COMPONENT DECLARATIONS                                                                         --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- SIGNAL DECLARATIONS                                                                            --
  ----------------------------------------------------------------------------------------------------

  -- Edge detector
  signal DISC_IN_1_AR_D2_FF : std_logic; -- Discrete Input 1 register
  signal DISC_IN_2_AR_D4_FF : std_logic; -- Discrete Input 2 register
  signal DISC_IN_3_AR_D7_FF : std_logic; -- Discrete Input 3 register

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
            DISC_IN_1_AR_D2_FF <= '0';
            DISC_IN_2_AR_D4_FF <= '0';
            DISC_IN_3_AR_D7_FF <= '0';
            DISC_IN_AR_EDGE <= (others => '0');
          else
            DISC_IN_1_AR_D2_FF <= DISC_IN_1_AR_D2;
            DISC_IN_2_AR_D4_FF <= DISC_IN_2_AR_D4;
            DISC_IN_3_AR_D7_FF <= DISC_IN_3_AR_D7;
            DISC_IN_AR_EDGE(0) <= DISC_IN_1_AR_D2 xor DISC_IN_1_AR_D2_FF;
            DISC_IN_AR_EDGE(1) <= DISC_IN_2_AR_D4 xor DISC_IN_2_AR_D4_FF;
            DISC_IN_AR_EDGE(2) <= DISC_IN_3_AR_D7 xor DISC_IN_3_AR_D7_FF;
          end if;
        end if;
    end process DISCRETE_INPUT_EDGE_DET;

    -- Discrete Output register
    DISCRETE_OUTPUT_REG: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            DISC_OUT_1_AR_D8 <= '0';
            DISC_OUT_2_AR_D12 <= '0';
            DISC_OUT_3_AR_D13 <= '0';
          else
            DISC_OUT_1_AR_D8 <= DISC_OUT_AR_LEVEL(0);
            DISC_OUT_2_AR_D12 <= DISC_OUT_AR_LEVEL(1);
            DISC_OUT_3_AR_D13 <= DISC_OUT_AR_LEVEL(2);
          end if;
        end if;
    end process DISCRETE_OUTPUT_REG;

end RTL;