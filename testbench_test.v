/*
 * Filename: testbench.v
 * Authors: Anna Nguyen, David Wang, Shelby King
 * Date: 2/8/2022
 * Course: Introduction to VLSI Design EE4325.001 Spring 2022
 * Description:
 *	Test bench for vending machine FSM. Inspiration taken from project
 *		resourses, as well as the course text book - CMOS VLSI Design,
 *		Weste and Harris. 
 *	
 *      NOTE!!! This file is a quick work around for sythensis errors in the original.
 */

// vending_controller_testbench
//		Testbench for the vending machine project. Reads from an input
//		file using the readmemb verilog standard function. Cases defined
//		and explained are located in the test_input.tv file.
module vending_controller_testbench_test;
  reg clk, reset, quarter_in, select1, select2;
  wire [1:0] i;
  wire product1, product2, quarter_out;
  
  reg [5:0] step_counter;
  reg end_sim;
  
  // For validation
  reg [31:0] vector_count, errors;
  reg [7:0] test_vectors[10000:0];
  reg [1:0] i_expected;
  reg p1_expected, p2_expected, qout_expected;
  
  // Instantiate FSM
  vending_controller FSM(clk, reset, quarter_in, select1, select2, 
                          i, product1, product2, quarter_out);
  // Start clock
  always
    begin
      clk = 1; 	#5;
      clk = 0;	 #5;
    end

  initial
    // Start test, set necessary values
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1, vending_controller_testbench_test);
      // TO DO: figure out a work around for reading text files!
      //$readmemb("test_input.txt", test_vectors);
      
      // Set counter variables
      step_counter = 6'b000000;
      end_sim = 1'b0;

      // Set validation values
      vector_count = 0;
      errors = 0;
      
      // Pulse reset
      reset = 0;		#3;
      reset = 1;		#10;
      reset = 0;
    end
  
  // Apply test inputs on rising edge of clock
  always @(posedge clk)
    begin
      #1;
      // Set test_vector
      case(step_counter)
        0: test_vectors[vector_count] = 8'b00000000; 
        default: end_sim = 1'b1;    
      endcase

      // Read vector
      {quarter_in, select1, select2, i_expected, p1_expected, p2_expected, qout_expected} = test_vectors[vector_count];

      step_counter = step_counter + 1;
    end
  
  // Check results on descending edge of clock
  always @(negedge clk)
    if(~reset)
      begin
        if ((i[1] != i_expected[1]) | (i[0] != i_expected[0]))
          begin
            $display("ERROR: Incorrect value for i");
            $display("		inputs = %b", {quarter_in, select1, select2});
            $display("		outputs = %b", {i[1], i[0], quarter_out, product1, product2});
            $display("		expected outputs = %b", {i_expected[1], i_expected[0], qout_expected, p1_expected, p2_expected});
            errors = errors + 1;
          end
        if ((product1 != p1_expected) | (product2 != p2_expected))
          begin
            $display("ERROR: Incorrect value for a product");
            $display("		inputs = %b", {quarter_in, select1, select2});
            $display("		outputs = %b", {i[1], i[0], quarter_out, product1, product2});
            $display("		expected outputs = %b", {i_expected[1], i_expected[0], qout_expected, p1_expected, p2_expected});
            errors = errors + 1;
          end
        if (quarter_out != qout_expected)
          begin
            $display("ERROR: Incorrect value for quarter_out");
            $display("		inputs = %b", {quarter_in, select1, select2});
            $display("		outputs = %b", {i[1], i[0], quarter_out, product1, product2});
            $display("		expected outputs = %b", {i_expected[1], i_expected[0], qout_expected, p1_expected, p2_expected});
            errors = errors + 1;
          end
        
        vector_count = vector_count + 1;
        // TO DO: find a work around for checking X value so the program can stop
        if(end_sim)
          begin
            $display("%d tests completed with %d errors", vector_count, errors);
            $stop;
          end
      end
  
endmodule // vending_controller_testbench_test
