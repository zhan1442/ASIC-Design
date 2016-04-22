// $Id: $
// File name:   eop_detect.sv
// Created:     2/24/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module eop_detect
(
   	input wire d_plus,
   	input wire d_minus,
   	output wire eop
);

   	assign eop = (!d_plus) && (!d_minus);
   

endmodule
