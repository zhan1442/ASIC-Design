// $Id: $
// File name:   sync_low.sv
// Created:     1/27/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module sync
(
  input wire clk,
  input wire n_rst,
  input wire async_in,
  output reg sync_out
);

reg q1;


always_ff @ (posedge clk, negedge n_rst)
begin : sync
	if(1'b0 == n_rst) 
	begin
    		q1 <= 0;
		sync_out <= 0;
  	end 
	else 
	begin
    		q1 <= async_in;
    		sync_out <= q1;
  	end
end


endmodule
