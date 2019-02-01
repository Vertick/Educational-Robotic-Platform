----------------------------------------------------------------------------------------------------
-- Block name: FPGA_MAIN_MODULE_Package                                                           --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: None.                                                                            --
----------------------------------------------------------------------------------------------------
-- Initial version 2 - 30/07/2018                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.RS232_Package.all;

package FPGA_MAIN_MODULE_Package is

  ----------------------------------------------------------------------------------------------------
  -- Type and constant declarations                                                                 --
  ----------------------------------------------------------------------------------------------------

  ----------------------------------------------------------------------------------------------------
  -- FPGA_MAIN_MODULE                                                                               --
  ----------------------------------------------------------------------------------------------------
  constant ARDUINO_BOARDS : integer := 4; -- Number of Arduino boards.
  constant ARDUINO_DISCRETE_PORTS : integer := 3*ARDUINO_BOARDS; -- Number of Arduino discrete ports.
  type ARDUINO_FRAME_ARRAY is array (0 to ARDUINO_BOARDS-1) of std_logic_vector(7 downto 0); -- Array of Arduino frames.

  ----------------------------------------------------------------------------------------------------
  -- MAIN_PROCESSOR                                                                                 --
  ----------------------------------------------------------------------------------------------------
  type UART_BT_STATE_TYPE is (IDLE, START_RESPONSE, ARDUINO_STATUS_DATA);  -- UART BT FSM states
  constant UART_BT_MSG_LENGTH : integer := 51; -- Number of characters for UART BT frames.
  type UART_BT_MSG2SEND_TYPE is array (0 to UART_BT_MSG_LENGTH-1) of std_logic_vector(7 downto 0);
  type UART_STATE_TYPE is (IDLE, RESPONSE_TO_ARDUINO_1, RESPONSE_TO_ARDUINO_2, RESPONSE_TO_ARDUINO_3, RESPONSE_TO_ARDUINO_4);  -- UART FSM states
  constant UART_MSG_LENGTH : integer := 21; -- Number of characters for UART frames.
  type UART_MSG2SEND_TYPE is array (0 to UART_MSG_LENGTH-1) of std_logic_vector(7 downto 0);
  constant UART_BT_START_RESPONSE : UART_BT_MSG2SEND_TYPE := (CHAR_LINE_FEED, CHAR_CR,        CHAR_UPPER_H,   CHAR_LOWER_E,
                                                              CHAR_UPPER_C,   CHAR_UPPER_R,   CHAR_UPPER_E,   CHAR_SPACE,
                                                              CHAR_LOWER_R,   CHAR_LOWER_E,   CHAR_LOWER_A,   CHAR_LOWER_D,
                                                              CHAR_LOWER_Y,   CHAR_FULL_STOP, CHAR_FULL_STOP, CHAR_FULL_STOP,
                                                              CHAR_LINE_FEED, CHAR_CR,        CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE);
  type UART_BT_ARDUINO_DATA_TYPE is array (0 to 16) of std_logic_vector(7 downto 0);
  constant UART_BT_ARDUINO_DATA : UART_BT_ARDUINO_DATA_TYPE := (CHAR_LINE_FEED, CHAR_CR,        CHAR_UPPER_A,   CHAR_LOWER_R,
                                                                CHAR_LOWER_D,   CHAR_LOWER_U,   CHAR_LOWER_I,   CHAR_LOWER_N,
                                                                CHAR_LOWER_O,   CHAR_SPACE,     CHAR_LOWER_D,   CHAR_LOWER_A,
                                                                CHAR_LOWER_T,   CHAR_LOWER_A,   CHAR_COLON,     CHAR_LINE_FEED,
                                                                CHAR_CR);
  type ARDUINO_DISC_STATUS_CHAR_TYPE is array (0 to 2*ARDUINO_DISCRETE_PORTS-1) of std_logic_vector(7 downto 0);
  constant UART_ACK_RESPONSE : UART_MSG2SEND_TYPE   := (CHAR_LINE_FEED, CHAR_CR,        CHAR_UPPER_M,   CHAR_LOWER_E,
                                                        CHAR_LOWER_S,   CHAR_LOWER_S,   CHAR_LOWER_A,   CHAR_LOWER_G,
                                                        CHAR_LOWER_E,   CHAR_SPACE,     CHAR_LOWER_R,   CHAR_LOWER_E,
                                                        CHAR_LOWER_C,   CHAR_LOWER_E,   CHAR_LOWER_I,   CHAR_LOWER_V,
                                                        CHAR_LOWER_E,   CHAR_LOWER_D,   CHAR_FULL_STOP, CHAR_LINE_FEED,
                                                        CHAR_CR);

  ----------------------------------------------------------------------------------------------------
  -- UART_BLUETOOTH                                                                                 --
  ----------------------------------------------------------------------------------------------------
  -- None.


  ----------------------------------------------------------------------------------------------------
  -- UART_ARDUINO                                                                                   --
  ----------------------------------------------------------------------------------------------------
  -- None.

end FPGA_MAIN_MODULE_Package;

package body FPGA_MAIN_MODULE_Package is

  ----------------------------------------------------------------------------------------------------
  -- Functions and Procedures                                                                       --
  ----------------------------------------------------------------------------------------------------
  -- None.

end FPGA_MAIN_MODULE_Package;
