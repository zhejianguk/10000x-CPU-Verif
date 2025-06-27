#!/bin/csh -f

# Synthesis
vsyn -F ./dut_src/flist_rtl.lst -I ./dut_src -I ./rtl_tb -o dut_top.vg

# System build
vcom vcom_compile.tcl

# PNR
cd fpgaCompDir
make all
cd ..

# Run on board
vdbg debug.tcl
