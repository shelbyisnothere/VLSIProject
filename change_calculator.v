/*
 * Filename: change_calculator.v
 * Authors: Anna Nguyen, David Wang, Shelby King
 * Date: 2/22/2022
 * Course: Introduction to VLSI Design EE4325.001 Spring 2022
 * Description:
 *
 */
 
// change_calculator module
//   [MODULE DESCRIPTION]
module change_calculator(clk, reset, quarter_in, dollar_in, selection,
                            i, quarter_out, dollar_out);
  input clk;
  input reset;
  input quarter_in;
  input dollar_in;
  input [1:0] selection;
  output [3:0] i;
  output [2:0] quarter_out;
  output dollar_out;
  
  // Selection encodings
  parameter[1:0]
  selected_none = 2'b00,
  selected1 = 2'b01,
  selected2 = 2'b10;
  
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
  S18 = 5'b10010;
  
  reg [4:0] state;
  reg [4:0] next_state;
  
  always @(posedge clk)
    begin
      if (reset)	state <= S0;
      else state <= next_state;
    end
    
  always @(quarter_in, dollar_in, selection)
    begin
      #1;
      case(state)
        S0:
          if(quarter_in)
            next_state = S1;
          else if(dollar_in)
            next_state = S4;
          else
            next_state = S0;
        S1:
          if(quarter_in)
            next_state = S2;
          else if(dollar_in)
            next_state = S5;
        S2:
          if(quarter_in)
            next_state = S3;
          else if(dollar_in)
            next_state = S6;        
        S3:
          if(quarter_in)
            next_state = S4;
          else if(dollar_in)
            next_state = S7;
        S4:
          if(quarter_in)
            next_state = S5;
          else if(dollar_in)
            next_state = S8;
          else if(selection == selected1)
            next_state = S0;
        S5:
          if(quarter_in)
            next_state = S6;
          else if(dollar_in)
            next_state = S9;
          else if(selection == selected1)
            next_state = S10;
        S6:
          if(quarter_in)
            next_state = S7;
          else if(dollar_in)
            next_state = S11;
          else if(selection == selected1)
            next_state = S12;
          else if(selection == selected2)
            next_state = S0;
        S7:
          if(quarter_in)
            next_state = S8;
          else if(dollar_in)
            next_state = S13;
          else if(selection == selected1)
            next_state = S14;
          else if(selection == selected2)
            next_state = S15;
        S8:
          if(quarter_in)
            next_state = S16;
          else if(dollar_in)
            next_state = S17;
          else if(selection == selected1)
            next_state = S18;
          else if(selection == selected2)
            next_state = S0;
        S9:
          next_state = S5;
        S10:
          next_state = S0;
        S11:
          next_state = S6;
        S12:
          next_state = S0;
        S13:
          next_state = S7;
        S14:
          next_state = S0;
        S15:
          next_state = S0;
        S16:
          next_state = S8;
        S17:
          next_state = S8;
        S18:
          next_state = S0;
        default:
          next_state = S0;
      endcase
    end       
   
   // Outputs
   /*
   assign i = {(state == S8 | state == S16 | state == S17 | state == S18),
                (state == S4 | state == S5 | state == S6 | state == S7 | state == S9 | state == S10 | state == S11 | state == S12 | state == S13 | state == S14 | state == S15),
                (state == S2 | state == S3 | state == S6 | state == S7 | state == S11 | state == S12 | state == S13 | state == S14 | state == S15),
                (state == S1 | state == S3 | state == S5 | state == S7 | state == S9 | state == S13 | state == S14 | state == S15)};
   */
   assign i[3] = (state == S8 | state == S16 | state == S17 | state == S18);   
   assign i[2] = (state == S4 | state == S5 | state == S6 | state == S7 | state == S9 | state == S10 | state == S11 | state == S12 | state == S13 | state == S14 | state == S15);
   assign i[1] = (state == S2 | state == S3 | state == S6 | state == S7 | state == S11 | state == S12 | state == S13 | state == S14 | state == S15);
   assign i[0] = (state == S1 | state == S3 | state == S5 | state == S7 | state == S9 | state == S13 | state == S14 | state == S15);
   assign quarter_out = {(state == S18),
                          (state == S11 | state == S12 | state == S14),
                          (state == S10 | state == S14 | state == S15 | state == S16)};
   assign dollar_out = (state == S9 | state == S11 | state == S13 | state == S17);
   
endmodule // change_calculator
