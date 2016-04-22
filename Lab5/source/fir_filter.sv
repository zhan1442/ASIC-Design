// $Id: $
// File name:   fir_filter.sv
// Created:     2/17/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module fir_filter
(
   	input wire clk, n_reset, load_coeff, data_ready,
   	input wire [15:0] sample_data, fir_coefficient,
	output wire one_k_samples, modwait, err,
   	output wire [15:0] fir_out
);

   	wire dr, lc, cntup;
   	wire [16:0] out;
   	wire [2:0] op;
   	wire [3:0] src1, src2, dest;
   	wire overflow, clear;
   
   	sync s1(
		.clk(clk),
		.async_in(data_ready),
		.n_rst(n_reset),
		.sync_out(dr)
	);
   	
	sync s2(
		.clk(clk),
		.n_rst(n_reset),
		.async_in(load_coeff),
		.sync_out(lc)
	);

   	controller c(
		.clk(clk),
		.n_reset(n_reset),
		.dr(dr),
		.lc(lc),
		.overflow(overflow),
		.cnt_up(cntup),
		.clear(clear),
		.modwait(modwait),
		.op(op),
		.src1(src1),
		.src2(src2),
		.dest(dest),
		.err(err)
	);

   	magnitude m(
		.in(out),
		.out(fir_out)
	);
   	
	counter count(
		.clk(clk),
		.n_reset(n_reset),
		.cnt_up(cntup),
		.one_k_samples(one_k_samples),
		.clear(clear)
	);

   	datapath d(
		.clk(clk),
		.n_reset(n_reset),
		.src1(src1),
		.src2(src2),
		.outreg_data(out),
		.overflow(overflow),
		.op(op),
		.dest(dest),
		.ext_data2(fir_coefficient),
		.ext_data1(sample_data)
	);
  
endmodule
