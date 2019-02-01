----------------------------------------------------------------------------------------------------
-- Block name: FPGA_MAIN_MODULE_TB                                                                --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: RS232_Package; FPGA_MAIN_MODULE_Package; FPGA_MAIN_MODULE; MAIN_PROCESSOR;       --
-- UART_BLUETOOTH; UART_SHIELD; DISCRETE_COMM_SHIELD; UART_ARDUINO;                               --
-- PWM_MONITORING_ARDUINO; DISCRETE_COMM_ARDUINO; UART_RX_MACHINE; UART_TX_MACHINE.               --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 26/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.RS232_Package.all;
use work.FPGA_MAIN_MODULE_Package.all;

entity FPGA_MAIN_MODULE_TB is

end FPGA_MAIN_MODULE_TB;

architecture BHV of FPGA_MAIN_MODULE_TB is

----------------------------------------------------------------------------------------------------
-- COMPONENT DECLARATIONS                                                                         --
----------------------------------------------------------------------------------------------------

component FPGA_MAIN_MODULE is
  port (-- Clock and Reset signals
    CLK_50MHZ          : in  std_logic; -- 32 MHz clock
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
end component;

function BT_MSG_TO_ASCII (MSG_IN : in  UART_BT_MSG2SEND_TYPE) return string is
  variable STRING_OUT : string (1 to UART_BT_MSG_LENGTH);

  begin
    for I in 1 to UART_BT_MSG_LENGTH loop  -- This loop cover the frames to receive
      if MSG_IN(I-1) < x"20" or MSG_IN(I-1) = x"20" or MSG_IN(I-1) = x"22"
        or MSG_IN(I-1) = x"9E" or MSG_IN(I-1) = x"FF" then STRING_OUT(I) := ' ';
      elsif MSG_IN(I-1) = x"21" then STRING_OUT(I) := '!';
      elsif MSG_IN(I-1) = x"23" then STRING_OUT(I) := '#';
      elsif MSG_IN(I-1) = x"24" then STRING_OUT(I) := '$';
      elsif MSG_IN(I-1) = x"25" then STRING_OUT(I) := '%';
      elsif MSG_IN(I-1) = x"26" then STRING_OUT(I) := '&';
      elsif MSG_IN(I-1) = x"27" then STRING_OUT(I) := ''';
      elsif MSG_IN(I-1) = x"28" then STRING_OUT(I) := '(';
      elsif MSG_IN(I-1) = x"29" then STRING_OUT(I) := ')';
      elsif MSG_IN(I-1) = x"2A" then STRING_OUT(I) := '*';
      elsif MSG_IN(I-1) = x"2B" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"2C" then STRING_OUT(I) := ',';
      elsif MSG_IN(I-1) = x"2D" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"2E" then STRING_OUT(I) := '.';
      elsif MSG_IN(I-1) = x"2F" then STRING_OUT(I) := '/';
      elsif MSG_IN(I-1) = x"30" then STRING_OUT(I) := '0';
      elsif MSG_IN(I-1) = x"31" then STRING_OUT(I) := '1';
      elsif MSG_IN(I-1) = x"32" then STRING_OUT(I) := '2';
      elsif MSG_IN(I-1) = x"33" then STRING_OUT(I) := '3';
      elsif MSG_IN(I-1) = x"34" then STRING_OUT(I) := '4';
      elsif MSG_IN(I-1) = x"35" then STRING_OUT(I) := '5';
      elsif MSG_IN(I-1) = x"36" then STRING_OUT(I) := '6';
      elsif MSG_IN(I-1) = x"37" then STRING_OUT(I) := '7';
      elsif MSG_IN(I-1) = x"38" then STRING_OUT(I) := '8';
      elsif MSG_IN(I-1) = x"39" then STRING_OUT(I) := '9';
      elsif MSG_IN(I-1) = x"3A" then STRING_OUT(I) := ':';
      elsif MSG_IN(I-1) = x"3B" then STRING_OUT(I) := ';';
      elsif MSG_IN(I-1) = x"3C" then STRING_OUT(I) := '<';
      elsif MSG_IN(I-1) = x"3D" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"3E" then STRING_OUT(I) := '>';
      elsif MSG_IN(I-1) = x"3F" then STRING_OUT(I) := '?';
      elsif MSG_IN(I-1) = x"40" then STRING_OUT(I) := '@';
      elsif MSG_IN(I-1) = x"41" then STRING_OUT(I) := 'A';
      elsif MSG_IN(I-1) = x"42" then STRING_OUT(I) := 'B';
      elsif MSG_IN(I-1) = x"43" then STRING_OUT(I) := 'C';
      elsif MSG_IN(I-1) = x"44" then STRING_OUT(I) := 'D';
      elsif MSG_IN(I-1) = x"45" then STRING_OUT(I) := 'E';
      elsif MSG_IN(I-1) = x"46" then STRING_OUT(I) := 'F';
      elsif MSG_IN(I-1) = x"47" then STRING_OUT(I) := 'G';
      elsif MSG_IN(I-1) = x"48" then STRING_OUT(I) := 'H';
      elsif MSG_IN(I-1) = x"49" then STRING_OUT(I) := 'I';
      elsif MSG_IN(I-1) = x"4A" then STRING_OUT(I) := 'J';
      elsif MSG_IN(I-1) = x"4B" then STRING_OUT(I) := 'K';
      elsif MSG_IN(I-1) = x"4C" then STRING_OUT(I) := 'L';
      elsif MSG_IN(I-1) = x"4D" then STRING_OUT(I) := 'M';
      elsif MSG_IN(I-1) = x"4E" then STRING_OUT(I) := 'N';
      elsif MSG_IN(I-1) = x"4F" then STRING_OUT(I) := 'O';
      elsif MSG_IN(I-1) = x"50" then STRING_OUT(I) := 'P';
      elsif MSG_IN(I-1) = x"51" then STRING_OUT(I) := 'Q';
      elsif MSG_IN(I-1) = x"52" then STRING_OUT(I) := 'R';
      elsif MSG_IN(I-1) = x"53" then STRING_OUT(I) := 'S';
      elsif MSG_IN(I-1) = x"54" then STRING_OUT(I) := 'T';
      elsif MSG_IN(I-1) = x"55" then STRING_OUT(I) := 'U';
      elsif MSG_IN(I-1) = x"56" then STRING_OUT(I) := 'V';
      elsif MSG_IN(I-1) = x"57" then STRING_OUT(I) := 'W';
      elsif MSG_IN(I-1) = x"58" then STRING_OUT(I) := 'X';
      elsif MSG_IN(I-1) = x"59" then STRING_OUT(I) := 'Y';
      elsif MSG_IN(I-1) = x"5A" then STRING_OUT(I) := 'Z';
      elsif MSG_IN(I-1) = x"5B" then STRING_OUT(I) := '[';
      elsif MSG_IN(I-1) = x"5C" then STRING_OUT(I) := '\';
      elsif MSG_IN(I-1) = x"5D" then STRING_OUT(I) := ']';
      elsif MSG_IN(I-1) = x"5E" then STRING_OUT(I) := '^';
      elsif MSG_IN(I-1) = x"5F" then STRING_OUT(I) := '_';
      elsif MSG_IN(I-1) = x"60" then STRING_OUT(I) := '`';
      elsif MSG_IN(I-1) = x"61" then STRING_OUT(I) := 'a';
      elsif MSG_IN(I-1) = x"62" then STRING_OUT(I) := 'b';
      elsif MSG_IN(I-1) = x"63" then STRING_OUT(I) := 'c';
      elsif MSG_IN(I-1) = x"64" then STRING_OUT(I) := 'd';
      elsif MSG_IN(I-1) = x"65" then STRING_OUT(I) := 'e';
      elsif MSG_IN(I-1) = x"66" then STRING_OUT(I) := 'f';
      elsif MSG_IN(I-1) = x"67" then STRING_OUT(I) := 'g';
      elsif MSG_IN(I-1) = x"68" then STRING_OUT(I) := 'h';
      elsif MSG_IN(I-1) = x"69" then STRING_OUT(I) := 'i';
      elsif MSG_IN(I-1) = x"6A" then STRING_OUT(I) := 'j';
      elsif MSG_IN(I-1) = x"6B" then STRING_OUT(I) := 'k';
      elsif MSG_IN(I-1) = x"6C" then STRING_OUT(I) := 'l';
      elsif MSG_IN(I-1) = x"6D" then STRING_OUT(I) := 'm';
      elsif MSG_IN(I-1) = x"6E" then STRING_OUT(I) := 'n';
      elsif MSG_IN(I-1) = x"6F" then STRING_OUT(I) := 'o';
      elsif MSG_IN(I-1) = x"70" then STRING_OUT(I) := 'p';
      elsif MSG_IN(I-1) = x"71" then STRING_OUT(I) := 'q';
      elsif MSG_IN(I-1) = x"72" then STRING_OUT(I) := 'r';
      elsif MSG_IN(I-1) = x"73" then STRING_OUT(I) := 's';
      elsif MSG_IN(I-1) = x"74" then STRING_OUT(I) := 't';
      elsif MSG_IN(I-1) = x"75" then STRING_OUT(I) := 'u';
      elsif MSG_IN(I-1) = x"76" then STRING_OUT(I) := 'v';
      elsif MSG_IN(I-1) = x"77" then STRING_OUT(I) := 'w';
      elsif MSG_IN(I-1) = x"78" then STRING_OUT(I) := 'x';
      elsif MSG_IN(I-1) = x"79" then STRING_OUT(I) := 'y';
      elsif MSG_IN(I-1) = x"7A" then STRING_OUT(I) := 'z';
      elsif MSG_IN(I-1) = x"7B" then STRING_OUT(I) := '{';
      elsif MSG_IN(I-1) = x"7C" then STRING_OUT(I) := '|';
      elsif MSG_IN(I-1) = x"7D" then STRING_OUT(I) := '}';
      elsif MSG_IN(I-1) = x"7E" then STRING_OUT(I) := '~';
      elsif MSG_IN(I-1) = x"7F" then STRING_OUT(I) := 'Ç';
      elsif MSG_IN(I-1) = x"80" then STRING_OUT(I) := 'ü';
      elsif MSG_IN(I-1) = x"81" then STRING_OUT(I) := 'é';
      elsif MSG_IN(I-1) = x"82" then STRING_OUT(I) := 'â';
      elsif MSG_IN(I-1) = x"83" then STRING_OUT(I) := 'ä';
      elsif MSG_IN(I-1) = x"84" then STRING_OUT(I) := 'à';
      elsif MSG_IN(I-1) = x"85" then STRING_OUT(I) := 'å';
      elsif MSG_IN(I-1) = x"86" then STRING_OUT(I) := 'ç';
      elsif MSG_IN(I-1) = x"87" then STRING_OUT(I) := 'ê';
      elsif MSG_IN(I-1) = x"88" then STRING_OUT(I) := 'ë';
      elsif MSG_IN(I-1) = x"89" then STRING_OUT(I) := 'è';
      elsif MSG_IN(I-1) = x"8A" then STRING_OUT(I) := 'ï';
      elsif MSG_IN(I-1) = x"8B" then STRING_OUT(I) := 'î';
      elsif MSG_IN(I-1) = x"8C" then STRING_OUT(I) := 'ì';
      elsif MSG_IN(I-1) = x"8D" then STRING_OUT(I) := 'Ä';
      elsif MSG_IN(I-1) = x"8E" then STRING_OUT(I) := 'Å';
      elsif MSG_IN(I-1) = x"8F" then STRING_OUT(I) := 'É';
      elsif MSG_IN(I-1) = x"90" then STRING_OUT(I) := 'æ';
      elsif MSG_IN(I-1) = x"91" then STRING_OUT(I) := 'Æ';
      elsif MSG_IN(I-1) = x"92" then STRING_OUT(I) := 'ô';
      elsif MSG_IN(I-1) = x"93" then STRING_OUT(I) := 'ö';
      elsif MSG_IN(I-1) = x"94" then STRING_OUT(I) := 'ò';
      elsif MSG_IN(I-1) = x"95" then STRING_OUT(I) := 'û';
      elsif MSG_IN(I-1) = x"96" then STRING_OUT(I) := 'ù';
      elsif MSG_IN(I-1) = x"97" then STRING_OUT(I) := 'ÿ';
      elsif MSG_IN(I-1) = x"98" then STRING_OUT(I) := 'Ö';
      elsif MSG_IN(I-1) = x"99" then STRING_OUT(I) := 'Ü';
      elsif MSG_IN(I-1) = x"9A" then STRING_OUT(I) := 'ø';
      elsif MSG_IN(I-1) = x"9B" then STRING_OUT(I) := '£';
      elsif MSG_IN(I-1) = x"9C" then STRING_OUT(I) := 'Ø';
      elsif MSG_IN(I-1) = x"9D" then STRING_OUT(I) := '×';
      elsif MSG_IN(I-1) = x"9F" then STRING_OUT(I) := 'á';
      elsif MSG_IN(I-1) = x"A0" then STRING_OUT(I) := 'í';
      elsif MSG_IN(I-1) = x"A1" then STRING_OUT(I) := 'ó';
      elsif MSG_IN(I-1) = x"A2" then STRING_OUT(I) := 'ú';
      elsif MSG_IN(I-1) = x"A3" then STRING_OUT(I) := 'ñ';
      elsif MSG_IN(I-1) = x"A4" then STRING_OUT(I) := 'Ñ';
      elsif MSG_IN(I-1) = x"A5" then STRING_OUT(I) := 'ª';
      elsif MSG_IN(I-1) = x"A6" then STRING_OUT(I) := 'º';
      elsif MSG_IN(I-1) = x"A7" then STRING_OUT(I) := '¿';
      elsif MSG_IN(I-1) = x"A8" then STRING_OUT(I) := '®';
      elsif MSG_IN(I-1) = x"A9" then STRING_OUT(I) := '¬';
      elsif MSG_IN(I-1) = x"AA" then STRING_OUT(I) := '½';
      elsif MSG_IN(I-1) = x"AB" then STRING_OUT(I) := '¼';
      elsif MSG_IN(I-1) = x"AC" then STRING_OUT(I) := '¡';
      elsif MSG_IN(I-1) = x"AD" then STRING_OUT(I) := '«';
      elsif MSG_IN(I-1) = x"AE" then STRING_OUT(I) := '»';
      elsif MSG_IN(I-1) = x"AF" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B0" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B1" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B2" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B3" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B4" then STRING_OUT(I) := 'Á';
      elsif MSG_IN(I-1) = x"B5" then STRING_OUT(I) := 'Â';
      elsif MSG_IN(I-1) = x"B6" then STRING_OUT(I) := 'À';
      elsif MSG_IN(I-1) = x"B7" then STRING_OUT(I) := '©';
      elsif MSG_IN(I-1) = x"B8" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B9" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"BA" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BB" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BC" then STRING_OUT(I) := '¢';
      elsif MSG_IN(I-1) = x"BD" then STRING_OUT(I) := '¥';
      elsif MSG_IN(I-1) = x"BE" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BF" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C0" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C1" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C2" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C3" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C4" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C5" then STRING_OUT(I) := 'ã';
      elsif MSG_IN(I-1) = x"C6" then STRING_OUT(I) := 'Ã';
      elsif MSG_IN(I-1) = x"C7" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C8" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C9" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CA" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CB" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"CC" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CD" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"CE" then STRING_OUT(I) := '¤';
      elsif MSG_IN(I-1) = x"CF" then STRING_OUT(I) := 'ð';
      elsif MSG_IN(I-1) = x"D0" then STRING_OUT(I) := 'Ð';
      elsif MSG_IN(I-1) = x"D1" then STRING_OUT(I) := 'Ê';
      elsif MSG_IN(I-1) = x"D2" then STRING_OUT(I) := 'Ë';
      elsif MSG_IN(I-1) = x"D3" then STRING_OUT(I) := 'È';
      elsif MSG_IN(I-1) = x"D4" then STRING_OUT(I) := 'i';
      elsif MSG_IN(I-1) = x"D5" then STRING_OUT(I) := 'Í';
      elsif MSG_IN(I-1) = x"D6" then STRING_OUT(I) := 'Î';
      elsif MSG_IN(I-1) = x"D7" then STRING_OUT(I) := 'Ï';
      elsif MSG_IN(I-1) = x"D8" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"D9" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"DA" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"DB" then STRING_OUT(I) := '_';
      elsif MSG_IN(I-1) = x"DC" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"DD" then STRING_OUT(I) := 'Ì';
      elsif MSG_IN(I-1) = x"DE" then STRING_OUT(I) := '¯';
      elsif MSG_IN(I-1) = x"DF" then STRING_OUT(I) := 'Ó';
      elsif MSG_IN(I-1) = x"E0" then STRING_OUT(I) := 'ß';
      elsif MSG_IN(I-1) = x"E1" then STRING_OUT(I) := 'Ô';
      elsif MSG_IN(I-1) = x"E2" then STRING_OUT(I) := 'Ò';
      elsif MSG_IN(I-1) = x"E3" then STRING_OUT(I) := 'õ';
      elsif MSG_IN(I-1) = x"E4" then STRING_OUT(I) := 'Õ';
      elsif MSG_IN(I-1) = x"E5" then STRING_OUT(I) := 'µ';
      elsif MSG_IN(I-1) = x"E6" then STRING_OUT(I) := 'þ';
      elsif MSG_IN(I-1) = x"E7" then STRING_OUT(I) := 'Þ';
      elsif MSG_IN(I-1) = x"E8" then STRING_OUT(I) := 'Ú';
      elsif MSG_IN(I-1) = x"E9" then STRING_OUT(I) := 'Û';
      elsif MSG_IN(I-1) = x"EA" then STRING_OUT(I) := 'Ù';
      elsif MSG_IN(I-1) = x"EB" then STRING_OUT(I) := 'ý';
      elsif MSG_IN(I-1) = x"EC" then STRING_OUT(I) := 'Ý';
      elsif MSG_IN(I-1) = x"ED" then STRING_OUT(I) := '¯';
      elsif MSG_IN(I-1) = x"EE" then STRING_OUT(I) := '´';
      elsif MSG_IN(I-1) = x"EF" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"F0" then STRING_OUT(I) := '±';
      elsif MSG_IN(I-1) = x"F1" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"F2" then STRING_OUT(I) := '¾';
      elsif MSG_IN(I-1) = x"F3" then STRING_OUT(I) := '¶';
      elsif MSG_IN(I-1) = x"F4" then STRING_OUT(I) := '§';
      elsif MSG_IN(I-1) = x"F5" then STRING_OUT(I) := '÷';
      elsif MSG_IN(I-1) = x"F6" then STRING_OUT(I) := '¸';
      elsif MSG_IN(I-1) = x"F7" then STRING_OUT(I) := '°';
      elsif MSG_IN(I-1) = x"F8" then STRING_OUT(I) := '¨';
      elsif MSG_IN(I-1) = x"F9" then STRING_OUT(I) := '·';
      elsif MSG_IN(I-1) = x"FA" then STRING_OUT(I) := '¹';
      elsif MSG_IN(I-1) = x"FB" then STRING_OUT(I) := '³';
      elsif MSG_IN(I-1) = x"FC" then STRING_OUT(I) := '²';
      elsif MSG_IN(I-1) = x"FD" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"FE" then STRING_OUT(I) := '¦';
      end if;
    end loop;
    return STRING_OUT;
end BT_MSG_TO_ASCII;

function MSG_TO_ASCII (MSG_IN : in  UART_MSG2SEND_TYPE) return string is
  variable STRING_OUT : string (1 to UART_MSG_LENGTH);

  begin
    for I in 1 to UART_MSG_LENGTH loop  -- This loop cover the frames to receive
      if MSG_IN(I-1) < x"20" or MSG_IN(I-1) = x"20" or MSG_IN(I-1) = x"22"
        or MSG_IN(I-1) = x"9E" or MSG_IN(I-1) = x"FF" then STRING_OUT(I) := ' ';
      elsif MSG_IN(I-1) = x"21" then STRING_OUT(I) := '!';
      elsif MSG_IN(I-1) = x"23" then STRING_OUT(I) := '#';
      elsif MSG_IN(I-1) = x"24" then STRING_OUT(I) := '$';
      elsif MSG_IN(I-1) = x"25" then STRING_OUT(I) := '%';
      elsif MSG_IN(I-1) = x"26" then STRING_OUT(I) := '&';
      elsif MSG_IN(I-1) = x"27" then STRING_OUT(I) := ''';
      elsif MSG_IN(I-1) = x"28" then STRING_OUT(I) := '(';
      elsif MSG_IN(I-1) = x"29" then STRING_OUT(I) := ')';
      elsif MSG_IN(I-1) = x"2A" then STRING_OUT(I) := '*';
      elsif MSG_IN(I-1) = x"2B" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"2C" then STRING_OUT(I) := ',';
      elsif MSG_IN(I-1) = x"2D" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"2E" then STRING_OUT(I) := '.';
      elsif MSG_IN(I-1) = x"2F" then STRING_OUT(I) := '/';
      elsif MSG_IN(I-1) = x"30" then STRING_OUT(I) := '0';
      elsif MSG_IN(I-1) = x"31" then STRING_OUT(I) := '1';
      elsif MSG_IN(I-1) = x"32" then STRING_OUT(I) := '2';
      elsif MSG_IN(I-1) = x"33" then STRING_OUT(I) := '3';
      elsif MSG_IN(I-1) = x"34" then STRING_OUT(I) := '4';
      elsif MSG_IN(I-1) = x"35" then STRING_OUT(I) := '5';
      elsif MSG_IN(I-1) = x"36" then STRING_OUT(I) := '6';
      elsif MSG_IN(I-1) = x"37" then STRING_OUT(I) := '7';
      elsif MSG_IN(I-1) = x"38" then STRING_OUT(I) := '8';
      elsif MSG_IN(I-1) = x"39" then STRING_OUT(I) := '9';
      elsif MSG_IN(I-1) = x"3A" then STRING_OUT(I) := ':';
      elsif MSG_IN(I-1) = x"3B" then STRING_OUT(I) := ';';
      elsif MSG_IN(I-1) = x"3C" then STRING_OUT(I) := '<';
      elsif MSG_IN(I-1) = x"3D" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"3E" then STRING_OUT(I) := '>';
      elsif MSG_IN(I-1) = x"3F" then STRING_OUT(I) := '?';
      elsif MSG_IN(I-1) = x"40" then STRING_OUT(I) := '@';
      elsif MSG_IN(I-1) = x"41" then STRING_OUT(I) := 'A';
      elsif MSG_IN(I-1) = x"42" then STRING_OUT(I) := 'B';
      elsif MSG_IN(I-1) = x"43" then STRING_OUT(I) := 'C';
      elsif MSG_IN(I-1) = x"44" then STRING_OUT(I) := 'D';
      elsif MSG_IN(I-1) = x"45" then STRING_OUT(I) := 'E';
      elsif MSG_IN(I-1) = x"46" then STRING_OUT(I) := 'F';
      elsif MSG_IN(I-1) = x"47" then STRING_OUT(I) := 'G';
      elsif MSG_IN(I-1) = x"48" then STRING_OUT(I) := 'H';
      elsif MSG_IN(I-1) = x"49" then STRING_OUT(I) := 'I';
      elsif MSG_IN(I-1) = x"4A" then STRING_OUT(I) := 'J';
      elsif MSG_IN(I-1) = x"4B" then STRING_OUT(I) := 'K';
      elsif MSG_IN(I-1) = x"4C" then STRING_OUT(I) := 'L';
      elsif MSG_IN(I-1) = x"4D" then STRING_OUT(I) := 'M';
      elsif MSG_IN(I-1) = x"4E" then STRING_OUT(I) := 'N';
      elsif MSG_IN(I-1) = x"4F" then STRING_OUT(I) := 'O';
      elsif MSG_IN(I-1) = x"50" then STRING_OUT(I) := 'P';
      elsif MSG_IN(I-1) = x"51" then STRING_OUT(I) := 'Q';
      elsif MSG_IN(I-1) = x"52" then STRING_OUT(I) := 'R';
      elsif MSG_IN(I-1) = x"53" then STRING_OUT(I) := 'S';
      elsif MSG_IN(I-1) = x"54" then STRING_OUT(I) := 'T';
      elsif MSG_IN(I-1) = x"55" then STRING_OUT(I) := 'U';
      elsif MSG_IN(I-1) = x"56" then STRING_OUT(I) := 'V';
      elsif MSG_IN(I-1) = x"57" then STRING_OUT(I) := 'W';
      elsif MSG_IN(I-1) = x"58" then STRING_OUT(I) := 'X';
      elsif MSG_IN(I-1) = x"59" then STRING_OUT(I) := 'Y';
      elsif MSG_IN(I-1) = x"5A" then STRING_OUT(I) := 'Z';
      elsif MSG_IN(I-1) = x"5B" then STRING_OUT(I) := '[';
      elsif MSG_IN(I-1) = x"5C" then STRING_OUT(I) := '\';
      elsif MSG_IN(I-1) = x"5D" then STRING_OUT(I) := ']';
      elsif MSG_IN(I-1) = x"5E" then STRING_OUT(I) := '^';
      elsif MSG_IN(I-1) = x"5F" then STRING_OUT(I) := '_';
      elsif MSG_IN(I-1) = x"60" then STRING_OUT(I) := '`';
      elsif MSG_IN(I-1) = x"61" then STRING_OUT(I) := 'a';
      elsif MSG_IN(I-1) = x"62" then STRING_OUT(I) := 'b';
      elsif MSG_IN(I-1) = x"63" then STRING_OUT(I) := 'c';
      elsif MSG_IN(I-1) = x"64" then STRING_OUT(I) := 'd';
      elsif MSG_IN(I-1) = x"65" then STRING_OUT(I) := 'e';
      elsif MSG_IN(I-1) = x"66" then STRING_OUT(I) := 'f';
      elsif MSG_IN(I-1) = x"67" then STRING_OUT(I) := 'g';
      elsif MSG_IN(I-1) = x"68" then STRING_OUT(I) := 'h';
      elsif MSG_IN(I-1) = x"69" then STRING_OUT(I) := 'i';
      elsif MSG_IN(I-1) = x"6A" then STRING_OUT(I) := 'j';
      elsif MSG_IN(I-1) = x"6B" then STRING_OUT(I) := 'k';
      elsif MSG_IN(I-1) = x"6C" then STRING_OUT(I) := 'l';
      elsif MSG_IN(I-1) = x"6D" then STRING_OUT(I) := 'm';
      elsif MSG_IN(I-1) = x"6E" then STRING_OUT(I) := 'n';
      elsif MSG_IN(I-1) = x"6F" then STRING_OUT(I) := 'o';
      elsif MSG_IN(I-1) = x"70" then STRING_OUT(I) := 'p';
      elsif MSG_IN(I-1) = x"71" then STRING_OUT(I) := 'q';
      elsif MSG_IN(I-1) = x"72" then STRING_OUT(I) := 'r';
      elsif MSG_IN(I-1) = x"73" then STRING_OUT(I) := 's';
      elsif MSG_IN(I-1) = x"74" then STRING_OUT(I) := 't';
      elsif MSG_IN(I-1) = x"75" then STRING_OUT(I) := 'u';
      elsif MSG_IN(I-1) = x"76" then STRING_OUT(I) := 'v';
      elsif MSG_IN(I-1) = x"77" then STRING_OUT(I) := 'w';
      elsif MSG_IN(I-1) = x"78" then STRING_OUT(I) := 'x';
      elsif MSG_IN(I-1) = x"79" then STRING_OUT(I) := 'y';
      elsif MSG_IN(I-1) = x"7A" then STRING_OUT(I) := 'z';
      elsif MSG_IN(I-1) = x"7B" then STRING_OUT(I) := '{';
      elsif MSG_IN(I-1) = x"7C" then STRING_OUT(I) := '|';
      elsif MSG_IN(I-1) = x"7D" then STRING_OUT(I) := '}';
      elsif MSG_IN(I-1) = x"7E" then STRING_OUT(I) := '~';
      elsif MSG_IN(I-1) = x"7F" then STRING_OUT(I) := 'Ç';
      elsif MSG_IN(I-1) = x"80" then STRING_OUT(I) := 'ü';
      elsif MSG_IN(I-1) = x"81" then STRING_OUT(I) := 'é';
      elsif MSG_IN(I-1) = x"82" then STRING_OUT(I) := 'â';
      elsif MSG_IN(I-1) = x"83" then STRING_OUT(I) := 'ä';
      elsif MSG_IN(I-1) = x"84" then STRING_OUT(I) := 'à';
      elsif MSG_IN(I-1) = x"85" then STRING_OUT(I) := 'å';
      elsif MSG_IN(I-1) = x"86" then STRING_OUT(I) := 'ç';
      elsif MSG_IN(I-1) = x"87" then STRING_OUT(I) := 'ê';
      elsif MSG_IN(I-1) = x"88" then STRING_OUT(I) := 'ë';
      elsif MSG_IN(I-1) = x"89" then STRING_OUT(I) := 'è';
      elsif MSG_IN(I-1) = x"8A" then STRING_OUT(I) := 'ï';
      elsif MSG_IN(I-1) = x"8B" then STRING_OUT(I) := 'î';
      elsif MSG_IN(I-1) = x"8C" then STRING_OUT(I) := 'ì';
      elsif MSG_IN(I-1) = x"8D" then STRING_OUT(I) := 'Ä';
      elsif MSG_IN(I-1) = x"8E" then STRING_OUT(I) := 'Å';
      elsif MSG_IN(I-1) = x"8F" then STRING_OUT(I) := 'É';
      elsif MSG_IN(I-1) = x"90" then STRING_OUT(I) := 'æ';
      elsif MSG_IN(I-1) = x"91" then STRING_OUT(I) := 'Æ';
      elsif MSG_IN(I-1) = x"92" then STRING_OUT(I) := 'ô';
      elsif MSG_IN(I-1) = x"93" then STRING_OUT(I) := 'ö';
      elsif MSG_IN(I-1) = x"94" then STRING_OUT(I) := 'ò';
      elsif MSG_IN(I-1) = x"95" then STRING_OUT(I) := 'û';
      elsif MSG_IN(I-1) = x"96" then STRING_OUT(I) := 'ù';
      elsif MSG_IN(I-1) = x"97" then STRING_OUT(I) := 'ÿ';
      elsif MSG_IN(I-1) = x"98" then STRING_OUT(I) := 'Ö';
      elsif MSG_IN(I-1) = x"99" then STRING_OUT(I) := 'Ü';
      elsif MSG_IN(I-1) = x"9A" then STRING_OUT(I) := 'ø';
      elsif MSG_IN(I-1) = x"9B" then STRING_OUT(I) := '£';
      elsif MSG_IN(I-1) = x"9C" then STRING_OUT(I) := 'Ø';
      elsif MSG_IN(I-1) = x"9D" then STRING_OUT(I) := '×';
      elsif MSG_IN(I-1) = x"9F" then STRING_OUT(I) := 'á';
      elsif MSG_IN(I-1) = x"A0" then STRING_OUT(I) := 'í';
      elsif MSG_IN(I-1) = x"A1" then STRING_OUT(I) := 'ó';
      elsif MSG_IN(I-1) = x"A2" then STRING_OUT(I) := 'ú';
      elsif MSG_IN(I-1) = x"A3" then STRING_OUT(I) := 'ñ';
      elsif MSG_IN(I-1) = x"A4" then STRING_OUT(I) := 'Ñ';
      elsif MSG_IN(I-1) = x"A5" then STRING_OUT(I) := 'ª';
      elsif MSG_IN(I-1) = x"A6" then STRING_OUT(I) := 'º';
      elsif MSG_IN(I-1) = x"A7" then STRING_OUT(I) := '¿';
      elsif MSG_IN(I-1) = x"A8" then STRING_OUT(I) := '®';
      elsif MSG_IN(I-1) = x"A9" then STRING_OUT(I) := '¬';
      elsif MSG_IN(I-1) = x"AA" then STRING_OUT(I) := '½';
      elsif MSG_IN(I-1) = x"AB" then STRING_OUT(I) := '¼';
      elsif MSG_IN(I-1) = x"AC" then STRING_OUT(I) := '¡';
      elsif MSG_IN(I-1) = x"AD" then STRING_OUT(I) := '«';
      elsif MSG_IN(I-1) = x"AE" then STRING_OUT(I) := '»';
      elsif MSG_IN(I-1) = x"AF" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B0" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B1" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B2" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B3" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B4" then STRING_OUT(I) := 'Á';
      elsif MSG_IN(I-1) = x"B5" then STRING_OUT(I) := 'Â';
      elsif MSG_IN(I-1) = x"B6" then STRING_OUT(I) := 'À';
      elsif MSG_IN(I-1) = x"B7" then STRING_OUT(I) := '©';
      elsif MSG_IN(I-1) = x"B8" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"B9" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"BA" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BB" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BC" then STRING_OUT(I) := '¢';
      elsif MSG_IN(I-1) = x"BD" then STRING_OUT(I) := '¥';
      elsif MSG_IN(I-1) = x"BE" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BF" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C0" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C1" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C2" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C3" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C4" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C5" then STRING_OUT(I) := 'ã';
      elsif MSG_IN(I-1) = x"C6" then STRING_OUT(I) := 'Ã';
      elsif MSG_IN(I-1) = x"C7" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C8" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C9" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CA" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CB" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"CC" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CD" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"CE" then STRING_OUT(I) := '¤';
      elsif MSG_IN(I-1) = x"CF" then STRING_OUT(I) := 'ð';
      elsif MSG_IN(I-1) = x"D0" then STRING_OUT(I) := 'Ð';
      elsif MSG_IN(I-1) = x"D1" then STRING_OUT(I) := 'Ê';
      elsif MSG_IN(I-1) = x"D2" then STRING_OUT(I) := 'Ë';
      elsif MSG_IN(I-1) = x"D3" then STRING_OUT(I) := 'È';
      elsif MSG_IN(I-1) = x"D4" then STRING_OUT(I) := 'i';
      elsif MSG_IN(I-1) = x"D5" then STRING_OUT(I) := 'Í';
      elsif MSG_IN(I-1) = x"D6" then STRING_OUT(I) := 'Î';
      elsif MSG_IN(I-1) = x"D7" then STRING_OUT(I) := 'Ï';
      elsif MSG_IN(I-1) = x"D8" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"D9" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"DA" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"DB" then STRING_OUT(I) := '_';
      elsif MSG_IN(I-1) = x"DC" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"DD" then STRING_OUT(I) := 'Ì';
      elsif MSG_IN(I-1) = x"DE" then STRING_OUT(I) := '¯';
      elsif MSG_IN(I-1) = x"DF" then STRING_OUT(I) := 'Ó';
      elsif MSG_IN(I-1) = x"E0" then STRING_OUT(I) := 'ß';
      elsif MSG_IN(I-1) = x"E1" then STRING_OUT(I) := 'Ô';
      elsif MSG_IN(I-1) = x"E2" then STRING_OUT(I) := 'Ò';
      elsif MSG_IN(I-1) = x"E3" then STRING_OUT(I) := 'õ';
      elsif MSG_IN(I-1) = x"E4" then STRING_OUT(I) := 'Õ';
      elsif MSG_IN(I-1) = x"E5" then STRING_OUT(I) := 'µ';
      elsif MSG_IN(I-1) = x"E6" then STRING_OUT(I) := 'þ';
      elsif MSG_IN(I-1) = x"E7" then STRING_OUT(I) := 'Þ';
      elsif MSG_IN(I-1) = x"E8" then STRING_OUT(I) := 'Ú';
      elsif MSG_IN(I-1) = x"E9" then STRING_OUT(I) := 'Û';
      elsif MSG_IN(I-1) = x"EA" then STRING_OUT(I) := 'Ù';
      elsif MSG_IN(I-1) = x"EB" then STRING_OUT(I) := 'ý';
      elsif MSG_IN(I-1) = x"EC" then STRING_OUT(I) := 'Ý';
      elsif MSG_IN(I-1) = x"ED" then STRING_OUT(I) := '¯';
      elsif MSG_IN(I-1) = x"EE" then STRING_OUT(I) := '´';
      elsif MSG_IN(I-1) = x"EF" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"F0" then STRING_OUT(I) := '±';
      elsif MSG_IN(I-1) = x"F1" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"F2" then STRING_OUT(I) := '¾';
      elsif MSG_IN(I-1) = x"F3" then STRING_OUT(I) := '¶';
      elsif MSG_IN(I-1) = x"F4" then STRING_OUT(I) := '§';
      elsif MSG_IN(I-1) = x"F5" then STRING_OUT(I) := '÷';
      elsif MSG_IN(I-1) = x"F6" then STRING_OUT(I) := '¸';
      elsif MSG_IN(I-1) = x"F7" then STRING_OUT(I) := '°';
      elsif MSG_IN(I-1) = x"F8" then STRING_OUT(I) := '¨';
      elsif MSG_IN(I-1) = x"F9" then STRING_OUT(I) := '·';
      elsif MSG_IN(I-1) = x"FA" then STRING_OUT(I) := '¹';
      elsif MSG_IN(I-1) = x"FB" then STRING_OUT(I) := '³';
      elsif MSG_IN(I-1) = x"FC" then STRING_OUT(I) := '²';
      elsif MSG_IN(I-1) = x"FD" then STRING_OUT(I) := '¦';
      elsif MSG_IN(I-1) = x"FE" then STRING_OUT(I) := '¦';
      end if;
    end loop;
    return STRING_OUT;
end MSG_TO_ASCII;

----------------------------------------------------------------------------------------------------
-- SIGNAL DECLARATIONS                                                                            --
----------------------------------------------------------------------------------------------------

-- Clock and Reset signals
signal CLK_50MHZ           : std_logic := '0'; -- 32 MHz clock
signal nRESET              : std_logic := '0'; -- Asynchronous reset (Active LOW)
-- FPGA Status LED Ports
signal LED_2              : std_logic; -- Board LED_2
signal LED_4              : std_logic; -- Board LED_4
signal LED_5              : std_logic; -- Board LED_5
-- UART_BLUETOOTH ports interface
signal UART_BT_RX         : std_logic; -- UART Bluetooth reception line.
signal UART_BT_TX         : std_logic; -- UART Bluetooth transmission line.
-- UART_SHIELD ports interface
signal UART_SH_RX         : std_logic; -- UART Shield reception line.
signal UART_SH_TX         : std_logic; -- UART Shield transmission line.
-- DISCRETE_COMM_SHIELD ports interface
signal DISC_IN_1_SH_D2    : std_logic; -- Arduino Shield digital port D2. Discrete Input 1.
signal PWM_1_SH_D3        : std_logic; -- Arduino Shield digital port D3. PWM port 1.
signal DISC_IN_2_SH_D4    : std_logic; -- Arduino Shield digital port D4. Discrete Input 2.
signal PWM_2_SH_D5        : std_logic; -- Arduino Shield digital port D5. PWM port 2.
signal PWM_3_SH_D6        : std_logic; -- Arduino Shield digital port D6. PWM port 3.
signal DISC_IN_3_SH_D7    : std_logic; -- Arduino Shield digital port D7. Discrete Input 3.
signal DISC_OUT_1_SH_D8   : std_logic; -- Arduino Shield digital port D8. Discrete Ouput 1.
signal PWM_4_SH_D9        : std_logic; -- Arduino Shield digital port D9. PWM port 4.
signal PWM_5_SH_D10       : std_logic; -- Arduino Shield digital port D10. PWM port 5.
signal PWM_6_SH_D11       : std_logic; -- Arduino Shield digital port D11. PWM port 6.
signal DISC_OUT_2_SH_D12  : std_logic; -- Arduino Shield digital port D8. Discrete Ouput 1.
signal DISC_OUT_3_SH_D13  : std_logic; -- Arduino Shield digital port D8. Discrete Ouput 1.
-- UART_SHIELD ports interface
signal UART_AR1_RX        : std_logic; -- UART Arduino Nano reception line.
signal UART_AR1_TX        : std_logic; -- UART Arduino Nano transmission line.
signal UART_AR2_RX        : std_logic; -- UART Arduino Nano reception line.
signal UART_AR2_TX        : std_logic; -- UART Arduino Nano transmission line.
signal UART_AR3_RX        : std_logic; -- UART Arduino Nano reception line.
signal UART_AR3_TX        : std_logic; -- UART Arduino Nano transmission line.
signal UART_AR4_RX        : std_logic; -- UART Arduino Nano reception line.
signal UART_AR4_TX        : std_logic; -- UART Arduino Nano transmission line.
-- PWM_MONITORING_ARDUINO ports interface
signal PWM_1_AR1_D3       : std_logic; -- Arduino Nano digital port D3. PWM port 1.
signal PWM_2_AR1_D5       : std_logic; -- Arduino Nano digital port D5. PWM port 2.
signal PWM_3_AR1_D6       : std_logic; -- Arduino Nano digital port D6. PWM port 3.
signal PWM_4_AR1_D9       : std_logic; -- Arduino Nano digital port D9. PWM port 4.
signal PWM_5_AR1_D10      : std_logic; -- Arduino Nano digital port D10. PWM port 5.
signal PWM_6_AR1_D11      : std_logic; -- Arduino Nano digital port D11. PWM port 6.
signal PWM_1_AR2_D3       : std_logic; -- Arduino Nano digital port D3. PWM port 1.
signal PWM_2_AR2_D5       : std_logic; -- Arduino Nano digital port D5. PWM port 2.
signal PWM_3_AR2_D6       : std_logic; -- Arduino Nano digital port D6. PWM port 3.
signal PWM_4_AR2_D9       : std_logic; -- Arduino Nano digital port D9. PWM port 4.
signal PWM_5_AR2_D10      : std_logic; -- Arduino Nano digital port D10. PWM port 5.
signal PWM_6_AR2_D11      : std_logic; -- Arduino Nano digital port D11. PWM port 6.
signal PWM_1_AR3_D3       : std_logic; -- Arduino Nano digital port D3. PWM port 1.
signal PWM_2_AR3_D5       : std_logic; -- Arduino Nano digital port D5. PWM port 2.
signal PWM_3_AR3_D6       : std_logic; -- Arduino Nano digital port D6. PWM port 3.
signal PWM_4_AR3_D9       : std_logic; -- Arduino Nano digital port D9. PWM port 4.
signal PWM_5_AR3_D10      : std_logic; -- Arduino Nano digital port D10. PWM port 5.
signal PWM_6_AR3_D11      : std_logic; -- Arduino Nano digital port D11. PWM port 6.
signal PWM_1_AR4_D3       : std_logic; -- Arduino Nano digital port D3. PWM port 1.
signal PWM_2_AR4_D5       : std_logic; -- Arduino Nano digital port D5. PWM port 2.
signal PWM_3_AR4_D6       : std_logic; -- Arduino Nano digital port D6. PWM port 3.
signal PWM_4_AR4_D9       : std_logic; -- Arduino Nano digital port D9. PWM port 4.
signal PWM_5_AR4_D10      : std_logic; -- Arduino Nano digital port D10. PWM port 5.
signal PWM_6_AR4_D11      : std_logic; -- Arduino Nano digital port D11. PWM port 6.
-- DISCRETE_COMM_ARDUINO ports interface
signal DISC_IN_1_AR1_D2   : std_logic; -- Arduino Nano digital port D2. Discrete Input 1.
signal DISC_IN_2_AR1_D4   : std_logic; -- Arduino Nano digital port D4. Discrete Input 2.
signal DISC_IN_3_AR1_D7   : std_logic; -- Arduino Nano digital port D7. Discrete Input 3.
signal DISC_OUT_1_AR1_D8  : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_OUT_2_AR1_D12 : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_OUT_3_AR1_D13 : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_IN_1_AR2_D2   : std_logic; -- Arduino Nano digital port D2. Discrete Input 1.
signal DISC_IN_2_AR2_D4   : std_logic; -- Arduino Nano digital port D4. Discrete Input 2.
signal DISC_IN_3_AR2_D7   : std_logic; -- Arduino Nano digital port D7. Discrete Input 3.
signal DISC_OUT_1_AR2_D8  : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_OUT_2_AR2_D12 : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_OUT_3_AR2_D13 : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_IN_1_AR3_D2   : std_logic; -- Arduino Nano digital port D2. Discrete Input 1.
signal DISC_IN_2_AR3_D4   : std_logic; -- Arduino Nano digital port D4. Discrete Input 2.
signal DISC_IN_3_AR3_D7   : std_logic; -- Arduino Nano digital port D7. Discrete Input 3.
signal DISC_OUT_1_AR3_D8  : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_OUT_2_AR3_D12 : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_OUT_3_AR3_D13 : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_IN_1_AR4_D2   : std_logic; -- Arduino Nano digital port D2. Discrete Input 1.
signal DISC_IN_2_AR4_D4   : std_logic; -- Arduino Nano digital port D4. Discrete Input 2.
signal DISC_IN_3_AR4_D7   : std_logic; -- Arduino Nano digital port D7. Discrete Input 3.
signal DISC_OUT_1_AR4_D8  : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_OUT_2_AR4_D12 : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
signal DISC_OUT_3_AR4_D13 : std_logic; -- Arduino Nano digital port D8. Discrete Ouput 1.
-- Not used ports
signal USER_IO_31         : std_logic;
signal USER_IO_40         : std_logic;
signal USER_IO_88         : std_logic;
signal USER_IO_94         : std_logic;
signal USER_IO_112        : std_logic;
signal USER_IO_135        : std_logic;
signal USER_IO_137        : std_logic;
signal USER_IO_139        : std_logic;
signal USER_IO_141        : std_logic;
-- Test Bench local signals
signal SYSTEM_TIME             : string(1 to 17) := (others => ' '); -- Signal to store the system time
signal END_OF_SIMULATION       : std_logic := '0'; -- Signal to assert the end of simulation
signal UART_BT_CLK             : std_logic := '0'; -- UART clock reference signal fot UART_BT
signal UART_SH_CLK             : std_logic := '0'; -- UART clock reference signal fot UART_SH
signal UART_AR1_CLK            : std_logic := '0'; -- UART clock reference signal fot UART_AR1
signal UART_AR2_CLK            : std_logic := '0'; -- UART clock reference signal fot UART_AR2
signal UART_AR3_CLK            : std_logic := '0'; -- UART clock reference signal fot UART_AR3
signal UART_AR4_CLK            : std_logic := '0'; -- UART clock reference signal fot UART_AR4
signal TEST_ID                 : integer := 0; -- Test ID for waveform inspection
signal TEST_FRAME              : std_logic_vector(7 downto 0) := (others => '0'); -- Frame data to test the UUT.
signal UART_BT_RECEIVED_FRAME  : std_logic_vector(7 downto 0) := (others => '0'); -- Received data from the UART_BT.
signal UART_SH_RECEIVED_FRAME  : std_logic_vector(7 downto 0) := (others => '0'); -- Received data from the UART_SH.
signal UART_AR1_RECEIVED_FRAME : std_logic_vector(7 downto 0) := (others => '0'); -- Received data from the UART_AR1.
signal UART_AR2_RECEIVED_FRAME : std_logic_vector(7 downto 0) := (others => '0'); -- Received data from the UART_AR2.
signal UART_AR3_RECEIVED_FRAME : std_logic_vector(7 downto 0) := (others => '0'); -- Received data from the UART_AR3.
signal UART_AR4_RECEIVED_FRAME : std_logic_vector(7 downto 0) := (others => '0'); -- Received data from the UART_AR4.
signal ERROR_DETECTED          : integer := 0; -- This signal is incremented when an error is detected
signal UART_BT_ERROR_DETECTED  : integer := 0; -- This signal is incremented when an error is detected
signal UART_SH_ERROR_DETECTED  : integer := 0; -- This signal is incremented when an error is detected
signal UART_AR1_ERROR_DETECTED : integer := 0; -- This signal is incremented when an error is detected
signal UART_AR2_ERROR_DETECTED : integer := 0; -- This signal is incremented when an error is detected
signal UART_AR3_ERROR_DETECTED : integer := 0; -- This signal is incremented when an error is detected
signal UART_AR4_ERROR_DETECTED : integer := 0; -- This signal is incremented when an error is detected
signal UART_BT_MESSAGE_INDEX   : integer := 1; -- Index to acquire message from the UART_BT.
signal UART_SH_MESSAGE_INDEX   : integer := 1; -- Index to acquire message from the UART_SH.
signal UART_AR1_MESSAGE_INDEX  : integer := 1; -- Index to acquire message from the UART_AR1.
signal UART_AR2_MESSAGE_INDEX  : integer := 1; -- Index to acquire message from the UART_AR2.
signal UART_AR3_MESSAGE_INDEX  : integer := 1; -- Index to acquire message from the UART_AR3.
signal UART_AR4_MESSAGE_INDEX  : integer := 1; -- Index to acquire message from the UART_AR4.
signal UART_BT_RECEIVED_MSG    : UART_BT_MSG2SEND_TYPE := UART_BT_START_RESPONSE; -- Received message from the UART_BT.
signal UART_SH_RECEIVED_MSG    : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_SH.
signal UART_AR1_RECEIVED_MSG   : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_AR1.
signal UART_AR2_RECEIVED_MSG   : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_AR2.
signal UART_AR3_RECEIVED_MSG   : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_AR3.
signal UART_AR4_RECEIVED_MSG   : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_AR4.
signal UART_BT_RECEIVED_STR    : string(1 to UART_BT_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_BT.
signal UART_SH_RECEIVED_STR    : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_SH.
signal UART_AR1_RECEIVED_STR   : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_AR1.
signal UART_AR2_RECEIVED_STR   : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_AR2.
signal UART_AR3_RECEIVED_STR   : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_AR3.
signal UART_AR4_RECEIVED_STR   : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_AR4.

----------------------------------------------------------------------------------------------------
-- CONSTANT DECLARATIONS                                                                          --
----------------------------------------------------------------------------------------------------

constant CLK_50MHZ_PERIOD : time := 20 ns;

begin

  UUT_FPGA_MAIN_MODULE: FPGA_MAIN_MODULE
    port map (
      -- Clock and Reset signals
      CLK_50MHZ           => CLK_50MHZ,
      nRESET              => nRESET,
      -- FPGA Status LED Ports
      LED_2              => LED_2,
      LED_4              => LED_4,
      LED_5              => LED_5,
      -- UART_BLUETOOTH ports interface
      UART_BT_RX         => UART_BT_RX,
      UART_BT_TX         => UART_BT_TX,
      -- UART_SHIELD ports interface
      UART_SH_RX         => UART_SH_RX,
      UART_SH_TX         => UART_SH_TX,
      -- DISCRETE_COMM_SHIELD ports interface
      DISC_IN_1_SH_D2    => DISC_IN_1_SH_D2,
      PWM_1_SH_D3        => PWM_1_SH_D3,
      DISC_IN_2_SH_D4    => DISC_IN_2_SH_D4,
      PWM_2_SH_D5        => PWM_2_SH_D5,
      PWM_3_SH_D6        => PWM_3_SH_D6,
      DISC_IN_3_SH_D7    => DISC_IN_3_SH_D7,
      DISC_OUT_1_SH_D8   => DISC_OUT_1_SH_D8,
      PWM_4_SH_D9        => PWM_4_SH_D9,
      PWM_5_SH_D10       => PWM_5_SH_D10,
      PWM_6_SH_D11       => PWM_6_SH_D11,
      DISC_OUT_2_SH_D12  => DISC_OUT_2_SH_D12,
      DISC_OUT_3_SH_D13  => DISC_OUT_3_SH_D13,
      -- UART_SHIELD ports interface
      UART_AR1_RX        => UART_AR1_RX,
      UART_AR1_TX        => UART_AR1_TX,
      UART_AR2_RX        => UART_AR2_RX,
      UART_AR2_TX        => UART_AR2_TX,
      UART_AR3_RX        => UART_AR3_RX,
      UART_AR3_TX        => UART_AR3_TX,
      UART_AR4_RX        => UART_AR4_RX,
      UART_AR4_TX        => UART_AR4_TX,
      -- PWM_MONITORING_ARDUINO ports interface
      PWM_1_AR1_D3       => PWM_1_AR1_D3,
      PWM_2_AR1_D5       => PWM_2_AR1_D5,
      PWM_3_AR1_D6       => PWM_3_AR1_D6,
      PWM_4_AR1_D9       => PWM_4_AR1_D9,
      PWM_5_AR1_D10      => PWM_5_AR1_D10,
      PWM_6_AR1_D11      => PWM_6_AR1_D11,
      PWM_1_AR2_D3       => PWM_1_AR2_D3,
      PWM_2_AR2_D5       => PWM_2_AR2_D5,
      PWM_3_AR2_D6       => PWM_3_AR2_D6,
      PWM_4_AR2_D9       => PWM_4_AR2_D9,
      PWM_5_AR2_D10      => PWM_5_AR2_D10,
      PWM_6_AR2_D11      => PWM_6_AR2_D11,
      PWM_1_AR3_D3       => PWM_1_AR3_D3,
      PWM_2_AR3_D5       => PWM_2_AR3_D5,
      PWM_3_AR3_D6       => PWM_3_AR3_D6,
      PWM_4_AR3_D9       => PWM_4_AR3_D9,
      PWM_5_AR3_D10      => PWM_5_AR3_D10,
      PWM_6_AR3_D11      => PWM_6_AR3_D11,
      PWM_1_AR4_D3       => PWM_1_AR4_D3,
      PWM_2_AR4_D5       => PWM_2_AR4_D5,
      PWM_3_AR4_D6       => PWM_3_AR4_D6,
      PWM_4_AR4_D9       => PWM_4_AR4_D9,
      PWM_5_AR4_D10      => PWM_5_AR4_D10,
      PWM_6_AR4_D11      => PWM_6_AR4_D11,
      -- DISCRETE_COMM_ARDUINO ports interface
      DISC_IN_1_AR1_D2   => DISC_IN_1_AR1_D2,
      DISC_IN_2_AR1_D4   => DISC_IN_2_AR1_D4,
      DISC_IN_3_AR1_D7   => DISC_IN_3_AR1_D7,
      DISC_OUT_1_AR1_D8  => DISC_OUT_1_AR1_D8,
      DISC_OUT_2_AR1_D12 => DISC_OUT_2_AR1_D12,
      DISC_OUT_3_AR1_D13 => DISC_OUT_3_AR1_D13,
      DISC_IN_1_AR2_D2   => DISC_IN_1_AR2_D2,
      DISC_IN_2_AR2_D4   => DISC_IN_2_AR2_D4,
      DISC_IN_3_AR2_D7   => DISC_IN_3_AR2_D7,
      DISC_OUT_1_AR2_D8  => DISC_OUT_1_AR2_D8,
      DISC_OUT_2_AR2_D12 => DISC_OUT_2_AR2_D12,
      DISC_OUT_3_AR2_D13 => DISC_OUT_3_AR2_D13,
      DISC_IN_1_AR3_D2   => DISC_IN_1_AR3_D2,
      DISC_IN_2_AR3_D4   => DISC_IN_2_AR3_D4,
      DISC_IN_3_AR3_D7   => DISC_IN_3_AR3_D7,
      DISC_OUT_1_AR3_D8  => DISC_OUT_1_AR3_D8,
      DISC_OUT_2_AR3_D12 => DISC_OUT_2_AR3_D12,
      DISC_OUT_3_AR3_D13 => DISC_OUT_3_AR3_D13,
      DISC_IN_1_AR4_D2   => DISC_IN_1_AR4_D2,
      DISC_IN_2_AR4_D4   => DISC_IN_2_AR4_D4,
      DISC_IN_3_AR4_D7   => DISC_IN_3_AR4_D7,
      DISC_OUT_1_AR4_D8  => DISC_OUT_1_AR4_D8,
      DISC_OUT_2_AR4_D12 => DISC_OUT_2_AR4_D12,
      DISC_OUT_3_AR4_D13 => DISC_OUT_3_AR4_D13,
      -- Not used ports
      USER_IO_31         => USER_IO_31,
      USER_IO_40         => USER_IO_40,
      USER_IO_88         => USER_IO_88,
      USER_IO_94         => USER_IO_94,
      USER_IO_112        => USER_IO_112,
      USER_IO_135        => USER_IO_135,
      USER_IO_137        => USER_IO_137,
      USER_IO_139        => USER_IO_139,
      USER_IO_141        => USER_IO_141);

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

  UART_BT_CLK_GEN: process
    begin
      wait until UART_BT_TX = '0';

      for I in 1 to 10 loop  -- This loop cover the frames to receive
        UART_BT_CLK <= '1';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
        UART_BT_CLK <= '0';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
      end loop;

  end process UART_BT_CLK_GEN;

  UART_BT_ACQUIRE: process
    begin
      wait until UART_BT_TX = '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the start bit
      if UART_BT_TX = '1' then -- If stop bit is not set an error is asserted
        UART_BT_ERROR_DETECTED <= UART_BT_ERROR_DETECTED +1;
      end if;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      for I in 0 to 7 loop  -- This loop cover the 8 bits to send
        UART_BT_RECEIVED_FRAME(I) <= UART_BT_TX;
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the stop bit
      if UART_BT_TX = '0' then -- If stop bit is not set an error is asserted
        UART_BT_ERROR_DETECTED <= UART_BT_ERROR_DETECTED +1;
      end if;

      UART_BT_RECEIVED_MSG(UART_BT_MESSAGE_INDEX-1) <= UART_BT_RECEIVED_FRAME;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      if UART_BT_MESSAGE_INDEX = UART_BT_MSG_LENGTH then
        UART_BT_MESSAGE_INDEX <= 1;
      else
        UART_BT_MESSAGE_INDEX <= UART_BT_MESSAGE_INDEX +1;
      end if;

  end process UART_BT_ACQUIRE;

  UART_SH_CLK_GEN: process
    begin
      wait until UART_SH_TX = '0';

      for I in 1 to 10 loop  -- This loop cover the frames to receive
        UART_SH_CLK <= '1';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
        UART_SH_CLK <= '0';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
      end loop;

  end process UART_SH_CLK_GEN;

  UART_SH_ACQUIRE: process
    begin
      wait until UART_SH_TX = '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the start bit
      if UART_SH_TX = '1' then -- If stop bit is not set an error is asserted
        UART_SH_ERROR_DETECTED <= UART_SH_ERROR_DETECTED +1;
      end if;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      for I in 0 to 7 loop  -- This loop cover the 8 bits to send
        UART_SH_RECEIVED_FRAME(I) <= UART_SH_TX;
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the stop bit
      if UART_SH_TX = '0' then -- If stop bit is not set an error is asserted
        UART_SH_ERROR_DETECTED <= UART_SH_ERROR_DETECTED +1;
      end if;

      UART_SH_RECEIVED_MSG(UART_SH_MESSAGE_INDEX-1) <= UART_SH_RECEIVED_FRAME;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      if UART_SH_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_SH_MESSAGE_INDEX <= 1;
      else
        UART_SH_MESSAGE_INDEX <= UART_SH_MESSAGE_INDEX +1;
      end if;

  end process UART_SH_ACQUIRE;

  UART_AR1_CLK_GEN: process
    begin
      wait until UART_AR1_TX = '0';

      for I in 1 to 10 loop  -- This loop cover the frames to receive
        UART_AR1_CLK <= '1';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
        UART_AR1_CLK <= '0';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
      end loop;

  end process UART_AR1_CLK_GEN;

  UART_AR1_ACQUIRE: process
    begin
      wait until UART_AR1_TX = '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the start bit
      if UART_AR1_TX = '1' then -- If stop bit is not set an error is asserted
        UART_AR1_ERROR_DETECTED <= UART_AR1_ERROR_DETECTED +1;
      end if;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      for I in 0 to 7 loop  -- This loop cover the 8 bits to send
        UART_AR1_RECEIVED_FRAME(I) <= UART_AR1_TX;
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the stop bit
      if UART_AR1_TX = '0' then -- If stop bit is not set an error is asserted
        UART_AR1_ERROR_DETECTED <= UART_AR1_ERROR_DETECTED +1;
      end if;

      UART_AR1_RECEIVED_MSG(UART_AR1_MESSAGE_INDEX-1) <= UART_AR1_RECEIVED_FRAME;

      wait for CLK_50MHZ_period;

      if UART_AR1_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_AR1_MESSAGE_INDEX <= 1;
      else
        UART_AR1_MESSAGE_INDEX <= UART_AR1_MESSAGE_INDEX +1;
      end if;

  end process UART_AR1_ACQUIRE;

  UART_AR2_CLK_GEN: process
    begin
      wait until UART_AR2_TX = '0';

      for I in 1 to 10 loop  -- This loop cover the frames to receive
        UART_AR2_CLK <= '1';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
        UART_AR2_CLK <= '0';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
      end loop;

  end process UART_AR2_CLK_GEN;

  UART_AR2_ACQUIRE: process
    begin
      wait until UART_AR2_TX = '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the start bit
      if UART_AR2_TX = '1' then -- If stop bit is not set an error is asserted
        UART_AR2_ERROR_DETECTED <= UART_AR2_ERROR_DETECTED +1;
      end if;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      for I in 0 to 7 loop  -- This loop cover the 8 bits to send
        UART_AR2_RECEIVED_FRAME(I) <= UART_AR2_TX;
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the stop bit
      if UART_AR2_TX = '0' then -- If stop bit is not set an error is asserted
        UART_AR2_ERROR_DETECTED <= UART_AR2_ERROR_DETECTED +1;
      end if;

      UART_AR2_RECEIVED_MSG(UART_AR2_MESSAGE_INDEX-1) <= UART_AR2_RECEIVED_FRAME;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      if UART_AR2_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_AR2_MESSAGE_INDEX <= 1;
      else
        UART_AR2_MESSAGE_INDEX <= UART_AR2_MESSAGE_INDEX +1;
      end if;

  end process UART_AR2_ACQUIRE;

  UART_AR3_CLK_GEN: process
    begin
      wait until UART_AR3_TX = '0';

      for I in 1 to 10 loop  -- This loop cover the frames to receive
        UART_AR3_CLK <= '1';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
        UART_AR3_CLK <= '0';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
      end loop;

  end process UART_AR3_CLK_GEN;

  UART_AR3_ACQUIRE: process
    begin
      wait until UART_AR3_TX = '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the start bit
      if UART_AR3_TX = '1' then -- If stop bit is not set an error is asserted
        UART_AR3_ERROR_DETECTED <= UART_AR3_ERROR_DETECTED +1;
      end if;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      for I in 0 to 7 loop  -- This loop cover the 8 bits to send
        UART_AR3_RECEIVED_FRAME(I) <= UART_AR3_TX;
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the stop bit
      if UART_AR3_TX = '0' then -- If stop bit is not set an error is asserted
        UART_AR3_ERROR_DETECTED <= UART_AR3_ERROR_DETECTED +1;
      end if;

      UART_AR3_RECEIVED_MSG(UART_AR3_MESSAGE_INDEX-1) <= UART_AR3_RECEIVED_FRAME;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      if UART_AR3_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_AR3_MESSAGE_INDEX <= 1;
      else
        UART_AR3_MESSAGE_INDEX <= UART_AR3_MESSAGE_INDEX +1;
      end if;

  end process UART_AR3_ACQUIRE;

  UART_AR4_CLK_GEN: process
    begin
      wait until UART_AR4_TX = '0';

      for I in 1 to 10 loop  -- This loop cover the frames to receive
        UART_AR4_CLK <= '1';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
        UART_AR4_CLK <= '0';
        wait for BAUD_RATE_HALF_LIMIT*CLK_50MHZ_PERIOD;
      end loop;

  end process UART_AR4_CLK_GEN;

  UART_AR4_ACQUIRE: process
    begin
      wait until UART_AR4_TX = '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the start bit
      if UART_AR4_TX = '1' then -- If stop bit is not set an error is asserted
        UART_AR4_ERROR_DETECTED <= UART_AR4_ERROR_DETECTED +1;
      end if;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      for I in 0 to 7 loop  -- This loop cover the 8 bits to send
        UART_AR4_RECEIVED_FRAME(I) <= UART_AR4_TX;
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period/2;

      -- Check the stop bit
      if UART_AR4_TX = '0' then -- If stop bit is not set an error is asserted
        UART_AR4_ERROR_DETECTED <= UART_AR4_ERROR_DETECTED +1;
      end if;

      UART_AR4_RECEIVED_MSG(UART_AR4_MESSAGE_INDEX-1) <= UART_AR4_RECEIVED_FRAME;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;

      if UART_AR4_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_AR4_MESSAGE_INDEX <= 1;
      else
        UART_AR4_MESSAGE_INDEX <= UART_AR4_MESSAGE_INDEX +1;
      end if;

  end process UART_AR4_ACQUIRE;

  -- Stimulus process
  STIM_PROC: process
    file   FILE_RESULTS    : text;
    variable LINE_TO_WRITE : line;

    begin

      file_open(FILE_RESULTS, "../../Simulation/FPGA_MAIN_MODULE_RESULTS.txt", write_mode);
      write(LINE_TO_WRITE, string'("Simulation started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      TEST_FRAME <= (others => '0');
      UART_BT_RX         <= '0';
      UART_SH_RX         <= '0';
      DISC_IN_1_SH_D2    <= '0';
      DISC_IN_2_SH_D4    <= '0';
      DISC_IN_3_SH_D7    <= '0';
      UART_AR1_RX        <= '0';
      UART_AR2_RX        <= '0';
      UART_AR3_RX        <= '0';
      UART_AR4_RX        <= '0';
      PWM_1_AR1_D3       <= '0';
      PWM_2_AR1_D5       <= '0';
      PWM_3_AR1_D6       <= '0';
      PWM_4_AR1_D9       <= '0';
      PWM_5_AR1_D10      <= '0';
      PWM_6_AR1_D11      <= '0';
      PWM_1_AR2_D3       <= '0';
      PWM_2_AR2_D5       <= '0';
      PWM_3_AR2_D6       <= '0';
      PWM_4_AR2_D9       <= '0';
      PWM_5_AR2_D10      <= '0';
      PWM_6_AR2_D11      <= '0';
      PWM_1_AR3_D3       <= '0';
      PWM_2_AR3_D5       <= '0';
      PWM_3_AR3_D6       <= '0';
      PWM_4_AR3_D9       <= '0';
      PWM_5_AR3_D10      <= '0';
      PWM_6_AR3_D11      <= '0';
      PWM_1_AR4_D3       <= '0';
      PWM_2_AR4_D5       <= '0';
      PWM_3_AR4_D6       <= '0';
      PWM_4_AR4_D9       <= '0';
      PWM_5_AR4_D10      <= '0';
      PWM_6_AR4_D11      <= '0';
      DISC_IN_1_AR1_D2   <= '0';
      DISC_IN_2_AR1_D4   <= '0';
      DISC_IN_3_AR1_D7   <= '0';
      DISC_IN_1_AR2_D2   <= '0';
      DISC_IN_2_AR2_D4   <= '0';
      DISC_IN_3_AR2_D7   <= '0';
      DISC_IN_1_AR3_D2   <= '0';
      DISC_IN_2_AR3_D4   <= '0';
      DISC_IN_3_AR3_D7   <= '0';
      DISC_IN_1_AR4_D2   <= '0';
      DISC_IN_2_AR4_D4   <= '0';
      DISC_IN_3_AR4_D7   <= '0';
      USER_IO_31         <= '0';
      USER_IO_40         <= '0';
      USER_IO_88         <= '0';
      USER_IO_94         <= '0';
      USER_IO_112        <= '0';
      USER_IO_135        <= '0';
      USER_IO_137        <= '0';
      USER_IO_139        <= '0';
      USER_IO_141        <= '0';

      write(LINE_TO_WRITE, string'("Testing output ports reset value..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Check the output port reset value
      if UART_BT_TX = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      -- Check the output port reset value
      if UART_SH_TX = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_1_SH_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_2_SH_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_3_SH_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      -- Check the output port reset value
      if UART_AR1_TX = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      -- Check the output port reset value
      if UART_AR2_TX = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      -- Check the output port reset value
      if UART_AR3_TX = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      -- Check the output port reset value
      if UART_AR4_TX = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_1_AR1_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_2_AR1_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_3_AR1_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_1_AR2_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_2_AR2_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_3_AR2_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_1_AR3_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_2_AR3_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_3_AR3_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_1_AR4_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_2_AR4_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_3_AR4_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
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
      TEST_ID <= 1;

      write(LINE_TO_WRITE, string'("Testing the UART_BT_START_RESPONSE message..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the UART_BT_START_RESPONSE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_BT_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_BT_RX <= '1';

      wait for (UART_BT_MSG_LENGTH+1)*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The UART_BT_START_RESPONSE message test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The UART_BT_START_RESPONSE message test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      TEST_ID <= 2;

      write(LINE_TO_WRITE, string'("Testing the SHIELD_UPDATE message..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the SHIELD_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_SH_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_SH_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_SH_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_SH_RECEIVED_STR <= MSG_TO_ASCII(UART_SH_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_SH:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_SH_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_SH_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The SHIELD_UPDATE message test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The SHIELD_UPDATE message test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 100 us;
      TEST_ID <= 3;

      write(LINE_TO_WRITE, string'("Testing the SHIELD discrete ports..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set values for the SHIELD discrete inputs
      DISC_IN_1_SH_D2    <= '1';

      wait for 1 us;

      -- Check the output port value
      if PWM_1_SH_D3 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if PWM_2_SH_D5 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if PWM_3_SH_D6 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_SH_RECEIVED_STR <= MSG_TO_ASCII(UART_SH_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_SH:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_SH_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      -- Set values for the SHIELD discrete inputs
      DISC_IN_2_SH_D4    <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_SH_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
       if DISC_OUT_2_SH_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_3_SH_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_SH_RECEIVED_STR <= MSG_TO_ASCII(UART_SH_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_SH:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_SH_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      -- Set values for the SHIELD discrete inputs
      DISC_IN_3_SH_D7    <= '1';

      wait for 1 us;

      -- Check the output port value
      if PWM_6_SH_D11 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if PWM_4_SH_D9 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if PWM_5_SH_D10 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_SH_RECEIVED_STR <= MSG_TO_ASCII(UART_SH_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_SH:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_SH_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      -- Set values for the SHIELD discrete inputs
      DISC_IN_1_SH_D2    <= '0';

      wait for 1 us;

      -- Check the output port value
      if PWM_1_SH_D3 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if PWM_2_SH_D5 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if PWM_3_SH_D6 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_SH_RECEIVED_STR <= MSG_TO_ASCII(UART_SH_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_SH:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_SH_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      -- Set values for the SHIELD discrete inputs
      DISC_IN_2_SH_D4    <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_SH_D8 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
       if DISC_OUT_2_SH_D12 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if DISC_OUT_3_SH_D13 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_SH_RECEIVED_STR <= MSG_TO_ASCII(UART_SH_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_SH:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_SH_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      -- Set values for the SHIELD discrete inputs
      DISC_IN_3_SH_D7    <= '0';

      wait for 1 us;

      -- Check the output port value
      if PWM_6_SH_D11 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if PWM_4_SH_D9 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;
      if PWM_5_SH_D10 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_SH_RECEIVED_STR <= MSG_TO_ASCII(UART_SH_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_SH:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_SH_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      if UART_BT_ERROR_DETECTED = 0 and UART_SH_ERROR_DETECTED = 0  and ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The SHIELD discrete ports test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The SHIELD discrete ports test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait for 100 us;
      TEST_ID <= 4;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO_UPDATE message for Arduino 1..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the ARDUINO_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_AR1_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_AR1_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_AR1_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR1_RECEIVED_STR <= MSG_TO_ASCII(UART_AR1_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_AR1_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO_UPDATE message for Arduino 1 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO_UPDATE message for Arduino 1 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 100 us;
      TEST_ID <= 5;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO_UPDATE message for Arduino 2..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the ARDUINO_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_AR2_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 0 to 7 loop  -- This loop cover the 8 bits to send
        UART_AR2_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_AR2_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_AR2_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO_UPDATE message for Arduino 2 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO_UPDATE message for Arduino 2 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 100 us;
      TEST_ID <= 6;

      write(LINE_TO_WRITE, string'("Testing the the ARDUINO_UPDATE message for Arduino 3..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the ARDUINO_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_AR3_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_AR3_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_AR3_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_AR3_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO_UPDATE message for Arduino 3 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO_UPDATE message for Arduino 3 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 100 us;
      TEST_ID <= 7;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO_UPDATE message for Arduino 4..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the ARDUINO_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_AR4_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_AR4_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_AR4_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_AR4_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO_UPDATE message for Arduino 4 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO_UPDATE message for Arduino 4 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 100 us;
      TEST_ID <= 8;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO PWM ports for Arduino 1..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set values for the ARDUINO pulse width values
      PWM_1_AR1_D3  <= '1';
      PWM_2_AR1_D5  <= '1';
      PWM_3_AR1_D6  <= '1';
      PWM_4_AR1_D9  <= '1';
      PWM_5_AR1_D10 <= '1';
      PWM_6_AR1_D11 <= '1';
      
      wait for 5 ms;

      PWM_1_AR1_D3  <= '0';
      PWM_2_AR1_D5  <= '0';
      PWM_3_AR1_D6  <= '0';
      PWM_4_AR1_D9  <= '0';
      PWM_5_AR1_D10 <= '0';
      PWM_6_AR1_D11 <= '0';

      wait for 10 ms;

      -- Set the frame to be sent and assert the command to start the ARDUINO_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_AR1_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_AR1_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_AR1_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR1_RECEIVED_STR <= MSG_TO_ASCII(UART_AR1_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_AR1_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO PWM ports for Arduino 1 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO PWM ports for Arduino 1 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 10 us;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO PWM ports for Arduino 2..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      PWM_1_AR2_D3  <= '1';
      PWM_2_AR2_D5  <= '1';
      PWM_3_AR2_D6  <= '1';
      PWM_4_AR2_D9  <= '1';
      PWM_5_AR2_D10 <= '1';
      PWM_6_AR2_D11 <= '1';

      wait for 6 ms;

      PWM_1_AR2_D3  <= '0';
      PWM_2_AR2_D5  <= '0';
      PWM_3_AR2_D6  <= '0';
      PWM_4_AR2_D9  <= '0';
      PWM_5_AR2_D10 <= '0';
      PWM_6_AR2_D11 <= '0';

      wait for 11 ms;

      -- Set the frame to be sent and assert the command to start the ARDUINO_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_AR2_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_AR2_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_AR2_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_AR2_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO PWM ports for Arduino 2 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO PWM ports for Arduino 2 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 10 us;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO PWM ports for Arduino 3..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      PWM_1_AR3_D3  <= '1';
      PWM_2_AR3_D5  <= '1';
      PWM_3_AR3_D6  <= '1';
      PWM_4_AR3_D9  <= '1';
      PWM_5_AR3_D10 <= '1';
      PWM_6_AR3_D11 <= '1';

      wait for 7 ms;

      PWM_1_AR3_D3  <= '0';
      PWM_2_AR3_D5  <= '0';
      PWM_3_AR3_D6  <= '0';
      PWM_4_AR3_D9  <= '0';
      PWM_5_AR3_D10 <= '0';
      PWM_6_AR3_D11 <= '0';

      wait for 12 ms;

      -- Set the frame to be sent and assert the command to start the ARDUINO_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_AR3_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_AR3_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_AR3_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_AR3_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO PWM ports for Arduino 3 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO PWM ports for Arduino 3 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 10 us;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO PWM ports for Arduino 4..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      PWM_1_AR4_D3  <= '1';
      PWM_2_AR4_D5  <= '1';
      PWM_3_AR4_D6  <= '1';
      PWM_4_AR4_D9  <= '1';
      PWM_5_AR4_D10 <= '1';
      PWM_6_AR4_D11 <= '1';

      wait for 8 ms;

      PWM_1_AR4_D3  <= '0';
      PWM_2_AR4_D5  <= '0';
      PWM_3_AR4_D6  <= '0';
      PWM_4_AR4_D9  <= '0';
      PWM_5_AR4_D10 <= '0';
      PWM_6_AR4_D11 <= '0';

      wait for 13 ms;

      -- Set the frame to be sent and assert the command to start the ARDUINO_UPDATE message
      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_PERIOD;

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      UART_AR4_RX <= '0';

      wait for BAUD_RATE_LIMIT*CLK_50MHZ_PERIOD;

      -- Send data to UUT
      for I in 7 downto 0 loop  -- This loop cover the 8 bits to send
        UART_AR4_RX <= TEST_FRAME(I);
        wait for BAUD_RATE_LIMIT*CLK_50MHZ_period;
      end loop;

      UART_AR4_RX <= '1';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0 and UART_AR4_ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO PWM ports for Arduino 4 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO PWM ports for Arduino 4 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      wait for 10 us;
      TEST_ID <= 9;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO discrete ports..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'("Test started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set values for the ARDUINO discrete inputs
      DISC_IN_1_AR1_D2 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_AR2_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR1_RECEIVED_STR <= MSG_TO_ASCII(UART_AR1_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_1_AR2_D2 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_AR3_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_1_AR3_D2 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_AR4_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_1_AR4_D2 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_AR1_D8 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO discrete ports for input 1 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO discrete ports for input 1 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      ERROR_DETECTED <= 0;

      DISC_IN_2_AR4_D4 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_2_AR3_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_2_AR3_D4 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_2_AR2_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_2_AR2_D4 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_2_AR1_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_2_AR1_D4 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_2_AR4_D12 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR1_RECEIVED_STR <= MSG_TO_ASCII(UART_AR1_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO discrete ports for input 2 test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO discrete ports for input 2 test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      end if;

      ERROR_DETECTED <= 0;

      DISC_IN_3_AR1_D7 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_3_AR3_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR1_RECEIVED_STR <= MSG_TO_ASCII(UART_AR1_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_3_AR2_D7 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_3_AR4_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_3_AR3_D7 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_3_AR1_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR1_RECEIVED_STR <= MSG_TO_ASCII(UART_AR1_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_3_AR4_D7 <= '1';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_3_AR2_D13 = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      -- Set values for the ARDUINO discrete inputs
      DISC_IN_1_AR1_D2 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_AR2_D8 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR1_RECEIVED_STR <= MSG_TO_ASCII(UART_AR1_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_1_AR2_D2 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_AR3_D8 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

       wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_1_AR3_D2 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_AR4_D8 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_1_AR4_D2 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_1_AR1_D8 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_2_AR4_D4 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_2_AR3_D12 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_2_AR3_D4 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_2_AR2_D12 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_2_AR2_D4 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_2_AR1_D12 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_2_AR1_D4 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_2_AR4_D12 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_3_AR1_D7 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_3_AR3_D13 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR1_RECEIVED_STR <= MSG_TO_ASCII(UART_AR1_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_3_AR2_D7 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_3_AR4_D13 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_3_AR3_D7 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_3_AR1_D13 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_3_AR4_D7 <= '0';

      wait for 1 us;

      -- Check the output port value
      if DISC_OUT_3_AR2_D13 = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
      end if;

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if UART_BT_ERROR_DETECTED = 0
         and UART_AR1_ERROR_DETECTED = 0 and UART_AR2_ERROR_DETECTED = 0 and UART_AR3_ERROR_DETECTED = 0 and UART_AR4_ERROR_DETECTED = 0
         and ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO discrete ports test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO discrete ports test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      write(LINE_TO_WRITE, string'("Simulation finished at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      file_close(FILE_RESULTS);

      END_OF_SIMULATION <= '1';

      wait for 2 ms;

  end process STIM_PROC;

end BHV;