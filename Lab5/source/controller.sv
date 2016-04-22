// $Id: $
// File name:   controller.sv
// Created:     2/16/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module controller
(
	input clk, n_reset, dr, lc, overflow,
	output reg cnt_up, clear, 
	output wire modwait,
	output reg [2:0] op,
	output reg [3:0] src1, src2, dest,
	output reg err
);

	reg mod, next_mod;
	assign modwait = mod;

	typedef enum logic [4:0] {IDLE, LOAD_COEF1, LOADED1, LOAD_COEF2, LOADED2, LOAD_COEF3, LOADED3, LOAD_COEF4,
				  STORE, ZERO, SORT1, SORT2, SORT3, SORT4, MUL1, SUB1, MUL2, ADD1, MUL3, SUB2, MUL4, ADD2,
			          EIDLE} 
	state_type;
	state_type state, next_state;
	
	always_ff @ (posedge clk, negedge n_reset)
	begin
	    	if(n_reset == 0) begin
		    state <= IDLE;
		    mod <= 0;
		end
		else begin
		    state <= next_state;
		    mod <= next_mod;
		end	
    	end

	always_comb
	begin
		next_state = IDLE;
		next_mod = 1;
		case(state)		
			IDLE: begin
				if (lc == 1)
					next_state = LOAD_COEF1;				
				else if (dr == 1) begin
					next_state = STORE;
				end
				else begin
					next_state = IDLE;
					next_mod = 0;
				end
			end
			
			LOAD_COEF1: begin
				next_state = LOADED1;
				next_mod = 0;		
			end
			
			LOADED1: begin
				if (lc == 1) begin
					next_state = LOAD_COEF2;			
				end
				else begin
					next_state = LOADED1;
					next_mod = 0;
				end
			end

			LOAD_COEF2: begin
				next_state = LOADED2;
				next_mod = 0;
			end

			LOADED2: begin
				if (lc == 1) begin
					next_state = LOAD_COEF3;			
				end
				else begin
					next_state = LOADED2;
					next_mod = 0;
				end
			end

			LOAD_COEF3: begin
				next_state = LOADED3;
				next_mod = 0;
			end

			LOADED3: begin
				if (lc == 1) begin
					next_state = LOAD_COEF4;			
				end
				else begin
					next_state = LOADED3;
					next_mod = 0;				
				end
			end

			LOAD_COEF4: begin
				next_state = IDLE;
				next_mod = 0;
			end

			STORE: begin
				if (dr == 1) begin
					next_state = ZERO;
				end
				else begin
					next_state = EIDLE;
					next_mod = 0;				
				end
			end
			
			ZERO: begin
				next_state = SORT1;
			end

			SORT1: next_state = SORT2;
			SORT2: next_state = SORT3;
			SORT3: next_state = SORT4;
			
			SORT4: next_state = MUL1;
			
			MUL1: next_state = SUB1;
			
			SUB1: begin
				next_state = MUL2;
				if (overflow == 1) begin
					next_state = EIDLE;
					next_mod = 0;
				end
			end

			MUL2: next_state = ADD1;
			
			ADD1: begin
				next_state = MUL3;
				if (overflow == 1) begin
					next_state = EIDLE;
					next_mod = 0;
				end
			end
			
			MUL3: next_state = SUB2;

			SUB2: begin
				next_state = MUL4;
				if (overflow == 1) begin
					next_state = EIDLE;
					next_mod = 0;
				end
			end

			MUL4: next_state = ADD2;

			ADD2: begin
				if (overflow == 1) begin
					next_state = EIDLE;
					next_mod = 0;
				end
				else begin
					next_state = IDLE;
					next_mod = 0;
				end	
			end

			EIDLE: begin
				if (dr == 1)
					next_state = STORE;
				else if (lc == 1)
					next_state = LOAD_COEF1;
				else begin
					next_state = EIDLE;
					next_mod = 0;
				end
			end
		endcase
	end

	always_comb
	begin
		cnt_up=0;
	    	err=0;
		clear=0;
	     	dest=4'b0000;
	     	src1=4'b0000;
	     	src2=4'b0000;
	     	op=3'b000;
		
		case(state)
			IDLE: begin
				cnt_up=0;
	    			err=0;
				clear=0;
	     			dest=4'b0000;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b000;	
			end
			
			LOAD_COEF1: begin
				cnt_up=0;
	    			err=0;
				clear=1;
	     			dest=4'b0110;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b011;
			end

			LOADED1: begin
				cnt_up=0;
	    			err=0;
				clear=0;
	     			dest=4'b0000;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b000;
			end

			LOAD_COEF2: begin
				cnt_up=0;
	    			err=0;
				clear=0;
	     			dest=4'b0111;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b011;
			end

			LOADED2: begin
				cnt_up=0;
	    			err=0;
				clear=0;
	     			dest=4'b0000;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b000;
			end

			LOAD_COEF3: begin
				cnt_up=0;
	    			err=0;
				clear=0;
	     			dest=4'b1000;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b011;
			end

			LOADED3: begin
				cnt_up=0;
	    			err=0;
				clear=0;
	     			dest=4'b0000;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b000;
			end

			LOAD_COEF4: begin
				cnt_up=0;
	    			err=0;
				clear=0;
	     			dest=4'b1001;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b011;
			end

			STORE: begin
			     	cnt_up=1;
			     	clear=0;
			     	err=0;
			    	dest=4'b0101;
			     	src1=4'b0000;
	     		     	src2=4'b0000;
			     	op=3'b010;
			end

			ZERO: begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0000;
			     	src1=4'b0000;
	     		     	src2=4'b0000;
			     	op=3'b101;
		       	end
			  
			SORT1:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0001;
			     	src1=4'b0010;
			     	src2=4'b0000;
			     	op=3'b001;
			end
			  
			SORT2:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0010;
			     	src1=4'b0011;
			     	src2=4'b0000;
			     	op=3'b001;
			end
			  
			SORT3:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0011;
			     	src1=4'b0100;
			     	src2=4'b0000;
			     	op=3'b001;
			end
			
			SORT4:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0100;
			     	src1=4'b0101;
			     	src2=4'b0000;
			     	op=3'b001;
			end

			MUL1:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b1010;
			     	src1=4'b0001;
			     	src2=4'b0110;
			     	op=3'b110;
			end

			SUB1:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0000;
			     	src1=4'b0000;
			     	src2=4'b1010;
			     	op=3'b101;
			end
			  
			MUL2:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b1010;
			     	src1=4'b0010;
			     	src2=4'b0111;
			     	op=3'b110;
			end
			  
			ADD1:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0000;
			     	src1=4'b0000;
			     	src2=4'b1010;
			     	op=3'b100;
			end
			  
			MUL3:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b1010;
			     	src1=4'b0011;
			     	src2=4'b1000;
			     	op=3'b110;
			end
			  
			SUB2:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0000;
			     	src1=4'b0000;
			     	src2=4'b1010;
			     	op=3'b101;
			end

			MUL4:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b1010;
			     	src1=4'b0100;
			     	src2=4'b1001;
			     	op=3'b110;
			end

			ADD2:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=0;
			     	dest=4'b0000;
			     	src1=4'b0000;
			     	src2=4'b1010;
			     	op=3'b100;
			end
			  
			EIDLE:begin
			     	cnt_up=0;
			     	clear=0;
			     	err=1;
			     	dest=4'b0000;
	     			src1=4'b0000;
	     			src2=4'b0000;
	     			op=3'b000;
			end
		endcase
	end

endmodule
