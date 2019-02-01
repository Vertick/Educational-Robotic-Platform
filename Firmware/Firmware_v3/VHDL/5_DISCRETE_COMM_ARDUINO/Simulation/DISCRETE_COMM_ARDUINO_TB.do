##--------------------------------------------------------------------------------------------------
## Block name: DISCRETE_COMM_ARDUINO                                                              --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: DISCRETE_COMM_ARDUINO_TB; DISCRETE_COMM_ARDUINO.                                 --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 24/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../Source/DISCRETE_COMM_ARDUINO.vhd
vcom ../../Simulation/DISCRETE_COMM_ARDUINO_TB.vhd

# Simulate
vsim work.DISCRETE_COMM_ARDUINO_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/discrete_comm_arduino_tb/SYSTEM_TIME \
sim:/discrete_comm_arduino_tb/END_OF_SIMULATION \
sim:/discrete_comm_arduino_tb/ERROR_DETECTED

# UUT signals
add wave -divider "UUT signals"
add wave  \
sim:/discrete_comm_arduino_tb/CLK_50MHZ \
sim:/discrete_comm_arduino_tb/nRESET \
sim:/discrete_comm_arduino_tb/DISC_IN_1_AR_D2 \
sim:/discrete_comm_arduino_tb/DISC_IN_2_AR_D4 \
sim:/discrete_comm_arduino_tb/DISC_IN_3_AR_D7 \
sim:/discrete_comm_arduino_tb/DISC_OUT_1_AR_D8 \
sim:/discrete_comm_arduino_tb/DISC_OUT_2_AR_D12 \
sim:/discrete_comm_arduino_tb/DISC_OUT_3_AR_D13 \
sim:/discrete_comm_arduino_tb/DISC_OUT_AR_LEVEL \
sim:/discrete_comm_arduino_tb/DISC_IN_AR_EDGE \

# Internal signals
add wave -divider "Internal signals"
add wave  \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/CLK_50MHZ \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/nRESET \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_IN_1_AR_D2 \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_IN_2_AR_D4 \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_IN_3_AR_D7 \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_OUT_1_AR_D8 \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_OUT_2_AR_D12 \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_OUT_3_AR_D13 \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_OUT_AR_LEVEL \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_IN_AR_EDGE \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_IN_1_AR_D2_FF \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_IN_2_AR_D4_FF \
sim:/discrete_comm_arduino_tb/UUT_DISCRETE_COMM_ARDUINO/DISC_IN_3_AR_D7_FF

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /discrete_comm_arduino_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /discrete_comm_arduino_tb/END_OF_SIMULATION]
  run 1ms
}