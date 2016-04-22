// $Id: $
// File name:   magnitude.sv
// Created:     2/17/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module magnitude
(
   	input wire [16:0] in,
  	output wire [15:0] out
);

   	assign out = (in[16]==0) ? in[15:0] : ~in[15:0] + 1;

endmodule
