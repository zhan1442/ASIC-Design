// $Id: $
// File name:   rcv_block.sv
// Created:     2/11/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module rcv_block
(
	input wire clk, n_rst, serial_in, data_read,
	output reg [7:0] rx_data,
	output reg data_ready, overrun_error,framing_error
);

	//reg [7:0] next_rx_data;
	//reg next_data_ready, next_overrun, next_framing_err;
	wire strt_bit_detected;
	wire shift_strobe;
	wire [7:0] packet_data;
	wire stop_bit;
	wire enable_timer;
	wire packet_done;
	wire sbc_clear;
	wire sbc_enable;
	wire load_buffer;
	
	start_bit_det START_BIT_DETECTOR
	(
		.clk(clk), 
		.n_rst(n_rst), 
		.serial_in(serial_in), 
		.start_bit_detected(strt_bit_detected)
	);

	
	sr_9bit SHIFT_REG
	(
		.clk(clk),
		.n_rst(n_rst),
		.shift_strobe(shift_strobe),
		.serial_in(serial_in),
		.packet_data(packet_data),
		.stop_bit(stop_bit)
	);
	

	timer TIMING_CONTROLLER 
	(
		.clk(clk),
		.n_rst(n_rst),
		.enable_timer(enable_timer),
		.shift_strobe(shift_strobe),
		.packet_done(packet_done)
	);

	stop_bit_chk STOP_BIT_CHECKER
	(
		.clk(clk),
		.n_rst(n_rst),
		.sbc_clear(sbc_clear),
		.sbc_enable(sbc_enable),
		.stop_bit(stop_bit),
		.framing_error(framing_error)
	);

	rcu RCU 
	(
		.clk(clk),
		.n_rst(n_rst),
		.start_bit_detected(strt_bit_detected),
		.packet_done(packet_done),
		.framing_error(framing_error),
		.sbc_clear(sbc_clear),
		.sbc_enable(sbc_enable),
		.load_buffer(load_buffer),
		.enable_timer(enable_timer)
	);

	rx_data_buff RX_DATA_BUFF
	(
		.clk(clk),
		.n_rst(n_rst),
		.load_buffer(load_buffer),
		.packet_data(packet_data),
		.data_read(data_read),
		.rx_data(rx_data),
		.data_ready(data_ready),
		.overrun_error(overrun_error)
	);
	
endmodule


