----------------------------------------------------------------------------------------------------
-- Block name: UART_SHIELD                                                                        --
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

entity UART_SHIELD is
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

end UART_SHIELD;

architecture RTL of UART_SHIELD is

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
      UART_IN_RECEIVED : out std_logic);                    -- New frame data received.
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
         UART_RX          => UART_SH_RX,
         -- Ouput signals
         UART_IN_FRAME    => UART_SH_IN_FRAME,
         UART_IN_RECEIVED => UART_SH_IN_RECEIVED);

    INST_UART_TX_MACHINE: UART_TX_MACHINE
       port map (
         -- Clock and Reset signals
         CLK_50MHZ      => CLK_50MHZ,
         nRESET         => nRESET,
         -- Input signals
         UART_OUT_FRAME => UART_SH_OUT_FRAME,
         UART_OUT_SEND  => UART_SH_OUT_SEND,
         -- Ouput signals
         UART_TX        => UART_SH_TX);

    ----------------------------------------------------------------------------------------------------
    -- LOCAL RTL/FUNCTIONS AND PROCEDURES                                                             --
    ----------------------------------------------------------------------------------------------------
    -- None.

end RTL;