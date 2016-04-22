// $Id: $
// File name:   rcu.sv
// Created:     2/29/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module rcu
(
	input wire clk, n_rst, d_edge, eop, shift_enable,
	input wire [7:0] rcv_data,
	input wire byte_received,
	output logic rcving, w_enable, r_error
);

	typedef enum bit [3:0]{
		IDLE, FBYTE, CHK, RCVING, STORE, EOP, EDGE, EWAIT, DELAY, EIDLE
	}
	stateType;
	stateType state, next_state;

	always_ff @ (negedge n_rst, posedge clk) begin
		if(n_rst == 1'b0)
			state <= IDLE;
		else
			state <= next_state;
	end

	always_comb
	begin
		next_state = state;
		case(state)
			IDLE: begin
				if(d_edge) 
			      		next_state = FBYTE;
			end
			FBYTE: begin
				if(byte_received) 
					next_state = CHK;
			end
			CHK: begin
				if(rcv_data == 8'b10000000) 
					next_state = RCVING;
				else 
					next_state = EWAIT;
			end
			RCVING: begin
				if(byte_received) 
					next_state = STORE;
				if(eop && shift_enable) 
					next_state = DELAY;
			end
			STORE: next_state = EOP;
			EWAIT:begin
				if(eop && shift_enable) 
					next_state = DELAY;
			end
			DELAY:begin
				if(d_edge) 
					next_state = EIDLE;
			end
			EIDLE:begin
				if(d_edge) 
					next_state = FBYTE;
			end
			EDGE:begin
				if(d_edge) 
					next_state = IDLE;
			end
			EOP:begin
				if(~eop && shift_enable) 
					next_state = RCVING;
				else if(eop && shift_enable) 
					next_state = EDGE;
			end
		endcase
	end

	assign rcving = ((state == IDLE) || (state == DELAY) || (state == EIDLE) || (state == EDGE)) ? 1'b0 : 1'b1;
	assign w_enable = (state == STORE) ? 1'b1 : 1'b0;
	assign r_error = ((state == EWAIT) || (state == DELAY) || (state == EIDLE)) ? 1'b1 : 1'b0;

endmodule
