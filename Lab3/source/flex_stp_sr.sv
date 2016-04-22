// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/1/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module flex_stp_sr
#(
	NUM_BITS = 4,
  	SHIFT_MSB = 1
)

(
	input wire clk, n_rst, shift_enable,serial_in,
	output reg[NUM_BITS-1:0] parallel_out	
);
	reg [NUM_BITS-1:0] next_out;	
		
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0) begin
			parallel_out <= '1;
		end		
		else begin
			parallel_out <= next_out;
		end
	end
	
	always_comb
	begin
		if (shift_enable == 1'b1) begin
			if (SHIFT_MSB == 1) 
				next_out = {parallel_out[NUM_BITS-2:0], serial_in};
			else
				next_out = {serial_in, parallel_out[NUM_BITS-1:1]};
			end
		else begin
			next_out = parallel_out; 	
		end
	end

endmodule
			
	
	
	
