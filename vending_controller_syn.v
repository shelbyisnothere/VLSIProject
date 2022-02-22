module inv(in, out);
input in;
output out;
assign out = ~in;
endmodule

module nand2(a, b, out);
input a, b;
output out;
assign out = ~(a & b);
endmodule

module nand3(a, b, c, out);
input a, b, c;
output out;
assign out = ~(a & b & c);
endmodule

module nand4(a, b, c, d, out);
input a, b, c, d;
output out;
assign out = ~(a & b & c & d);
endmodule

module nor2(a, b, out);
input a, b;
output out;
assign out = ~(a | b);
endmodule

module nor3(a, b, c, out);
input a, b, c;
output out;
assign out = ~(a | b | c);
endmodule

module xor2(a, b, out);
input a, b;
output out;
assign out = (a ^ b);
endmodule

module aoi12(a, b, c, out);
input a, b, c;
output out;
assign out = ~(a | (b & c));
endmodule

module aoi22(a, b, c, d, out);
input a, b, c, d;
output out;
assign out = ~((a & b) | (c & d));
endmodule

module oai12(a, b, c, out);
input a, b, c;
output out;
assign out = ~(a & (b | c));
endmodule

module oai22(a, b, c, d, out);
input a, b, c, d;
output out;
assign out = ~((a | b) & (c | d));
endmodule

module dff( d, gclk, rnot, q);
input d, gclk, rnot;
output q;
reg q;
always @(posedge gclk or negedge rnot)
  if (rnot == 1'b0)
    q = 1'b0;
  else
    q = d;
endmodule

/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : L-2016.03-SP3
// Date      : Tue Feb 22 02:33:49 2022
/////////////////////////////////////////////////////////////


module vending_controller ( clk, reset, select1, select2, i, product1, 
        product2, selection );
  input [3:0] i;
  output [1:0] selection;
  input clk, reset, select1, select2;
  output product1, product2;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86;
  wire   [2:0] state;
  wire   [2:0] next_state;
  assign product1 = N61;
  assign product2 = N65;

  \**SEQGEN**  \state_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N14), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N13), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \state_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N12), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(state[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_AND2 C17 ( .A(N62), .B(N57), .Z(N17) );
  GTECH_AND2 C18 ( .A(N17), .B(N58), .Z(N18) );
  GTECH_OR2 C20 ( .A(state[2]), .B(state[1]), .Z(N19) );
  GTECH_OR2 C21 ( .A(N19), .B(N58), .Z(N20) );
  GTECH_OR2 C24 ( .A(state[2]), .B(N57), .Z(N22) );
  GTECH_OR2 C25 ( .A(N22), .B(state[0]), .Z(N23) );
  GTECH_OR2 C29 ( .A(state[2]), .B(N57), .Z(N25) );
  GTECH_OR2 C30 ( .A(N25), .B(N58), .Z(N26) );
  GTECH_OR2 C33 ( .A(N62), .B(state[1]), .Z(N28) );
  GTECH_OR2 C34 ( .A(N28), .B(state[0]), .Z(N29) );
  GTECH_AND2 C36 ( .A(state[2]), .B(state[0]), .Z(N31) );
  GTECH_AND2 C37 ( .A(state[2]), .B(state[1]), .Z(N32) );
  \**SEQGEN**  \next_state_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(
        1'b0), .clocked_on(1'b0), .data_in(N55), .enable(N52), .Q(
        next_state[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b0) );
  \**SEQGEN**  \next_state_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(
        1'b0), .clocked_on(1'b0), .data_in(N54), .enable(N52), .Q(
        next_state[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b0) );
  \**SEQGEN**  \next_state_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(
        1'b0), .clocked_on(1'b0), .data_in(N53), .enable(N52), .Q(
        next_state[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b0) );
  GTECH_NOT I_0 ( .A(state[1]), .Z(N57) );
  GTECH_NOT I_1 ( .A(state[0]), .Z(N58) );
  GTECH_OR2 C141 ( .A(N57), .B(state[2]), .Z(N59) );
  GTECH_OR2 C142 ( .A(N58), .B(N59), .Z(N60) );
  GTECH_NOT I_2 ( .A(N60), .Z(N61) );
  GTECH_NOT I_3 ( .A(state[2]), .Z(N62) );
  GTECH_OR2 C145 ( .A(state[1]), .B(N62), .Z(N63) );
  GTECH_OR2 C146 ( .A(state[0]), .B(N63), .Z(N64) );
  GTECH_NOT I_4 ( .A(N64), .Z(N65) );
  GTECH_OR2 C149 ( .A(N57), .B(state[2]), .Z(N66) );
  GTECH_OR2 C150 ( .A(state[0]), .B(N66), .Z(N67) );
  GTECH_NOT I_5 ( .A(N67), .Z(N68) );
  GTECH_OR2 C153 ( .A(state[1]), .B(N62), .Z(N69) );
  GTECH_OR2 C154 ( .A(state[0]), .B(N69), .Z(N70) );
  GTECH_NOT I_6 ( .A(N70), .Z(N71) );
  GTECH_OR2 C157 ( .A(state[1]), .B(state[2]), .Z(N72) );
  GTECH_OR2 C158 ( .A(N58), .B(N72), .Z(N73) );
  GTECH_NOT I_7 ( .A(N73), .Z(N74) );
  GTECH_OR2 C162 ( .A(N57), .B(state[2]), .Z(N75) );
  GTECH_OR2 C163 ( .A(N58), .B(N75), .Z(N76) );
  GTECH_NOT I_8 ( .A(N76), .Z(N77) );
  SELECT_OP C165 ( .DATA1({1'b0, 1'b0, 1'b0}), .DATA2(next_state), .CONTROL1(
        N0), .CONTROL2(N1), .Z({N14, N13, N12}) );
  GTECH_BUF B_0 ( .A(reset), .Z(N0) );
  GTECH_BUF B_1 ( .A(N11), .Z(N1) );
  SELECT_OP C166 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b1), .DATA4(1'b0), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .CONTROL4(N38), .Z(N39)
         );
  GTECH_BUF B_2 ( .A(N15), .Z(N2) );
  GTECH_BUF B_3 ( .A(N34), .Z(N3) );
  GTECH_BUF B_4 ( .A(N35), .Z(N4) );
  SELECT_OP C167 ( .DATA1({1'b0, 1'b0}), .DATA2({1'b0, 1'b1}), .DATA3({1'b1, 
        1'b0}), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z({N41, N40}) );
  SELECT_OP C168 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N2), 
        .CONTROL2(N46), .CONTROL3(N44), .Z(N45) );
  SELECT_OP C169 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N2), 
        .CONTROL2(N51), .CONTROL3(N49), .Z(N50) );
  SELECT_OP C170 ( .DATA1(N39), .DATA2(N45), .DATA3(N50), .DATA4(N16), .DATA5(
        N16), .DATA6(1'b1), .CONTROL1(N5), .CONTROL2(N6), .CONTROL3(N7), 
        .CONTROL4(N8), .CONTROL5(N9), .CONTROL6(N10), .Z(N52) );
  GTECH_BUF B_5 ( .A(N18), .Z(N5) );
  GTECH_BUF B_6 ( .A(N21), .Z(N6) );
  GTECH_BUF B_7 ( .A(N24), .Z(N7) );
  GTECH_BUF B_8 ( .A(N27), .Z(N8) );
  GTECH_BUF B_9 ( .A(N30), .Z(N9) );
  GTECH_BUF B_10 ( .A(N33), .Z(N10) );
  SELECT_OP C171 ( .DATA1({1'b0, N41, N40}), .DATA2({1'b0, N46, N46}), .DATA3(
        {N51, 1'b0, 1'b0}), .DATA4({1'b0, 1'b0, 1'b0}), .DATA5({1'b0, 1'b0, 
        1'b0}), .DATA6({1'b0, 1'b0, 1'b0}), .CONTROL1(N5), .CONTROL2(N6), 
        .CONTROL3(N7), .CONTROL4(N8), .CONTROL5(N9), .CONTROL6(N10), .Z({N55, 
        N54, N53}) );
  GTECH_NOT I_9 ( .A(reset), .Z(N11) );
  GTECH_AND2 C177 ( .A(select1), .B(select2), .Z(N15) );
  GTECH_OR2 C178 ( .A(N82), .B(N83), .Z(N16) );
  GTECH_OR2 C179 ( .A(N80), .B(N81), .Z(N82) );
  GTECH_OR2 C180 ( .A(N78), .B(N79), .Z(N80) );
  GTECH_NOT I_10 ( .A(i[3]), .Z(N78) );
  GTECH_NOT I_11 ( .A(i[2]), .Z(N79) );
  GTECH_NOT I_12 ( .A(i[1]), .Z(N81) );
  GTECH_NOT I_13 ( .A(i[0]), .Z(N83) );
  GTECH_NOT I_14 ( .A(N20), .Z(N21) );
  GTECH_NOT I_15 ( .A(N23), .Z(N24) );
  GTECH_NOT I_16 ( .A(N26), .Z(N27) );
  GTECH_NOT I_17 ( .A(N29), .Z(N30) );
  GTECH_OR2 C197 ( .A(N31), .B(N32), .Z(N33) );
  GTECH_AND2 C204 ( .A(select1), .B(N84), .Z(N34) );
  GTECH_NOT I_18 ( .A(select2), .Z(N84) );
  GTECH_AND2 C206 ( .A(N85), .B(select2), .Z(N35) );
  GTECH_NOT I_19 ( .A(select1), .Z(N85) );
  GTECH_OR2 C211 ( .A(N34), .B(N15), .Z(N36) );
  GTECH_OR2 C212 ( .A(N35), .B(N36), .Z(N37) );
  GTECH_NOT I_20 ( .A(N37), .Z(N38) );
  GTECH_OR2 C214 ( .A(i[3]), .B(i[2]), .Z(N42) );
  GTECH_OR2 C216 ( .A(N42), .B(N15), .Z(N43) );
  GTECH_NOT I_21 ( .A(N43), .Z(N44) );
  GTECH_OR2 C218 ( .A(i[3]), .B(N86), .Z(N47) );
  GTECH_AND2 C219 ( .A(i[2]), .B(i[1]), .Z(N86) );
  GTECH_OR2 C221 ( .A(N47), .B(N15), .Z(N48) );
  GTECH_NOT I_22 ( .A(N48), .Z(N49) );
  GTECH_NOT I_23 ( .A(N15), .Z(N56) );
  GTECH_AND2 C225 ( .A(N42), .B(N56), .Z(N46) );
  GTECH_AND2 C226 ( .A(N47), .B(N56), .Z(N51) );
  GTECH_OR2 C227 ( .A(N68), .B(N71), .Z(selection[1]) );
  GTECH_OR2 C228 ( .A(N74), .B(N77), .Z(selection[0]) );
endmodule

