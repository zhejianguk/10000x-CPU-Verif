#!/bin/csh -f

xedbextract -f c910.xvcf -d result.xedb -B16
xedbreport -t result.xedb -s dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wdata -s dut_top.x_cpu_sub_system_axi.x_rv_integration_platform.x_cpu_top.x_ct_top_0.biu_pad_wvalid -expr "%2 === 1" -expr_out 1 -fh -w 8 -csv -o a.csv
cat a.csv | sed '1d' | awk '{print $5}' | cut -b 8,9 > linux.out
cat linux.out | sed -r "s#(.*)#printf \'\\x\1\'#g" > show_out.csh
csh show_out.csh | tee linux_uart.out
