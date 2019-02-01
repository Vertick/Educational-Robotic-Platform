----------------------------------------------------------------------------------------------------
-- Block name: UART_BLUETOOTH                                                                     --
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

entity UART_BLUETOOTH is
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

end UART_BLUETOOTH;

architecture RTL of UART_BLUETOOTH is

  ----------------------------------------------------------------------------------------------------
  -- COMPONENT DECLARATIONS                                                                         --
  ----------------------------------------------------------------------------------------------------

  component UART_RX_MACHINE is
    port (
      -- Clock and Reset signals
      CLK_50MHZ        : in  std_logic;                    -- 50 MHz clock.
      nRESET           : in  std_logic;                    -- Asynchronous reset (Active LOW).
      -- Input signals
      UART_RX          : in std_logic;                     -- UART reception line.
      -- Ouput signals
      UART_IN_FRAME    : out std_logic_vector(7 downto 0); -- Received frame data.
      UART_IN_RECEIVED : out std_logic);                   -- New frame data received.
  end component;

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
  -- None.

  begin

    ----------------------------------------------------------------------------------------------------
    -- COMPONENT INSTANTIATIONS                                                                       --
    ----------------------------------------------------------------------------------------------------

    INST_UART_RX_MACHINE: UART_RX_MACHINE
       port map (
         -- Clock and Reset signals
         CLK_50MHZ        => CLK_50MHZ,
         nRESET           => nRESET,
         -- Input signals
         UART_RX          => UART_BT_RX,
         -- Ouput signals
         UART_IN_FRAME    => UART_BT_IN_FRAME,
         UART_IN_RECEIVED => UART_BT_IN_RECEIVED);

    INST_UART_TX_MACHINE: UART_TX_MACHINE
       port map (
         -- Clock and Reset signals
         CLK_50MHZ      => CLK_50MHZ,
         nRESET         => nRESET,
         -- Input signals
         UART_OUT_FRAME => UART_BT_OUT_FRAME,
         UART_OUT_SEND  => UART_BT_OUT_SEND,
         -- Ouput signals
         UART_TX        => UART_BT_TX);

    ----------------------------------------------------------------------------------------------------
    -- LOCAL RTL/FUNCTIONS AND PROCEDURES                                                             --
    ----------------------------------------------------------------------------------------------------
    -- None.

end RTL;