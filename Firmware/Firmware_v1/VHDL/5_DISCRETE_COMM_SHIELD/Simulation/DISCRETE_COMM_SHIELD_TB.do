##--------------------------------------------------------------------------------------------------
## Block name: DISCRETE_COMM_SHIELD                                                               --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: DISCRETE_COMM_SHIELD_TB; DISCRETE_COMM_SHIELD.                                   --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 24/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../Source/DISCRETE_COMM_SHIELD.vhd
vcom ../../Simulation/DISCRETE_COMM_SHIELD_TB.vhd

# Simulate
vsim work.DISCRETE_COMM_SHIELD_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/discrete_comm_shield_tb/SYSTEM_TIME \
sim:/discrete_comm_shield_tb/END_OF_SIMULATION \
sim:/discrete_comm_shield_tb/ERROR_DETECTED

# UUT signals
add wave -divider "UUT signals"
add wave  \
sim:/discrete_comm_shield_tb/CLK_50MHZ \
sim:/discrete_comm_shield_tb/nRESET \
sim:/discrete_comm_shield_tb/DISC_IN_1_SH_D2 \
sim:/discrete_comm_shield_tb/DISC_IN_2_SH_D4 \
sim:/discrete_comm_shield_tb/DISC_IN_3_SH_D7 \
sim:/discrete_comm_shield_tb/PWM_1_SH_D3 \
sim:/discrete_comm_shield_tb/PWM_2_SH_D5 \
sim:/discrete_comm_shield_tb/PWM_3_SH_D6 \
sim:/discrete_comm_shield_tb/DISC_OUT_1_SH_D8 \
sim:/discrete_comm_shield_tb/DISC_OUT_2_SH_D12 \
sim:/discrete_comm_shield_tb/DISC_OUT_3_SH_D13 \
sim:/discrete_comm_shield_tb/PWM_4_SH_D9 \
sim:/discrete_comm_shield_tb/PWM_5_SH_D10 \
sim:/discrete_comm_shield_tb/PWM_6_SH_D11 \
sim:/discrete_comm_shield_tb/DISC_OUT_SH_LEVEL \
sim:/discrete_comm_shield_tb/DISC_IN_SH_EDGE

# Internal signals
add wave -divider "Internal signals"
add wave  \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/CLK_50MHZ \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/nRESET \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_IN_1_SH_D2 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_IN_2_SH_D4 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_IN_3_SH_D7 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/PWM_1_SH_D3 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/PWM_2_SH_D5 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/PWM_3_SH_D6 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_OUT_1_SH_D8 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_OUT_2_SH_D12 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_OUT_3_SH_D13 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/PWM_4_SH_D9 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/PWM_5_SH_D10 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/PWM_6_SH_D11 \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_OUT_SH_LEVEL \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_IN_SH_EDGE \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_IN_1_SH_D2_FF \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_IN_2_SH_D4_FF \
sim:/discrete_comm_shield_tb/UUT_DISCRETE_COMM_SHIELD/DISC_IN_3_SH_D7_FF

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /discrete_comm_shield_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /discrete_comm_shield_tb/END_OF_SIMULATION]
  run 1ms
}