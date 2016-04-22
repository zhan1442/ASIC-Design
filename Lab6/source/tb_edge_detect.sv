// $Id: $
// File name:   tb_edge_detect.sv
// Created:     2/24/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_edge_detect
();
	   localparam	CLK_PERIOD = 10;
	   localparam	CHECK_DELAY = 1;
	 
	   reg tb_d_plus;
	   reg tb_d_edge;
	   reg tb_clk;
	   reg tb_n_rst;

	   edge_detect DUT
	   (
	      	.d_plus(tb_d_plus),
	      	.d_edge(tb_d_edge),
	      	.clk(tb_clk),
	      	.n_rst(tb_n_rst)
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
        tb_n_rst	= 1'b1;
        @(posedge tb_clk);
        tb_n_rst = 1'b0;
	
        //TEST CASE 1
	@(posedge tb_clk);
	tb_n_rst = 1'b1;		
	tb_d_plus = 1;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==1)
            $info("Test case 1: Passed");
        else 
           $error("Test case 1: Failed");

	//TEST CASE 2
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 0;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 2: Passed");
        else 
           $error("Test case 2: Failed");

	//TEST CASE 3
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 0;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==1)
            $info("Test case 3: Passed");
        else 
           $error("Test case 3: Failed");

	//TEST CASE 4
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 4: Passed");
        else 
           $error("Test case 4: Failed");

	//TEST CASE 5
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 5: Passed");
        else 
           $error("Test case 5: Failed");

	//TEST CASE 6
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 0;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 6: Passed");
        else 
           $error("Test case 6: Failed");

	//TEST CASE 7
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 7: Passed");
        else 
           $error("Test case 7: Failed");
	//TEST CASE 8
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==1)
            $info("Test case 8: Passed");
        else 
           $error("Test case 8: Failed");

	//TEST CASE 5
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 5: Passed");
        else 
           $error("Test case 5: Failed");

	//TEST CASE 6
	@(posedge tb_clk);
	tb_n_rst = 1'b0;
	tb_d_plus = 0;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 6: Passed");
        else 
           $error("Test case 6: Failed");

	//TEST CASE 7
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 7: Passed");
        else 
           $error("Test case 7: Failed");
	//TEST CASE 8
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==1)
            $info("Test case 8: Passed");
        else 
           $error("Test case 8: Failed");

	//TEST CASE 6
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 0;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 6: Passed");
        else 
           $error("Test case 6: Failed");

	//TEST CASE 7
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 7: Passed");
        else 
           $error("Test case 7: Failed");
	//TEST CASE 8
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==1)
            $info("Test case 8: Passed");
        else 
           $error("Test case 8: Failed");

	//TEST CASE 5
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 5: Passed");
        else 
           $error("Test case 5: Failed");

	//TEST CASE 6
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 0;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 6: Passed");
        else 
           $error("Test case 6: Failed");

	//TEST CASE 7
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 7: Passed");
        else 
           $error("Test case 7: Failed");

	//TEST CASE 8
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk); 
        #(CHECK_DELAY);
        if(tb_d_edge==1)
            $info("Test case 8: Passed");
        else 
           $error("Test case 8: Failed");

	//TEST CASE 5
	@(posedge tb_clk);
	tb_n_rst = 1'b1;
	tb_d_plus = 1;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 5: Passed");
        else 
           $error("Test case 5: Failed");

	//TEST CASE 6
	@(posedge tb_clk);
	tb_n_rst = 1'b0;
	tb_d_plus = 0;
	@(posedge tb_clk);
        #(CHECK_DELAY);
        if(tb_d_edge==0)
            $info("Test case 6: Passed");
        else 
           $error("Test case 6: Failed");
   end

	
endmodule
