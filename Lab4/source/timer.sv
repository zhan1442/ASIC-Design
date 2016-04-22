// $Id: $
// File name:   timer.sv
// Created:     2/11/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module timer
(
	input clk, n_rst, enable_timer,
	output shift_strobe, packet_done
);

	reg delayed_enable;
	reg delay_reg;

	always_ff @ (posedge clk, negedge n_rst) 
   	begin
		if(n_rst == 0) begin 
		    delay_reg <= 0;
		    delayed_enable <= 0;
		end
		else begin
		    delay_reg <= enable_timer;
		    delayed_enable <= delay_reg;
		end
    	end

	flex_counter #(4) cnt_to_10
    	(
        	.clk(clk),
 		.n_rst(n_rst),
 		.clear(packet_done),
 		.count_enable(delayed_enable),
 		.rollover_val(4'b1010),
 		.count_out(),
 		.rollover_flag(shift_strobe)
    	);

	
	flex_counter #(4) cnt_to_9
    	(
		.clk(clk),
		.n_rst(n_rst),
		.clear(packet_done),
		.count_enable(shift_strobe),
		.rollover_val(4'b1001),
		.count_out(),
		.rollover_flag(packet_done)
    	);

endmodule
