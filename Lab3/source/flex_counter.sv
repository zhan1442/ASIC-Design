// $Id: $
// File name:   flex_counter.sv
// Created:     2/2/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module flex_counter
#(
	NUM_CNT_BITS = 4
)

(
	input wire clk, n_rst, clear, count_enable,
	input wire [NUM_CNT_BITS-1:0] rollover_val,
	output reg [NUM_CNT_BITS-1:0] count_out,
	output reg rollover_flag
);
	reg [NUM_CNT_BITS-1:0] count_next;
	reg next_flag;	
	
	always_ff @ (posedge clk, negedge n_rst)
	begin 
		if (n_rst == 0) begin
			count_out <= '0;
			rollover_flag <= '0;	
		end
		else begin
			count_out <= count_next;
			rollover_flag <= next_flag;  
		end		
	end

	always_comb
	begin	
		if (clear == 1) begin
			count_next = '0;
			next_flag = '0;
		end
		else begin
			if (count_enable == 0) begin
				count_next = count_out;
				next_flag = rollover_flag;
			end
			else begin
				count_next = count_out + 1;
				next_flag = 1'b0;
				if (count_out == rollover_val)
					count_next = 1;	
				if (count_next == rollover_val)
					next_flag = 1'b1;	
			end
		end
	end


endmodule

	
