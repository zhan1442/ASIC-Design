// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     2/28/2016
// Author:      Jun He
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: tb usb

`timescale 1ns / 100ps
module tb_usb_receiver();

// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 10;
	localparam 	BITS = 4;

	// Shared Test Variables
	reg tb_clk;
	reg tb_n_rst;
	reg tb_d_plus, tb_d_minus, tb_r_enable;
	reg [7:0] tb_r_data;
	reg tb_empty, tb_full, tb_rcving, tb_r_error;
	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// Default Config Test Variables & constants

	usb_receiver DUT
	(
		.clk(tb_clk), .n_rst(tb_n_rst), 
		.d_plus(tb_d_plus), 
		.d_minus(tb_d_minus),
		.r_enable(tb_r_enable),
		.r_data(tb_r_data),
		.empty(tb_empty), .full(tb_full),
		.rcving(tb_rcving), .r_error(tb_r_error)
		
	);
initial
begin
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
