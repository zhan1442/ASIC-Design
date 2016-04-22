// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/1/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module flex_pts_sr
#(
	NUM_BITS = 4,
  	SHIFT_MSB = 1
)

(
	input wire clk, n_rst, shift_enable, load_enable,
	input wire [NUM_BITS-1:0] parallel_in,
	output wire serial_out
);
	reg [NUM_BITS-1:0] curr_values;
	reg [NUM_BITS-1:0] mux_out;
	
	if (SHIFT_MSB == 1)
		assign serial_out = curr_values[NUM_BITS-1];
  	else
    		assign serial_out = curr_values[0];
	
	
	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 1'b0) begin
			curr_values <= '1;
		end		
		else begin
			curr_values <= mux_out;
		end
			
	end

	always_comb 
	begin
		if (load_enable == 1) begin
			mux_out = parallel_in;
		end
		else begin
			if (shift_enable == 1) begin
				if (SHIFT_MSB == 1)			
					mux_out = {curr_values[NUM_BITS-2:0], 1'b1};
				else 
					mux_out = {1'b1, curr_values[NUM_BITS-1:1]}; 
			end
			else
				mux_out = curr_values;
		end
	end

endmodule
