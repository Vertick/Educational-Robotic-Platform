----------------------------------------------------------------------------------------------------
-- Block name: MAIN_PROCESSOR_TB                                                                  --
----------------------------------------------------------------------------------------------------
-- Author name: Pedro Plaza                                                                       --
----------------------------------------------------------------------------------------------------
-- Dependencies: MAIN_PROCESSOR; FPGA_MAIN_MODULE_Package; RS232_Package.                         --
----------------------------------------------------------------------------------------------------
-- Initial version 1 - 26/08/2017                                                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.FPGA_MAIN_MODULE_Package.all;
use work.RS232_Package.all;

entity MAIN_PROCESSOR_TB is

end MAIN_PROCESSOR_TB;

architecture BHV of MAIN_PROCESSOR_TB is

----------------------------------------------------------------------------------------------------
-- COMPONENT DECLARATIONS                                                                         --
----------------------------------------------------------------------------------------------------

component MAIN_PROCESSOR is
  port (-- Clock and Reset signals
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
      elsif MSG_IN(I-1) = x"7F" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"80" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"81" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"82" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"83" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"84" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"85" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"86" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"87" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"88" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"89" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8A" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8B" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8C" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8D" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8E" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8F" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"90" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"91" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"92" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"93" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"94" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"95" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"96" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"97" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"98" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"99" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9A" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9B" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9C" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9D" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9F" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A1" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A4" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A8" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A9" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AA" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AB" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AD" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AE" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AF" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B1" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B4" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B8" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B9" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"BA" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BB" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"BD" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"BE" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BF" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C0" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C1" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C2" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C3" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C4" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"C6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"C7" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C8" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C9" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CA" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CB" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"CC" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CD" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"CE" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"CF" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D1" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D4" then STRING_OUT(I) := 'i';
      elsif MSG_IN(I-1) = x"D5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D8" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"D9" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"DA" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"DB" then STRING_OUT(I) := '_';
      elsif MSG_IN(I-1) = x"DC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"DD" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"DE" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"DF" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E1" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E4" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E8" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E9" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EA" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EB" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"ED" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EE" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EF" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"F0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F1" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"F2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F4" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F8" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F9" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FA" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FB" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FD" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FE" then STRING_OUT(I) := '�';
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
      elsif MSG_IN(I-1) = x"7F" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"80" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"81" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"82" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"83" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"84" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"85" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"86" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"87" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"88" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"89" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8A" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8B" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8C" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8D" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8E" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"8F" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"90" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"91" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"92" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"93" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"94" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"95" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"96" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"97" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"98" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"99" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9A" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9B" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9C" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9D" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"9F" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A1" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A4" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A8" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"A9" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AA" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AB" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AD" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AE" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"AF" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B1" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B4" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B8" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"B9" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"BA" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BB" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"BD" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"BE" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"BF" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C0" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C1" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C2" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C3" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"C4" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"C6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"C7" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C8" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"C9" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CA" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CB" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"CC" then STRING_OUT(I) := '-';
      elsif MSG_IN(I-1) = x"CD" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"CE" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"CF" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D1" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D4" then STRING_OUT(I) := 'i';
      elsif MSG_IN(I-1) = x"D5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"D8" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"D9" then STRING_OUT(I) := '+';
      elsif MSG_IN(I-1) = x"DA" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"DB" then STRING_OUT(I) := '_';
      elsif MSG_IN(I-1) = x"DC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"DD" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"DE" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"DF" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E1" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E4" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E8" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"E9" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EA" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EB" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"ED" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EE" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"EF" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"F0" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F1" then STRING_OUT(I) := '=';
      elsif MSG_IN(I-1) = x"F2" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F3" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F4" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F5" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F6" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F7" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F8" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"F9" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FA" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FB" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FC" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FD" then STRING_OUT(I) := '�';
      elsif MSG_IN(I-1) = x"FE" then STRING_OUT(I) := '�';
      end if;
    end loop;
    return STRING_OUT;
end MSG_TO_ASCII;

----------------------------------------------------------------------------------------------------
-- SIGNAL DECLARATIONS                                                                            --
----------------------------------------------------------------------------------------------------

-- Clock and Reset signals
signal CLK_50MHZ           : std_logic := '0';                                    -- 32 MHz clock
signal nRESET              : std_logic := '0';                                    -- Asynchronous reset (Active LOW)
-- UART_BLUETOOTH ports interface
signal UART_BT_IN_FRAME    : std_logic_vector(7 downto 0);                        -- Received frame data.
signal UART_BT_IN_RECEIVED : std_logic;                                           -- New frame data received.
signal UART_BT_OUT_FRAME   : std_logic_vector(7 downto 0);                        -- Frame data to be transmited.
signal UART_BT_OUT_SEND    : std_logic;                                           -- Command to start the transmission of a frame.
-- UART_SHIELD ports interface
signal UART_SH_IN_FRAME    : std_logic_vector(7 downto 0);                        -- Received frame data.
signal UART_SH_IN_RECEIVED : std_logic;                                           -- New frame data received.
signal UART_SH_OUT_FRAME   : std_logic_vector(7 downto 0);                        -- Frame data to be transmited.
signal UART_SH_OUT_SEND    : std_logic;                                           -- Command to start the transmission of a frame.
-- UART_ARDUINO ports interface
signal UART_AR_IN_FRAME    : ARDUINO_FRAME_ARRAY;                                 -- Received frame data.
signal UART_AR_IN_RECEIVED : std_logic_vector(ARDUINO_BOARDS-1 downto 0);         -- New frame data received.
signal UART_AR_OUT_FRAME   : ARDUINO_FRAME_ARRAY;                                 -- Frame data to be transmited.
signal UART_AR_OUT_SEND    : std_logic_vector(ARDUINO_BOARDS-1 downto 0);         -- Command to start the transmission of a frame.
-- DISCRETE_COMM_SHIELD ports interface
signal DISC_IN_SH_EDGE     : std_logic_vector(2 downto 0);                        -- Edge detected in discrete inputs.
signal DISC_OUT_SH_LEVEL   : std_logic_vector(8 downto 0);                        -- Commanded level for discrete outputs.
-- PWM_MONITORING_ARDUINO ports interface
signal PWM_AR_PULSE_HI     : PWM_ARDUINO_PULSE_ARRAY;                             -- PWM high level pulse in milliseconds.
signal PWM_AR_PULSE_LO     : PWM_ARDUINO_PULSE_ARRAY;                             -- PWM low level pulse in milliseconds.
-- DISCRETE_COMM_ARDUINO ports interface
signal DISC_IN_AR_EDGE     : std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0); -- Edge detected in discrete inputs.
signal DISC_OUT_AR_LEVEL   : std_logic_vector(ARDUINO_DISCRETE_PORTS-1 downto 0); -- Commanded level for discrete outputs.
-- Test Bench local signals
signal SYSTEM_TIME            : string(1 to 17) := (others => ' '); -- Signal to store the system time
signal END_OF_SIMULATION      : std_logic := '0'; -- Signal to assert the end of simulation
signal TEST_FRAME             : std_logic_vector(7 downto 0); -- Frame data to test the UUT.
signal ERROR_DETECTED         : integer := 0; -- This signal is incremented when an error is detected
signal UART_BT_MESSAGE_INDEX  : integer := 1; -- Index to acquire message from the UART_BT.
signal UART_SH_MESSAGE_INDEX  : integer := 1; -- Index to acquire message from the UART_SH.
signal UART_AR1_MESSAGE_INDEX : integer := 1; -- Index to acquire message from the UART_AR1.
signal UART_AR2_MESSAGE_INDEX : integer := 1; -- Index to acquire message from the UART_AR2.
signal UART_AR3_MESSAGE_INDEX : integer := 1; -- Index to acquire message from the UART_AR3.
signal UART_AR4_MESSAGE_INDEX : integer := 1; -- Index to acquire message from the UART_AR4.
signal UART_BT_RECEIVED_MSG   : UART_BT_MSG2SEND_TYPE := UART_BT_START_RESPONSE; -- Received message from the UART_BT.
signal UART_SH_RECEIVED_MSG   : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_SH.
signal UART_AR1_RECEIVED_MSG  : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_AR1.
signal UART_AR2_RECEIVED_MSG  : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_AR2.
signal UART_AR3_RECEIVED_MSG  : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_AR3.
signal UART_AR4_RECEIVED_MSG  : UART_MSG2SEND_TYPE := UART_ACK_RESPONSE; -- Received message from the UART_AR4.
signal UART_BT_RECEIVED_STR   : string(1 to UART_BT_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_BT.
signal UART_SH_RECEIVED_STR   : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_SH.
signal UART_AR1_RECEIVED_STR  : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_AR1.
signal UART_AR2_RECEIVED_STR  : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_AR2.
signal UART_AR3_RECEIVED_STR  : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_AR3.
signal UART_AR4_RECEIVED_STR  : string(1 to UART_MSG_LENGTH) := (others => ' '); -- Received string message from the UART_AR4.

----------------------------------------------------------------------------------------------------
-- CONSTANT DECLARATIONS                                                                          --
----------------------------------------------------------------------------------------------------

constant CLK_50MHZ_PERIOD : time := 20 ns;

begin

  UUT_MAIN_PROCESSOR: MAIN_PROCESSOR
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
      DISC_IN_AR_EDGE     => DISC_IN_AR_EDGE,
      DISC_OUT_AR_LEVEL   => DISC_OUT_AR_LEVEL);

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

  UART_BT_ACQUIRE: process
    begin

      wait until UART_BT_OUT_SEND = '1';

      UART_BT_RECEIVED_MSG(UART_BT_MESSAGE_INDEX-1) <= UART_BT_OUT_FRAME;

      wait for CLK_50MHZ_period;

      if UART_BT_MESSAGE_INDEX = UART_BT_MSG_LENGTH then
        UART_BT_MESSAGE_INDEX <= 1;
      else
        UART_BT_MESSAGE_INDEX <= UART_BT_MESSAGE_INDEX +1;
      end if;

  end process UART_BT_ACQUIRE;

  UART_SH_ACQUIRE: process
    begin

      wait until UART_SH_OUT_SEND = '1';

      UART_SH_RECEIVED_MSG(UART_SH_MESSAGE_INDEX-1) <= UART_SH_OUT_FRAME;

      wait for CLK_50MHZ_period;

      if UART_SH_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_SH_MESSAGE_INDEX <= 1;
      else
        UART_SH_MESSAGE_INDEX <= UART_SH_MESSAGE_INDEX +1;
      end if;

  end process UART_SH_ACQUIRE;

  UART_AR1_ACQUIRE: process
    begin

      wait until UART_AR_OUT_SEND(0) = '1';

      UART_AR1_RECEIVED_MSG(UART_AR1_MESSAGE_INDEX-1) <= UART_AR_OUT_FRAME(0);

      wait for CLK_50MHZ_period;

      if UART_AR1_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_AR1_MESSAGE_INDEX <= 1;
      else
        UART_AR1_MESSAGE_INDEX <= UART_AR1_MESSAGE_INDEX +1;
      end if;

  end process UART_AR1_ACQUIRE;

  UART_AR2_ACQUIRE: process
    begin

      wait until UART_AR_OUT_SEND(1) = '1';

      UART_AR2_RECEIVED_MSG(UART_AR2_MESSAGE_INDEX-1) <= UART_AR_OUT_FRAME(1);

      wait for CLK_50MHZ_period;

      if UART_AR2_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_AR2_MESSAGE_INDEX <= 1;
      else
        UART_AR2_MESSAGE_INDEX <= UART_AR2_MESSAGE_INDEX +1;
      end if;

  end process UART_AR2_ACQUIRE;

  UART_AR3_ACQUIRE: process
    begin

      wait until UART_AR_OUT_SEND(2) = '1';

      UART_AR3_RECEIVED_MSG(UART_AR3_MESSAGE_INDEX-1) <= UART_AR_OUT_FRAME(2);

      wait for CLK_50MHZ_period;

      if UART_AR3_MESSAGE_INDEX = UART_MSG_LENGTH then
        UART_AR3_MESSAGE_INDEX <= 1;
      else
        UART_AR3_MESSAGE_INDEX <= UART_AR3_MESSAGE_INDEX +1;
      end if;

  end process UART_AR3_ACQUIRE;

  UART_AR4_ACQUIRE: process
    begin

      wait until UART_AR_OUT_SEND(3) = '1';

      UART_AR4_RECEIVED_MSG(UART_AR4_MESSAGE_INDEX-1) <= UART_AR_OUT_FRAME(3);

      wait for CLK_50MHZ_period;

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

      file_open(FILE_RESULTS, "../../Simulation/MAIN_PROCESSOR_RESULTS.txt", write_mode);
      write(LINE_TO_WRITE, string'("Simulation started at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      TEST_FRAME <= (others => '0');

      UART_BT_IN_FRAME <= (others => '0');
      UART_BT_IN_RECEIVED <= '0';
      UART_SH_IN_FRAME <= (others => '0');
      UART_SH_IN_RECEIVED <= '0';
      for I in 0 to ARDUINO_BOARDS-1 loop
        UART_AR_IN_FRAME(I) <= (others => '0');
        UART_AR_IN_RECEIVED(I) <= '0';
      end loop;
      DISC_IN_SH_EDGE <= (others => '0');
      for I in 0 to ARDUINO_BOARDS*PWM_AR_PORTS-1 loop
        PWM_AR_PULSE_HI(I) <= (others => '0');
        PWM_AR_PULSE_LO(I) <= (others => '0');
      end loop;
      DISC_IN_AR_EDGE <= (others => '0');

      write(LINE_TO_WRITE, string'("Testing output ports reset value..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Check the output port reset value
      if UART_BT_OUT_FRAME = "00000000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;
      -- Check the output port reset value
      if UART_BT_OUT_SEND = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;
      -- Check the output port reset value
      if UART_SH_OUT_FRAME = "00000000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;
      -- Check the output port reset value
      if UART_SH_OUT_SEND = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;
      for I in 0 to ARDUINO_BOARDS-1 loop
        -- Check the output port reset value
        if UART_AR_OUT_FRAME(I) = "00000000" then
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;
        -- Check the output port reset value
        if UART_AR_OUT_SEND(I) = '1' then
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;
      end loop;
      -- Check the output port reset value
      if DISC_OUT_SH_LEVEL = "000000000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
      end if;
      -- Check the output port reset value
      if DISC_OUT_AR_LEVEL = "000000000000" then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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

      TEST_FRAME <= "10101010";

      wait for CLK_50MHZ_period;

      write(LINE_TO_WRITE, string'("Testing the UART_BT_START_RESPONSE message..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the UART_BT_START_RESPONSE message
      UART_BT_IN_FRAME <= TEST_FRAME;
      UART_BT_IN_RECEIVED <= '1';

      wait for CLK_50MHZ_period;

      UART_BT_IN_RECEIVED <= '0';

      wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

      UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      write(LINE_TO_WRITE, string'("Testing the SHIELD_STATUS_CHAR message..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the SHIELD_STATUS_CHAR message
      UART_SH_IN_FRAME <= TEST_FRAME;
      UART_SH_IN_RECEIVED <= '1';

      wait for CLK_50MHZ_period;

      UART_SH_IN_RECEIVED <= '0';

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

      write(LINE_TO_WRITE, string'("Testing the ARDUINO_STATUS_CHAR message..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set the frame to be sent and assert the command to start the ARDUINO_STATUS_CHAR message
      for I in 0 to ARDUINO_BOARDS-1 loop
        UART_AR_IN_FRAME(I) <= TEST_FRAME;
        UART_AR_IN_RECEIVED(I) <= '1';

        wait for CLK_50MHZ_period;

        UART_AR_IN_RECEIVED(I) <= '0';

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
        UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);

        wait for 1 us;

      end loop;

      write(LINE_TO_WRITE, string'("Testing the SHIELD discrete inputs..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set values for the SHIELD discrete inputs
      for I in 0 to 2 loop
        DISC_IN_SH_EDGE(I) <= '1';

        wait for CLK_50MHZ_period;

        DISC_IN_SH_EDGE(I) <= '0';

        wait for CLK_50MHZ_period;

        -- Check the output port value
        if DISC_OUT_SH_LEVEL(3*I) = '0' then
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;

        if DISC_OUT_SH_LEVEL(3*I+1) = '0' then
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;

        if DISC_OUT_SH_LEVEL(3*I+2) = '0' then
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
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

        DISC_IN_SH_EDGE(I) <= '1';

        wait for CLK_50MHZ_period;

        DISC_IN_SH_EDGE(I) <= '0';

        wait for CLK_50MHZ_period;

        -- Check the output port value
        if DISC_OUT_SH_LEVEL(3*I) = '1' then
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;

        if DISC_OUT_SH_LEVEL(3*I+1) = '1' then
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
        end if;

        if DISC_OUT_SH_LEVEL(3*I+1) = '1' then
          ERROR_DETECTED <= ERROR_DETECTED +1;
          wait for CLK_50MHZ_period;
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

        if ERROR_DETECTED = 0 then
          write(LINE_TO_WRITE, string'("The SHIELD discrete inputs test has been passed."));
          writeline(FILE_RESULTS, LINE_TO_WRITE);
        else
          write(LINE_TO_WRITE, string'("The SHIELD discrete inputs test has been failed."));
          writeline(FILE_RESULTS, LINE_TO_WRITE);
          ERROR_DETECTED <= 0;
        end if;

        wait for 1 us;

      end loop;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO pulse width values..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set values for the ARDUINO pulse width values
      for I in 0 to ARDUINO_BOARDS*PWM_AR_PORTS-1 loop
        PWM_AR_PULSE_HI(I) <= "10101010";

        UART_AR_IN_FRAME(0) <= TEST_FRAME;
        UART_AR_IN_RECEIVED(0) <= '1';

        wait for CLK_50MHZ_period;

        UART_AR_IN_RECEIVED(0) <= '0';

        wait for UART_BT_MSG_LENGTH*TRANSFER_TIMER_LIMIT*CLK_50MHZ_PERIOD;

        UART_BT_RECEIVED_STR <= BT_MSG_TO_ASCII(UART_BT_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_BT:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_BT_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR1:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR1_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);

        wait for 1 us;

      end loop;

      for I in 0 to ARDUINO_BOARDS*PWM_AR_PORTS-1 loop
        PWM_AR_PULSE_LO(I) <= "10101010";

        UART_AR_IN_FRAME(1) <= TEST_FRAME;
        UART_AR_IN_RECEIVED(1) <= '1';

        wait for CLK_50MHZ_period;

        UART_AR_IN_RECEIVED(1) <= '0';

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
        UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
        wait for 1 us;
        write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
        writeline(FILE_RESULTS, LINE_TO_WRITE);

        wait for 1 us;

      end loop;

      write(LINE_TO_WRITE, string'("Testing the ARDUINO discrete inputs..."));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      -- Set values for the ARDUINO discrete inputs
      DISC_IN_AR_EDGE(0) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(0) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(3) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(0) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(0) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(3) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(3) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(3) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(6) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(3) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(3) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(6) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(6) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(6) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(9) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(6) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(6) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(9) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(9) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(9) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(0) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(9) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(9) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(0) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(10) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(10) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(7) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(10) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(10) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(7) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(7) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(7) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(4) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(7) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(7) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(4) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(4) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(4) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(1) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(4) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(4) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(1) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(1) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(1) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(10) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(1) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(1) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(10) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(2) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(2) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(8) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(2) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(2) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(8) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(5) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(5) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(11) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(5) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(5) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(11) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(8) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(8) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(2) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(8) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(8) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(2) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(11) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(11) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(5) = '0' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      wait for 1 us;

      DISC_IN_AR_EDGE(11) <= '1';

      wait for CLK_50MHZ_period;

      DISC_IN_AR_EDGE(11) <= '0';

      wait for CLK_50MHZ_period;

      -- Check the output port value
      if DISC_OUT_AR_LEVEL(5) = '1' then
        ERROR_DETECTED <= ERROR_DETECTED +1;
        wait for CLK_50MHZ_period;
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
      UART_AR2_RECEIVED_STR <= MSG_TO_ASCII(UART_AR2_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR2:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR2_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR3_RECEIVED_STR <= MSG_TO_ASCII(UART_AR3_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR3:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR3_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      UART_AR4_RECEIVED_STR <= MSG_TO_ASCII(UART_AR4_RECEIVED_MSG);
      wait for 1 us;
      write(LINE_TO_WRITE, string'("Received message from UART_AR4:"));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      write(LINE_TO_WRITE, string'(UART_AR4_RECEIVED_STR));
      writeline(FILE_RESULTS, LINE_TO_WRITE);

      if ERROR_DETECTED = 0 then
        write(LINE_TO_WRITE, string'("The ARDUINO discrete inputs test has been passed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
      else
        write(LINE_TO_WRITE, string'("The ARDUINO discrete inputs test has been failed."));
        writeline(FILE_RESULTS, LINE_TO_WRITE);
        ERROR_DETECTED <= 0;
      end if;

      wait for 1 us;

      write(LINE_TO_WRITE, string'("Simulation finished at " & SYSTEM_TIME));
      writeline(FILE_RESULTS, LINE_TO_WRITE);
      file_close(FILE_RESULTS);

      END_OF_SIMULATION <= '1';

      wait for 2 ms;

  end process STIM_PROC;

end BHV;