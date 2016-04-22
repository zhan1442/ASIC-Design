// $Id: $
// File name:   usb_receiver.sv
// Created:     2/29/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module usb_receiver(
	input wire clk, n_rst, d_plus, d_minus, r_enable,
	output logic [7:0] r_data,
	output logic empty, full, rcving, r_error
);

	reg d_plus_sync, d_minus_sync, d_edge, d_orig, eop, shift_enable, w_enable;
	reg byte_received;
	reg [7:0] rcv_data;

	sync_high SYNC_H
	(
		.clk(clk), 
		.n_rst(n_rst), 
		.async_in(d_plus), 
		.sync_out(d_plus_sync)
	);

	sync_low SYNC_L
	(
		.clk(clk), 
		.n_rst(n_rst), 
		.async_in(d_minus), 
		.sync_out(d_minus_sync)
	);

	edge_detect EDGE
	(
		.clk(clk), 
		.n_rst(n_rst), 
		.d_plus(d_plus_sync), 
		.d_edge(d_edge)
	);

	eop_detect EOP
	(
		.d_plus(d_plus_sync), 
		.d_minus(d_minus_sync), 
		.eop(eop)
	);

	decode DCD(
		.clk(clk),
		.n_rst(n_rst),
		.d_plus(d_plus_sync),
		.shift_enable(shift_enable), 
		.eop(eop), 
		.d_orig(d_orig)
	);

	timer TIMR(
		.clk(clk), 
		.n_rst(n_rst), 
		.d_edge(d_edge), 
		.rcving(rcving),
		.shift_enable(shift_enable), 
		.byte_received(byte_received)
	);

	shift_register SHIFT_REG(
		.clk(clk), 
		.n_rst(n_rst), 
		.shift_enable(shift_enable), 
		.d_orig(d_orig),
		.rcv_data(rcv_data)
	);

	rcu RCU_U(
		.clk(clk), 
		.n_rst(n_rst), 
		.d_edge(d_edge), 
		.eop(eop), 
		.shift_enable(shift_enable),
		.rcv_data(rcv_data), 
		.byte_received(byte_received), 
		.rcving(rcving), 
		.w_enable(w_enable),
		.r_error(r_error)
	);

	rx_fifo RXFF(
		.clk(clk), 
		.n_rst(n_rst), 
		.r_enable(r_enable), 
		.w_enable(w_enable),
		.w_data(rcv_data), 
		.r_data(r_data), 
		.empty(empty), 
		.full(full)
	);

endmodule
