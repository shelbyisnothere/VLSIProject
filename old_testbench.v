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
module old_vending_controller_testbench;
  reg clk, reset, quarter_in, select1, select2, select3;
  wire [3:0] i;
  wire product1, product2, product3;
  wire [2:0] quarter_out;
  
  // For validation
  reg [31:0] vector_count, errors;
  reg [13:0] test_vectors[10000:0];
  reg [3:0] i_expected;
  reg p1_expected, p2_expected, p3_expected;
  reg [2:0] qout_expected;
  
  // Instantiate FSM
  old_vending_controller FSM(clk, reset, quarter_in, select1, select2, select3,
                          i, product1, product2, product3, quarter_out);
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
      $dumpvars(1, old_vending_controller_testbench);
      $readmemb("old_test_input.txt", test_vectors);
      
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
      {quarter_in, select1, select2,select3, i_expected, p1_expected, p2_expected, p3_expected, qout_expected} = test_vectors[vector_count];
    end
  
  // Check results on descending edge of clock
  always @(negedge clk)
    if(~reset)
      begin
        if ((i[1] !== i_expected[1]) | (i[0] !== i_expected[0]))
          begin
            $display("ERROR: Incorrect value for i");
            $display("		inputs = %b", {quarter_in, select1, select2, select3});
            $display("		outputs = %b", {i, quarter_out, product1, product2, product3});
            $display("		expected outputs = %b", {i_expected, qout_expected, p1_expected, p2_expected, p3_expected});
            errors = errors + 1;
          end
        if ((product1 !== p1_expected) | (product2 !== p2_expected))
          begin
            $display("ERROR: Incorrect value for a product");
            $display("		inputs = %b", {quarter_in, select1, select2, select3});
            $display("		outputs = %b", {i, quarter_out, product1, product2, product3});
            $display("		expected outputs = %b", {i_expected, qout_expected, p1_expected, p2_expected, p3_expected});
            errors = errors + 1;
          end
        if (quarter_out !== qout_expected)
          begin
            $display("ERROR: Incorrect value for quarter_out");
            $display("		inputs = %b", {quarter_in, select1, select2, select3});
            $display("		outputs = %b", {i, quarter_out, product1, product2, product3});
            $display("		expected outputs = %b", {i_expected, qout_expected, p1_expected, p2_expected, p3_expected});
            errors = errors + 1;
          end
        
        vector_count = vector_count + 1;
        
        if(test_vectors[vector_count] === 14'bx)
          begin
            $display("%d tests completed with %d errors", vector_count, errors);
            $stop;
          end
      end
  
endmodule // vending_controller_testbench
