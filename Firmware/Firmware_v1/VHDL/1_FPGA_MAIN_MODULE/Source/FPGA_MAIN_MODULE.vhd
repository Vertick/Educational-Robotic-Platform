----------------------------------------------------------------------------------------------------
-- Block name: FPGA_MAIN_MODULE                                                                   --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: RS232_Package; FPGA_MAIN_MODULE_Package; MAIN_PROCESSOR; UART_BLUETOOTH;         --
-- UART_SHIELD; DISCRETE_COMM_SHIELD; UART_ARDUINO; PWM_MONITORING_ARDUINO; DISCRETE_COMM_ARDUINO;--
-- UART_RX_MACHINE; UART_TX_MACHINE.                                                              --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 20/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.FPGA_MAIN_MODULE_Package.all;

entity FPGA_MAIN_MODULE is
  port (
    -- Clock and Reset signals
    CLK_50MHZ          : in  std_logic; -- 50 MHz clock
    nRESET             : in  std_logic; -- Asynchronous reset (Active LOW)
    -- FPGA Status LED Ports
    LED_2              : out std_logic; -- Board LED_2
    LED_4              : out std_logic; -- Board LED_4
    LED_5              : out std_logic; -- Board LED_5
    -- UART_BLUETOOTH ports interface
    UART_BT_RX         : in  std_logic; -- UART Bluetooth reception line.
    UART_BT_TX         : out std_logic; -- UART Bluetooth transmission line.
    -- UART_SHIELD ports interface
    UART_SH_RX         : in  std_logic; -- UART Shield reception line.
    UART_SH_TX         : out std_logic; -- UART Shield transmission line.
    -- DISCRETE_COMM_SHIELD ports interface
    DISC_IN_1_SH_D2    : in  std_logic; -- Arduino Shield digital port D2. Discrete Input 1.
    PWM_1_SH_D3        : out std_logic; -- Arduino Shield digital port D3. PWM port 1.
    DISC_IN_2_SH_D4    : in  std_logic; -- Arduino Shield digital port D4. Discrete Input 2.
    PWM_2_SH_D5        : out std_logic; -- Arduino Shield digital port D5. PWM port 2.
    PWM_3_SH_D6        : out std_logic; -- Arduino Shield digital port D6. PWM port 3.
    DISC_IN_3_SH_D7    : in  std_logic; -- Arduino Shield digital port D7. Discrete Input 3.
    DISC_OUT_1_SH_D8   : out std_logic; -- Arduino Shield digital port D8. Discrete Ouput 1.
    PWM_4_SH_D9        : out std_logic; -- Arduino Shield digital port D9. PWM port 4.
    PWM_5_SH_D10       : out std_logic; -- Arduino Shield digital port D10. PWM port 5.
    PWM_6_SH_D11       : out std_logic; -- Arduino Shield digital port D11. PWM port 6.
    DISC_OUT_2_SH_D12  : out std_logic; -- Arduino Shield digital port D8. Discrete Ouput 1.
    DISC_OUT_3_SH_D13  : out std_logic; -- Arduino Shield digital port D8. Discrete Ouput 1.
    -- UART_SHIELD ports interface
    UART_AR1_RX        : in  std_logic; -- UART Arduino Nano reception line.
    UART_AR1_TX        : out std_logic; -- UART Arduino Nano transmission line.
    UART_AR2_RX        : in  std_logic; -- UART Arduino Nano reception line.
    UART_AR2_TX        : out std_logic; -- UART Arduino Nano transmission line.
    UART_AR3_RX        : in  std_logic; -- UART Arduino Nano reception line.
    UART_AR3_TX        : out std_logic; -- UART Arduino Nano transmission line.
    UART_AR4_RX        : in  std_logic; -- UART Arduino Nano reception line.
    UART_AR4_TX        : out std_logic; -- UART Arduino Nano transmission line.
    -- PWM_MONITORING_ARDUINO ports interface
    PWM_1_AR1_D3       : in  std_logic; -- Arduino Nano digital port D3. PWM port 1.
    PWM_2_AR1_D5       : in  std_logic; -- Arduino Nano digital port D5. PWM port 2.
    PWM_3_AR1_D6       : in  std_logic; -- Arduino Nano digital port D6. PWM port 3.
    PWM_4_AR1_D9       : in  std_logic; -- Arduino Nano digital port D9. PWM port 4.
    PWM_5_AR1_D10      : in  std_logic; -- Arduino Nano digital port D10. PWM port 5.
    PWM_6_AR1_D11      : in  std_logic; -- Arduino Nano digital port D11. PWM port 6.
    PWM_1_AR2_D3       : in  std_logic; -- Arduino Nano digital port D3. PWM port 1.
    PWM_2_AR2_D5       : in  std_logic; -- Arduino Nano digital port D5. PWM port 2.
    PWM_3_AR2_D6       : in  std_logic; -- Arduino Nano digital port D6. PWM port 3.
    PWM_4_AR2_D9       : in  std_logic; -- Arduino Nano digital port D9. PWM port 4.
    PWM_5_AR2_D10      : in  std_logic; -- Arduino Nano digital port D10. PWM port 5.
    PWM_6_AR2_D11      : in  std_logic; -- Arduino Nano digital port D11. PWM port 6.
    PWM_1_AR3_D3       : in  std_logic; -- Arduino Nano digital port D3. PWM port 1.
    PWM_2_AR3_D5       : in  std_logic; -- Arduino Nano digital port D5. PWM port 2.
    PWM_3_AR3_D6       : in  std_logic; -- Arduino Nano digital port D6. PWM port 3.
    PWM_4_AR3_D9       : in  std_logic; -- Arduino Nano digital port D9. PWM port 4.
    PWM_5_AR3_D10      : in  std_logic; -- Arduino Nano digital port D10. PWM port 5.
    PWM_6_AR3_D11      : in  std_logic; -- Arduino Nano digital port D11. PWM port 6.
    PWM_1_AR4_D3       : in  std_logic; -- Arduino Nano digital port D3. PWM port 1.
    PWM_2_AR4_D5       : in  std_logic; -- Arduino Nano digital port D5. PWM port 2.
    PWM_3_AR4_D6       : in  std_logic; -- Arduino Nano digital port D6. PWM port 3.
    PWM_4_AR4_D9       : in  std_logic; -- Arduino Nano digital port D9. PWM port 4.
    PWM_5_AR4_D10      : in  std_logic; -- Arduino Nano digital port D10. PWM port 5.
    PWM_6_AR4_D11      : in  std_logic; -- Arduino Nano digital port D11. PWM port 6.
    -- DISCRETE_COMM_ARDUINO ports interface
    DISC_IN_1_AR1_D2   : in  std_logic; -- Arduino Nano digital port D2. Discrete Input 1.
    DISC_IN_2_AR1_D4   : in  std_logic; -- Arduino Nano digital port D4. Discrete Input 2.
    DISC_IN_3_AR1_D7   : in  std_logic; -- Arduino Nano digital port D7. Discrete Input 3.
    DISC_OUT_1_AR1_D8  : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_2_AR1_D12 : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_3_AR1_D13 : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_IN_1_AR2_D2   : in  std_logic; -- Arduino Nano digital port D2. Discrete Input 1.
    DISC_IN_2_AR2_D4   : in  std_logic; -- Arduino Nano digital port D4. Discrete Input 2.
    DISC_IN_3_AR2_D7   : in  std_logic; -- Arduino Nano digital port D7. Discrete Input 3.
    DISC_OUT_1_AR2_D8  : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_2_AR2_D12 : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_3_AR2_D13 : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_IN_1_AR3_D2   : in  std_logic; -- Arduino Nano digital port D2. Discrete Input 1.
    DISC_IN_2_AR3_D4   : in  std_logic; -- Arduino Nano digital port D4. Discrete Input 2.
    DISC_IN_3_AR3_D7   : in  std_logic; -- Arduino Nano digital port D7. Discrete Input 3.
    DISC_OUT_1_AR3_D8  : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_2_AR3_D12 : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_3_AR3_D13 : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_IN_1_AR4_D2   : in  std_logic; -- Arduino Nano digital port D2. Discrete Input 1.
    DISC_IN_2_AR4_D4   : in  std_logic; -- Arduino Nano digital port D4. Discrete Input 2.
    DISC_IN_3_AR4_D7   : in  std_logic; -- Arduino Nano digital port D7. Discrete Input 3.
    DISC_OUT_1_AR4_D8  : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_2_AR4_D12 : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    DISC_OUT_3_AR4_D13 : out std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
    -- Not used ports
    USER_IO_31         : in  std_logic;
    USER_IO_40         : in  std_logic;
    USER_IO_88         : in  std_logic;
    USER_IO_94         : in  std_logic;
    USER_IO_112        : in  std_logic;
    USER_IO_135        : in  std_logic;
    USER_IO_137        : in  std_logic;
    USER_IO_139        : in  std_logic;
    USER_IO_141        : in  std_logic);
end FPGA_MAIN_MODULE;

architecture TOP of FPGA_MAIN_MODULE is

  ----------------------------------------------------------------------------------------------------
  -- COMPONENT DECLARATIONS                                                                         --
  ----------------------------------------------------------------------------------------------------

  component MAIN_PROCESSOR is
    port (
      -- Clock and Reset signals
      CLK_50MHZ           : in  std_logic;                                            -- 32 MHz clock
      nRESET              : in  std_logic;                                            -- Asynchronous reset (Active LOW)
      -- UART_BLUETOOTH ports interface
      UART_BT_IN_FRAME    : in  std_logic_vector(7 downto 0);                         -- Received frame data.
      UART_BT_IN_RECEIVED : in  std_logic;                                            -- New frame data received.
      UART_BT_OUT_FRAME   : out std_logic_vector(7 downto 0);                         -- Frame data to be transmited.
      UART_BT_OUT_SEND    : out std_logic;                                            -- Command to start the transmission of a frame.
      -- UART_SHIELD ports interface
      UART_SH_IN_FRAME    : in  std_logic_vector(7 downto 0);                         -- Received frame data.
      UART_SH_IN_RECEIVED : in  std_logic;                                            -- New frame data received.
      UART_SH_OUT_FRAME   : out std_logic_vector(7 downto 0);                         -- Frame data to be transmited.
      UART_SH_OUT_SEND    : out std_logic;                                            -- Command to start the transmission of a frame.
      -- UART_ARDUINO ports interface
      UART_AR_IN_FRAME    : in  ARDUINO_FRAME_ARRAY;                                  -- Received frame data.
      UART_AR_IN_RECEIVED : in  std_logic_vector(ARDUINO_BOARDS-1 downto 0);          -- New frame data received.
      UART_AR_OUT_FRAME   : out ARDUINO_FRAME_ARRAY;                                  -- Frame data to be transmited.
      UART_AR_OUT_SEND    : out std_logic_vector(ARDUINO_BOARDS-1 downto 0);          -- Command to start the transmission of a frame.
      -- DISCRETE_COMM_SHIELD ports interface
      DISC_IN_SH_EDGE     : in  std_logic_vector(2 downto 0);                         -- Edge detected in discrete inputs.
      DISC_OUT_SH_LEVEL   : out std_logic_vector(8 downto 0);                         -- Commanded level for discrete outputs.
      -- PWM_MONITORING_ARDUINO ports interface
      PWM_AR_PULSE_HI     : in  PWM_ARDUINO_PULSE_ARRAY;                              -- PWM high level pulse in milliseconds.
      PWM_AR_PULSE_LO     : in  PWM_ARDUINO_PULSE_ARRAY;                              -- PWM low level pulse in milliseconds.
      -- DISCRETE_COMM_ARDUINO ports interface
      DISC_IN_AR_EDGE     : in  std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0);  -- Edge detected in discrete inputs.
      DISC_OUT_AR_LEVEL   : out std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0)); -- Commanded level for discrete outputs.
  end component;

  component UART_BLUETOOTH is
    port (
      -- Clock and Reset signals
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

  component UART_SHIELD is
    port (
      -- Clock and Reset signals
      CLK_50MHZ           : in  std_logic;                    -- 32 MHz clock
      nRESET              : in  std_logic;                    -- Asynchronous reset (Active LOW)
      -- FPGA_MAIN_MODULE ports interface
      UART_SH_RX          : in  std_logic;                    -- UART Shield reception line.
      UART_SH_TX          : out std_logic;                    -- UART Shield transmission line.
      -- MAIN_PROCESSOR ports interface
      UART_SH_IN_FRAME    : out std_logic_vector(7 downto 0); -- Received frame data.
      UART_SH_IN_RECEIVED : out std_logic;                    -- New frame data received.
      UART_SH_OUT_FRAME   : in  std_logic_vector(7 downto 0); -- Frame data to be transmited.
      UART_SH_OUT_SEND    : in  std_logic);                   -- Command to start the transmission of a frame.
  end component;

  component DISCRETE_COMM_SHIELD is
    port (
      -- Clock and Reset signals
      CLK_50MHZ           : in  std_logic;                   -- 32 MHz clock
      nRESET              : in  std_logic;                   -- Asynchronous reset (Active LOW)
      -- FPGA_MAIN_MODULE ports interface
      DISC_IN_1_SH_D2     : in  std_logic;                   -- Arduino Shield digital port D2. Discrete Input 1.
      DISC_IN_2_SH_D4     : in  std_logic;                   -- Arduino Shield digital port D4. Discrete Input 2.
      DISC_IN_3_SH_D7     : in  std_logic;                   -- Arduino Shield digital port D7. Discrete Input 3.
      PWM_1_SH_D3         : out std_logic;                   -- Arduino Shield digital port D3. PWM port 1.
      PWM_2_SH_D5         : out std_logic;                   -- Arduino Shield digital port D5. PWM port 2.
      PWM_3_SH_D6         : out std_logic;                   -- Arduino Shield digital port D6. PWM port 3.
      DISC_OUT_1_SH_D8    : out std_logic;                   -- Arduino Shield digital port D8. Discrete Ouput 1.
      DISC_OUT_2_SH_D12   : out std_logic;                   -- Arduino Shield digital port D8. Discrete Ouput 1.
      DISC_OUT_3_SH_D13   : out std_logic;                   -- Arduino Shield digital port D8. Discrete Ouput 1.
      PWM_4_SH_D9         : out std_logic;                   -- Arduino Shield digital port D9. PWM port 4.
      PWM_5_SH_D10        : out std_logic;                   -- Arduino Shield digital port D10. PWM port 5.
      PWM_6_SH_D11        : out std_logic;                   -- Arduino Shield digital port D11. PWM port 6.
      -- MAIN_PROCESSOR ports interface
      DISC_OUT_SH_LEVEL : in  std_logic_vector(8 downto 0);  -- Commanded level for discrete outputs.
      DISC_IN_SH_EDGE   : out std_logic_vector(2 downto 0)); -- Edge detected in discrete inputs.
  end component;

  component UART_ARDUINO is
    port (
      -- Clock and Reset signals
      CLK_50MHZ           : in  std_logic;                    -- 32 MHz clock
      nRESET              : in  std_logic;                    -- Asynchronous reset (Active LOW)
      -- FPGA_MAIN_MODULE ports interface
      UART_AR_RX          : in  std_logic;                    -- UART Arduino Nano reception line.
      UART_AR_TX          : out std_logic;                    -- UART Arduino Nano transmission line.
      -- MAIN_PROCESSOR ports interface
      UART_AR_IN_FRAME    : out std_logic_vector(7 downto 0); -- Received frame data.
      UART_AR_IN_RECEIVED : out std_logic;                    -- New frame data received.
      UART_AR_OUT_FRAME   : in  std_logic_vector(7 downto 0); -- Frame data to be transmited.
      UART_AR_OUT_SEND    : in  std_logic);                   -- Command to start the transmission of a frame.
  end component;

  component PWM_MONITORING_ARDUINO is
    port (
      -- Clock and Reset signals
      CLK_50MHZ           : in  std_logic;                    -- 32 MHz clock
      nRESET              : in  std_logic;                    -- Asynchronous reset (Active LOW)
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

  component DISCRETE_COMM_ARDUINO is
    port (
      -- Clock and Reset signals
      CLK_50MHZ           : in  std_logic;                    -- 32 MHz clock
      nRESET              : in  std_logic;                    -- Asynchronous reset (Active LOW)
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
  end component;

  ----------------------------------------------------------------------------------------------------
  -- SIGNAL DECLARATIONS                                                                            --
  ----------------------------------------------------------------------------------------------------

  -- BRD_STATUS_LED
  signal BRD_STATUS_LED_COUNT : integer range 1 to 5000000;
  signal BRD_STATUS_LED_WORD  : std_logic_vector(5 downto 0);
  -- MAIN_PROCESSOR <> UART_BLUETOOTH signals interface
  signal UART_BT_IN_FRAME     : std_logic_vector(7 downto 0);                        -- Received frame data.
  signal UART_BT_IN_RECEIVED  : std_logic;                                           -- New frame data received.
  signal UART_BT_OUT_FRAME    : std_logic_vector(7 downto 0);                        -- Frame data to be transmited.
  signal UART_BT_OUT_SEND     : std_logic;                                           -- Command to start the transmission of a frame.
  -- MAIN_PROCESSOR <> UART_SHIELD signals interface
  signal UART_SH_IN_FRAME     : std_logic_vector(7 downto 0);                        -- Received frame data.
  signal UART_SH_IN_RECEIVED  : std_logic;                                           -- New frame data received.
  signal UART_SH_OUT_FRAME    : std_logic_vector(7 downto 0);                        -- Frame data to be transmited.
  signal UART_SH_OUT_SEND     : std_logic;                                           -- Command to start the transmission of a frame.
  -- MAIN_PROCESSOR <> UART_ARDUINO signals interface
  signal UART_AR_IN_FRAME     : ARDUINO_FRAME_ARRAY;                                 -- Received frame data.
  signal UART_AR_IN_RECEIVED  : std_logic_vector(ARDUINO_BOARDS-1 downto 0);         -- New frame data received.
  signal UART_AR_OUT_FRAME    : ARDUINO_FRAME_ARRAY;                                 -- Frame data to be transmited.
  signal UART_AR_OUT_SEND     : std_logic_vector(ARDUINO_BOARDS-1 downto 0);         -- Command to start the transmission of a frame.
  -- MAIN_PROCESSOR <> DISCRETE_COMM_SHIELD signals interface
  signal DISC_IN_SH_EDGE      : std_logic_vector(2 downto 0);                        -- Edge detected in discrete inputs.
  signal DISC_OUT_SH_LEVEL    : std_logic_vector(8 downto 0);                        -- Commanded level for discrete outputs.
  -- MAIN_PROCESSOR <> PWM_MONITORING_ARDUINO signals interface
  signal PWM_AR_PULSE_HI      : PWM_ARDUINO_PULSE_ARRAY;                             -- PWM high level pulse in milliseconds.
  signal PWM_AR_PULSE_LO      : PWM_ARDUINO_PULSE_ARRAY;                             -- PWM low level pulse in milliseconds.
  signal PWM_AR_PULSE_HI_1    : PWM_AR_PULSE_ARRAY;                                  -- PWM high level pulse in milliseconds.
  signal PWM_AR_PULSE_LO_1    : PWM_AR_PULSE_ARRAY;                                  -- PWM low level pulse in milliseconds.
  signal PWM_AR_PULSE_HI_2    : PWM_AR_PULSE_ARRAY;                                  -- PWM high level pulse in milliseconds.
  signal PWM_AR_PULSE_LO_2    : PWM_AR_PULSE_ARRAY;                                  -- PWM low level pulse in milliseconds.
  signal PWM_AR_PULSE_HI_3    : PWM_AR_PULSE_ARRAY;                                  -- PWM high level pulse in milliseconds.
  signal PWM_AR_PULSE_LO_3    : PWM_AR_PULSE_ARRAY;                                  -- PWM low level pulse in milliseconds.
  signal PWM_AR_PULSE_HI_4    : PWM_AR_PULSE_ARRAY;                                  -- PWM high level pulse in milliseconds.
  signal PWM_AR_PULSE_LO_4    : PWM_AR_PULSE_ARRAY;                                  -- PWM low level pulse in milliseconds.
  -- MAIN_PROCESSOR <> DISCRETE_COMM_ARDUINO signals interface
  signal s_DISC_IN_AR_EDGE    : std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0); -- Edge detected in discrete inputs.
  signal s_DISC_OUT_AR_LEVEL  : std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0); -- Commanded level for discrete outputs.

  begin

    ----------------------------------------------------------------------------------------------------
    -- COMPONENT INSTANTIATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------

    INST_MAIN_PROCESSOR: MAIN_PROCESSOR
       port map (
         -- Clock and Reset signals
         CLK_50MHZ           => CLK_50MHZ,
         nRESET              => nRESET,
         -- UART_BLUETOOTH ports interface
         UART_BT_IN_FRAME    => UART_BT_IN_FRAME,
         UART_BT_IN_RECEIVED => UART_BT_IN_RECEIVED,
         UART_BT_OUT_FRAME   => UART_BT_OUT_FRAME,
         UART_BT_OUT_SEND    => UART_BT_OUT_SEND,
         -- UART_SHIELD ports interface
         UART_SH_IN_FRAME    => UART_SH_IN_FRAME,
         UART_SH_IN_RECEIVED => UART_SH_IN_RECEIVED,
         UART_SH_OUT_FRAME   => UART_SH_OUT_FRAME,
         UART_SH_OUT_SEND    => UART_SH_OUT_SEND,
         -- UART_ARDUINO ports interface
         UART_AR_IN_FRAME    => UART_AR_IN_FRAME,
         UART_AR_IN_RECEIVED => UART_AR_IN_RECEIVED,
         UART_AR_OUT_FRAME   => UART_AR_OUT_FRAME,
         UART_AR_OUT_SEND    => UART_AR_OUT_SEND,
         -- DISCRETE_COMM_SHIELD ports interface
         DISC_IN_SH_EDGE     => DISC_IN_SH_EDGE,
         DISC_OUT_SH_LEVEL   => DISC_OUT_SH_LEVEL,
         -- PWM_MONITORING_ARDUINO ports interface
         PWM_AR_PULSE_HI     => PWM_AR_PULSE_HI,
         PWM_AR_PULSE_LO     => PWM_AR_PULSE_LO,
         -- DISCRETE_COMM_ARDUINO ports interface
         DISC_IN_AR_EDGE     => s_DISC_IN_AR_EDGE,
         DISC_OUT_AR_LEVEL   => s_DISC_OUT_AR_LEVEL);

    INST_UART_BLUETOOTH: UART_BLUETOOTH
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

    INST_UART_SHIELD: UART_SHIELD
       port map (
         -- Clock and Reset signals
         CLK_50MHZ           => CLK_50MHZ,
         nRESET              => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         UART_SH_RX          => UART_SH_RX,
         UART_SH_TX          => UART_SH_TX,
         -- MAIN_PROCESSOR ports interface
         UART_SH_IN_FRAME    => UART_SH_IN_FRAME,
         UART_SH_IN_RECEIVED => UART_SH_IN_RECEIVED,
         UART_SH_OUT_FRAME   => UART_SH_OUT_FRAME,
         UART_SH_OUT_SEND    => UART_SH_OUT_SEND);

    INST_DISCRETE_COMM_SHIELD: DISCRETE_COMM_SHIELD
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

    INST_UART_ARDUINO_1: UART_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ           => CLK_50MHZ,
         nRESET              => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         UART_AR_RX          => UART_AR1_RX,
         UART_AR_TX          => UART_AR1_TX,
         -- MAIN_PROCESSOR ports interface
         UART_AR_IN_FRAME    => UART_AR_IN_FRAME(0),
         UART_AR_IN_RECEIVED => UART_AR_IN_RECEIVED(0),
         UART_AR_OUT_FRAME   => UART_AR_OUT_FRAME(0),
         UART_AR_OUT_SEND    => UART_AR_OUT_SEND(0));

    INST_UART_ARDUINO_2: UART_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ           => CLK_50MHZ,
         nRESET              => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         UART_AR_RX          => UART_AR2_RX,
         UART_AR_TX          => UART_AR2_TX,
         -- MAIN_PROCESSOR ports interface
         UART_AR_IN_FRAME    => UART_AR_IN_FRAME(1),
         UART_AR_IN_RECEIVED => UART_AR_IN_RECEIVED(1),
         UART_AR_OUT_FRAME   => UART_AR_OUT_FRAME(1),
         UART_AR_OUT_SEND    => UART_AR_OUT_SEND(1));

    INST_UART_ARDUINO_3: UART_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ           => CLK_50MHZ,
         nRESET              => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         UART_AR_RX          => UART_AR3_RX,
         UART_AR_TX          => UART_AR3_TX,
         -- MAIN_PROCESSOR ports interface
         UART_AR_IN_FRAME    => UART_AR_IN_FRAME(2),
         UART_AR_IN_RECEIVED => UART_AR_IN_RECEIVED(2),
         UART_AR_OUT_FRAME   => UART_AR_OUT_FRAME(2),
         UART_AR_OUT_SEND    => UART_AR_OUT_SEND(2));

    INST_UART_ARDUINO_4: UART_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ           => CLK_50MHZ,
         nRESET              => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         UART_AR_RX          => UART_AR4_RX,
         UART_AR_TX          => UART_AR4_TX,
         -- MAIN_PROCESSOR ports interface
         UART_AR_IN_FRAME    => UART_AR_IN_FRAME(3),
         UART_AR_IN_RECEIVED => UART_AR_IN_RECEIVED(3),
         UART_AR_OUT_FRAME   => UART_AR_OUT_FRAME(3),
         UART_AR_OUT_SEND    => UART_AR_OUT_SEND(3));

    INST_PWM_MONITORING_ARDUINO_1: PWM_MONITORING_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ       => CLK_50MHZ,
         nRESET          => nRESET,
         -- Input signals
         PWM_1_AR_D3     => PWM_1_AR1_D3,
         PWM_2_AR_D5     => PWM_2_AR1_D5,
         PWM_3_AR_D6     => PWM_3_AR1_D6,
         PWM_4_AR_D9     => PWM_4_AR1_D9,
         PWM_5_AR_D10    => PWM_5_AR1_D10,
         PWM_6_AR_D11    => PWM_6_AR1_D11,
         -- Ouput signals
         PWM_AR_PULSE_HI => PWM_AR_PULSE_HI_1,
         PWM_AR_PULSE_LO => PWM_AR_PULSE_LO_1);

    INST_PWM_MONITORING_ARDUINO_2: PWM_MONITORING_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ       => CLK_50MHZ,
         nRESET          => nRESET,
         -- Input signals
         PWM_1_AR_D3     => PWM_1_AR2_D3,
         PWM_2_AR_D5     => PWM_2_AR2_D5,
         PWM_3_AR_D6     => PWM_3_AR2_D6,
         PWM_4_AR_D9     => PWM_4_AR2_D9,
         PWM_5_AR_D10    => PWM_5_AR2_D10,
         PWM_6_AR_D11    => PWM_6_AR2_D11,
         -- Ouput signals
         PWM_AR_PULSE_HI => PWM_AR_PULSE_HI_2,
         PWM_AR_PULSE_LO => PWM_AR_PULSE_LO_2);

    INST_PWM_MONITORING_ARDUINO_3: PWM_MONITORING_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ       => CLK_50MHZ,
         nRESET          => nRESET,
         -- Input signals
         PWM_1_AR_D3     => PWM_1_AR3_D3,
         PWM_2_AR_D5     => PWM_2_AR3_D5,
         PWM_3_AR_D6     => PWM_3_AR3_D6,
         PWM_4_AR_D9     => PWM_4_AR3_D9,
         PWM_5_AR_D10    => PWM_5_AR3_D10,
         PWM_6_AR_D11    => PWM_6_AR3_D11,
         -- Ouput signals
         PWM_AR_PULSE_HI => PWM_AR_PULSE_HI_3,
         PWM_AR_PULSE_LO => PWM_AR_PULSE_LO_3);

    INST_PWM_MONITORING_ARDUINO_4: PWM_MONITORING_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ       => CLK_50MHZ,
         nRESET          => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         PWM_1_AR_D3     => PWM_1_AR4_D3,
         PWM_2_AR_D5     => PWM_2_AR4_D5,
         PWM_3_AR_D6     => PWM_3_AR4_D6,
         PWM_4_AR_D9     => PWM_4_AR4_D9,
         PWM_5_AR_D10    => PWM_5_AR4_D10,
         PWM_6_AR_D11    => PWM_6_AR4_D11,
         -- MAIN_PROCESSOR ports interface
         PWM_AR_PULSE_HI => PWM_AR_PULSE_HI_4,
         PWM_AR_PULSE_LO => PWM_AR_PULSE_LO_4);

    INST_DISCRETE_COMM_ARDUINO_1: DISCRETE_COMM_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ         => CLK_50MHZ,
         nRESET            => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         DISC_IN_1_AR_D2   => DISC_IN_1_AR1_D2,
         DISC_IN_2_AR_D4   => DISC_IN_2_AR1_D4,
         DISC_IN_3_AR_D7   => DISC_IN_3_AR1_D7,
         DISC_OUT_1_AR_D8  => DISC_OUT_1_AR1_D8,
         DISC_OUT_2_AR_D12 => DISC_OUT_2_AR1_D12,
         DISC_OUT_3_AR_D13 => DISC_OUT_3_AR1_D13,
         -- MAIN_PROCESSOR ports interface
         DISC_OUT_AR_LEVEL => s_DISC_OUT_AR_LEVEL(2 downto 0),
         DISC_IN_AR_EDGE   => s_DISC_IN_AR_EDGE(2 downto 0));

    INST_DISCRETE_COMM_ARDUINO_2: DISCRETE_COMM_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ         => CLK_50MHZ,
         nRESET            => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         DISC_IN_1_AR_D2   => DISC_IN_1_AR2_D2,
         DISC_IN_2_AR_D4   => DISC_IN_2_AR2_D4,
         DISC_IN_3_AR_D7   => DISC_IN_3_AR2_D7,
         DISC_OUT_1_AR_D8  => DISC_OUT_1_AR2_D8,
         DISC_OUT_2_AR_D12 => DISC_OUT_2_AR2_D12,
         DISC_OUT_3_AR_D13 => DISC_OUT_3_AR2_D13,
         -- MAIN_PROCESSOR ports interface
         DISC_OUT_AR_LEVEL => s_DISC_OUT_AR_LEVEL(5 downto 3),
         DISC_IN_AR_EDGE   => s_DISC_IN_AR_EDGE(5 downto 3));

    INST_DISCRETE_COMM_ARDUINO_3: DISCRETE_COMM_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ         => CLK_50MHZ,
         nRESET            => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         DISC_IN_1_AR_D2   => DISC_IN_1_AR3_D2,
         DISC_IN_2_AR_D4   => DISC_IN_2_AR3_D4,
         DISC_IN_3_AR_D7   => DISC_IN_3_AR3_D7,
         DISC_OUT_1_AR_D8  => DISC_OUT_1_AR3_D8,
         DISC_OUT_2_AR_D12 => DISC_OUT_2_AR3_D12,
         DISC_OUT_3_AR_D13 => DISC_OUT_3_AR3_D13,
         -- MAIN_PROCESSOR ports interface
         DISC_OUT_AR_LEVEL => s_DISC_OUT_AR_LEVEL(8 downto 6),
         DISC_IN_AR_EDGE   => s_DISC_IN_AR_EDGE(8 downto 6));

    INST_DISCRETE_COMM_ARDUINO_4: DISCRETE_COMM_ARDUINO
       port map (
         -- Clock and Reset signals
         CLK_50MHZ         => CLK_50MHZ,
         nRESET            => nRESET,
         -- FPGA_MAIN_MODULE ports interface
         DISC_IN_1_AR_D2   => DISC_IN_1_AR4_D2,
         DISC_IN_2_AR_D4   => DISC_IN_2_AR4_D4,
         DISC_IN_3_AR_D7   => DISC_IN_3_AR4_D7,
         DISC_OUT_1_AR_D8  => DISC_OUT_1_AR4_D8,
         DISC_OUT_2_AR_D12 => DISC_OUT_2_AR4_D12,
         DISC_OUT_3_AR_D13 => DISC_OUT_3_AR4_D13,
         -- MAIN_PROCESSOR ports interface
         DISC_OUT_AR_LEVEL => s_DISC_OUT_AR_LEVEL(11 downto 9),
         DISC_IN_AR_EDGE   => s_DISC_IN_AR_EDGE(11 downto 9));

    ----------------------------------------------------------------------------------------------------
    -- LOCAL RTL/FUNCTIONS AND PROCEDURES                                                             --
    ----------------------------------------------------------------------------------------------------

  PWM_AR_PULSE_HI_LOAD: for I in 0 to PWM_AR_PORTS-1 generate
    PWM_AR_PULSE_HI(4*I) <= PWM_AR_PULSE_HI_1(I);
    PWM_AR_PULSE_HI(4*I+1) <= PWM_AR_PULSE_HI_2(I);
    PWM_AR_PULSE_HI(4*I+2) <= PWM_AR_PULSE_HI_3(I);
    PWM_AR_PULSE_HI(4*I+3) <= PWM_AR_PULSE_HI_4(I);
  end generate PWM_AR_PULSE_HI_LOAD;

  PWM_AR_PULSE_LO_LOAD: for I in 0 to PWM_AR_PORTS-1 generate
    PWM_AR_PULSE_LO(4*I) <= PWM_AR_PULSE_LO_1(I);
    PWM_AR_PULSE_LO(4*I+1) <= PWM_AR_PULSE_LO_2(I);
    PWM_AR_PULSE_LO(4*I+2) <= PWM_AR_PULSE_LO_3(I);
    PWM_AR_PULSE_LO(4*I+3) <= PWM_AR_PULSE_LO_4(I);
  end generate PWM_AR_PULSE_LO_LOAD;

    -- Board Status LED Ports
    LED_2 <= BRD_STATUS_LED_WORD(0);
    LED_4 <= BRD_STATUS_LED_WORD(2);
    LED_5 <= BRD_STATUS_LED_WORD(4);

    BRD_STATUS_LED_COUNTER: process(CLK_50MHZ)
      begin
        if rising_edge(CLK_50MHZ) then
          if nRESET = '0' then
            BRD_STATUS_LED_COUNT <= 1;
            BRD_STATUS_LED_WORD <= (others => '0');
          else
            if BRD_STATUS_LED_COUNT = 5000000 then
              BRD_STATUS_LED_COUNT <= 1;
              if BRD_STATUS_LED_WORD = "111111" then
                BRD_STATUS_LED_WORD <= (others => '0');
              else
                BRD_STATUS_LED_WORD <= BRD_STATUS_LED_WORD(4 downto 0)&'1';
              end if;
            else
              BRD_STATUS_LED_COUNT <= BRD_STATUS_LED_COUNT + 1;
            end if; 
          end if;
        end if;
    end process BRD_STATUS_LED_COUNTER;

end TOP;