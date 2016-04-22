// $Id: $
// File name:   sr_9bit.sv
// Created:     2/11/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module sr_9bit 
(
	input wire clk, n_rst, shift_strobe, serial_in,
	output wire [7:0] packet_data,
	output wire stop_bit
);

	wire [8:0] out;

	flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0)) SHIFT_REG9
	(
		.clk(clk),
		.n_rst(n_rst),
		.shift_enable(shift_strobe),
		.serial_in(serial_in),
		.parallel_out(out)
	);

	assign stop_bit = out[8];
	assign packet_data = out[7:0];


endmodule
