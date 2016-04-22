// 337 TA Provided Lab 2 8-bit adder wrapper file template
// This code serves as a template for the 8-bit adder design wrapper file 
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);

	genvar i;
	generate
		for(i = 0; i < 16; i = i + 1)	
		begin

			always @ (a, b, carry_in)
			begin
				assert((a[i] == 1'b1) ||(a[i] == 1'b0))
				else $error("Input 'a[i]' of component is not a digital logic value");
				assert((b[i] == 1'b1) ||(b[i] == 1'b0))
				else $error("Input 'b[i]' of component is not a digital logic value");
				assert((carry_in == 1'b1) ||(carry_in == 1'b0))
				else $error("Input 'carry_in' of component is not a digital logic value");	
			end		
		end 
			
	
	endgenerate

	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
	adder_nbit #(.BIT_WIDTH(16)) X1 ( .a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));

endmodule
