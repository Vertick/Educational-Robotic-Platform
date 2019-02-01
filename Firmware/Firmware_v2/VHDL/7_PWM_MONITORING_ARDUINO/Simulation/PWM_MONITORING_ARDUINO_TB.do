##--------------------------------------------------------------------------------------------------
## Block name: PWM_MONITORING_ARDUINO                                                             --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: PWM_MONITORING_ARDUINO_TB; PWM_MONITORING_ARDUINO; FPGA_MAIN_MODULE_Package;     --
##               RS232_Package                                                                    --
##--------------------------------------------------------------------------------------------------
## Initial version 1 - 24/08/2017                                                                 --
##--------------------------------------------------------------------------------------------------

# Compile
vcom ../../../0_Packages/RS232_Package.vhd
vcom ../../../0_Packages/FPGA_MAIN_MODULE_Package.vhd
vcom ../../Source/PWM_MONITORING_ARDUINO.vhd
vcom ../../Simulation/PWM_MONITORING_ARDUINO_TB.vhd

# Simulate
vsim work.PWM_MONITORING_ARDUINO_TB

# Test Bench signals
add wave -divider "Test Bench signals"
add wave  \
sim:/pwm_monitoring_arduino_tb/SYSTEM_TIME \
sim:/pwm_monitoring_arduino_tb/END_OF_SIMULATION \
sim:/pwm_monitoring_arduino_tb/ERROR_DETECTED \
sim:/pwm_monitoring_arduino_tb/TEST_PULSE

# UUT signals
add wave -divider "UUT signals"
add wave  \
sim:/pwm_monitoring_arduino_tb/CLK_50MHZ \
sim:/pwm_monitoring_arduino_tb/nRESET \
sim:/pwm_monitoring_arduino_tb/PWM_1_AR_D3 \
sim:/pwm_monitoring_arduino_tb/PWM_2_AR_D5 \
sim:/pwm_monitoring_arduino_tb/PWM_3_AR_D6 \
sim:/pwm_monitoring_arduino_tb/PWM_4_AR_D9 \
sim:/pwm_monitoring_arduino_tb/PWM_5_AR_D10 \
sim:/pwm_monitoring_arduino_tb/PWM_6_AR_D11 \
sim:/pwm_monitoring_arduino_tb/PWM_AR_PULSE_HI \
sim:/pwm_monitoring_arduino_tb/PWM_AR_PULSE_LO


# Internal signals
add wave -divider "Internal signals"
add wave  \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/CLK_50MHZ \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/nRESET \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_1_AR_D3 \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_2_AR_D5 \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_3_AR_D6 \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_4_AR_D9 \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_5_AR_D10 \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_6_AR_D11 \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_AR_PULSE_HI \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_AR_PULSE_LO \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_AR_FF_1 \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_AR_FF_2 \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_AR_RISE_EDGE \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_AR_FALL_EDGE \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/TIME_REF_1MS_COUNT \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/TIME_REF_1MS \
sim:/pwm_monitoring_arduino_tb/UUT_PWM_MONITORING_ARDUINO/PWM_PULSE_COUNT

set END_OF_SIMULATION_RD 0
set UPDATE_SYSTEM_TIME_RD 1
while {$END_OF_SIMULATION_RD == 0} {
  set LOCAL_TIME [clock format [clock seconds] -format %T-%D]
  force -freeze /pwm_monitoring_arduino_tb/SYSTEM_TIME $LOCAL_TIME
  ## Detect the end of the simulation
  set END_OF_SIMULATION_RD [examine /pwm_monitoring_arduino_tb/END_OF_SIMULATION]
  run 1ms
}