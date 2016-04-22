// $Id: $
// File name:   packer.sv
// Created:     3/31/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module packer
(
	input clk, n_rst,
	input code_done, last_char,
	input [63:0] code,
	input [6:0] bits,
	output reg input_enable, packet_done,
	output reg last_packet,
	output reg [7:0] compressed_data
);
	
	wire clear, cs_enable, load_enable, serial;
	wire [3:0] roll_val;
	wire [6:0] all_roll_val; 
	wire rollover, all_rollover;

	flex_counter 
	#(
		.NUM_CNT_BITS(7)
	
	)
	ALL_ROLL(
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear),
		.count_enable(cs_enable),
		.rollover_val(all_roll_val),
		.count_out(),
		.rollover_flag(all_rollover)
	);

	flex_counter 
	#(
		.NUM_CNT_BITS(4)
	
	)
	ROLL(
		.clk(clk),
		.n_rst(n_rst),
		.clear(1'b0),
		.count_enable(cs_enable),
		.rollover_val(roll_val),
		.count_out(),
		.rollover_flag(rollover)
	);

	flex_pts_sr
	#(
		.NUM_BITS(64),
		.SHIFT_MSB(0)
	)
	PTS(
		.clk(clk),
		.n_rst(n_rst),
		.parallel_in(code),
		.shift_enable(cs_enable),
		.load_enable(load_enable),
		.serial_out(serial)
	);

	flex_stp_sr 
	#(
		.NUM_BITS(8),
		.SHIFT_MSB(0)
	)
	STP(
		.clk(clk),
		.n_rst(n_rst),
		.serial_in(serial),
		.shift_enable(cs_enable),
		.parallel_out(compressed_data)
	);

	rcu_packer RCU
	(
		.clk(clk),
		.n_rst(n_rst),
		.code_done(code_done),
		.last_char(last_char),
		.bits(bits),
		.all_rollover(all_rollover),
		.rollover(rollover),

		.load_enable(load_enable),
		.clear(clear),
		.cs_enable(cs_enable),
		.roll_val(roll_val),
		.all_roll_val(all_roll_val),
		.input_enable(input_enable),
		.last_packet(last_packet),
		.packet_done(packet_done)
	);	
	
endmodule





