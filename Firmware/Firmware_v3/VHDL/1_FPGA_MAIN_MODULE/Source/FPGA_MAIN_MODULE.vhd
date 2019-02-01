----------------------------------------------------------------------------------------------------
-- Block name: FPGA_MAIN_MODULE                                                                   --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: RS232_Package; FPGA_MAIN_MODULE_Package; MAIN_PROCESSOR; UART_BLUETOOTH;         --
-- UART_ARDUINO; DISCRETE_COMM_ARDUINO; UART_RX_MACHINE; UART_TX_MACHINE.                         --
----------------------------------------------------------------------------------------------------
-- Initial version 2 - 30/07/2018                                                                 --
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
    nRESET_AR1         : out std_logic; -- Asynchronous reset (Active LOW) for Arduino Nano 1
    nRESET_AR2         : out std_logic; -- Asynchronous reset (Active LOW) for Arduino Nano 2
    nRESET_AR3         : out std_logic; -- Asynchronous reset (Active LOW) for Arduino Nano 3
    nRESET_AR4         : out std_logic; -- Asynchronous reset (Active LOW) for Arduino Nano 4
    -- FPGA Status LED Ports
    LED_2              : out std_logic; -- Board LED_2
    LED_4              : out std_logic; -- Board LED_4
    LED_5              : out std_logic; -- Board LED_5
    -- UART_BLUETOOTH ports interface
    UART_BT_RX         : in  std_logic; -- UART Bluetooth reception line.
    UART_BT_TX         : out std_logic; -- UART Bluetooth transmission line.
    -- UART_ARDUINO ports interface
    UART_AR1_RX        : in  std_logic; -- UART Arduino Nano reception line.
    UART_AR1_TX        : out std_logic; -- UART Arduino Nano transmission line.
    UART_AR2_RX        : in  std_logic; -- UART Arduino Nano reception line.
    UART_AR2_TX        : out std_logic; -- UART Arduino Nano transmission line.
    UART_AR3_RX        : in  std_logic; -- UART Arduino Nano reception line.
    UART_AR3_TX        : out std_logic; -- UART Arduino Nano transmission line.
    UART_AR4_RX        : in  std_logic; -- UART Arduino Nano reception line.
    UART_AR4_TX        : out std_logic; -- UART Arduino Nano transmission line.
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
    USER_IO_8          : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_21         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_22         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_26         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_27         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_30         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_44         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_47         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_48         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_53         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_55         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_57         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_63         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_64         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_65         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_67         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_69         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_70         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_71         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_72         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_79         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_80         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_81         : in  std_logic;  -- Not used pin (BOARD 1V2)
    USER_IO_86         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_89         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_90         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_91         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_96         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_97         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_99         : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_100        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_101        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_112        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_118        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_120        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_121        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_126        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_129        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_132        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_136        : in  std_logic;  -- Not used pin (BOARD GND)
    USER_IO_137        : in  std_logic;  -- Not used pin
    USER_IO_139        : in  std_logic;  -- Not used pin
    USER_IO_141        : in  std_logic); -- Not used pin

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
      -- UART_ARDUINO ports interface
      UART_AR_IN_FRAME    : in  ARDUINO_FRAME_ARRAY;                                  -- Received frame data.
      UART_AR_IN_RECEIVED : in  std_logic_vector(ARDUINO_BOARDS-1 downto 0);          -- New frame data received.
      UART_AR_OUT_FRAME   : out ARDUINO_FRAME_ARRAY;                                  -- Frame data to be transmited.
      UART_AR_OUT_SEND    : out std_logic_vector(ARDUINO_BOARDS-1 downto 0);          -- Command to start the transmission of a frame.
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
  -- MAIN_PROCESSOR <> UART_ARDUINO signals interface
  signal UART_AR_IN_FRAME     : ARDUINO_FRAME_ARRAY;                                 -- Received frame data.
  signal UART_AR_IN_RECEIVED  : std_logic_vector(ARDUINO_BOARDS-1 downto 0);         -- New frame data received.
  signal UART_AR_OUT_FRAME    : ARDUINO_FRAME_ARRAY;                                 -- Frame data to be transmited.
  signal UART_AR_OUT_SEND     : std_logic_vector(ARDUINO_BOARDS-1 downto 0);         -- Command to start the transmission of a frame.
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
         -- UART_ARDUINO ports interface
         UART_AR_IN_FRAME    => UART_AR_IN_FRAME,
         UART_AR_IN_RECEIVED => UART_AR_IN_RECEIVED,
         UART_AR_OUT_FRAME   => UART_AR_OUT_FRAME,
         UART_AR_OUT_SEND    => UART_AR_OUT_SEND,
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

  nRESET_AR1 <= nRESET;
  nRESET_AR2 <= nRESET;
  nRESET_AR3 <= nRESET;
  nRESET_AR4 <= nRESET;

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