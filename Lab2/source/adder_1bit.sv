// $id: $
// File name:   adder_1bit.sv
// Created:     1/26/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 100ps
module adder_1bit
(
	input wire a, b, carry_in,	
	output wire sum, carry_out
);
	
	always @ (a, b, carry_in)
	begin
		assert((a == 1'b1) ||(a == 1'b0))
		else $error("Input 'a' of component is not a digital logic value");
		
		assert((b == 1'b1) ||(b == 1'b0))
		else $error("Input 'b' of component is not a digital logic value");

		assert((carry_in == 1'b1) ||(carry_in == 1'b0))
		else $error("Input 'carry_in' of component is not a digital logic value");
	end

	assign sum = carry_in ^	(a ^ b);
        assign carry_out = ((~ carry_in) & b & a) | (carry_in & (b | a));
	
	always @ (a, b, carry_in)
	begin
		#(2) 
		assert(((a + b + carry_in)%2) == sum)
		else $error("Output 'sum' of 1 bit adder is not correct");
	end
	

endmodule
