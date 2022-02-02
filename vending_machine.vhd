/*
 * Authors: Anna Nguyen, David Wang, Shelby King
 * Date: 2/8/2022
 * Course: Introduction to VLSI Design EE4325.001 Spring 2022
 * Description:
 *	Simple vending machine FSM.
 */

module insertion(clk, reset, quarter_in, select1, select2,
                 i[2:0], product1, product2, quarter_out);
  in;
  input clk;
  input reset;
  input quarter_in;		// A quarter has been inserted into the machine
  input select1;		// Selection for product 1
  input select2;		// Selection for product 2
  output i[1:0];		// Amount inserted. Uses the following encoding:
  						//		00 = $0.00
  						//		01 = $0.25
  						//		10 = $0.50
  						//		11 = $0.75
  output product1;		// Product 1; costs $0.50
  output product2;		// Product 2; costs $0.75
  output quarter_out;	// A quarter has been dispensed by the machine
  //output s1;
  //output s2;
  
  reg [2:0] state;		// The current state of the FSM

  // State encodings
  parameter [2:0]
  I0 = 3'b000,	// Start state
  I1 = 3'b001,	// One quarter has been inserted into the vending machine
  I2 = 3'b010,	// Two quarters have been inserted into the vending machine
  I3 = 3'b011,	// Three quarters have been inserted into the vending machine
  I4 = 3'b100,	// Product 1 is dispensed with no change
  I5 = 3'b101,	// Product 2 is dispensed with no change
  I6 = 3'b110;	// Product 1 is dispensed with $0.25 change
  
  // State transitions
  always @(posedge clk) begin
    case (state)
      I0:
        begin
          // State output
          i <= 2'b00;
          product1 <= 0;
          product2 <= 0;
          quarter_out <= 0;
          // Next state
          if (quarter_in) 
            state <= I1;
        end
      I1:
        begin
          i <= 2'b01;
          product1 <= 0;
          product2 <= 0;
          quarter_out <= 0;
          if (quarter_in) 
            state <= I2;
        end
      I2:
        begin
          i <= 2'b10;
          product1 <= 0;
          product2 <= 0;
          quarter_out <= 0;
          if (quarter_in) 
            state <= I3;
          else if (select1)
            state <= I5;
        end
      I3:
        begin
          i <= 2'b11;
          product1 <= 0;
          product2 <= 0;
          quarter_out <= 0;
          if (select1) 
            state <= I6;
          if (select2)
            state <= I4;
        end
      I4:
        begin
          i <= 2'b11;
          product1 <= 0;
          product2 <= 1;
          quarter_out <= 0;
          state <= I0;
        end
      I5:
        begin
          i <= 2'b10;
          product1 <= 1;
          product2 <= 0;
          quarter <= 0;
          state <= I0;
        end
      I6:
        begin
          i <= 2'b11;
          product1 <= 0;
          product2 <= 1;
          quarter_out <= 1;
          state <= I0;
        end
      default:
        state <= I0;
    endcase
  end
endmodule
