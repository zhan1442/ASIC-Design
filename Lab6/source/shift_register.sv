// $Id: $
// File name:   shift_register.sv
// Created:     2/29/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module shift_register
(
	input wire clk, n_rst, shift_enable, d_orig,
	output logic [7:0] rcv_data
);

	flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) SR
	(
		.clk(clk),
		.n_rst(n_rst),
		.shift_enable(shift_enable),
		.serial_in(d_orig),
		.parallel_out(rcv_data)
	);

endmodule

