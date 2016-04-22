// $Id: $
// File name:   rcu_packer.sv
// Created:     4/19/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module rcu_packer
(
	input clk, n_rst, //from outside
	input code_done, last_char,
	input [6:0] bits,
	input all_rollover, //from inside , flag
	input rollover, //flag

	output reg load_enable, //to inside
	output reg clear, //clear counter
	output reg cs_enable, //counter and shift register enable
	output reg [3:0] roll_val,
	output reg [6:0] all_roll_val,
	output reg input_enable, //to outside
	output reg last_packet, packet_done
);

	typedef enum logic [1:0] {WAIT,
				  SHIFT,
				  LAST}
	state_type;
	state_type state, next_state;

	reg [6:0] next_all_roll_val; 

	assign packet_done = rollover;

	assign input_enable = (state == WAIT) ? 1'b1 : 1'b0;
	assign load_enable = (state == WAIT) ? 1'b1 : 1'b0;
	assign clear = (state == WAIT) ? 1'b1 : 1'b0;
	assign cs_enable = (state == WAIT) ? 1'b0 : 1'b1;

	assign last_packet = (state == LAST) ? 1'b1 : 1'b0;

	always_ff @ (posedge clk, negedge n_rst)
	begin
	    	if(n_rst == 0) begin
			state <= WAIT;
		    	all_roll_val = 0;
		end
		else begin
			state <= next_state;
			all_roll_val = next_all_roll_val;
		end
    	end

	always_comb
    	begin
        	next_state = WAIT;
		case(state)
			WAIT: begin
				if(code_done == 1)
					next_state = SHIFT;
				else
					next_state = WAIT;
			end

			SHIFT: begin
				if(~last_char & all_rollover)
					next_state = WAIT;
				else if(last_char & all_rollover)
					next_state = LAST;
				else
					next_state = SHIFT;
			end

			LAST: begin
				if(rollover == 1)
					next_state = WAIT;
				else
					next_state = LAST;
			end
		endcase
	end

	assign roll_val = 4'b1000;
	assign next_all_roll_val = (load_enable == 1) ? bits - 1 : all_roll_val;


endmodule








