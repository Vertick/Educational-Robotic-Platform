----------------------------------------------------------------------------------------------------
-- Block name: FPGA_MAIN_MODULE_Package                                                           --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: None.                                                                            --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 15/08/2017                                                                 --
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
  constant PWM_AR_PORTS : integer := 6; -- Number of Arduino ports.
  constant PWM_PULSE_LENGHT : integer := 8; -- Number of bits for PWM pulses.
  type ARDUINO_FRAME_ARRAY is array (0 to ARDUINO_BOARDS-1) of std_logic_vector(7 downto 0); -- Array of Arduino frames.
  type PWM_ARDUINO_PULSE_ARRAY is array (0 to ARDUINO_BOARDS*PWM_AR_PORTS-1) of std_logic_vector(PWM_PULSE_LENGHT-1 downto 0); -- Array of PWM ports.

  ----------------------------------------------------------------------------------------------------
  -- MAIN_PROCESSOR                                                                                 --
  ----------------------------------------------------------------------------------------------------
  type UART_BT_STATE_TYPE is (IDLE, START_RESPONSE, SHIELD_STATUS_DATA, ARDUINO_STATUS_DATA);  -- UART BT FSM states
  constant UART_BT_MSG_LENGTH : integer := 147; -- Number of characters for UART BT frames.
  type UART_BT_MSG2SEND_TYPE is array (0 to UART_BT_MSG_LENGTH-1) of std_logic_vector(7 downto 0);
  type UART_STATE_TYPE is (IDLE, RESPONSE_TO_SHIELD, RESPONSE_TO_ARDUINO_1, RESPONSE_TO_ARDUINO_2, RESPONSE_TO_ARDUINO_3, RESPONSE_TO_ARDUINO_4);  -- UART FSM states
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
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE,
                                                              CHAR_SPACE,     CHAR_SPACE,     CHAR_SPACE);
  type UART_BT_SHIELD_DATA_TYPE is array (0 to 15) of std_logic_vector(7 downto 0);
  constant UART_BT_SHIELD_DATA : UART_BT_SHIELD_DATA_TYPE := (CHAR_LINE_FEED, CHAR_CR,        CHAR_UPPER_S,   CHAR_LOWER_H,
                                                              CHAR_LOWER_I,   CHAR_LOWER_E,   CHAR_LOWER_L,   CHAR_LOWER_D,
                                                              CHAR_SPACE,     CHAR_LOWER_D,   CHAR_LOWER_A,   CHAR_LOWER_T,
                                                              CHAR_LOWER_A,   CHAR_COLON,     CHAR_LINE_FEED, CHAR_CR);
  type UART_BT_ARDUINO_DATA_TYPE is array (0 to 16) of std_logic_vector(7 downto 0);
  constant UART_BT_ARDUINO_DATA : UART_BT_ARDUINO_DATA_TYPE := (CHAR_LINE_FEED, CHAR_CR,        CHAR_UPPER_A,   CHAR_LOWER_R,
                                                                CHAR_LOWER_D,   CHAR_LOWER_U,   CHAR_LOWER_I,   CHAR_LOWER_N,
                                                                CHAR_LOWER_O,   CHAR_SPACE,     CHAR_LOWER_D,   CHAR_LOWER_A,
                                                                CHAR_LOWER_T,   CHAR_LOWER_A,   CHAR_COLON,     CHAR_LINE_FEED,
                                                                CHAR_CR);
  type SHIELD_STATUS_CHAR_TYPE is array (0 to 5) of std_logic_vector(7 downto 0);
  type ARDUINO_PWM_STATUS_CHAR_TYPE is array (0 to 2*ARDUINO_BOARDS*PWM_AR_PORTS-1) of std_logic_vector(7 downto 0);
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
  -- UART_SHIELD                                                                                    --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- DISCRETE_COMM_SHIELD                                                                           --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- UART_ARDUINO                                                                                   --
  ----------------------------------------------------------------------------------------------------
  -- None.

  ----------------------------------------------------------------------------------------------------
  -- PWM_MONITORING_ARDUINO                                                                         --
  ----------------------------------------------------------------------------------------------------
  type PWM_PULSE_COUNT_ARRAY is array (0 to PWM_AR_PORTS-1) of integer range 0 to 2**(PWM_PULSE_LENGHT-1); -- Array of PWM pulse lenght counters.  constant PWM_PULSE_LENGHT : integer := 8; -- PWM pulse bits lenght.
  constant TIME_REF_1MS_COUNT_LIMIT : integer := 50000; -- Time reference for 1 ms counter for a clock of 50 MHz.

  ----------------------------------------------------------------------------------------------------
  -- DISCRETE_COMM_ARDUINO                                                                          --
  ----------------------------------------------------------------------------------------------------
  type PWM_AR_PULSE_ARRAY is array (0 to PWM_AR_PORTS-1) of std_logic_vector(PWM_PULSE_LENGHT-1 downto 0); -- Array of PWM ports.

end FPGA_MAIN_MODULE_Package;

package body FPGA_MAIN_MODULE_Package is

  ----------------------------------------------------------------------------------------------------
  -- Functions and Procedures                                                                       --
  ----------------------------------------------------------------------------------------------------
  -- None.

end FPGA_MAIN_MODULE_Package;
