##--------------------------------------------------------------------------------------------------
## Block name: MAIN_PROCESSOR                                                                     --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: MAIN_PROCESSOR_TB; MAIN_PROCESSOR; FPGA_MAIN_MODULE_Package; RS232_Package.      --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 25/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../../0_Packages/RS232_Package.vhd
vcom ../../../0_Packages/FPGA_MAIN_MODULE_Package.vhd
vcom ../../Source/MAIN_PROCESSOR.vhd
vcom ../../Simulation/MAIN_PROCESSOR_TB.vhd

# Simulate
vsim work.MAIN_PROCESSOR_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/main_processor_tb/SYSTEM_TIME \
sim:/main_processor_tb/END_OF_SIMULATION \
sim:/main_processor_tb/TEST_FRAME \
sim:/main_processor_tb/ERROR_DETECTED \
sim:/main_processor_tb/UART_BT_MESSAGE_INDEX \
sim:/main_processor_tb/UART_SH_MESSAGE_INDEX \
sim:/main_processor_tb/UART_AR1_MESSAGE_INDEX \
sim:/main_processor_tb/UART_AR2_MESSAGE_INDEX \
sim:/main_processor_tb/UART_AR3_MESSAGE_INDEX \
sim:/main_processor_tb/UART_AR4_MESSAGE_INDEX \
sim:/main_processor_tb/UART_BT_RECEIVED_MSG \
sim:/main_processor_tb/UART_SH_RECEIVED_MSG \
sim:/main_processor_tb/UART_AR1_RECEIVED_MSG \
sim:/main_processor_tb/UART_AR2_RECEIVED_MSG \
sim:/main_processor_tb/UART_AR3_RECEIVED_MSG \
sim:/main_processor_tb/UART_AR4_RECEIVED_MSG \
sim:/main_processor_tb/UART_BT_RECEIVED_STR \
sim:/main_processor_tb/UART_SH_RECEIVED_STR \
sim:/main_processor_tb/UART_AR1_RECEIVED_STR \
sim:/main_processor_tb/UART_AR2_RECEIVED_STR \
sim:/main_processor_tb/UART_AR3_RECEIVED_STR \
sim:/main_processor_tb/UART_AR4_RECEIVED_STR

# UUT signals
add wave -divider "UUT signals"
add wave  \
sim:/main_processor_tb/CLK_50MHZ \
sim:/main_processor_tb/nRESET \
sim:/main_processor_tb/UART_BT_IN_FRAME \
sim:/main_processor_tb/UART_BT_IN_RECEIVED \
sim:/main_processor_tb/UART_BT_OUT_FRAME \
sim:/main_processor_tb/UART_BT_OUT_SEND \
sim:/main_processor_tb/UART_SH_IN_FRAME \
sim:/main_processor_tb/UART_SH_IN_RECEIVED \
sim:/main_processor_tb/UART_SH_OUT_FRAME \
sim:/main_processor_tb/UART_SH_OUT_SEND \
sim:/main_processor_tb/UART_AR_IN_FRAME \
sim:/main_processor_tb/UART_AR_IN_RECEIVED \
sim:/main_processor_tb/UART_AR_OUT_FRAME \
sim:/main_processor_tb/UART_AR_OUT_SEND \
sim:/main_processor_tb/DISC_IN_SH_EDGE \
sim:/main_processor_tb/DISC_OUT_SH_LEVEL \
sim:/main_processor_tb/PWM_AR_PULSE_HI \
sim:/main_processor_tb/PWM_AR_PULSE_LO \
sim:/main_processor_tb/DISC_IN_AR_EDGE \
sim:/main_processor_tb/DISC_OUT_AR_LEVEL

# Internal signals
add wave -divider "Internal signals"
add wave -position insertpoint  \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/CLK_50MHZ \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/nRESET \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_BT_IN_FRAME \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_BT_IN_RECEIVED \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_BT_OUT_FRAME \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_BT_OUT_SEND \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_SH_IN_FRAME \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_SH_IN_RECEIVED \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_SH_OUT_FRAME \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_SH_OUT_SEND \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_AR_IN_FRAME \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_AR_IN_RECEIVED \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_AR_OUT_FRAME \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_AR_OUT_SEND \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/DISC_IN_SH_EDGE \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/DISC_OUT_SH_LEVEL \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/PWM_AR_PULSE_HI \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/PWM_AR_PULSE_LO \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/DISC_IN_AR_EDGE \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/DISC_OUT_AR_LEVEL \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/BT_TRANSFER_TIMER \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_BT_STATE \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/BT_DATA_COUNTER \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_BT_MSG2SEND \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/BT_TX_ACTIVE \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/BT_CHAR_2_SEND \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/SHIELD_STATUS_CHAR \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/ARDUINO_STATUS_CHAR \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/SHIELD_STATUS_UPDATED \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/ARDUINO_STATUS_UPDATED \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/TRANSFER_TIMER \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_STATE \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/DATA_COUNTER \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/UART_MSG2SEND \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/TX_ACTIVE \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/CHAR_2_SEND \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/s_DISC_OUT_SH_LEVEL \
sim:/main_processor_tb/UUT_MAIN_PROCESSOR/s_DISC_OUT_AR_LEVEL

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /main_processor_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /main_processor_tb/END_OF_SIMULATION]
  run 1ms
}