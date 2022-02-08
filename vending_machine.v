/*
 * Filename: vending_controller_fsm.v
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
module vending_controller(clk, reset, quarter_in, select1, select2, 
                 i, product1, product2, quarter_out);
  input clk;
  input reset;
  input quarter_in;			// A quarter has been inserted into the machine
  input select1;			// Selection for product 1
  input select2;			// Selection for product 2
  output reg [1:0] i;		// Amount inserted. Uses the following encoding:
  							//		00 = $0.00
  							//		01 = $0.25
  							//		10 = $0.50
  							//		11 = $0.75
  output reg product1;		// Product 1; costs $0.50
  output reg product2;		// Product 2; costs $0.75
  output reg quarter_out;	// A quarter has been dispensed by the machine
  
  typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6} statetype;
  statetype state, next_state;
  
  always @(posedge clk)
    begin
      if (reset)	state <= S0;
      else			state <= next_state;
    end
  
  always @(*)
    begin
      case(state)
        S0: 
          if(quarter_in) 
              next_state = S1;
        S1: 
          if(quarter_in) next_state = S2;
        S2:
          if(quarter_in) next_state = S3;
          else if(select1) next_state = S5;
        S3: 
          if(select2) next_state = S4;
          else if(select1) next_state = S6;
        S4:	
          next_state = S0;
        S5: 
          next_state = S0;
        S6: 
          next_state = S0;
        default: 
          next_state = S0;
      endcase
    end
  
  // Output logic
  assign i = {(state == S2 | state == S3 | state == S4 | state == S5 | state == S6),
              (state == S1 | state == S3 | state == S4 | state == S6)};
  assign product1 = (state == S5 | state == S6);
  assign product2 = (state == S4);
  assign quarter_out = (state == S6);
  
endmodule // vending_controller
