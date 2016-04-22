// $Id: $
// File name:   tb_timer.sv
// Created:     2/29/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_timer
();
	localparam CLK_PERIOD = 10;
	localparam CHECK_DELAY = 1;
	
	reg tb_clk;
	reg tb_n_rst; 
	reg tb_d_edge;
	reg tb_rcving;
	reg tb_shift_enable;
	reg tb_byte_recived;
	reg [3:0] tb_cnt_out;

	always
    	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
     	end

	timer DUT
	(
		.clk(tb_clk), 
		.n_rst(tb_n_rst), 
		.d_edge(tb_d_edge), 
		.rcving(tb_rcving),
		.shift_enable(tb_shift_enable), 
		.byte_received(tb_byte_recived)
	);

	initial
     	begin
		tb_n_rst=1;
		@(posedge tb_clk);
		tb_n_rst = 0;
		tb_d_edge = 0;
		tb_rcving = 0;
		@(posedge tb_clk);
		tb_n_rst=1;
		@(posedge tb_clk);
		tb_rcving = 1;
		@(posedge tb_clk);
		tb_d_edge = 1;
		@(posedge tb_clk);
		tb_d_edge = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_d_edge = 1;
		@(posedge tb_clk);
		tb_d_edge = 0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
	end

endmodule






