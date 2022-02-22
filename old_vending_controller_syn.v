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
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Feb 22 05:07:57 2022
/////////////////////////////////////////////////////////////


module old_vending_controller ( clk, reset, quarter_in, select1, select2, i, 
        product1, product2, quarter_out );
  output [1:0] i;
  input clk, reset, quarter_in, select1, select2;
  output product1, product2, quarter_out;
  wire   N13, N14, N15, N16, N19, N20, N22, N24, N25, N26, N27, N28, N29, N30,
         N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, n4, n5,
         n6, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43;
  wire   [3:0] state;

  inv I_10 ( .in(N40), .out(N41) );
  inv I_9 ( .in(N37), .out(N38) );
  inv I_8 ( .in(N34), .out(N35) );
  inv I_7 ( .in(N31), .out(N32) );
  inv I_6 ( .in(N28), .out(N29) );
  inv I_5 ( .in(N25), .out(N26) );
  inv I_3 ( .in(state[1]), .out(N20) );
  inv I_2 ( .in(state[2]), .out(N19) );
  nand2 C165 ( .a(select1), .b(select2), .out(n4) );
  inv I_0 ( .in(reset), .out(N13) );
  nand2 C50 ( .a(state[2]), .b(state[1]), .out(n5) );
  nand2 C47 ( .a(state[2]), .b(state[1]), .out(N39) );
  nand2 C42 ( .a(state[2]), .b(N20), .out(N36) );
  nand2 C37 ( .a(state[2]), .b(N20), .out(N33) );
  nand2 C33 ( .a(N19), .b(state[1]), .out(N30) );
  nand2 C28 ( .a(N19), .b(state[1]), .out(N27) );
  nand2 C24 ( .a(N19), .b(N20), .out(N24) );
  nand2 C21 ( .a(N19), .b(N20), .out(n6) );
  dff \state_reg[0]  ( .d(N14), .gclk(clk), .rnot(1'b1), .q(state[0]) );
  dff \state_reg[2]  ( .d(N16), .gclk(clk), .rnot(1'b1), .q(state[2]) );
  dff \state_reg[1]  ( .d(N15), .gclk(clk), .rnot(1'b1), .q(state[1]) );
  inv U9 ( .in(N38), .out(n8) );
  nand2 U10 ( .a(n9), .b(n10), .out(i[1]) );
  nor3 U13 ( .a(product2), .b(quarter_out), .c(n13), .out(n9) );
  inv U16 ( .in(N41), .out(n7) );
  inv U18 ( .in(N35), .out(n16) );
  inv U19 ( .in(n17), .out(N40) );
  nor2 U20 ( .a(N39), .b(state[0]), .out(n17) );
  nand2 U21 ( .a(state[0]), .b(n18), .out(N37) );
  inv U22 ( .in(N36), .out(n18) );
  inv U23 ( .in(n19), .out(N34) );
  nor2 U24 ( .a(N33), .b(state[0]), .out(n19) );
  nand2 U25 ( .a(state[0]), .b(n20), .out(N31) );
  inv U26 ( .in(N30), .out(n20) );
  inv U27 ( .in(n21), .out(N28) );
  nor2 U28 ( .a(N27), .b(state[0]), .out(n21) );
  nand2 U29 ( .a(state[0]), .b(n22), .out(N25) );
  inv U30 ( .in(N24), .out(n22) );
  nor2 U31 ( .a(n23), .b(n24), .out(N16) );
  aoi22 U32 ( .a(N32), .b(n25), .c(N29), .d(n26), .out(n23) );
  oai12 U33 ( .b(n27), .c(n28), .a(n29), .out(n25) );
  inv U34 ( .in(select2), .out(n28) );
  nor2 U35 ( .a(n30), .b(n24), .out(N15) );
  nor3 U36 ( .a(n31), .b(n32), .c(n33), .out(n30) );
  nor2 U37 ( .a(n12), .b(n34), .out(n32) );
  oai22 U38 ( .a(n14), .b(n35), .c(n26), .d(n36), .out(n31) );
  nor2 U39 ( .a(n37), .b(n24), .out(N14) );
  nor3 U41 ( .a(n38), .b(n39), .c(n33), .out(n37) );
  oai12 U42 ( .b(n40), .c(n14), .a(n15), .out(n33) );
  nand2 U43 ( .a(state[0]), .b(N42), .out(n15) );
  inv U44 ( .in(N32), .out(n14) );
  nor3 U45 ( .a(n27), .b(quarter_in), .c(n41), .out(n40) );
  nor2 U46 ( .a(select2), .b(select1), .out(n41) );
  inv U47 ( .in(n4), .out(n27) );
  nor2 U48 ( .a(quarter_in), .b(n12), .out(n39) );
  inv U49 ( .in(N26), .out(n12) );
  oai12 U50 ( .b(n29), .c(n36), .a(n42), .out(n38) );
  nand3 U51 ( .a(N22), .b(n43), .c(quarter_in), .out(n42) );
  inv U52 ( .in(state[0]), .out(n43) );
  inv U53 ( .in(N29), .out(n36) );
  nor2 U54 ( .a(quarter_in), .b(n26), .out(n29) );
  inv U55 ( .in(n35), .out(n26) );
  nand3 U56 ( .a(n4), .b(n34), .c(select1), .out(n35) );
  inv U57 ( .in(quarter_in), .out(n34) );
  inv U58 ( .in(n6), .out(N22) );
  inv U59 ( .in(n5), .out(N42) );
  nor2 U60 ( .a(N29), .b(N38), .out(n10) );
  inv U61 ( .in(N13), .out(n24) );
  inv U62 ( .in(n16), .out(product2) );
  nand2 U63 ( .a(n15), .b(n7), .out(quarter_out) );
  inv U64 ( .in(n14), .out(n13) );
  nand2 U65 ( .a(n12), .b(n9), .out(i[0]) );
  nand2 U66 ( .a(n7), .b(n8), .out(product1) );
endmodule

