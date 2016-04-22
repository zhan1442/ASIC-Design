// $Id: $
// File name:   tb_encrypt.sv
// Created:     3/24/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_encrypt
();

	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 10;  
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
    	reg tb_n_rst;
	//reg tb_en_enable;
	reg [1:0] tb_select;
	reg [7:0] tb_rx_data;
	//reg [7:0] tb_key, //this is needed if the "key" can be entered by user.
	reg [7:0] tb_en_data;
	//reg data_ready, data_read //these is needed when the process requires more than one clk cycle.

	encrypt DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		//.en_enable(tb_en_enable),
		.select(tb_select),
		.rx_data(tb_rx_data),
		.en_data(tb_en_data)
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
		//tb_en_enable = 1;

		//TEST CASE 0
		@(posedge tb_clk);
		//#8 
		tb_select = 2'b00;
		tb_rx_data = 8'b01010100;
		@(posedge tb_clk);
		//#(CHECK_DELAY);

		//TEST CASE 1
		//#8
		tb_select = 2'b01;
		tb_rx_data = 8'b01110101;
		@(posedge tb_clk);
		//#(CHECK_DELAY);

		//TEST CASE 2
		//#8
		tb_select = 2'b01;
		tb_rx_data = 8'b10101010;
		@(posedge tb_clk);

		//TEST CASE 3
		//#8
		tb_select = 2'b01;
		tb_rx_data = 8'b01010101;
		@(posedge tb_clk);

		//TEST CASE 4
		//#8
		tb_select = 2'b10;
		tb_rx_data = 8'b11110000;
		@(posedge tb_clk);

		//TEST CASE 5
		//#8
		tb_select = 2'b10;
		tb_rx_data = 8'b00001111;
		@(posedge tb_clk);

		//TEST CASE 6
		//#8
		tb_select = 2'b11;
		tb_rx_data = 8'b00001111;
		@(posedge tb_clk);

		//TEST CASE 7
		//#8
		tb_select = 2'b11;
		tb_rx_data = 8'b10110110;
		@(posedge tb_clk);

	end


endmodule

