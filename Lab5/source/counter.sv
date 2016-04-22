// $Id: $
// File name:   counter.sv
// Created:     2/17/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module counter
(
   input wire clk, n_reset, cnt_up, clear,
   output wire one_k_samples
);


flex_counter #(10) count_to_1000
(
      	.clk(clk),
	.n_rst(n_reset),
	.clear(clear),
	.count_enable(cnt_up),
	.rollover_val(10'b1111101000),
	.rollover_flag(one_k_samples)
);

endmodule
