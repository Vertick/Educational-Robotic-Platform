##--------------------------------------------------------------------------------------------------
## Block name: UART_RX_MACHINE                                                                    --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: UART_RX_MACHINE_TB; UART_RX_MACHINE; RS232_Package.                              --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 24/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../../0_Packages/RS232_Package.vhd
vcom ../../Source/UART_RX_MACHINE.vhd
vcom ../../Simulation/UART_RX_MACHINE_TB.vhd

# Simulate
vsim work.UART_RX_MACHINE_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/uart_rx_machine_tb/SYSTEM_TIME \
sim:/uart_rx_machine_tb/END_OF_SIMULATION \
sim:/uart_rx_machine_tb/DATA_SNT \
sim:/uart_rx_machine_tb/ERROR_DETECTED

# UUT signals
add wave -divider "UUT signals"
add wave  \
sim:/uart_rx_machine_tb/CLK_50MHZ \
sim:/uart_rx_machine_tb/nRESET \
sim:/uart_rx_machine_tb/UART_RX \
sim:/uart_rx_machine_tb/UART_IN_FRAME \
sim:/uart_rx_machine_tb/UART_IN_RECEIVED

# Internal signals
add wave -divider "Internal signals"
add wave  \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/CLK_50MHZ \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/nRESET \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/UART_RX \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/UART_IN_FRAME \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/UART_IN_RECEIVED \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/BAUD_RATE_COUNT \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/UART_FRAME_COUNT \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/UART_RX_FF \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/UART_RX_FALL_EDGE \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/UART_RX_ACTIVE \
sim:/uart_rx_machine_tb/UUT_UART_RX_MACHINE/DATA_RECEIVED

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /uart_rx_machine_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /uart_rx_machine_tb/END_OF_SIMULATION]
  run 1ms
}