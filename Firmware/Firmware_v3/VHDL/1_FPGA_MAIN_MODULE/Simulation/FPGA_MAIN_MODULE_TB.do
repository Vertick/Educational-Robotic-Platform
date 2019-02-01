##--------------------------------------------------------------------------------------------------
## Block name: FPGA_MAIN_MODULE                                                                   --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: RS232_Package; FPGA_MAIN_MODULE_Package; FPGA_MAIN_MODULE_TB; FPGA_MAIN_MODULE;  --
## MAIN_PROCESSOR; UART_BLUETOOTH; UART_ARDUINO;DISCRETE_COMM_ARDUINO; UART_RX_MACHINE;           --
## UART_TX_MACHINE.                                                                               --
##--------------------------------------------------------------------------------------------------
## Initial version 2 - 30/07/2018                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../../0_Packages/RS232_Package.vhd
vcom ../../../0_Packages/FPGA_MAIN_MODULE_Package.vhd
vcom ../../../7_UART_TX_MACHINE/Source/UART_TX_MACHINE.vhd
vcom ../../../6_UART_RX_MACHINE/Source/UART_RX_MACHINE.vhd
vcom ../../../5_DISCRETE_COMM_ARDUINO/Source/DISCRETE_COMM_ARDUINO.vhd
vcom ../../../4_UART_ARDUINO/Source/UART_ARDUINO.vhd
vcom ../../../3_UART_BLUETOOTH/Source/UART_BLUETOOTH.vhd
vcom ../../../2_MAIN_PROCESSOR/Source/MAIN_PROCESSOR.vhd
vcom ../../Source/FPGA_MAIN_MODULE.vhd
vcom ../../Simulation/FPGA_MAIN_MODULE_TB.vhd

# Simulate
vsim work.FPGA_MAIN_MODULE_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/fpga_main_module_tb/SYSTEM_TIME \
sim:/fpga_main_module_tb/END_OF_SIMULATION \
sim:/fpga_main_module_tb/TEST_ID \
sim:/fpga_main_module_tb/UART_BT_CLK \
sim:/fpga_main_module_tb/UART_AR1_CLK \
sim:/fpga_main_module_tb/UART_AR2_CLK \
sim:/fpga_main_module_tb/UART_AR3_CLK \
sim:/fpga_main_module_tb/UART_AR4_CLK \
sim:/fpga_main_module_tb/TEST_FRAME \
sim:/fpga_main_module_tb/UART_BT_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_AR1_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_AR2_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_AR3_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_AR4_RECEIVED_FRAME \
sim:/fpga_main_module_tb/ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_BT_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_AR1_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_AR2_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_AR3_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_AR4_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_BT_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_AR1_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_AR2_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_AR3_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_AR4_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_BT_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_AR1_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_AR2_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_AR3_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_AR4_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_BT_RECEIVED_STR \
sim:/fpga_main_module_tb/UART_AR1_RECEIVED_STR \
sim:/fpga_main_module_tb/UART_AR2_RECEIVED_STR \
sim:/fpga_main_module_tb/UART_AR3_RECEIVED_STR \
sim:/fpga_main_module_tb/UART_AR4_RECEIVED_STR

# UUT signals
add wave -divider "UUT signals"
add wave  \
sim:/fpga_main_module_tb/CLK_50MHZ \
sim:/fpga_main_module_tb/nRESET \
sim:/fpga_main_module_tb/LED_2 \
sim:/fpga_main_module_tb/LED_4 \
sim:/fpga_main_module_tb/LED_5 \
sim:/fpga_main_module_tb/UART_BT_RX \
sim:/fpga_main_module_tb/UART_BT_TX \
sim:/fpga_main_module_tb/UART_AR1_RX \
sim:/fpga_main_module_tb/UART_AR1_TX \
sim:/fpga_main_module_tb/UART_AR2_RX \
sim:/fpga_main_module_tb/UART_AR2_TX \
sim:/fpga_main_module_tb/UART_AR3_RX \
sim:/fpga_main_module_tb/UART_AR3_TX \
sim:/fpga_main_module_tb/UART_AR4_RX \
sim:/fpga_main_module_tb/UART_AR4_TX \
sim:/fpga_main_module_tb/DISC_IN_1_AR1_D2 \
sim:/fpga_main_module_tb/DISC_IN_2_AR1_D4 \
sim:/fpga_main_module_tb/DISC_IN_3_AR1_D7 \
sim:/fpga_main_module_tb/DISC_OUT_1_AR1_D8 \
sim:/fpga_main_module_tb/DISC_OUT_2_AR1_D12 \
sim:/fpga_main_module_tb/DISC_OUT_3_AR1_D13 \
sim:/fpga_main_module_tb/DISC_IN_1_AR2_D2 \
sim:/fpga_main_module_tb/DISC_IN_2_AR2_D4 \
sim:/fpga_main_module_tb/DISC_IN_3_AR2_D7 \
sim:/fpga_main_module_tb/DISC_OUT_1_AR2_D8 \
sim:/fpga_main_module_tb/DISC_OUT_2_AR2_D12 \
sim:/fpga_main_module_tb/DISC_OUT_3_AR2_D13 \
sim:/fpga_main_module_tb/DISC_IN_1_AR3_D2 \
sim:/fpga_main_module_tb/DISC_IN_2_AR3_D4 \
sim:/fpga_main_module_tb/DISC_IN_3_AR3_D7 \
sim:/fpga_main_module_tb/DISC_OUT_1_AR3_D8 \
sim:/fpga_main_module_tb/DISC_OUT_2_AR3_D12 \
sim:/fpga_main_module_tb/DISC_OUT_3_AR3_D13 \
sim:/fpga_main_module_tb/DISC_IN_1_AR4_D2 \
sim:/fpga_main_module_tb/DISC_IN_2_AR4_D4 \
sim:/fpga_main_module_tb/DISC_IN_3_AR4_D7 \
sim:/fpga_main_module_tb/DISC_OUT_1_AR4_D8 \
sim:/fpga_main_module_tb/DISC_OUT_2_AR4_D12 \
sim:/fpga_main_module_tb/DISC_OUT_3_AR4_D13 \
sim:/fpga_main_module_tb/USER_IO_8 \
sim:/fpga_main_module_tb/USER_IO_21 \
sim:/fpga_main_module_tb/USER_IO_22 \
sim:/fpga_main_module_tb/USER_IO_26 \
sim:/fpga_main_module_tb/USER_IO_27 \
sim:/fpga_main_module_tb/USER_IO_30 \
sim:/fpga_main_module_tb/USER_IO_44 \
sim:/fpga_main_module_tb/USER_IO_47 \
sim:/fpga_main_module_tb/USER_IO_48 \
sim:/fpga_main_module_tb/USER_IO_53 \
sim:/fpga_main_module_tb/USER_IO_55 \
sim:/fpga_main_module_tb/USER_IO_57 \
sim:/fpga_main_module_tb/USER_IO_63 \
sim:/fpga_main_module_tb/USER_IO_64 \
sim:/fpga_main_module_tb/USER_IO_65 \
sim:/fpga_main_module_tb/USER_IO_67 \
sim:/fpga_main_module_tb/USER_IO_69 \
sim:/fpga_main_module_tb/USER_IO_70 \
sim:/fpga_main_module_tb/USER_IO_71 \
sim:/fpga_main_module_tb/USER_IO_72 \
sim:/fpga_main_module_tb/USER_IO_79 \
sim:/fpga_main_module_tb/USER_IO_80 \
sim:/fpga_main_module_tb/USER_IO_81 \
sim:/fpga_main_module_tb/USER_IO_86 \
sim:/fpga_main_module_tb/USER_IO_89 \
sim:/fpga_main_module_tb/USER_IO_90 \
sim:/fpga_main_module_tb/USER_IO_91 \
sim:/fpga_main_module_tb/USER_IO_96 \
sim:/fpga_main_module_tb/USER_IO_97 \
sim:/fpga_main_module_tb/USER_IO_99 \
sim:/fpga_main_module_tb/USER_IO_100 \
sim:/fpga_main_module_tb/USER_IO_101 \
sim:/fpga_main_module_tb/USER_IO_112 \
sim:/fpga_main_module_tb/USER_IO_118 \
sim:/fpga_main_module_tb/USER_IO_120 \
sim:/fpga_main_module_tb/USER_IO_121 \
sim:/fpga_main_module_tb/USER_IO_126 \
sim:/fpga_main_module_tb/USER_IO_129 \
sim:/fpga_main_module_tb/USER_IO_132 \
sim:/fpga_main_module_tb/USER_IO_136 \
sim:/fpga_main_module_tb/USER_IO_137 \
sim:/fpga_main_module_tb/USER_IO_139 \
sim:/fpga_main_module_tb/USER_IO_141 \

# Internal signals
add wave -divider "Internal signals"
add wave -position insertpoint  \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/CLK_50MHZ \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/nRESET \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/LED_2 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/LED_4 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/LED_5 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR1_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR1_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR2_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR2_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR3_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR3_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR4_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR4_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_1_AR1_D2 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_2_AR1_D4 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_3_AR1_D7 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_1_AR1_D8 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_2_AR1_D12 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_3_AR1_D13 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_1_AR2_D2 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_2_AR2_D4 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_3_AR2_D7 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_1_AR2_D8 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_2_AR2_D12 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_3_AR2_D13 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_1_AR3_D2 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_2_AR3_D4 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_3_AR3_D7 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_1_AR3_D8 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_2_AR3_D12 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_3_AR3_D13 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_1_AR4_D2 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_2_AR4_D4 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_3_AR4_D7 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_1_AR4_D8 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_2_AR4_D12 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_3_AR4_D13 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_8 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_21 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_22 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_26 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_27 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_30 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_44 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_47 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_48 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_53 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_55 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_57 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_63 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_64 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_65 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_67 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_69 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_70 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_71 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_72 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_79 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_80 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_81 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_86 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_89 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_90 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_91 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_96 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_97 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_99 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_100 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_101 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_112 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_118 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_120 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_121 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_126 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_129 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_132 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_136 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_137 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_139 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_141 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/BRD_STATUS_LED_COUNT \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/BRD_STATUS_LED_WORD \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_IN_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_IN_RECEIVED \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_OUT_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_OUT_SEND \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR_IN_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR_IN_RECEIVED \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR_OUT_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR_OUT_SEND \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/s_DISC_IN_AR_EDGE \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/s_DISC_OUT_AR_LEVEL

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /fpga_main_module_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /fpga_main_module_tb/END_OF_SIMULATION]
  run 1ms
}