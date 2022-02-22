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
module old_vending_controller(clk, reset, quarter_in, dollar_in, select1, select2, select3,
                 i, product1, product2, product3, quarter_out, dollar_out);
  input clk;
  input reset;
  input quarter_in;			// A quarter has been inserted into the machine
  input dollar_in;    // A dollar has been inserted into the machine
  input select1;			// Selection for product 1
  input select2;			// Selection for product 2
  input select3;
  output [3:0] i;		// Amount inserted. Uses the following encoding:
  							//		00 = $0.00
  							//		01 = $0.25
  							//		10 = $0.50
  							//		11 = $0.75
  output product1;		// Product 1; costs $0.50
  output product2;		// Product 2; costs $0.75
  output product3;  // Product 3; costs $1.00
  output [2:0] quarter_out;	// A quarter has been dispensed by the machine
  output dollar_out;        // A dollar has been dispensed by the machine
  
  // State encodings
  parameter [4:0]
  S0 = 5'b00000,
  S1 = 5'b00001,
  S2 = 5'b00010,
  S3 = 5'b00011,
  S4 = 5'b00100,
  S5 = 5'b00101,
  S6 = 5'b00110,
  S7 = 5'b00111,
  S8 = 5'b01000,
  S9 = 5'b01001,
  S10 = 5'b01010,
  S11 = 5'b01011,
  S12 = 5'b01100,
  S13 = 5'b01101,
  S14 = 5'b01110,
  S15 = 5'b01111,
  S16 = 5'b10000,
  S17 = 5'b10001,
  S18 = 5'b10010,
  S19 = 5'b10011,
  S20 = 5'b10100,
  S21 = 5'b10101,
  S22 = 5'b10110,
  S23 = 5'b10111;
  
  reg [3:0] i;		// Amount inserted. Uses the following encoding:
  							//		00 = $0.00
  							//		01 = $0.25
  							//		10 = $0.50
  							//		11 = $0.75
  reg product1;		// Product 1; costs $0.50
  reg product2;		// Product 2; costs $0.75
  reg product3;  // Product 3; costs $1.00
  reg [2:0] quarter_out;	// A quarter has been dispensed by the machine
  reg dollar_out;        // A dollar has been dispensed by the machine
  
  reg [4:0] state, next_state;
  
  always @(posedge clk)
    begin
      if (reset)	state <= S0;
      else			state <= next_state;
    end

  always @(clk or reset or quarter_in or select1 or select2 or select3)
    begin
      #1;
      next_state = S0;
      case(state) /*synthesis full_case*/
        S0: 
          begin
            i[3] = 0; i[2] = 0; i[1] = 0; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            if(quarter_in) next_state = S1;
            else if(dollar_in) next_state = S8;
            else
              next_state = S0;
          end
        S1: 
          begin
            i[3] = 0; i[2] = 0; i[1] = 0; i[0] = 1;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            if(quarter_in) next_state = S2;
            else if(dollar_in) next_state = S9;
            else
              next_state = S1;
          end
        S2:
          begin
            i[3] = 0; i[2] = 0; i[1] = 1; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            if(quarter_in) next_state = S3;
            else if(dollar_in) next_state = S10;
            else if ((select1 && select2) | (select1 && select3) | (select2 && select3)) next_state = S2;
            else if(select1) next_state = S5;
            else 
              next_state = S2;
          end
        S3:
          begin
            i[3] = 0; i[2] = 0; i[1] = 1; i[0] = 1;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            if(quarter_in) next_state = S8;
            else if(dollar_in) next_state = S20;  
            else if((select1 && select2) | (select1 && select3) | (select2 && select3)) next_state = S3;
            else if(select1) next_state = S6;
            else if(select2) next_state = S4;
            else 
              next_state = S3;
         end
        S4:	
          begin
            i[3] = 0; i[2] = 0; i[1] = 1; i[0] = 1;
            product1 = 0; product2 = 1; product3 = 0;
            dollar_out = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            next_state = S0;
          end
        S5: 
          begin
            i[3] = 0; i[2] = 0; i[1] = 1; i[0] = 0;
            product1 = 1; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            next_state = S0;
          end
        S6: 
          begin
            i[3] = 0; i[2] = 0; i[1] = 1; i[0] = 1;
            product1 = 1; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 1;
            dollar_out = 0;
            next_state = S0;
          end
        S7:
          begin
            i[3] = 0; i[2] = 1; i[1] = 1; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 1;
            dollar_out = 0;
            next_state = S10;
          end
        S8:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            if(quarter_in) next_state = S9;
            else if(dollar_in) next_state = S21;  
            else if((select1 && select2) | (select1 && select3) | (select2 && select3)) next_state = S8;
            else if(select1) next_state = S11;
            else if(select2) next_state = S12;
            else if(select3) next_state = S17;
            else
              next_state = S8;
          end
        S9:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 1;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            if(quarter_in) next_state = S10;
            else if(dollar_in) next_state = S22;
            else if((select1 && select2) | (select1 && select3) | (select2 && select3)) next_state = S9;
            else if(select1) next_state = S13;
            else if(select2) next_state = S14;
            else if(select3) next_state = S18;
            else
              next_state = S9;
          end
        S10:
          begin
            i[3] = 0; i[2] = 1; i[1] = 1; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            if(quarter_in) next_state = S7;
            else if(dollar_in) next_state = S23;
            else if((select1 && select2) | (select1 && select3) | (select2 && select3)) next_state = S10;
            else if(select1) next_state = S15;
            else if(select2) next_state = S16;
            else if(select3) next_state = S19;
            else
              next_state = S10;
          end
        S11:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 0;
            product1 = 1; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 1; quarter_out[0] = 0;
            dollar_out = 0;
            next_state = S0;
          end
        S12:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 0;
            product1 = 0; product2 = 1; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 1;
            dollar_out = 0;
            next_state = S0;
          end
        S13:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 1;
            product1 = 1; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 1; quarter_out[0] = 1;
            dollar_out = 0;
            next_state = S0;
          end
        S14:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 1;
            product1 = 0; product2 = 1; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 1; quarter_out[0] = 0;
            dollar_out = 0;
            next_state = S0;
          end
        S15:
          begin
            i[3] = 0; i[2] = 1; i[1] = 1; i[0] = 0;
            product1 = 1; product2 = 0; product3 = 0;
            quarter_out[2] = 1; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            next_state = S0;
          end
        S16:
          begin
            i[3] = 0; i[2] = 1; i[1] = 1; i[0] = 0;
            product1 = 0; product2 = 1; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 1; quarter_out[0] = 1;
            dollar_out = 0;
            next_state = S0;
          end
        S17:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 1;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            next_state = S0;
          end
        S18:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 1;
            product1 = 0; product2 = 0; product3 = 1;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 1;
            dollar_out = 0;
            next_state = S0;
          end
        S19:
          begin
            i[3] = 0; i[2] = 1; i[1] = 1; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 1;
            quarter_out[2] = 0; quarter_out[1] = 1; quarter_out[0] = 0;
            dollar_out = 0;
            next_state = S0;
          end
        S20:
          begin
            i[3] = 0; i[2] = 0; i[1] = 1; i[0] = 1;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 1;
            next_state = S3;
          end
        S21:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 1;
            next_state = S8;
          end
        S22:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 1;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 1;
            next_state = S9;
          end
        S23:
          begin
            i[3] = 0; i[2] = 1; i[1] = 1; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 1;
            next_state = S10;
          end
        default:
          begin
            i[3] = 0; i[2] = 1; i[1] = 0; i[0] = 0;
            product1 = 0; product2 = 0; product3 = 0;
            quarter_out[2] = 0; quarter_out[1] = 0; quarter_out[0] = 0;
            dollar_out = 0;
            next_state = S0;
          end
      endcase
    end

endmodule // vending_controller
