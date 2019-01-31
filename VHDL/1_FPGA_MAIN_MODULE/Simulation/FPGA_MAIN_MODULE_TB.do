##--------------------------------------------------------------------------------------------------
## Block name: FPGA_MAIN_MODULE                                                                   --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: RS232_Package; FPGA_MAIN_MODULE_Package; FPGA_MAIN_MODULE_TB; FPGA_MAIN_MODULE;  --
## MAIN_PROCESSOR; UART_BLUETOOTH; UART_SHIELD; DISCRETE_COMM_SHIELD; UART_ARDUINO;               --
## PWM_MONITORING_ARDUINO; DISCRETE_COMM_ARDUINO; UART_RX_MACHINE; UART_TX_MACHINE.               --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 24/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../../0_Packages/RS232_Package.vhd
vcom ../../../0_Packages/FPGA_MAIN_MODULE_Package.vhd
vcom ../../../10_UART_TX_MACHINE/Source/UART_TX_MACHINE.vhd
vcom ../../../9_UART_RX_MACHINE/Source/UART_RX_MACHINE.vhd
vcom ../../../8_DISCRETE_COMM_ARDUINO/Source/DISCRETE_COMM_ARDUINO.vhd
vcom ../../../7_PWM_MONITORING_ARDUINO/Source/PWM_MONITORING_ARDUINO.vhd
vcom ../../../6_UART_ARDUINO/Source/UART_ARDUINO.vhd
vcom ../../../5_DISCRETE_COMM_SHIELD/Source/DISCRETE_COMM_SHIELD.vhd
vcom ../../../4_UART_SHIELD/Source/UART_SHIELD.vhd
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
sim:/fpga_main_module_tb/UART_SH_CLK \
sim:/fpga_main_module_tb/UART_AR1_CLK \
sim:/fpga_main_module_tb/UART_AR2_CLK \
sim:/fpga_main_module_tb/UART_AR3_CLK \
sim:/fpga_main_module_tb/UART_AR4_CLK \
sim:/fpga_main_module_tb/TEST_FRAME \
sim:/fpga_main_module_tb/UART_BT_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_SH_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_AR1_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_AR2_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_AR3_RECEIVED_FRAME \
sim:/fpga_main_module_tb/UART_AR4_RECEIVED_FRAME \
sim:/fpga_main_module_tb/ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_BT_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_SH_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_AR1_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_AR2_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_AR3_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_AR4_ERROR_DETECTED \
sim:/fpga_main_module_tb/UART_BT_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_SH_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_AR1_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_AR2_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_AR3_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_AR4_MESSAGE_INDEX \
sim:/fpga_main_module_tb/UART_BT_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_SH_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_AR1_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_AR2_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_AR3_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_AR4_RECEIVED_MSG \
sim:/fpga_main_module_tb/UART_BT_RECEIVED_STR \
sim:/fpga_main_module_tb/UART_SH_RECEIVED_STR \
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
sim:/fpga_main_module_tb/UART_SH_RX \
sim:/fpga_main_module_tb/UART_SH_TX \
sim:/fpga_main_module_tb/DISC_IN_1_SH_D2 \
sim:/fpga_main_module_tb/PWM_1_SH_D3 \
sim:/fpga_main_module_tb/DISC_IN_2_SH_D4 \
sim:/fpga_main_module_tb/PWM_2_SH_D5 \
sim:/fpga_main_module_tb/PWM_3_SH_D6 \
sim:/fpga_main_module_tb/DISC_IN_3_SH_D7 \
sim:/fpga_main_module_tb/DISC_OUT_1_SH_D8 \
sim:/fpga_main_module_tb/PWM_4_SH_D9 \
sim:/fpga_main_module_tb/PWM_5_SH_D10 \
sim:/fpga_main_module_tb/PWM_6_SH_D11 \
sim:/fpga_main_module_tb/DISC_OUT_2_SH_D12 \
sim:/fpga_main_module_tb/DISC_OUT_3_SH_D13 \
sim:/fpga_main_module_tb/UART_AR1_RX \
sim:/fpga_main_module_tb/UART_AR1_TX \
sim:/fpga_main_module_tb/UART_AR2_RX \
sim:/fpga_main_module_tb/UART_AR2_TX \
sim:/fpga_main_module_tb/UART_AR3_RX \
sim:/fpga_main_module_tb/UART_AR3_TX \
sim:/fpga_main_module_tb/UART_AR4_RX \
sim:/fpga_main_module_tb/UART_AR4_TX \
sim:/fpga_main_module_tb/PWM_1_AR1_D3 \
sim:/fpga_main_module_tb/PWM_2_AR1_D5 \
sim:/fpga_main_module_tb/PWM_3_AR1_D6 \
sim:/fpga_main_module_tb/PWM_4_AR1_D9 \
sim:/fpga_main_module_tb/PWM_5_AR1_D10 \
sim:/fpga_main_module_tb/PWM_6_AR1_D11 \
sim:/fpga_main_module_tb/PWM_1_AR2_D3 \
sim:/fpga_main_module_tb/PWM_2_AR2_D5 \
sim:/fpga_main_module_tb/PWM_3_AR2_D6 \
sim:/fpga_main_module_tb/PWM_4_AR2_D9 \
sim:/fpga_main_module_tb/PWM_5_AR2_D10 \
sim:/fpga_main_module_tb/PWM_6_AR2_D11 \
sim:/fpga_main_module_tb/PWM_1_AR3_D3 \
sim:/fpga_main_module_tb/PWM_2_AR3_D5 \
sim:/fpga_main_module_tb/PWM_3_AR3_D6 \
sim:/fpga_main_module_tb/PWM_4_AR3_D9 \
sim:/fpga_main_module_tb/PWM_5_AR3_D10 \
sim:/fpga_main_module_tb/PWM_6_AR3_D11 \
sim:/fpga_main_module_tb/PWM_1_AR4_D3 \
sim:/fpga_main_module_tb/PWM_2_AR4_D5 \
sim:/fpga_main_module_tb/PWM_3_AR4_D6 \
sim:/fpga_main_module_tb/PWM_4_AR4_D9 \
sim:/fpga_main_module_tb/PWM_5_AR4_D10 \
sim:/fpga_main_module_tb/PWM_6_AR4_D11 \
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
sim:/fpga_main_module_tb/USER_IO_31 \
sim:/fpga_main_module_tb/USER_IO_40 \
sim:/fpga_main_module_tb/USER_IO_88 \
sim:/fpga_main_module_tb/USER_IO_94 \
sim:/fpga_main_module_tb/USER_IO_112 \
sim:/fpga_main_module_tb/USER_IO_135 \
sim:/fpga_main_module_tb/USER_IO_137 \
sim:/fpga_main_module_tb/USER_IO_139 \
sim:/fpga_main_module_tb/USER_IO_141

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
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_SH_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_SH_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_1_SH_D2 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_1_SH_D3 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_2_SH_D4 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_2_SH_D5 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_3_SH_D6 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_3_SH_D7 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_1_SH_D8 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_4_SH_D9 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_5_SH_D10 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_6_SH_D11 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_2_SH_D12 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_3_SH_D13 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR1_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR1_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR2_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR2_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR3_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR3_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR4_RX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR4_TX \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_1_AR1_D3 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_2_AR1_D5 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_3_AR1_D6 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_4_AR1_D9 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_5_AR1_D10 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_6_AR1_D11 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_1_AR2_D3 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_2_AR2_D5 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_3_AR2_D6 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_4_AR2_D9 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_5_AR2_D10 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_6_AR2_D11 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_1_AR3_D3 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_2_AR3_D5 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_3_AR3_D6 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_4_AR3_D9 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_5_AR3_D10 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_6_AR3_D11 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_1_AR4_D3 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_2_AR4_D5 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_3_AR4_D6 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_4_AR4_D9 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_5_AR4_D10 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_6_AR4_D11 \
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
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_31 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_40 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_88 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_94 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_112 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_135 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_137 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_139 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/USER_IO_141 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/BRD_STATUS_LED_COUNT \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/BRD_STATUS_LED_WORD \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_IN_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_IN_RECEIVED \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_OUT_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_BT_OUT_SEND \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_SH_IN_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_SH_IN_RECEIVED \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_SH_OUT_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_SH_OUT_SEND \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR_IN_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR_IN_RECEIVED \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR_OUT_FRAME \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/UART_AR_OUT_SEND \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_IN_SH_EDGE \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/DISC_OUT_SH_LEVEL \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_HI \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_LO \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_HI_1 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_LO_1 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_HI_2 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_LO_2 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_HI_3 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_LO_3 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_HI_4 \
sim:/fpga_main_module_tb/UUT_FPGA_MAIN_MODULE/PWM_AR_PULSE_LO_4 \
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