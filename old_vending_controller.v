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
  parameter [3:0]
  S0 = 4'b0000,
  S1 = 4'b0001,
  S2 = 4'b0010,
  S3 = 4'b0011,
  S4 = 4'b0100,
  S5 = 4'b0101,
  S6 = 4'b0110,
  S7 = 4'b0111;
  
  reg [1:0] i;		// Amount inserted. Uses the following encoding:
  							//		00 = $0.00
  							//		01 = $0.25
  							//		10 = $0.50
  							//		11 = $0.75
  reg product1;		// Product 1; costs $0.50
  reg product2;		// Product 2; costs $0.75
  reg quarter_out;	// A quarter has been dispensed by the machine
  
  reg [3:0] state, next_state;
  
  always @(posedge clk)
    begin
      if (reset)	state <= S0;
      else			state <= next_state;
    end

  always @(clk or reset or quarter_in or select1 or select2)
    begin
      #1;
      next_state = S0;
      case(state) /*synthesis full_case*/
        S0: 
          begin
            i[1] = 0; i[0] = 0;
            product1 = 0; product2 = 0;
            quarter_out = 0;
            if(quarter_in) 
              next_state = S1;
            else
              next_state = S0;
          end
        S1: 
          begin
            i[1] = 0; i[0] = 1;
            product1 = 0; product2 = 0;
            quarter_out = 0;
            if(quarter_in) next_state = S2;
            else
              next_state = S1;
          end
        S2:
          begin
            i[1] = 1; i[0] = 0;
            product1 = 0; product2 = 0;
            quarter_out = 0;
            if(quarter_in) next_state = S3;
            else if (select1 && select2) next_state = S2;
            else if(select1) next_state = S5;
            else 
              next_state = S2;
          end
        S3:
          begin
            i[1] = 1; i[0] = 1;
            product1 = 0; product2 = 0;
            quarter_out = 0;
            if(quarter_in) next_state = S7;
            else if (select1 && select2) next_state = S3;
            else if(select1) next_state = S6;
            else if(select2) next_state = S4;
            else 
              next_state = S3;
         end
        S4:	
          begin
            i[1] = 1; i[0] = 1;
            product1 = 0; product2 = 1;
            quarter_out = 0;
            next_state = S0;
          end
        S5: 
          begin
            i[1] = 1; i[0] = 0;
            product1 = 1; product2 = 0;
            quarter_out = 0;
            next_state = S0;
          end
        S6: 
          begin
            i[1] = 1; i[0] = 1;
            product1 = 1; product2 = 0;
            quarter_out = 1;
            next_state = S0;
          end
        S7:
          begin
            i[1] = 1; i[0] = 1;
            product1 = 0; product2 = 0;
            quarter_out = 1;
            next_state = S3;
          end
        default:
          begin
            i[1] = 0; i[0] = 0;
            product1 = 0; product2 = 0;
            quarter_out = 0;
            next_state = S0;
          end
      endcase
    end
  
  // Output logic
  /*
  assign i = {(state == S2 | state == S3 | state == S4 | state == S5 | state == S6 | state == S7),
              (state == S1 | state == S3 | state == S4 | state == S6 | state == S7)};
  assign product1 = (state == S5 | state == S6);
  assign product2 = (state == S4);
  assign quarter_out = (state == S6 | state == S7);
  */
  
endmodule // vending_controller
