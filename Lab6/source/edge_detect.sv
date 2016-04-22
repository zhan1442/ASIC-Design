// $Id: $
// File name:   edge_detect.sv
// Created:     2/24/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module edge_detect
(
   	input wire clk,
   	input wire n_rst,
   	input wire d_plus,
   	output wire d_edge
);
	
	reg r1,r2;
	
	always_ff@(posedge clk, negedge n_rst)
     	begin
		if(n_rst == 0) begin	
			r1 <= 1'b1;
		        r2 <= 1'b1;
		end
		else begin
		     	r1 <= d_plus;
		     	r2 <= r1;
		end
     	end
	 
	assign d_edge = (r1 != r2) ? 1'b1 : 1'b0;

endmodule
