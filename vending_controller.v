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
module vending_controller(clk, reset, select1, select2, i,
                            product1, product2, selection);
  input clk;
  input reset;
  input select1;          // Selection for product 1
  input select2;          // Selection for product 2
  input [3:0] i;          // Amount inserted
  output product1;        // Product 1; costs $1.00
  output product2;        // Product 2; costs $1.50
  output [1:0] selection; // Selected product
  
  // State encodings
  parameter [2:0]
  S0 = 3'b000,
  S1 = 3'b001,
  S2 = 3'b010,
  S3 = 3'b011,
  S4 = 3'b100;
  
  reg [2:0] state, next_state;
  
  always @(posedge clk)
    begin
      if (reset)	state <= S0;
      else			state <= next_state;

      #1;

      case(state)
        S0: 
          if(select1 && select2) 
              next_state = S0;
            else if (select1 && ~select2)
              next_state = S1;
            else if (~select1 && select2)
              next_state = S2;
        S1: 
          if(select1 && select2)
              next_state = S0;
            else if (i[3] | i[2])
              next_state = S3;
        S2:
          if(select1 && select2)
              next_state = S0;
            else if (i[3] | (i[2] && i[1]))
              next_state = S4;
        S3:
          if(~i)
            next_state = S0;
        S4:	
          if(~i)
            next_state = S0;
        default: 
          next_state = S0;
      endcase
    end
  
  // Output logic
  assign product1 = (state == S3);
  assign product2 = (state == S4);
  assign selection = {(state == 2 | state == 4), (state == S1 | state == S3)};

  
endmodule // vending_controller
