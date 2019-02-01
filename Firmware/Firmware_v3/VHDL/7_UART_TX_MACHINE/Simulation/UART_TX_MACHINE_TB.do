##--------------------------------------------------------------------------------------------------
## Block name: UART_TX_MACHINE                                                                    --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: UART_TX_MACHINE_TB; UART_TX_MACHINE; RS232_Package.                              --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 24/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../../0_Packages/RS232_Package.vhd
vcom ../../Source/UART_TX_MACHINE.vhd
vcom ../../Simulation/UART_TX_MACHINE_TB.vhd

# Simulate
vsim work.UART_TX_MACHINE_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/uart_tx_machine_tb/SYSTEM_TIME \
sim:/uart_tx_machine_tb/END_OF_SIMULATION \
sim:/uart_tx_machine_tb/DATA_RCV \
sim:/uart_tx_machine_tb/ERROR_DETECTED \

# UUT signals
add wave -divider "UUT signals"
add wave -position insertpoint  \
sim:/uart_tx_machine_tb/CLK_50MHZ \
sim:/uart_tx_machine_tb/nRESET \
sim:/uart_tx_machine_tb/UART_OUT_FRAME \
sim:/uart_tx_machine_tb/UART_OUT_SEND \
sim:/uart_tx_machine_tb/UART_TX \

# Internal signals
add wave -divider "Internal signals"
add wave -position insertpoint  \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/CLK_50MHZ \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/nRESET \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/UART_OUT_FRAME \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/UART_OUT_SEND \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/UART_TX \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/BAUD_RATE_COUNT \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/UART_FRAME_COUNT \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/FRAME2SEND \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/UART_TX_ACTIVE \
sim:/uart_tx_machine_tb/UUT_UART_TX_MACHINE/DATA_TRANSMITTED

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /uart_tx_machine_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /uart_tx_machine_tb/END_OF_SIMULATION]
  run 1ms
}