// $Id: $
// File name:   timer.sv
// Created:     2/29/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module timer
(
	input wire clk, n_rst, d_edge, rcving,
	output wire shift_enable, byte_received
);

	wire [3:0] cnt_out;
	reg received, r2, r1;	

	flex_counter F1
	(
		.clk(clk), 
		.n_rst(n_rst),
		.clear(d_edge),
		.count_enable(rcving),
		.rollover_val(4'd8),
		.count_out(cnt_out)
	);

	assign shift_enable = (cnt_out == 2) ? 1'b1 : 1'b0;

	flex_counter F2
	(
		.clk(clk), 
		.n_rst(n_rst),
		.clear(~rcving),
		.count_enable(shift_enable),
		.rollover_val(4'd8),
		.rollover_flag(received)
	);

	always_ff @(posedge clk, negedge n_rst) begin
		if(1'b0 == n_rst) begin
			r2 <= 0;
			r1 <= 0;
		end else begin
			r2 <= r1;
			r1 <= received;
		end
	end

	assign byte_received = ((r1 == 1) && (r2 == 0)) ? 1'b1 : 1'b0;

endmodule

	
