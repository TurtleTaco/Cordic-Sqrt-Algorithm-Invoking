############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project sqrt_CORDIC
set_top sqrt_CORDIC
add_files sqrt_CORDIC.cpp
open_solution "solution1"
set_part {xczu19eg-ffve1924-3-e-es2} -tool vivado
create_clock -period 10 -name default
#source "./sqrt_CORDIC/solution1/directives.tcl"
#csim_design -compiler gcc
csynth_design
#cosim_design
export_design -format ip_catalog
