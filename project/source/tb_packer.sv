// $Id: $
// File name:   tb_packer.sv
// Created:     4/20/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_packer
();

// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 10;  
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
    	reg tb_n_rst;
	reg tb_code_done; 
	reg tb_last_char;
	reg [63:0] tb_code;
	reg [6:0] tb_bits;
	reg tb_input_enable;
	reg tb_packet_done;
	reg tb_last_packet;
	reg [7:0] tb_compressed_data;

	packer DUT
	(
		.clk(tb_clk),
	    	.n_rst(tb_n_rst),
		.code_done(tb_code_done),
		.last_char(tb_last_char),
		.code(tb_code),
		.bits(tb_bits),
		.input_enable(tb_input_enable),
		.packet_done(tb_packet_done),
		.last_packet(tb_last_packet),
		.compressed_data(tb_compressed_data)
	);

	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	initial
    	begin
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		tb_n_rst = 1'b0;
		@(posedge tb_clk);
		tb_n_rst = 1'b1;

		tb_last_char = 0;
		//1st char
		tb_code_done = 1;
		tb_bits = 5;
		tb_code = 17;
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_code_done = 0;
		tb_bits = 0;
		tb_code = 0;
		@(posedge tb_clk);
		#200
		//2rd char
		tb_code_done = 1;
		tb_bits = 16;
		tb_code = 38269;
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_code_done = 0;
		tb_bits = 0;
		tb_code = 0;
		@(posedge tb_clk);
		#200
		//3th char
		tb_code_done = 1;
		tb_bits = 11;
		tb_code = 1461;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_code_done = 0;
		tb_bits = 0;
		tb_code = 0;
		@(posedge tb_clk);
		#200
		//4th char
		tb_code_done = 1;
		tb_bits = 9;
		tb_code = 463;
		tb_last_char = 1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_code_done = 0;
		tb_bits = 0;
		tb_code = 0;
		@(posedge tb_clk);

	end

endmodule






