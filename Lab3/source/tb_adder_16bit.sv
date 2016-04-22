// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 16 bit adder design 

`timescale 1ns / 100ps

module tb_adder_16bit
();
	// Define local parameters used by the test bench
	localparam NUM_INPUT_BITS			= 16;
	localparam NUM_OUTPUT_BITS		= NUM_INPUT_BITS + 1;
	localparam MAX_OUTPUT_BIT			= NUM_OUTPUT_BITS - 1;
	localparam NUM_TEST_BITS 			= (NUM_INPUT_BITS * 2) + 1;
	localparam MAX_TEST_BIT				= NUM_TEST_BITS - 1;
	localparam NUM_TEST_CASES 		= 7;
	localparam MAX_TEST_VALUE 		= NUM_TEST_CASES - 1;
	localparam TEST_A_BIT					= 0;
	localparam TEST_B_BIT					= NUM_INPUT_BITS;
	localparam TEST_CARRY_IN_BIT	= MAX_TEST_BIT;
	localparam TEST_SUM_BIT				= 0;
	localparam TEST_CARRY_OUT_BIT	= MAX_OUTPUT_BIT;
	localparam TEST_DELAY					= 10;

	// Declare Design Under Test (DUT) portmap signals
	wire	[15:0]tb_a;
	wire	[15:0]tb_b;
	wire	tb_carry_in;
	wire	[15:0]tb_sum;
	wire	tb_carry_out;
	
	// Declare test bench signals
	integer tb_test_case;
	reg [32:0] tb_test_inputs;
	reg [32:0] tb_expected_outputs;
	
	// DUT port map
	adder_16bit DUT(.a(tb_a), .b(tb_b), .carry_in(tb_carry_in), .sum(tb_sum), .overflow(tb_carry_out));
	
	// Connect individual test input bits to a vector for easier testing
	assign tb_a					= tb_test_inputs[15:0];
	assign tb_b					= tb_test_inputs[31:16];
	assign tb_carry_in	= tb_test_inputs[32];
	
	// Test bench process
	initial
	begin
	   
	   //TESTCASE1
	   tb_test_inputs[15:0] = 16'h0000;
           tb_test_inputs[31:16] = 16'h0000;
           tb_test_inputs[32] = 1'b0;

	   
	   // Wait for a bit to allow this process to catch up with assign statements triggered
	   // by test input assignment above
      	   #1;
			
	   // Calculate the expected outputs
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
           // Wait for DUT to process the inputs
           #(TEST_DELAY - 1);
	   		
           // Check the DUT's Sum output value
           assert(tb_expected_outputs[NUM_INPUT_BITS-1:TEST_SUM_BIT] == tb_sum)
	       $info("Correct Sum value for test case %d!", tb_test_case);
	   else
	       $error("Incorrect Sum value for test case %d!", tb_test_case);

			
	   // Check the DUT's Carry Out output value
	   assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	       $info("Correct Carry Out value for test case %d!", tb_test_case);
	   else
               $error("Incorrect Carry Out value for test case %d!", tb_test_case);
           tb_test_case = 1;
	   
	   //TESTCASE2
	   tb_test_inputs[15:0] = 16'hFFFA;
           tb_test_inputs[31:16] = 16'h0001;
           tb_test_inputs[32] = 1'b0;
           
	   // Wait for a bit to allow this process to catch up with assign statements triggered
	   // by test input assignment above
      	   #1;
			
	   // Calculate the expected outputs
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
           // Wait for DUT to process the inputs
           #(TEST_DELAY - 1);
			
           // Check the DUT's Sum output value
           // Check the DUT's Sum output value
           assert(tb_expected_outputs[NUM_INPUT_BITS-1:TEST_SUM_BIT] == tb_sum)
	       $info("Correct Sum value for test case %d!", tb_test_case);
	   else
	       $error("Incorrect Sum value for test case %d!", tb_test_case);

			
	   // Check the DUT's Carry Out output value
	   assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	       $info("Correct Carry Out value for test case %d!", tb_test_case);
	   else
               $error("Incorrect Carry Out value for test case %d!", tb_test_case);
           tb_test_case = 2;
	   

           //TESTCASE3
	   tb_test_inputs[15:0] = 16'h0001;
           tb_test_inputs[31:16] = 16'hFFFA;
           tb_test_inputs[32] = 1'b0;
	   

			
	   // Wait for a bit to allow this process to catch up with assign statements triggered
	   // by test input assignment above
      	   #1;
			
	   // Calculate the expected outputs
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
           // Wait for DUT to process the inputs
           #(TEST_DELAY - 1);
			
           // Check the DUT's Sum output value
           assert(tb_expected_outputs[NUM_INPUT_BITS-1:TEST_SUM_BIT] == tb_sum)
	       $info("Correct Sum value for test case %d!", tb_test_case);
	   else
	       $error("Incorrect Sum value for test case %d!", tb_test_case);

			
	   // Check the DUT's Carry Out output value
	   assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	       $info("Correct Carry Out value for test case %d!", tb_test_case);
	   else
               $error("Incorrect Carry Out value for test case %d!", tb_test_case);

           tb_test_case = 3;
	   

           //TESTCASE4
	   tb_test_inputs[15:0] = 16'hAAFF;
           tb_test_inputs[31:16] = 16'hFFAA;
           tb_test_inputs[32] = 1'b0;
	   

	   // Wait for a bit to allow this process to catch up with assign statements triggered
	   // by test input assignment above
      	   #1;
			
	   // Calculate the expected outputs
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
           // Wait for DUT to process the inputs
           #(TEST_DELAY - 1);
			
           // Check the DUT's Sum output value
           assert(tb_expected_outputs[NUM_INPUT_BITS-1:TEST_SUM_BIT] == tb_sum)
	       $info("Correct Sum value for test case %d!", tb_test_case);
	   else
	       $error("Incorrect Sum value for test case %d!", tb_test_case);

			
	   // Check the DUT's Carry Out output value
	   assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	       $info("Correct Carry Out value for test case %d!", tb_test_case);
	   else
               $error("Incorrect Carry Out value for test case %d!", tb_test_case);
           tb_test_case = 4;
	   
           //TESTCASE5
	   tb_test_inputs[15:0] = 16'h0002;
           tb_test_inputs[31:16] = 16'h0001;
           tb_test_inputs[32] = 1'b0;
	   

			
	   // Wait for a bit to allow this process to catch up with assign statements triggered
	   // by test input assignment above
      	   #1;
			
	   // Calculate the expected outputs
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
           // Wait for DUT to process the inputs
           #(TEST_DELAY - 1);
			
           // Check the DUT's Sum output value
           assert(tb_expected_outputs[NUM_INPUT_BITS-1:TEST_SUM_BIT] == tb_sum)
	       $info("Correct Sum value for test case %d!", tb_test_case);
	   else
	       $error("Incorrect Sum value for test case %d!", tb_test_case);

			
	   // Check the DUT's Carry Out output value
	   assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	       $info("Correct Carry Out value for test case %d!", tb_test_case);
	   else
               $error("Incorrect Carry Out value for test case %d!", tb_test_case);

           tb_test_case = 5;
	   
	   //TESTCASE6
	   tb_test_inputs[15:0] = 16'h0CAD;
           tb_test_inputs[31:16] = 16'hABCD;
           tb_test_inputs[32] = 1'b1;
	   

			
	   // Wait for a bit to allow this process to catch up with assign statements triggered
	   // by test input assignment above
      	   #1;
			
	   // Calculate the expected outputs
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
           // Wait for DUT to process the inputs
           #(TEST_DELAY - 1);
			
           // Check the DUT's Sum output value
           assert(tb_expected_outputs[NUM_INPUT_BITS-1:TEST_SUM_BIT] == tb_sum)
	       $info("Correct Sum value for test case %d!", tb_test_case);
	   else
	       $error("Incorrect Sum value for test case %d!", tb_test_case);

			
	   // Check the DUT's Carry Out output value
	   assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	       $info("Correct Carry Out value for test case %d!", tb_test_case);
	   else
               $error("Incorrect Carry Out value for test case %d!", tb_test_case);

           tb_test_case = 6;

           //TESTCASE7
	   tb_test_inputs[15:0] = 16'h0101;
           tb_test_inputs[31:16] = 16'h0ADF;
           tb_test_inputs[32] = 1'b0;
	   

			
	   // Wait for a bit to allow this process to catch up with assign statements triggered
	   // by test input assignment above
      	   #1;
			
	   // Calculate the expected outputs
	   tb_expected_outputs = tb_a + tb_b + tb_carry_in;
			
           // Wait for DUT to process the inputs
           #(TEST_DELAY - 1);
			
           // Check the DUT's Sum output value
           assert(tb_expected_outputs[NUM_INPUT_BITS-1:TEST_SUM_BIT] == tb_sum)
	       $info("Correct Sum value for test case %d!", tb_test_case);
	   else
	       $error("Incorrect Sum value for test case %d!", tb_test_case);

			
	   // Check the DUT's Carry Out output value
	   assert(tb_expected_outputs[TEST_CARRY_OUT_BIT] == tb_carry_out)
	       $info("Correct Carry Out value for test case %d!", tb_test_case);
	   else
               $error("Incorrect Carry Out value for test case %d!", tb_test_case);

           tb_test_case = 7;
	  
	end
	
	final
	begin
	assert (NUM_TEST_CASES == tb_test_case)
	  	$info("This test bench has run to completion");
        else
	    	$error("This test bench was not run long enough to execute all test cases. Please run this test bench for at least a total of %d ns", (NUM_TEST_CASES * TEST_DELAY));
	end
endmodule
