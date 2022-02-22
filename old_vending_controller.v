/*
 * Filename: vending_controller.v
 * Authors: Anna Nguyen, David Wang, Shelby King
 * Date: 2/8/2022
 * Course: Introduction to VLSI Design EE4325.001 Spring 2022
 * Description:
 *		Simple vending machine FSM. Inspiration taken from project
 *		resourses, as well as the course text book - CMOS VLSI Design,
 *		Weste and Harris. 
 */

// vending_controller module
//		Intended to be the main controller for the vending machine.
//		Takes 5 inputs (clk, reset, quarter_in, select1, and select2),
//		and 4 outputs (i, product1, product2, and quarter_out). Uses 
//		a finite state machine to process input
module old_vending_controller(clk, reset, quarter_in, select1, select2, 
                 i, product1, product2, quarter_out);
  input clk;
  input reset;
  input quarter_in;			// A quarter has been inserted into the machine
  input select1;			// Selection for product 1
  input select2;			// Selection for product 2
  output [1:0] i;		// Amount inserted. Uses the following encoding:
  							//		00 = $0.00
  							//		01 = $0.25
  							//		10 = $0.50
  							//		11 = $0.75
  output product1;		// Product 1; costs $0.50
  output product2;		// Product 2; costs $0.75
  output quarter_out;	// A quarter has been dispensed by the machine
  
  // State encodings
  parameter [2:0]
  S0 = 3'b000,
  S1 = 3'b001,
  S2 = 3'b010,
  S3 = 3'b011,
  S4 = 3'b100,
  S5 = 3'b101,
  S6 = 3'b110,
  S7 = 3'b111;
  
  reg [2:0] state, next_state;
  
  always @(posedge clk)
    begin
      if (reset)	state = S0;
      else			state = next_state;
    end

  always @(quarter_in or select1 or select2)
    begin
      #1;
      case(state)
        S0: 
          if(quarter_in) 
              next_state = S1;
            //else
              //next_state = S0;
        S1: 
          if(quarter_in) next_state = S2;
        S2:
          if(quarter_in) next_state = S3;
          else if (select1 && select2) next_state = S2;
          else if(select1) next_state = S5;
        S3:
          if(quarter_in) next_state = S7;
          else if (select1 && select2) next_state = S3;
          else if(select1) next_state = S6;
          else if(select2) next_state = S4;
        S4:	
          next_state = S0;
        S5: 
          next_state = S0;
        S6: 
          next_state = S0;
        S7:
          next_state = S3;
        default: 
          next_state = S0;
      endcase
    end
  
  // Output logic
  assign i = {(state == S2 | state == S3 | state == S4 | state == S5 | state == S6 | state == S7),
              (state == S1 | state == S3 | state == S4 | state == S6 | state == S7)};
  assign product1 = (state == S5 | state == S6);
  assign product2 = (state == S4);
  assign quarter_out = (state == S6 | state == S7);
  
endmodule // vending_controller
