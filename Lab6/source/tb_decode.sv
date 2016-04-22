// $Id: $
// File name:   tb_decode.sv
// Created:     2/23/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_decode
();
	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 10;  
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay

	reg tb_clk;
    	reg tb_n_rst;
    	reg tb_d_plus;
	reg tb_shift_enable;
	reg tb_eop;
	reg tb_d_orig;

	decode DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.d_plus(tb_d_plus),
		.shift_enable(tb_shift_enable),
		.eop(tb_eop),
		.d_orig(tb_d_orig)	
	);
	
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

	initial
    	begin
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		@(posedge tb_clk);
		tb_n_rst = 1'b0;
		@(posedge tb_clk);
		
		//TEST CASE 0 
    		tb_n_rst = 1'b0;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		tb_n_rst = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 0: PASSED");
		else 
		    $error("Test case 0: FAILED");
		
		//TEST CASE 1
		#(CHECK_DELAY);
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 0)
		    $info("Test case 1: PASSED");
		else 
		    $error("Test case 1: FAILED");

		//TEST CASE 2
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 2: PASSED");
		else 
		    $error("Test case 2: FAILED");
		
		//TEST CASE 3
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 3: PASSED");
		else 
		    $error("Test case 3: FAILED");

		//TEST CASE 4
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 4: PASSED");
		else 
		    $error("Test case 4: FAILED");

		//TEST CASE 5
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 0)
		    $info("Test case 5: PASSED");
		else 
		    $error("Test case 5: FAILED");

		//TEST CASE 6
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 0)
		    $info("Test case 6: PASSED");
		else 
		    $error("Test case 6: FAILED");

		//TEST CASE 7
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 7: PASSED");
		else 
		    $error("Test case 7: FAILED");

		//TEST CASE 8
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 8: PASSED");
		else 
		    $error("Test case 8: FAILED");

		//TEST CASE 9
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 9: PASSED");
		else 
		    $error("Test case 9: FAILED");

		//TEST CASE 10
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 0)
		    $info("Test case 10: PASSED");
		else 
		    $error("Test case 10: FAILED");

		//TEST CASE 11
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 11: PASSED");
		else 
		    $error("Test case 11: FAILED");

		//TEST CASE 12
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 12: PASSED");
		else 
		    $error("Test case 12: FAILED");

		//TEST CASE 13
		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=1;
		tb_eop=1;
	
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==1)
		    $info("Test case 13: PASSED");
		else 
		   $error("Test case 13: FAILED");

		//TEST CASE 14
		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==0)
		    $info("Test case 14: PASSED");
		else 
		   $error("Test case 14: FAILED");

		//TEST CASE 15

		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==0)
		    $info("Test case 15: PASSED");
		else 
		   $error("Test case 15: FAILED");

		//TEST CASE 6
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 0)
		    $info("Test case 6: PASSED");
		else 
		    $error("Test case 6: FAILED");

		//TEST CASE 7
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 7: PASSED");
		else 
		    $error("Test case 7: FAILED");

		//TEST CASE 8
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 8: PASSED");
		else 
		    $error("Test case 8: FAILED");

		//TEST CASE 11
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 11: PASSED");
		else 
		    $error("Test case 11: FAILED");

		//TEST CASE 12
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 12: PASSED");
		else 
		    $error("Test case 12: FAILED");

		//TEST CASE 13
		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=1;
		tb_eop=1;
	
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==1)
		    $info("Test case 13: PASSED");
		else 
		   $error("Test case 13: FAILED");

		//TEST CASE 14
		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==0)
		    $info("Test case 14: PASSED");
		else 
		   $error("Test case 14: FAILED");

		//TEST CASE 15

		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==0)
		    $info("Test case 15: PASSED");
		else 
		   $error("Test case 15: FAILED");
		
		//TEST CASE 14
		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==0)
		    $info("Test case 14: PASSED");
		else 
		   $error("Test case 14: FAILED");

		//TEST CASE 15

		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==0)
		    $info("Test case 15: PASSED");
		else 
		   $error("Test case 15: FAILED");

		//TEST CASE 13
		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=1;
		tb_eop=1;
	
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==1)
		    $info("Test case 13: PASSED");
		else 
		   $error("Test case 13: FAILED");

		//TEST CASE 14
		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==0)
		    $info("Test case 14: PASSED");
		else 
		   $error("Test case 14: FAILED");

		//TEST CASE 13
		tb_n_rst = 1'b1;		
		tb_d_plus = 0;
		tb_shift_enable=1;
		tb_eop=1;
	
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig==1)
		    $info("Test case 13: PASSED");
		else 
		   $error("Test case 13: FAILED");

		//TEST CASE 12
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 12: PASSED");
		else 
		    $error("Test case 12: FAILED");

		//TEST CASE 11
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 11: PASSED");
		else 
		    $error("Test case 11: FAILED");

		//TEST CASE 6
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 0)
		    $info("Test case 6: PASSED");
		else 
		    $error("Test case 6: FAILED");

		//TEST CASE 7
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 7: PASSED");
		else 
		    $error("Test case 7: FAILED");

		//TEST CASE 11
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b1;
		tb_shift_enable = 1'b1;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 1)
		    $info("Test case 11: PASSED");
		else 
		    $error("Test case 11: FAILED");

		//TEST CASE 6
    		tb_n_rst = 1'b1;
    		tb_d_plus = 1'b0;
		tb_shift_enable = 1'b0;
		tb_eop = 1'b0;
		@(posedge tb_clk);
		#(CHECK_DELAY);
		if(tb_d_orig == 0)
		    $info("Test case 6: PASSED");
		else 
		    $error("Test case 6: FAILED");
	end


endmodule
