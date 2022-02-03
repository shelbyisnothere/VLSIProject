/*
 * Filename: vending_testbench.vhd
 * Authors: Anna Nguyen, David Wang, Shelby King
 * Date: 2/8/2022
 * Course: Introduction to VLSI Design EE4325.001 Spring 2022
 * Description:
 *	Test bench for vending machine FSM.
 */

// TO DO: Rename file to have verilog format (i think this is in vhdl format??)

module vending_fsm_testbench;
  logic clk, reset, quarter_in, select1, select2;
  logic [1:0] i;
  logic product1, product2, quarter_out;
  
  reg [5:0] step_counter;
  logic end_sim;
  
  // Instantiate FSM
  vending_machine_fsm FSM(clk, reset, quarter_in, select1, select2, 
                          i, product1, product2, quarter_out);
  // Start clock
  always
    begin
      clk = 1; 	#5;
      clk = 0;	#5;
    end

  initial
    // Start test, set necessary values
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1, vending_fsm_testbench);
      // Set couter
      step_counter = 6'b000000;
      
      // Load inputs, pulse reset
      quarter_in = 0;
      select1 = 0;
      select2 = 0;
      reset = 1;		#10;
      reset = 0;		#10;
    end
  
  // Apply test inputs on rising edge of clock
  always @(posedge clk)
    begin
      #1;
      // Case statement for test steps
      case(step_counter)
        /* Test 1: 
         * 		Purchase product 1 with $0.50.
         */
        0: quarter_in = 1;
      	1: quarter_in = 1;
        2: /* nothing - user thinks */;
        3: select1 = 1;
        4: /* wait for product */;
        /* Test 2:
         * 		Purchase product 1 with $0.75
         */
        5: quarter_in = 1;
        default: end_sim = 1;
      endcase
      step_counter += 1;
    end
    
      // Check results on descending edge of clock
      always @(negedge clk)
        begin
          if(~reset) 
            begin
              if(product1)		// Product 1 is being dispensed
                begin
                  //Display dispensed product and reset selection
                  $display("Product1 has been dispensed");
                  select1 = 0;
                end
              
              if(product2)		// Product 2 is being dispensed
                begin
                  //Display dispensed product and reset selection
                  $display("Product2 has been dispensed");
                  select2 = 0;
                end
              
              if(quarter_out)	// Quarter change is being dispensed
                $display("Dispensed quarter");
              
              if(quarter_in) 	// Quarter inserted
                begin
                  // Display money inserted and reset quarter_in signal
                  $display("Money inserted: %0h%0h", i[1], i[0]);
                  quarter_in = 0;
                end
              
              if(select1) 		// Product 1 selected ($0.50)
                begin
                  // If select2 was enabled, user changed their mind before enough money was inserted
                  if(select2)
                    select2 = 0;
                  // Display selection
                  $display("Product1 selected!");
                end
              
              if(select2) 		// Product 2 selected ($0.75)
                begin
                  // If select1 was enabled, user changed their mind before enough money was inserted
                  if(select1)
                    select1 = 0;
                  $display("Product2 selected!");
                end
              
              if(end_sim)
                $finish;
            end
        end
endmodule
