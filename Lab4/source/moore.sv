// $Id: $
// File name:   moore.sv
// Created:     2/4/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module moore
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
		case (state)
			WAITING: begin
				if (i == 1)
					nextstate = RCV1;
				else
					nextstate = WAITING;
			end
			RCV1: begin
				//nextstate = (i == 1) ? RCV11 : WAITING;	
				if (i == 1)
					nextstate = RCV11;
				else
					nextstate = WAITING;
			end	
			RCV11: begin
				//nextstate = (i == 0) ? RCV110 : RCV11;
				if (i == 0)
					nextstate = RCV110;
				else
					nextstate = RCV11;
			end
			RCV110: begin
				//nextstate = (i == 1) ? RCV1101 : WAITING;
				if (i == 1)
					nextstate = RCV1101;
				else
					nextstate = WAITING;
			end
			RCV1101: begin
				//nextstate = (i == 1) ? RCV11 : WAITING;
				if (i == 1)
					nextstate = RCV11;
				else
					nextstate = WAITING;
			end
		endcase 						
	end

	assign o = (state == RCV1101) ? 1'b1 : 1'b0;

endmodule
	
