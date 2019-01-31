##--------------------------------------------------------------------------------------------------
## Block name: UART_BLUETOOTH                                                                     --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: UART_BLUETOOTH_TB; UART_BLUETOOTH; UART_RX_MACHINE; UART_TX_MACHINE;             --
##               RS232_Package                                                                    --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 24/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../../0_Packages/RS232_Package.vhd
vcom ../../../9_UART_RX_MACHINE/Source/UART_RX_MACHINE.vhd
vcom ../../../10_UART_TX_MACHINE/Source/UART_TX_MACHINE.vhd
vcom ../../Source/UART_BLUETOOTH.vhd
vcom ../../Simulation/UART_BLUETOOTH_TB.vhd

# Simulate
vsim work.UART_BLUETOOTH_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/uart_bluetooth_tb/SYSTEM_TIME \
sim:/uart_bluetooth_tb/END_OF_SIMULATION \
sim:/uart_bluetooth_tb/TEST_FRAME \
sim:/uart_bluetooth_tb/ERROR_DETECTED

# UUT signals
add wave -divider "UUT signals"
add wave  \
sim:/uart_bluetooth_tb/CLK_50MHZ \
sim:/uart_bluetooth_tb/nRESET \
sim:/uart_bluetooth_tb/UART_BT_RX \
sim:/uart_bluetooth_tb/UART_BT_TX \
sim:/uart_bluetooth_tb/UART_BT_IN_FRAME \
sim:/uart_bluetooth_tb/UART_BT_IN_RECEIVED \
sim:/uart_bluetooth_tb/UART_BT_OUT_FRAME \
sim:/uart_bluetooth_tb/UART_BT_OUT_SEND

# Internal signals
add wave -divider "Internal signals"
add wave -position insertpoint  \
sim:/uart_bluetooth_tb/UUT_UART_BLUETOOTH/CLK_50MHZ \
sim:/uart_bluetooth_tb/UUT_UART_BLUETOOTH/nRESET \
sim:/uart_bluetooth_tb/UUT_UART_BLUETOOTH/UART_BT_RX \
sim:/uart_bluetooth_tb/UUT_UART_BLUETOOTH/UART_BT_TX \
sim:/uart_bluetooth_tb/UUT_UART_BLUETOOTH/UART_BT_IN_FRAME \
sim:/uart_bluetooth_tb/UUT_UART_BLUETOOTH/UART_BT_IN_RECEIVED \
sim:/uart_bluetooth_tb/UUT_UART_BLUETOOTH/UART_BT_OUT_FRAME \
sim:/uart_bluetooth_tb/UUT_UART_BLUETOOTH/UART_BT_OUT_SEND

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /uart_bluetooth_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /uart_bluetooth_tb/END_OF_SIMULATION]
  run 1ms
}