// $Id: $
// File name:   rcu.sv
// Created:     2/11/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module rcu
(
	input clk, n_rst, start_bit_detected, packet_done, framing_error,
	output wire sbc_clear, sbc_enable, load_buffer, enable_timer
);
	
	typedef enum logic [2:0] {IDLE, 
				  START_BIT_RCVD, 
				  RCV_PACKET, 
				  STOP_BIT_RCVD, 
			          CHK_FRAM_ERR, 
				  STORE_DATA} 
	state_type;
	state_type state, next_state;

	assign sbc_clear = (state == START_BIT_RCVD) ? 1'b1 : 1'b0;
    	assign sbc_enable = (state == STOP_BIT_RCVD) ? 1'b1 : 1'b0;
    	assign load_buffer = (state == STORE_DATA) ? 1'b1 : 1'b0;
	assign enable_timer = (state == RCV_PACKET) ? 1'b1 : 1'b0;
    	
	always_ff @ (posedge clk, negedge n_rst)
	begin
	    	if(n_rst == 0) 
		    state <= IDLE;
		else
		    state <= next_state;
    	end

	always_comb
    	begin
        	next_state = IDLE;
		case(state)
			IDLE: begin
				if(start_bit_detected == 1)
					next_state = START_BIT_RCVD;
				else
					next_state = IDLE;
			end
			
			START_BIT_RCVD: next_state = RCV_PACKET;

			RCV_PACKET: begin
				if(packet_done == 1)
				    next_state = STOP_BIT_RCVD;
				else
				    next_state = RCV_PACKET;
			end

			STOP_BIT_RCVD: next_state = CHK_FRAM_ERR;

			CHK_FRAM_ERR: begin
				if(framing_error == 1)
				    next_state = IDLE;
				else
				    next_state = STORE_DATA;
			end

			STORE_DATA: next_state = IDLE;
		endcase			
	end	


endmodule
