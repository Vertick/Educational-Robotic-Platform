##--------------------------------------------------------------------------------------------------
## Block name: UART_SHIELD                                                                        --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: UART_SHIELD_TB; UART_SHIELD; UART_RX_MACHINE; UART_TX_MACHINE; RS232_Package     --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 24/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../../0_Packages/RS232_Package.vhd
vcom ../../../9_UART_RX_MACHINE/Source/UART_RX_MACHINE.vhd
vcom ../../../10_UART_TX_MACHINE/Source/UART_TX_MACHINE.vhd
vcom ../../Source/UART_SHIELD.vhd
vcom ../../Simulation/UART_SHIELD_TB.vhd

# Simulate
vsim work.UART_SHIELD_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/uart_shield_tb/SYSTEM_TIME \
sim:/uart_shield_tb/END_OF_SIMULATION \
sim:/uart_shield_tb/TEST_FRAME \
sim:/uart_shield_tb/ERROR_DETECTED

# UUT signals
add wave -divider "UUT signals"
add wave  \
sim:/uart_shield_tb/CLK_50MHZ \
sim:/uart_shield_tb/nRESET \
sim:/uart_shield_tb/UART_SH_RX \
sim:/uart_shield_tb/UART_SH_TX \
sim:/uart_shield_tb/UART_SH_IN_FRAME \
sim:/uart_shield_tb/UART_SH_IN_RECEIVED \
sim:/uart_shield_tb/UART_SH_OUT_FRAME \
sim:/uart_shield_tb/UART_SH_OUT_SEND \

# Internal signals
add wave -divider "Internal signals"
add wave  \
sim:/uart_shield_tb/UUT_UART_SHIELD/CLK_50MHZ \
sim:/uart_shield_tb/UUT_UART_SHIELD/nRESET \
sim:/uart_shield_tb/UUT_UART_SHIELD/UART_SH_RX \
sim:/uart_shield_tb/UUT_UART_SHIELD/UART_SH_TX \
sim:/uart_shield_tb/UUT_UART_SHIELD/UART_SH_IN_FRAME \
sim:/uart_shield_tb/UUT_UART_SHIELD/UART_SH_IN_RECEIVED \
sim:/uart_shield_tb/UUT_UART_SHIELD/UART_SH_OUT_FRAME \
sim:/uart_shield_tb/UUT_UART_SHIELD/UART_SH_OUT_SEND

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /uart_shield_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /uart_shield_tb/END_OF_SIMULATION]
  run 1ms
}