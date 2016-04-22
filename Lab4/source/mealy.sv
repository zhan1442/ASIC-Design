// $Id: $
// File name:   mealy.sv
// Created:     2/8/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module mealy
(
	input wire clk, n_rst, i,
	output reg o
);

	typedef enum logic [2:0] {WAITING, RCV1, RCV11, RCV110, RCV1101} 
	state_type;
	state_type state, nextstate;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if (n_rst == 0)
			state <= WAITING;
		else
			state <= nextstate;
	end

	always_comb
	begin
		nextstate = state;
		case(state)
			WAITING: begin
				if (i == 1)
					nextstate = RCV1;
				else
					nextstate = WAITING;
			end
			RCV1: begin
				if (i == 1)
					nextstate = RCV11;
				else
					nextstate = WAITING;
			end
			RCV11: begin
				if (i == 0)
					nextstate = RCV110;
				else
					nextstate = RCV11;
			end
			RCV110: begin
				if (i == 1)
					nextstate = RCV1;
				else
					
					nextstate = WAITING;
			end
		endcase
	end

	assign o = (state == RCV110) && i ? 1 : 0;


endmodule







