/*
 * Filename: vending_machine.v
 * Authors: Anna Nguyen, David Wang, Shelby King
 * Date: 2/8/2022
 * Course: Introduction to VLSI Design EE4325.001 Spring 2022
 * Description:
 *	Simple vending machine FSM.
 */

// TO DO: Rename file to have verilog format (i think this is in vhdl format??)

module vending_machine_fsm(clk, reset, quarter_in, select1, select2, 
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
  
  typedef enum logic [2:0] {I0, I1, I2, I3, I4, I5, I6} statetype;
  statetype state, next_state;

  /* Old code. Don't want to delete
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
  */
  
  // TO DO: Try ```always_ff @(posedge clk)```
  always @(posedge clk)
    begin // TO DO: Try without?
      if (reset)	state <= I0;
      else			state <= next_state;
    end
  
  // TO DO: Try ```always_comb``` 
  always @(*)
    begin
      case(state)
        I0: 
          if(quarter_in) 
              next_state <= I1;
        I1: 
          if(quarter_in) next_state <= I2;
        I2:
          if(quarter_in) next_state <= I3;
          else if(select1) next_state <= I5;
        I3: 
          if(select2) next_state <= I4;
          else if(select1) next_state <= I6;
        I4:	
          next_state <= I0;
        I5: 
          next_state <= I0;
        I6: 
          next_state <= I0;
        default: 
          next_state <= I0;
      endcase
    end
  
  // Output logic
  assign i = {(state == I2 | state == I3 | state == I4 | state == I5 | state == I6),
              (state == I1 | state == I3 | state == I4 | state == I6)};
  assign product1 = (state == I5 | state == I6);
  assign product2 = (state == I4);
  assign quarter_out = (state == I6);
  
endmodule
