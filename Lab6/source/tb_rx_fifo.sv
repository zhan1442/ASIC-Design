// $Id: $
// File name:   tb_rx_fifo.sv
// Created:     2/24/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_rx_fifo
();
	localparam CLK_PERIOD = 2.5;
	localparam CHECK_DELAY = 3;

	reg tb_clk;
   	reg tb_n_rst;    
   	reg tb_r_enable;
   	reg tb_w_enable;
  	reg [7:0] tb_w_data;
   	reg [7:0] tb_r_data;
   	reg tb_empty;
   	reg tb_full;

	always
    	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
     	end

	rx_fifo DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.r_enable(tb_r_enable),
		.w_enable(tb_w_enable),
		.w_data(tb_w_data),
		.r_data(tb_r_data),
		.empty(tb_empty),
		.full(tb_full)
	);
	
	initial
     	begin
		int testcase;
		tb_n_rst=1;
		@(posedge tb_clk);
		tb_n_rst = 0;
		tb_r_enable = 0;
		tb_w_enable = 0;
		tb_w_data = 8'b0;
	
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_n_rst=1;

		@(posedge tb_clk);
		tb_r_enable=0;
		tb_w_enable=1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		#8
		tb_w_enable=0;
		if (tb_full ==1)
			  $info("Test case 2: Passed");
			else 
			  $error("Test case 2: FAILED");
	 	@(posedge tb_clk);
		tb_r_enable=1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		#8
		if (tb_empty==1)
			  $info("Test case 2: Passed");
			else 
			  $error("Test case 2: FAILED");

		for(testcase=0; testcase<1001; testcase++) begin
	      		@(posedge tb_clk);
	     		tb_n_rst<=$random()%2;
	     		tb_r_enable<=$random()%2;
	     		tb_w_enable<=$random()%2;
	     		tb_w_data<=$random()%256;
	  	end
	end

endmodule






