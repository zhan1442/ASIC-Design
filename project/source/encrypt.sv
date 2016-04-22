// $Id: $
// File name:   encrypt.sv
// Created:     3/23/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: This block is for encrypting the data that is output from the data packer, it has four modes that can be selected by user using the select input. This block would also output the 8 bits encrypted data from en_data and assert data_ready for one cycle to signal that the en_data is ready to be read.

module encrypt
(
	input clk, n_rst, //en_enable,
	input [1:0] select,
	input [7:0] rx_data,
	//input [7:0] key, //this is needed if the "key" can be entered by user.
	output reg [7:0] en_data//,
	//output data_ready, data_read //these is needed when the process requires more than one clk cycle.
);

	//reg [7:0] curr_endata, next_endata;
	//reg curr_dataready, next_dataready;
	//reg curr_dataread, next_dataread;
	
	//assign en_data = curr_endata;
	//assign data_ready = curr_dataready;
	//assign data_read = curr_dataread;

	/*always_ff @ (negedge n_rst, posedge clk)
	begin
		if(n_rst == 1'b0) begin
			curr_endata <= 8'b00000000; //this is the "key" to start the encryption
		end
		else begin
			curr_endata <= next_endata;
		end

	end*/	

	/*always_comb
	begin
		if (en_enable == 1'b1) begin
			//next_endata = rx_data;
			case (select)
				2'b00: begin 
					//00: output without encrypt the data.
					endata = rx_data; // next_endata = rx_data;
				end
				2'b01: begin 
					//01: xor all the corresponding bit of the data.
					endata = rx_data ^ '1;//next_endata = curr_endata ^ rx_data;
				
				end
				2'b10: begin 
					//10: interchange the first 4 bit with the last 4 bit.
					endata = {rx_data[3:0],rx_data[7:4]};  // next_endata = {rx_data[3:0],rx_data[7:4]};
				end
				2'b11: begin 
					//11: xor all the corresponding bit and interchange first 4 bit with last 4 bit.
					endata = rx_data ^ '1;// next_endata = curr_endata ^ rx_data;
					endata = {endata[3:0],endata[7:4]};// next_endata = {next_endata[3:0],next_endata[7:4]};
				end
			endcase
		end
		// the encoded data should retain its value when en_enable is equal to 0.
		else begin
			endata = endata;//next_endata = curr_endata;
		end

	end*/
	
	always_comb
	begin
		case (select)
			2'b00: begin 
				//00: output without encrypt the data.
				en_data = rx_data; // next_endata = rx_data;
			end
			2'b01: begin 
				//01: xor all the corresponding bit of the data.
				en_data = rx_data ^ '1;//next_endata = curr_endata ^ rx_data;
				
			end
			2'b10: begin 
				//10: interchange the first 4 bit with the last 4 bit.
				en_data = {rx_data[3:0],rx_data[7:4]};  // next_endata = {rx_data[3:0],rx_data[7:4]};
			end
			2'b11: begin 
				//11: xor all the corresponding bit and interchange first 4 bit with last 4 bit.
				en_data = rx_data ^ '1;// next_endata = curr_endata ^ rx_data;
				en_data = {en_data[3:0],en_data[7:4]};// next_endata = {next_endata[3:0],next_endata[7:4]};
			end
		endcase
	end


endmodule

	



	
