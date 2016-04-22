// $Id: $
// File name:   tb_eop_detect.sv
// Created:     2/24/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 100ps

module tb_eop_detect ();
	   localparam	CLK_PERIOD = 10;
	   localparam	CHECK_DELAY = 1;
	 
	   reg tb_d_plus;
	   reg tb_d_minus;
	   reg tb_eop;

	   eop_detect DUT
	   (
	      	.d_plus(tb_d_plus),
	      	.d_minus(tb_d_minus),
	      	.eop(tb_eop)
	   );


	   initial
	   begin
			 //TEST CASE 1
			tb_d_plus = 0;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 1)
			  $info("Test case 1: Passed");
			else 
			  $error("Test case 1: FAILED");

			 //TEST CASE 2
			tb_d_plus = 1;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 2: Passed");
			else 
			  $error("Test case 2: FAILED");

			 //TEST CASE 3
			tb_d_plus = 0;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 3: Passed");
			else 
			  $error("Test case 3: FAILED");

			 //TEST CASE 4
			tb_d_plus = 1;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 4: Passed");
			else 
			  $error("Test case 4: FAILED");
				 //TEST CASE 3
			tb_d_plus = 0;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 3: Passed");
			else 
			  $error("Test case 3: FAILED");

			 //TEST CASE 2
			tb_d_plus = 1;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 2: Passed");
			else 
			  $error("Test case 2: FAILED");
			
			 //TEST CASE 3
			tb_d_plus = 0;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 3: Passed");
			else 
			  $error("Test case 3: FAILED");

			 //TEST CASE 4
			tb_d_plus = 1;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 4: Passed");
			else 
			  $error("Test case 4: FAILED");
				 //TEST CASE 3
			tb_d_plus = 0;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 3: Passed");
			else 
			  $error("Test case 3: FAILED");

			 //TEST CASE 3
			tb_d_plus = 0;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 1)
			  $info("Test case 3: Passed");
			else 
			  $error("Test case 3: FAILED");

			 //TEST CASE 4
			tb_d_plus = 1;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 4: Passed");
			else 
			  $error("Test case 4: FAILED");
			
			 //TEST CASE 2
			tb_d_plus = 1;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 2: Passed");
			else 
			  $error("Test case 2: FAILED");

			 //TEST CASE 3
			tb_d_plus = 0;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 3: Passed");
			else 
			  $error("Test case 3: FAILED");

			 //TEST CASE 4
			tb_d_plus = 0;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 1)
			  $info("Test case 4: Passed");
			else 
			  $error("Test case 4: FAILED");
			
			 //TEST CASE 2
			tb_d_plus = 1;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 2: Passed");
			else 
			  $error("Test case 2: FAILED");			
			
			 //TEST CASE 4
			tb_d_plus = 1;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 4: Passed");
			else 
			  $error("Test case 4: FAILED");

			 //TEST CASE 1
			tb_d_plus = 0;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 1)
			  $info("Test case 1: Passed");
			else 
			  $error("Test case 1: FAILED");

			 //TEST CASE 2
			tb_d_plus = 1;
			tb_d_minus =0;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 2: Passed");
			else 
			  $error("Test case 2: FAILED");

			 //TEST CASE 3
			tb_d_plus = 0;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 3: Passed");
			else 
			  $error("Test case 3: FAILED");

			 //TEST CASE 4
			tb_d_plus = 1;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 4: Passed");
			else 
			  $error("Test case 4: FAILED");
			//TEST CASE 3
			tb_d_plus = 0;
			tb_d_minus =1;
			#(CHECK_DELAY)
			if( tb_eop == 0)
			  $info("Test case 3: Passed");
			else 
			  $error("Test case 3: FAILED");
	     end // initial begin
endmodule // tb_eop_detect
