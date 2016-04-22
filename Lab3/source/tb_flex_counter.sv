// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 16 bit adder design 

`timescale 1ns / 100ps

module tb_flex_counter
();
	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 2.5;
	localparam	CHECK_DELAY = 1; // Check 1ns after the rising edge to allow for propagation delay
    	localparam  NUM_CNT_BITS = 4;


    	reg tb_clk;
    	reg tb_n_rst;
    	reg tb_clear;
    	reg tb_count_enable;
    	reg [NUM_CNT_BITS-1:0] tb_rollover_val;
    	reg [NUM_CNT_BITS-1:0] tb_count_out;
    	reg tb_rollover_flag;
	
	flex_counter DUT
    	( 
		.clk( tb_clk ),
		.n_rst( tb_n_rst ),
		.clear( tb_clear ),
		.count_enable( tb_count_enable ),
		.rollover_val( tb_rollover_val ),
		.count_out( tb_count_out ),
		.rollover_flag( tb_rollover_flag ) 
    	);

	// Clock generation block
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
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk)

		//TEST CASE 1
		tb_n_rst = 1'b1;		
		tb_rollover_val = 4;
		tb_count_enable = 1'b0;
		tb_clear = 1'b1;

		@(posedge tb_clk); 
		#(CHECK_DELAY);
		if(tb_count_out == 0 && tb_rollover_flag == 0)
		    $info("Test case 1: PASSED");
		else 
		    $error("Test case 1: FAILED");
		
		
		//TEST CASE 2
		
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
		@(posedge tb_clk)
		
		tb_n_rst = 1'b0;		
		tb_rollover_val = 3;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

	    
		#(CHECK_DELAY);
		if(tb_count_out == 0 && tb_rollover_flag == 0)
		    $info("Test case 2: PASSED");
		else 
		    $error("Test case 2: FAILED");


		//TEST CASE 3
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	       

		tb_n_rst = 1'b1;		
		tb_rollover_val = 5;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		 

		#(CHECK_DELAY);
		if(tb_count_out == 1 && tb_rollover_flag == 0)
		    $info("Test case 3: PASSED");
		else 
		    $error("Test case 3: FAILED");

		//TEST CASE 4
		
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0; 
		
		tb_n_rst = 1'b1;		
		tb_rollover_val = 5;
		tb_count_enable = 1'b0;
		
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
	      

		#(CHECK_DELAY);
		if(tb_count_out == 0 && tb_rollover_flag == 0)
		    $info("Test case 4: PASSED");
		else 
		    $error("Test case 4: FAILED");


		//TEST CASE 5
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	      
		tb_n_rst = 1'b1;		
		tb_rollover_val = 5;
		tb_count_enable = 1'b1;
		

		@(posedge tb_clk); 
		@(posedge tb_clk);
		tb_n_rst = 1'b0; 
		@(posedge tb_clk);
		tb_n_rst = 1'b1;
		@(posedge tb_clk);

		#(CHECK_DELAY);
		if(tb_count_out == 2 && tb_rollover_flag == 0)
		    $info("Test case 5: PASSED");
		else 
		    $error("Test case 5: FAILED");

		//TEST CASE 6
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	       

		tb_n_rst = 1'b1;		
		tb_rollover_val = 6;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		#(CHECK_DELAY);
		if(tb_count_out == 6 && tb_rollover_flag == 1)
		    $info("Test case 6: PASSED");
		else 
		    $error("Test case 6: FAILED");


		//TEST CASE 7
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	       

		tb_n_rst = 1'b1;		
		tb_rollover_val = 7;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		 

		#(CHECK_DELAY);
		if(tb_count_out == 6 && tb_rollover_flag == 0)
		    $info("Test case 7: PASSED");
		else 
		    $error("Test case 7: FAILED");

		//TEST CASE 8
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	       

		tb_n_rst = 1'b1;		
		tb_rollover_val = 8;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		 

		#(CHECK_DELAY);
		if(tb_count_out == 8 && tb_rollover_flag == 1)
		    $info("Test case 8: PASSED");
		else 
		    $error("Test case 8: FAILED");


		//TEST CASE 9
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	       

		tb_n_rst = 1'b1;		
		tb_rollover_val = 9;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		 

		#(CHECK_DELAY);
		if(tb_count_out == 9 && tb_rollover_flag == 1)
		    $info("Test case 9: PASSED");
		else 
		    $error("Test case 9: FAILED");


		//TEST CASE 10
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	       

		tb_n_rst = 1'b1;		
		tb_rollover_val = 10;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		 

		#(CHECK_DELAY);
		if(tb_count_out == 10 && tb_rollover_flag == 1)
		    $info("Test case 10: PASSED");
		else 
		    $error("Test case 10: FAILED");
		    

		//TEST CASE 11
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	       

		tb_n_rst = 1'b1;		
		tb_rollover_val = 11;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		 

		#(CHECK_DELAY);
		if( (tb_count_out == tb_rollover_val) && ( tb_rollover_flag == 1 ) )
		    $info("Test case 11: PASSED");
		else 
		    $error("Test case 11: FAILED");
	    
		//TEST CASE 12
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
	       

		tb_n_rst = 1'b1;		
		tb_rollover_val = 12;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		 

		#(CHECK_DELAY);
		if( (tb_count_out == tb_rollover_val) && ( tb_rollover_flag == 1 ) )
		    $info("Test case 12: PASSED");
		else 
		    $error("Test case 12: FAILED");


		//TEST CASE 13
		@(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;

		tb_n_rst = 1'b1;		
		tb_rollover_val = 13;
		tb_count_enable = 1'b1;
		tb_clear = 1'b0;

		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk); 
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		

		#(CHECK_DELAY);
		if( (tb_count_out == tb_rollover_val) && ( tb_rollover_flag == 1 ) )
		    $info("Test case 13: PASSED");
		else 
		    $error("Test case 13: FAILED");



    	end




endmodule
	
