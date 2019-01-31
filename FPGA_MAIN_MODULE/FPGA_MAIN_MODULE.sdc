##--------------------------------------------------------------------------------------------------
## Block name: FPGA_MAIN_MODULE                                                                   --
##--------------------------------------------------------------------------------------------------
## Author name: Pedro Plaza                                                                       --
##--------------------------------------------------------------------------------------------------
## Dependencies: DEVICE  "EP2C5T144C8"                                                            --
##--------------------------------------------------------------------------------------------------
## Initial version 0.1 - 20/08/2017                                                               --
##--------------------------------------------------------------------------------------------------

#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3

#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLK_50MHZ} -period 20.000 -waveform { 0.000 10.000 } [get_ports { CLK_50MHZ }]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

