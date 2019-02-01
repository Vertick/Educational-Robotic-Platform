----------------------------------------------------------------------------------------------------
-- Block name: RS232_Package                                                                      --
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

package RS232_Package is

  ----------------------------------------------------------------------------------------------------
  -- Type and constant declarations                                                                 --
  ----------------------------------------------------------------------------------------------------

  --------------------------------------------------------------------------------------------------------
  --| BAUD RATE    |       110 |       300 |      1200 |      2400 |      4800 |      9600 |     19200 |--
  --------------------------------------------------------------------------------------------------------
  --| UART_Clock   |    290909 |    106667 |     26667 |     13333 |      6667 |      5208 |      1667 |--
  --------------------------------------------------------------------------------------------------------
  --| SERIAL_CLOCK |    145455 |     53333 |     13333 |      6667 |      3333 |      2604 |       833 |--
  --------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------
  --| BAUD RATE    |     38400 |     57600 |    115200 |    230400 |    460800 |    921600 |--
  --------------------------------------------------------------------------------------------
  --| UART_Clock   |       833 |       556 |       434 |       139 |        69 |        35 |--
  --------------------------------------------------------------------------------------------
  --| SERIAL_CLOCK |       417 |       278 |       232 |        69 |        35 |        17 |--
  --------------------------------------------------------------------------------------------

  -- Timing constants
  constant BAUD_RATE_LIMIT         : integer := 434;                -- Cycle count for a Baud Rate of 115200 bps
  constant BAUD_RATE_HALF_LIMIT    : integer := 232;                -- Half cycle count for a Baud Rate of 115200 bps
  constant RS232_FRAME_LIMIT       : integer := 9;                  -- RS232 frame lenght
  constant SERIAL_MESSAGE_LIMIT    : integer := 1;                  -- Serial Message lenght
  constant BT_TRANSFER_TIMER_LIMIT : integer := BAUD_RATE_LIMIT*12; -- Complete ransfer time limit
  constant TRANSFER_TIMER_LIMIT    : integer := BAUD_RATE_LIMIT*12; -- Complete ransfer time limit
  -- ASCII control characters (character code 0-31)
  constant CHAR_NULL_CHAR        : std_logic_vector(7 downto 0) := x"00"; -- Null char
  constant CHAR_SOH              : std_logic_vector(7 downto 0) := x"01"; -- Start of Heading
  constant CHAR_SOT              : std_logic_vector(7 downto 0) := x"02"; -- Start of Text
  constant CHAR_END_OF_TEXT      : std_logic_vector(7 downto 0) := x"03"; -- End of Text
  constant CHAR_END_OF_TX        : std_logic_vector(7 downto 0) := x"04"; -- End of Transmission
  constant CHAR_ENQ              : std_logic_vector(7 downto 0) := x"05"; -- Enquiry
  constant CHAR_ACK              : std_logic_vector(7 downto 0) := x"06"; -- Acknowledgment
  constant CHAR_BELL             : std_logic_vector(7 downto 0) := x"07"; -- Bell
  constant CHAR_BACK_SPACE       : std_logic_vector(7 downto 0) := x"08"; -- Back Space
  constant CHAR_HORIZONTAL_TAB   : std_logic_vector(7 downto 0) := x"09"; -- Horizontal Tab
  constant CHAR_LINE_FEED        : std_logic_vector(7 downto 0) := x"0A"; -- Line Feed
  constant CHAR_VERTICAL_TAB     : std_logic_vector(7 downto 0) := x"0B"; -- Vertical Tab
  constant CHAR_FORM_FEED        : std_logic_vector(7 downto 0) := x"0C"; -- Form Feed
  constant CHAR_CR               : std_logic_vector(7 downto 0) := x"0D"; -- Carriage Return
  constant CHAR_SHIFT_OUT        : std_logic_vector(7 downto 0) := x"0E"; -- Shift Out / X-On
  constant CHAR_SHIFT_IN         : std_logic_vector(7 downto 0) := x"0F"; -- Shift In / X-Off
  constant CHAR_DLE              : std_logic_vector(7 downto 0) := x"10"; -- Data Line Escape
  constant CHAR_DEV_CTRL_1       : std_logic_vector(7 downto 0) := x"11"; -- Device Control 1 (oft. XON)
  constant CHAR_DEV_CTRL_2       : std_logic_vector(7 downto 0) := x"12"; -- Device Control 2
  constant CHAR_DEV_CTRL_3       : std_logic_vector(7 downto 0) := x"13"; -- Device Control 3 (oft. XOFF)
  constant CHAR_DEV_CTRL_4       : std_logic_vector(7 downto 0) := x"14"; -- Device Control 4
  constant CHAR_nACK             : std_logic_vector(7 downto 0) := x"15"; -- Negative Acknowledgement
  constant CHAR_SYNCH_IDLE       : std_logic_vector(7 downto 0) := x"16"; -- Synchronous Idle
  constant CHAR_EOT_BLOCK        : std_logic_vector(7 downto 0) := x"17"; -- End of Transmit Block
  constant CHAR_CANCEL           : std_logic_vector(7 downto 0) := x"18"; -- Cancel
  constant CHAR_EOME             : std_logic_vector(7 downto 0) := x"19"; -- End of Medium
  constant CHAR_SUBSTITUTE       : std_logic_vector(7 downto 0) := x"1A"; -- Substitute
  constant CHAR_ESCAPE           : std_logic_vector(7 downto 0) := x"1B"; -- Escape
  constant CHAR_FILE_SEPARATOR   : std_logic_vector(7 downto 0) := x"1C"; -- File Separator
  constant CHAR_GROUP_SEPARATOR  : std_logic_vector(7 downto 0) := x"1D"; -- Group Separator
  constant CHAR_RECORD_SEPARATOR : std_logic_vector(7 downto 0) := x"1E"; -- Record Separator
  constant CHAR_UNIT_SEPARATOR   : std_logic_vector(7 downto 0) := x"1F"; -- Unit Separator
  -- ASCII printable characters (character code 32-127)
  constant CHAR_SPACE             : std_logic_vector(7 downto 0) := x"20"; -- Space
  constant CHAR_EXCLAMATION_MARK  : std_logic_vector(7 downto 0) := x"21"; -- Exclamation mark
  constant CHAR_DOUBLE_QUOTES     : std_logic_vector(7 downto 0) := x"22"; -- Double quotes (or speech marks)
  constant CHAR_NUMBER            : std_logic_vector(7 downto 0) := x"23"; -- Number
  constant CHAR_DOLLAR            : std_logic_vector(7 downto 0) := x"24"; -- Dollar
  constant CHAR_PROCENTTECKEN     : std_logic_vector(7 downto 0) := x"25"; -- Procenttecken
  constant CHAR_AMPERSAND         : std_logic_vector(7 downto 0) := x"26"; -- Ampersand
  constant CHAR_SINGLE_QUOTE      : std_logic_vector(7 downto 0) := x"27"; -- Single quote
  constant CHAR_OPEN_PARENTHESIS  : std_logic_vector(7 downto 0) := x"28"; -- Open parenthesis (or open bracket)
  constant CHAR_CLOSE_PARENTHESIS : std_logic_vector(7 downto 0) := x"29"; -- Close parenthesis (or close bracket)
  constant CHAR_ASTERISK          : std_logic_vector(7 downto 0) := x"2A"; -- Asterisk
  constant CHAR_PLUS              : std_logic_vector(7 downto 0) := x"2B"; -- Plus
  constant CHAR_COMMA             : std_logic_vector(7 downto 0) := x"2C"; -- Comma
  constant CHAR_HYPHEN            : std_logic_vector(7 downto 0) := x"2D"; -- Hyphen
  constant CHAR_FULL_STOP         : std_logic_vector(7 downto 0) := x"2E"; -- Period, dot or full stop
  constant CHAR_SLASH             : std_logic_vector(7 downto 0) := x"2F"; -- Slash or divide
  constant CHAR_ZERO              : std_logic_vector(7 downto 0) := x"30"; -- Zero
  constant CHAR_ONE               : std_logic_vector(7 downto 0) := x"31"; -- One
  constant CHAR_TWO               : std_logic_vector(7 downto 0) := x"32"; -- Two
  constant CHAR_THREE             : std_logic_vector(7 downto 0) := x"33"; -- Three
  constant CHAR_FOUR              : std_logic_vector(7 downto 0) := x"34"; -- Four
  constant CHAR_FIVE              : std_logic_vector(7 downto 0) := x"35"; -- Five
  constant CHAR_SIX               : std_logic_vector(7 downto 0) := x"36"; -- Six
  constant CHAR_SEVEN             : std_logic_vector(7 downto 0) := x"37"; -- Seven
  constant CHAR_EIGHT             : std_logic_vector(7 downto 0) := x"38"; -- Eight
  constant CHAR_NINE              : std_logic_vector(7 downto 0) := x"39"; -- Nine
  constant CHAR_COLON             : std_logic_vector(7 downto 0) := x"3A"; -- Colon
  constant CHAR_SEMICOLON         : std_logic_vector(7 downto 0) := x"3B"; -- Semicolon
  constant CHAR_LESS_THAN         : std_logic_vector(7 downto 0) := x"3C"; -- Less than (or open angled bracket)
  constant CHAR_EQUALS            : std_logic_vector(7 downto 0) := x"3D"; -- Equals
  constant CHAR_GREATER_THAN      : std_logic_vector(7 downto 0) := x"3E"; -- Greater than (or close angled bracket)
  constant CHAR_QUESTION_MARK     : std_logic_vector(7 downto 0) := x"3F"; -- Question mark
  constant CHAR_AT_SYMBOL         : std_logic_vector(7 downto 0) := x"40"; -- At symbol
  constant CHAR_UPPER_A           : std_logic_vector(7 downto 0) := x"41"; -- Uppercase A
  constant CHAR_UPPER_B           : std_logic_vector(7 downto 0) := x"42"; -- Uppercase B
  constant CHAR_UPPER_C           : std_logic_vector(7 downto 0) := x"43"; -- Uppercase C
  constant CHAR_UPPER_D           : std_logic_vector(7 downto 0) := x"44"; -- Uppercase D
  constant CHAR_UPPER_E           : std_logic_vector(7 downto 0) := x"45"; -- Uppercase E
  constant CHAR_UPPER_F           : std_logic_vector(7 downto 0) := x"46"; -- Uppercase F
  constant CHAR_UPPER_G           : std_logic_vector(7 downto 0) := x"47"; -- Uppercase G
  constant CHAR_UPPER_H           : std_logic_vector(7 downto 0) := x"48"; -- Uppercase H
  constant CHAR_UPPER_I           : std_logic_vector(7 downto 0) := x"49"; -- Uppercase I
  constant CHAR_UPPER_J           : std_logic_vector(7 downto 0) := x"4A"; -- Uppercase J
  constant CHAR_UPPER_K           : std_logic_vector(7 downto 0) := x"4B"; -- Uppercase K
  constant CHAR_UPPER_L           : std_logic_vector(7 downto 0) := x"4C"; -- Uppercase L
  constant CHAR_UPPER_M           : std_logic_vector(7 downto 0) := x"4D"; -- Uppercase M
  constant CHAR_UPPER_N           : std_logic_vector(7 downto 0) := x"4E"; -- Uppercase N
  constant CHAR_UPPER_O           : std_logic_vector(7 downto 0) := x"4F"; -- Uppercase O
  constant CHAR_UPPER_P           : std_logic_vector(7 downto 0) := x"50"; -- Uppercase P
  constant CHAR_UPPER_Q           : std_logic_vector(7 downto 0) := x"51"; -- Uppercase Q
  constant CHAR_UPPER_R           : std_logic_vector(7 downto 0) := x"52"; -- Uppercase R
  constant CHAR_UPPER_S           : std_logic_vector(7 downto 0) := x"53"; -- Uppercase S
  constant CHAR_UPPER_T           : std_logic_vector(7 downto 0) := x"54"; -- Uppercase T
  constant CHAR_UPPER_U           : std_logic_vector(7 downto 0) := x"55"; -- Uppercase U
  constant CHAR_UPPER_V           : std_logic_vector(7 downto 0) := x"56"; -- Uppercase V
  constant CHAR_UPPER_W           : std_logic_vector(7 downto 0) := x"57"; -- Uppercase W
  constant CHAR_UPPER_X           : std_logic_vector(7 downto 0) := x"58"; -- Uppercase X
  constant CHAR_UPPER_Y           : std_logic_vector(7 downto 0) := x"59"; -- Uppercase Y
  constant CHAR_UPPER_Z           : std_logic_vector(7 downto 0) := x"5A"; -- Uppercase Z
  constant CHAR_OPENING_BRACKET   : std_logic_vector(7 downto 0) := x"5B"; -- Opening bracket
  constant CHAR_BACKSLASH         : std_logic_vector(7 downto 0) := x"5C"; -- Backslash
  constant CHAR_CLOSING_BRACKET   : std_logic_vector(7 downto 0) := x"5D"; -- Closing bracket
  constant CHAR_CARET             : std_logic_vector(7 downto 0) := x"5E"; -- Caret - circumflex
  constant CHAR_UNDERSCORE        : std_logic_vector(7 downto 0) := x"5F"; -- Underscore
  constant CHAR_GRAVE_ACCENT      : std_logic_vector(7 downto 0) := x"60"; -- Grave accent
  constant CHAR_LOWER_A           : std_logic_vector(7 downto 0) := x"61"; -- Lowercase a
  constant CHAR_LOWER_B           : std_logic_vector(7 downto 0) := x"62"; -- Lowercase b
  constant CHAR_LOWER_C           : std_logic_vector(7 downto 0) := x"63"; -- Lowercase c
  constant CHAR_LOWER_D           : std_logic_vector(7 downto 0) := x"64"; -- Lowercase d
  constant CHAR_LOWER_E           : std_logic_vector(7 downto 0) := x"65"; -- Lowercase e
  constant CHAR_LOWER_F           : std_logic_vector(7 downto 0) := x"66"; -- Lowercase f
  constant CHAR_LOWER_G           : std_logic_vector(7 downto 0) := x"67"; -- Lowercase g
  constant CHAR_LOWER_H           : std_logic_vector(7 downto 0) := x"68"; -- Lowercase h
  constant CHAR_LOWER_I           : std_logic_vector(7 downto 0) := x"69"; -- Lowercase i
  constant CHAR_LOWER_J           : std_logic_vector(7 downto 0) := x"6A"; -- Lowercase j
  constant CHAR_LOWER_K           : std_logic_vector(7 downto 0) := x"6B"; -- Lowercase k
  constant CHAR_LOWER_L           : std_logic_vector(7 downto 0) := x"6C"; -- Lowercase l
  constant CHAR_LOWER_M           : std_logic_vector(7 downto 0) := x"6D"; -- Lowercase m
  constant CHAR_LOWER_N           : std_logic_vector(7 downto 0) := x"6E"; -- Lowercase n
  constant CHAR_LOWER_O           : std_logic_vector(7 downto 0) := x"6F"; -- Lowercase o
  constant CHAR_LOWER_P           : std_logic_vector(7 downto 0) := x"70"; -- Lowercase p
  constant CHAR_LOWER_Q           : std_logic_vector(7 downto 0) := x"71"; -- Lowercase q
  constant CHAR_LOWER_R           : std_logic_vector(7 downto 0) := x"72"; -- Lowercase r
  constant CHAR_LOWER_S           : std_logic_vector(7 downto 0) := x"73"; -- Lowercase s
  constant CHAR_LOWER_T           : std_logic_vector(7 downto 0) := x"74"; -- Lowercase t
  constant CHAR_LOWER_U           : std_logic_vector(7 downto 0) := x"75"; -- Lowercase u
  constant CHAR_LOWER_V           : std_logic_vector(7 downto 0) := x"76"; -- Lowercase v
  constant CHAR_LOWER_W           : std_logic_vector(7 downto 0) := x"77"; -- Lowercase w
  constant CHAR_LOWER_X           : std_logic_vector(7 downto 0) := x"78"; -- Lowercase x
  constant CHAR_LOWER_Y           : std_logic_vector(7 downto 0) := x"79"; -- Lowercase y
  constant CHAR_LOWER_Z           : std_logic_vector(7 downto 0) := x"7A"; -- Lowercase z
  constant CHAR_OPENING_BRACE     : std_logic_vector(7 downto 0) := x"7B"; -- Opening brace
  constant CHAR_VERTICAL_BAR      : std_logic_vector(7 downto 0) := x"7C"; -- Vertical bar
  constant CHAR_CLOSING_BRACE     : std_logic_vector(7 downto 0) := x"7D"; -- Closing brace
  constant CHAR_EQUIVALENCY_SIGN  : std_logic_vector(7 downto 0) := x"7E"; -- Equivalency sign - tilde
  constant CHAR_DELETE            : std_logic_vector(7 downto 0) := x"7F"; -- Delete
  -- The extended ASCII codes (character cod   e 128-255)
  constant CHAR_EURO_SIGN                                  : std_logic_vector(7 downto 0) := x"80"; -- Euro sign
  constant CHAR_UNKNOWN_1                                  : std_logic_vector(7 downto 0) := x"81"; -- 
  constant CHAR_SINGLE_LOW_9_QUOTATION_MARK                : std_logic_vector(7 downto 0) := x"82"; -- Single low-9 quotation mark
  constant CHAR_LATIN_SMALL_LETTER_WITH_HOOK               : std_logic_vector(7 downto 0) := x"83"; -- Latin small letter f with hook
  constant CHAR_DOUBLE_LOW_9_QUOTATION_MARK                : std_logic_vector(7 downto 0) := x"84"; -- Double low-9 quotation mark
  constant CHAR_HORIZONTAL_ELLIPSIS                        : std_logic_vector(7 downto 0) := x"85"; -- Horizontal ellipsis
  constant CHAR_DAGGER                                     : std_logic_vector(7 downto 0) := x"86"; -- Dagger
  constant CHAR_DOUBLE_DAGGER                              : std_logic_vector(7 downto 0) := x"87"; -- Double dagger
  constant CHAR_MODIFIER_LETTER_CIRCUMFLEX_ACCENT          : std_logic_vector(7 downto 0) := x"88"; -- Modifier letter circumflex accent
  constant CHAR_PER_MILLE_SIGN                             : std_logic_vector(7 downto 0) := x"89"; -- Per mille sign
  constant CHAR_LATIN_CAPITAL_LETTER_S_WITH_CARON          : std_logic_vector(7 downto 0) := x"8A"; -- Latin capital letter S with caron
  constant CHAR_SINGLE_LEFT_POINTING_ANGLE_QUOTATION       : std_logic_vector(7 downto 0) := x"8B"; -- Single left-pointing angle quotation
  constant CHAR_LATIN_CAPITAL_LIGATURE_OE                  : std_logic_vector(7 downto 0) := x"8C"; -- Latin capital ligature OE
  constant CHAR_UNKNOWN_2                                  : std_logic_vector(7 downto 0) := x"8D"; -- 
  constant CHAR_LATIN_CAPTIAL_LETTER_Z_WITH_CARON          : std_logic_vector(7 downto 0) := x"8E"; -- Latin captial letter Z with caron
  constant CHAR_UNKNOWN_3                                  : std_logic_vector(7 downto 0) := x"8F"; -- 
  constant CHAR_UNKNOWN_4                                  : std_logic_vector(7 downto 0) := x"90"; -- 
  constant CHAR_LEFT_SINGLE_QUOTATION_MARK                 : std_logic_vector(7 downto 0) := x"91"; -- Left single quotation mark
  constant CHAR_RIGHT_SINGLE_QUOTATION_MARK                : std_logic_vector(7 downto 0) := x"92"; -- Right single quotation mark
  constant CHAR_LEFT_DOUBLE_QUOTATION_MARK                 : std_logic_vector(7 downto 0) := x"93"; -- Left double quotation mark
  constant CHAR_RIGHT_DOUBLE_QUOTATION_MARK                : std_logic_vector(7 downto 0) := x"94"; -- Right double quotation mark
  constant CHAR_BULLET                                     : std_logic_vector(7 downto 0) := x"95"; -- Bullet
  constant CHAR_EN_DASH                                    : std_logic_vector(7 downto 0) := x"96"; -- En dash
  constant CHAR_EM_DASH                                    : std_logic_vector(7 downto 0) := x"97"; -- Em dash
  constant CHAR_SMALL_TILDE                                : std_logic_vector(7 downto 0) := x"98"; -- Small tilde
  constant CHAR_TRADE_MARK_SIGN                            : std_logic_vector(7 downto 0) := x"99"; -- Trade mark sign
  constant CHAR_LATIN_SMALL_LETTER_S_WITH_CARON            : std_logic_vector(7 downto 0) := x"9A"; -- Latin small letter S with caron
  constant CHAR_SINGLE_RIGHT_POINTING_ANGLE_QUOTATION_MARK : std_logic_vector(7 downto 0) := x"9B"; -- Single right-pointing angle quotation mark
  constant CHAR_LATIN_SMALL_LIGATURE_OE                    : std_logic_vector(7 downto 0) := x"9C"; -- Latin small ligature oe
  constant CHAR_UNKNOWN_5                                  : std_logic_vector(7 downto 0) := x"9D"; -- 
  constant CHAR_LATIN_SMALL_LETTER_Z_WITH_CARON            : std_logic_vector(7 downto 0) := x"9E"; -- Latin small letter z with caron
  constant CHAR_LATIN_CAPITAL_LETTER_Y_WITH_DIAERESIS      : std_logic_vector(7 downto 0) := x"9F"; -- Latin capital letter Y with diaeresis
  constant CHAR_NON_BREAKING_SPACE                         : std_logic_vector(7 downto 0) := x"A0"; -- Non-breaking space
  constant CHAR_INVERTED_EXCLAMATION_MARK                  : std_logic_vector(7 downto 0) := x"A1"; -- Inverted exclamation mark
  constant CHAR_CENT_SIGN                                  : std_logic_vector(7 downto 0) := x"A2"; -- Cent sign
  constant CHAR_POUND_SIGN                                 : std_logic_vector(7 downto 0) := x"A3"; -- Pound sign
  constant CHAR_CURRENCY_SIGN                              : std_logic_vector(7 downto 0) := x"A4"; -- Currency sign
  constant CHAR_YEN_SIGN                                   : std_logic_vector(7 downto 0) := x"A5"; -- Yen sign
  constant CHAR_PIPE_BROKEN_VERTICAL_BAR                   : std_logic_vector(7 downto 0) := x"A6"; -- Pipe, Broken vertical bar
  constant CHAR_SECTION_SIGN                               : std_logic_vector(7 downto 0) := x"A7"; -- Section sign
  constant CHAR_SPACING_DIAERESIS_UMLAUT                   : std_logic_vector(7 downto 0) := x"A8"; -- Spacing diaeresis - umlaut
  constant CHAR_COPYRIGHT_SIGN                             : std_logic_vector(7 downto 0) := x"A9"; -- Copyright sign
  constant CHAR_FEMININE_ORDINAL_INDICATOR                 : std_logic_vector(7 downto 0) := x"AA"; -- Feminine ordinal indicator
  constant CHAR_LEFT_DOUBLE_ANGLE_QUOTES                   : std_logic_vector(7 downto 0) := x"AB"; -- Left double angle quotes
  constant CHAR_SIGN                                       : std_logic_vector(7 downto 0) := x"AC"; -- sign
  constant CHAR_SOFT_HYPHEN                                : std_logic_vector(7 downto 0) := x"AD"; -- Soft hyphen
  constant CHAR_REGISTERED_TRADE_MARK_SIGN                 : std_logic_vector(7 downto 0) := x"AE"; -- Registered trade mark sign
  constant CHAR_SPACING_MACRON_OVERLINE                    : std_logic_vector(7 downto 0) := x"AF"; -- Spacing macron - overline
  constant CHAR_DEGREE_SIGN                                : std_logic_vector(7 downto 0) := x"B0"; -- Degree sign
  constant CHAR_PLUS_OR_MINUS_SIGN                         : std_logic_vector(7 downto 0) := x"B1"; -- Plus-or-minus sign
  constant CHAR_SUPERSCRIPT_TWO_SQUARED                    : std_logic_vector(7 downto 0) := x"B2"; -- Superscript two - squared
  constant CHAR_SUPERSCRIPT_THREE_CUBED                    : std_logic_vector(7 downto 0) := x"B3"; -- Superscript three - cubed
  constant CHAR_ACUTE_ACCENT_SPACING_ACUTE                 : std_logic_vector(7 downto 0) := x"B4"; -- Acute accent - spacing acute
  constant CHAR_MICRO_SIGN                                 : std_logic_vector(7 downto 0) := x"B5"; -- Micro sign
  constant CHAR_PILCROW_SIGN_PARAGRAPH_SIGN                : std_logic_vector(7 downto 0) := x"B6"; -- Pilcrow sign - paragraph sign
  constant CHAR_MIDDLE_DOT_GEORGIAN_COMMA                  : std_logic_vector(7 downto 0) := x"B7"; -- Middle dot - Georgian comma
  constant CHAR_SPACING_CEDILLA                            : std_logic_vector(7 downto 0) := x"B8"; -- Spacing cedilla
  constant CHAR_SUPERSCRIPT_ONE                            : std_logic_vector(7 downto 0) := x"B9"; -- Superscript one
  constant CHAR_MASCULINE_ORDINAL_INDICATOR                : std_logic_vector(7 downto 0) := x"BA"; -- Masculine ordinal indicator
  constant CHAR_RIGHT_DOUBLE_ANGLE_QUOTES                  : std_logic_vector(7 downto 0) := x"BB"; -- Right double angle quotes
  constant CHAR_FRACTION_ONE_QUARTER                       : std_logic_vector(7 downto 0) := x"BC"; -- Fraction one quarter
  constant CHAR_FRACTION_ONE_HALF                          : std_logic_vector(7 downto 0) := x"BD"; -- Fraction one half
  constant CHAR_FRACTION_THREE_QUARTERS                    : std_logic_vector(7 downto 0) := x"BE"; -- Fraction three quarters
  constant CHAR_INVERTED_QUESTION_MARK                     : std_logic_vector(7 downto 0) := x"BF"; -- Inverted question mark
  constant CHAR_LATIN_CAPITAL_A_WITH_GRAVE                 : std_logic_vector(7 downto 0) := x"C0"; -- Latin capital letter A with grave
  constant CHAR_LATIN_CAPITAL_A_WITH_ACUTE                 : std_logic_vector(7 downto 0) := x"C1"; -- Latin capital letter A with acute
  constant CHAR_LATIN_CAPITAL_A_WITH_CIRCUMFLEX            : std_logic_vector(7 downto 0) := x"C2"; -- Latin capital letter A with circumflex
  constant CHAR_LATIN_CAPITAL_A_WITH_TILDE                 : std_logic_vector(7 downto 0) := x"C3"; -- Latin capital letter A with tilde
  constant CHAR_LATIN_CAPITAL_A_WITH_DIAERESIS             : std_logic_vector(7 downto 0) := x"C4"; -- Latin capital letter A with diaeresis
  constant CHAR_LATIN_CAPITAL_A_WITH_RING_ABOVE            : std_logic_vector(7 downto 0) := x"C5"; -- Latin capital letter A with ring above
  constant CHAR_LATIN_CAPITAL_AE                           : std_logic_vector(7 downto 0) := x"C6"; -- Latin capital letter AE
  constant CHAR_LATIN_CAPITAL_C_WITH_CEDILLA               : std_logic_vector(7 downto 0) := x"C7"; -- Latin capital letter C with cedilla
  constant CHAR_LATIN_CAPITAL_E_WITH_GRAVE                 : std_logic_vector(7 downto 0) := x"C8"; -- Latin capital letter E with grave
  constant CHAR_LATIN_CAPITAL_E_WITH_ACUTE                 : std_logic_vector(7 downto 0) := x"C9"; -- Latin capital letter E with acute
  constant CHAR_LATIN_CAPITAL_E_WITH_CIRCUMFLEX            : std_logic_vector(7 downto 0) := x"CA"; -- Latin capital letter E with circumflex
  constant CHAR_LATIN_CAPITAL_E_WITH_DIAERESIS             : std_logic_vector(7 downto 0) := x"CB"; -- Latin capital letter E with diaeresis
  constant CHAR_LATIN_CAPITAL_I_WITH_GRAVE                 : std_logic_vector(7 downto 0) := x"CC"; -- Latin capital letter I with grave
  constant CHAR_LATIN_CAPITAL_I_WITH_ACUTE                 : std_logic_vector(7 downto 0) := x"CD"; -- Latin capital letter I with acute
  constant CHAR_LATIN_CAPITAL_I_WITH_CIRCUMFLEX            : std_logic_vector(7 downto 0) := x"CE"; -- Latin capital letter I with circumflex
  constant CHAR_LATIN_CAPITAL_I_WITH_DIAERESIS             : std_logic_vector(7 downto 0) := x"CF"; -- Latin capital letter I with diaeresis
  constant CHAR_LATIN_CAPITAL_ETH                          : std_logic_vector(7 downto 0) := x"D0"; -- Latin capital letter ETH
  constant CHAR_LATIN_CAPITAL_N_WITH_TILDE                 : std_logic_vector(7 downto 0) := x"D1"; -- Latin capital letter N with tilde
  constant CHAR_LATIN_CAPITAL_O_WITH_GRAVE                 : std_logic_vector(7 downto 0) := x"D2"; -- Latin capital letter O with grave
  constant CHAR_LATIN_CAPITAL_O_WITH_ACUTE                 : std_logic_vector(7 downto 0) := x"D3"; -- Latin capital letter O with acute
  constant CHAR_LATIN_CAPITAL_O_WITH_CIRCUMFLEX            : std_logic_vector(7 downto 0) := x"D4"; -- Latin capital letter O with circumflex
  constant CHAR_LATIN_CAPITAL_O_WITH_TILDE                 : std_logic_vector(7 downto 0) := x"D5"; -- Latin capital letter O with tilde
  constant CHAR_LATIN_CAPITAL_O_WITH_DIAERESIS             : std_logic_vector(7 downto 0) := x"D6"; -- Latin capital letter O with diaeresis
  constant CHAR_MULTI_PLICATI_ON_SIGN                      : std_logic_vector(7 downto 0) := x"D7"; -- Multiplication sign
  constant CHAR_LATIN_CAPITAL_O_WITH_SLASH                 : std_logic_vector(7 downto 0) := x"D8"; -- Latin capital letter O with slash
  constant CHAR_LATIN_CAPITAL_U_WITH_GRAVE                 : std_logic_vector(7 downto 0) := x"D9"; -- Latin capital letter U with grave
  constant CHAR_LATIN_CAPITAL_U_WITH_ACUTE                 : std_logic_vector(7 downto 0) := x"DA"; -- Latin capital letter U with acute
  constant CHAR_LATIN_CAPITAL_U_WITH_CIRCUMFLEX            : std_logic_vector(7 downto 0) := x"DB"; -- Latin capital letter U with circumflex
  constant CHAR_LATIN_CAPITAL_U_WITH_DIAERESIS             : std_logic_vector(7 downto 0) := x"DC"; -- Latin capital letter U with diaeresis
  constant CHAR_LATIN_CAPITAL_Y_WITH_ACUTE                 : std_logic_vector(7 downto 0) := x"DD"; -- Latin capital letter Y with acute
  constant CHAR_LATIN_CAPITAL_THORN                        : std_logic_vector(7 downto 0) := x"DE"; -- Latin capital letter THORN
  constant CHAR_LATIN_SMALL_SHARP_S_ESS_ZED                : std_logic_vector(7 downto 0) := x"DF"; -- Latin small letter sharp s - ess-zed
  constant CHAR_LATIN_SMALL_A_WITH_GRAVE                   : std_logic_vector(7 downto 0) := x"E0"; -- Latin small letter a with grave
  constant CHAR_LATIN_SMALL_A_WITH_ACUTE                   : std_logic_vector(7 downto 0) := x"E1"; -- Latin small letter a with acute
  constant CHAR_LATIN_SMALL_A_WITH_CIRCUMFLEX              : std_logic_vector(7 downto 0) := x"E2"; -- Latin small letter a with circumflex
  constant CHAR_LATIN_SMALL_A_WITH_TILDE                   : std_logic_vector(7 downto 0) := x"E3"; -- Latin small letter a with tilde
  constant CHAR_LATIN_SMALL_A_WITH_DIAERESIS               : std_logic_vector(7 downto 0) := x"E4"; -- Latin small letter a with diaeresis
  constant CHAR_LATIN_SMALL_A_WITH_RING_ABOVE              : std_logic_vector(7 downto 0) := x"E5"; -- Latin small letter a with ring above
  constant CHAR_LATIN_SMALL_AE                             : std_logic_vector(7 downto 0) := x"E6"; -- Latin small letter ae
  constant CHAR_LATIN_SMALL_C_WITH_CEDILLA                 : std_logic_vector(7 downto 0) := x"E7"; -- Latin small letter c with cedilla
  constant CHAR_LATIN_SMALL_E_WITH_GRAVE                   : std_logic_vector(7 downto 0) := x"E8"; -- Latin small letter e with grave
  constant CHAR_LATIN_SMALL_E_WITH_ACUTE                   : std_logic_vector(7 downto 0) := x"E9"; -- Latin small letter e with acute
  constant CHAR_LATIN_SMALL_E_WITH_CIRCUMFLEX              : std_logic_vector(7 downto 0) := x"EA"; -- Latin small letter e with circumflex
  constant CHAR_LATIN_SMALL_E_WITH_DIAERESIS               : std_logic_vector(7 downto 0) := x"EB"; -- Latin small letter e with diaeresis
  constant CHAR_LATIN_SMALL_I_WITH_GRAVE                   : std_logic_vector(7 downto 0) := x"EC"; -- Latin small letter i with grave
  constant CHAR_LATIN_SMALL_I_WITH_ACUTE                   : std_logic_vector(7 downto 0) := x"ED"; -- Latin small letter i with acute
  constant CHAR_LATIN_SMALL_I_WITH_CIRCUMFLEX              : std_logic_vector(7 downto 0) := x"EE"; -- Latin small letter i with circumflex
  constant CHAR_LATIN_SMALL_I_WITH_DIAERESIS               : std_logic_vector(7 downto 0) := x"EF"; -- Latin small letter i with diaeresis
  constant CHAR_LATIN_SMALL_ETH                            : std_logic_vector(7 downto 0) := x"F0"; -- Latin small letter eth
  constant CHAR_LATIN_SMALL_N_WITH_TILDE                   : std_logic_vector(7 downto 0) := x"F1"; -- Latin small letter n with tilde
  constant CHAR_LATIN_SMALL_O_WITH_GRAVE                   : std_logic_vector(7 downto 0) := x"F2"; -- Latin small letter o with grave
  constant CHAR_LATIN_SMALL_O_WITH_ACUTE                   : std_logic_vector(7 downto 0) := x"F3"; -- Latin small letter o with acute
  constant CHAR_LATIN_SMALL_O_WITH_CIRCUMFLEX              : std_logic_vector(7 downto 0) := x"F4"; -- Latin small letter o with circumflex
  constant CHAR_LATIN_SMALL_O_WITH_TILDE                   : std_logic_vector(7 downto 0) := x"F5"; -- Latin small letter o with tilde
  constant CHAR_LATIN_SMALL_O_WITH_DIAERESIS               : std_logic_vector(7 downto 0) := x"F6"; -- Latin small letter o with diaeresis
  constant CHAR_DIVISION_SIGN                              : std_logic_vector(7 downto 0) := x"F7"; -- Division sign
  constant CHAR_LATIN_SMALL_O_WITH_SLASH                   : std_logic_vector(7 downto 0) := x"F8"; -- Latin small letter o with slash
  constant CHAR_LATIN_SMALL_U_WITH_GRAVE                   : std_logic_vector(7 downto 0) := x"F9"; -- Latin small letter u with grave
  constant CHAR_LATIN_SMALL_U_WITH_ACUTE                   : std_logic_vector(7 downto 0) := x"FA"; -- Latin small letter u with acute
  constant CHAR_LATIN_SMALL_U_WITH_CIRCUMFLEX              : std_logic_vector(7 downto 0) := x"FB"; -- Latin small letter u with circumflex
  constant CHAR_LATIN_SMALL_U_WITH_DIAERESIS               : std_logic_vector(7 downto 0) := x"FC"; -- Latin small letter u with diaeresis
  constant CHAR_LATIN_SMALL_Y_WITH_ACUTE                   : std_logic_vector(7 downto 0) := x"FD"; -- Latin small letter y with acute
  constant CHAR_LATIN_SMALL_THORN                          : std_logic_vector(7 downto 0) := x"FE"; -- Latin small letter thorn
  constant CHAR_LATIN_SMALL_Y_WITH_DIAERESIS               : std_logic_vector(7 downto 0) := x"FF"; -- Latin small letter y with diaeresis

end RS232_Package;

package body RS232_Package is

  ----------------------------------------------------------------------------------------------------
  -- Functions and Procedures                                                                       --
  ----------------------------------------------------------------------------------------------------
  -- None.

end RS232_Package;
