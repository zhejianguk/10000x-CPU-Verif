#!/bin/csh -f

# Clean the work libs
rm -rf Tb* 64 AN.DB simv.daidir simv* work.lib++ work_lib 

# Optional, just to change another program compiled as inst.pat and data.pat
# cp /some/where/inst.pat /some/where/data.pat rtl_tb/

# Run VCS
vlogan -sverilog -full64 +incdir+dut_src rtl_tb/tb_top.v rtl_tb/int_mnt.v -I dut_src -I rtl_tb -F dut_src/flist_rtl.lst -l vlogan.out -kdb +define+RTL_SIM
vcs -top Tb -debug_access+r -full64 -t ps -l elaborate.log -kdb
./simv

# Take care of ./dut_ram*.txt, they are the RAM memh files tranlated from inst.pat and data.pat
