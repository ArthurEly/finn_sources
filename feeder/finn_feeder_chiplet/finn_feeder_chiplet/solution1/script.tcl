############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project finn_feeder_chiplet
set_top finn_feeder_chiplet
add_files finn_feeder.h
add_files finn_feeder_chiplet.cpp
add_files -tb finn_feeder_test.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -display_name {FINN Feeder chiplet 8 bits} -format ip_catalog -output /home/artti/Desktop/finn_fpga/finn_chiplet_projects/finn_chiplet_v2.1b/feeder/finn_feeder_chiplet/ip -rtl verilog -version 2.1.1
config_cosim -rtl vhdl -tool xsim
set_clock_uncertainty 5%
source "./finn_feeder_chiplet/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl verilog -format ip_catalog -output /home/artti/Desktop/finn_fpga/finn_chiplet_projects/finn_chiplet_v2.1b/feeder/finn_feeder_chiplet/ip
