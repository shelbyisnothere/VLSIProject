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
 */

// vending_controller_testbench
//		Testbench for the vending machine project. Reads from an input
//		file using the readmemb verilog standard function. Cases defined
//		and explained are located in the test_input.tv file.
module vending_fsm_testbench;
  reg clk, reset, quarter_in, dollar_in, select1, select2;
  wire [3:0] i;
  wire [1:0] selection;
  wire [2:0] quarter_out;
  wire product1, product2, dollar_out;
  
  // For validation
  reg [31:0] vector_count, errors;
  reg [15:0] test_vectors[10000:0];
  reg [3:0] i_expected;
  reg [2:0] qout_expected;
  reg p1_expected, p2_expected, dout_expected;
  
  // Instantiate FSM
  vending_controller vending_ctrllr(clk, reset, select1, select2, i,
                                      product1, product2, selection);
  
  change_calculator change(clk, reset, quarter_in, dollar_in, selection,
                              i, quarter_out, dollar_out);
  
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
      $dumpvars(1, vending_fsm_testbench);
      $readmemb("test_input.txt", test_vectors);
      
      // Set validation values
      vector_count = 0;
      errors = 0;
      
      // Pulse reset
      reset = 1;		#22;
      reset = 0;
    end
  
  // Apply test inputs on rising edge of clock
  always @(posedge clk)
    begin
      #1;
      {quarter_in, dollar_in, select1, select2, i_expected, p1_expected, p2_expected, qout_expected, dout_expected} = test_vectors[vector_count];
    end
  
  // Check results on descending edge of clock
  always @(negedge clk)
    if(~reset)
      begin
        if ((i[3] != i_expected[3] | i[2] != i_expected[2] | i[1] != i_expected[1]) | (i[0] != i_expected[0]))
          begin
            $display("ERROR: Incorrect value for i");
            $display("		inputs = %b", {quarter_in, dollar_in, select1, select2});
            $display("		outputs = %b", {i, quarter_out, dollar_out, product1, product2});
            $display("		expected outputs = %b", {i_expected, qout_expected, dout_expected, p1_expected, p2_expected});
            errors = errors + 1;
          end
        if ((product1 != p1_expected) | (product2 != p2_expected))
          begin
            $display("ERROR: Incorrect value for a product");
            $display("		inputs = %b", {quarter_in, dollar_in, select1, select2});
            $display("		outputs = %b", {i, quarter_out, dollar_out, product1, product2});
            $display("		expected outputs = %b", {i_expected, qout_expected, dout_expected, p1_expected, p2_expected});
            errors = errors + 1;
          end
        if (quarter_out != qout_expected)
          begin
            $display("ERROR: Incorrect value for quarter_out");
            $display("		inputs = %b", {quarter_in, dollar_in, select1, select2});
            $display("		outputs = %b", {i, quarter_out, dollar_out, product1, product2});
            $display("		expected outputs = %b", {i_expected, qout_expected, dout_expected, p1_expected, p2_expected});
            errors = errors + 1;
          end
        
        if (dollar_out != dout_expected)
          begin
            $display("ERROR: Incorrect value for dollar_out");
            $display("		inputs = %b", {quarter_in, dollar_in, select1, select2});
            $display("		outputs = %b", {i, quarter_out, dollar_out, product1, product2});
            $display("		expected outputs = %b", {i_expected, qout_expected, dout_expected, p1_expected, p2_expected});
            errors = errors + 1;
          end
        
        vector_count = vector_count + 1;

        if(test_vectors[vector_count] === 16'bx)
          begin
            $display("%d tests completed with %d errors", vector_count, errors);
            $stop;
          end
      end
  
endmodule // vending_controller_testbench
