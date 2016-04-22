// $Id: $
// File name:   decode.sv
// Created:     2/23/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module decode
(
	input clk,n_rst,d_plus,shift_enable,eop,
	output wire d_orig	
);
	reg r1,next_r1,r2,next_r2;
	always_ff @ (posedge clk, negedge n_rst)
	begin 
		if (n_rst == 0) begin
			r1 <= 1'b1;
			r2 <= 1'b1;	
		end
		else begin
			r1 <= next_r1;
			r2 <= next_r2;  
		end		
	end

	assign next_r1 = (shift_enable == 1'b1 && eop == 1'b1) ? 1'b1 : ((shift_enable == 1'b1) ? d_plus : r1);	
	assign next_r2 = (shift_enable == 1'b1 && eop == 1'b1) ? 1'b1 : d_plus;

	assign d_orig = (r1 == r2) ? 1'b1 : 1'b0;
	
endmodule
