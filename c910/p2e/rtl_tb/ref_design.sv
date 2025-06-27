reg dck;
always@(posedge ccum.free_root_clock) dck <= cgu.clk[0];
dut_top u_dut_top();
assign u_dut_top.brd_clk_n = ~dck;
assign u_dut_top.brd_clk_p = dck;
assign u_dut_top.sysrst = ~rstn;
assign u_dut_top.uart0_tx = 1'b1;
assign u_dut_top.uart0_rts = 1'b0;


