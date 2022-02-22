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
// Date      : Tue Feb 22 08:10:02 2022
/////////////////////////////////////////////////////////////


module old_vending_controller ( clk, reset, quarter_in, dollar_in, select1, 
        select2, select3, i, product1, product2, product3, quarter_out, 
        dollar_out );
  output [3:0] i;
  output [2:0] quarter_out;
  input clk, reset, quarter_in, dollar_in, select1, select2, select3;
  output product1, product2, product3, dollar_out;
  wire   N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N40, N41, N44, N45,
         N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73,
         N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87,
         N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N119, N120, N121, N122, N123,
         N124, N125, N126, N127, N128, N129, N130, N131, N132, N133, N134,
         N135, N136, N137, N138, N139, N140, N141, N142, N143, N144, N145,
         N146, N147, N148, N149, N150, N151, N152, N153, N154, N155, N156,
         N157, N158, N211, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173;
  wire   [4:0] state;
  assign i[3] = 1'b0;

  inv I_28 ( .in(N157), .out(N158) );
  inv I_27 ( .in(N152), .out(N153) );
  inv I_26 ( .in(N147), .out(N148) );
  inv I_25 ( .in(N142), .out(N143) );
  inv I_24 ( .in(N137), .out(N138) );
  inv I_23 ( .in(N132), .out(N133) );
  inv I_22 ( .in(N127), .out(N128) );
  inv I_21 ( .in(N122), .out(N123) );
  inv I_20 ( .in(N117), .out(quarter_out[2]) );
  inv I_19 ( .in(N112), .out(N113) );
  inv I_18 ( .in(N107), .out(N108) );
  inv I_17 ( .in(N102), .out(N103) );
  inv I_16 ( .in(N97), .out(N98) );
  inv I_15 ( .in(N92), .out(N93) );
  inv I_14 ( .in(N87), .out(N88) );
  inv I_13 ( .in(N82), .out(N83) );
  inv I_12 ( .in(N77), .out(N78) );
  inv I_11 ( .in(N72), .out(N73) );
  inv I_10 ( .in(N67), .out(N68) );
  inv I_9 ( .in(N62), .out(N63) );
  inv I_8 ( .in(N57), .out(N58) );
  inv I_7 ( .in(N52), .out(N53) );
  inv I_6 ( .in(N47), .out(N48) );
  inv I_4 ( .in(state[1]), .out(N38) );
  inv I_3 ( .in(state[2]), .out(N37) );
  inv I_2 ( .in(state[3]), .out(N36) );
  inv I_1 ( .in(state[4]), .out(N35) );
  nand2 C509 ( .a(select2), .b(select3), .out(n173) );
  nand2 C508 ( .a(select1), .b(select3), .out(n172) );
  nand2 C507 ( .a(select1), .b(select2), .out(n171) );
  nand2 C506 ( .a(n171), .b(n172), .out(N211) );
  nand2 C505 ( .a(n170), .b(n173), .out(N34) );
  nand2 C188 ( .a(n168), .b(n169), .out(N156) );
  nand2 C187 ( .a(state[2]), .b(state[1]), .out(N155) );
  nand2 C186 ( .a(state[4]), .b(N36), .out(N154) );
  nand2 C179 ( .a(n166), .b(n167), .out(N151) );
  nand2 C178 ( .a(state[2]), .b(state[1]), .out(N150) );
  nand2 C177 ( .a(state[4]), .b(N36), .out(N149) );
  nand2 C171 ( .a(n164), .b(n165), .out(N146) );
  nand2 C170 ( .a(state[2]), .b(N38), .out(N145) );
  nand2 C169 ( .a(state[4]), .b(N36), .out(N144) );
  nand2 C163 ( .a(n162), .b(n163), .out(N141) );
  nand2 C162 ( .a(state[2]), .b(N38), .out(N140) );
  nand2 C161 ( .a(state[4]), .b(N36), .out(N139) );
  nand2 C156 ( .a(n160), .b(n161), .out(N136) );
  nand2 C155 ( .a(N37), .b(state[1]), .out(N135) );
  nand2 C154 ( .a(state[4]), .b(N36), .out(N134) );
  nand2 C148 ( .a(n158), .b(n159), .out(N131) );
  nand2 C147 ( .a(N37), .b(state[1]), .out(N130) );
  nand2 C146 ( .a(state[4]), .b(N36), .out(N129) );
  nand2 C141 ( .a(n156), .b(n157), .out(N126) );
  nand2 C140 ( .a(N37), .b(N38), .out(N125) );
  nand2 C139 ( .a(state[4]), .b(N36), .out(N124) );
  nand2 C134 ( .a(n154), .b(n155), .out(N121) );
  nand2 C133 ( .a(N37), .b(N38), .out(N120) );
  nand2 C132 ( .a(state[4]), .b(N36), .out(N119) );
  nand2 C128 ( .a(n152), .b(n153), .out(N116) );
  nand2 C127 ( .a(state[2]), .b(state[1]), .out(N115) );
  nand2 C126 ( .a(N35), .b(state[3]), .out(N114) );
  nand2 C119 ( .a(n150), .b(n151), .out(N111) );
  nand2 C118 ( .a(state[2]), .b(state[1]), .out(N110) );
  nand2 C117 ( .a(N35), .b(state[3]), .out(N109) );
  nand2 C111 ( .a(n148), .b(n149), .out(N106) );
  nand2 C110 ( .a(state[2]), .b(N38), .out(N105) );
  nand2 C109 ( .a(N35), .b(state[3]), .out(N104) );
  nand2 C103 ( .a(n146), .b(n147), .out(N101) );
  nand2 C102 ( .a(state[2]), .b(N38), .out(N100) );
  nand2 C101 ( .a(N35), .b(state[3]), .out(N99) );
  nand2 C96 ( .a(n144), .b(n145), .out(N96) );
  nand2 C95 ( .a(N37), .b(state[1]), .out(N95) );
  nand2 C94 ( .a(N35), .b(state[3]), .out(N94) );
  nand2 C88 ( .a(n142), .b(n143), .out(N91) );
  nand2 C87 ( .a(N37), .b(state[1]), .out(N90) );
  nand2 C86 ( .a(N35), .b(state[3]), .out(N89) );
  nand2 C81 ( .a(n140), .b(n141), .out(N86) );
  nand2 C80 ( .a(N37), .b(N38), .out(N85) );
  nand2 C79 ( .a(N35), .b(state[3]), .out(N84) );
  nand2 C74 ( .a(n138), .b(n139), .out(N81) );
  nand2 C73 ( .a(N37), .b(N38), .out(N80) );
  nand2 C72 ( .a(N35), .b(state[3]), .out(N79) );
  nand2 C68 ( .a(n136), .b(n137), .out(N76) );
  nand2 C67 ( .a(state[2]), .b(state[1]), .out(N75) );
  nand2 C66 ( .a(N35), .b(N36), .out(N74) );
  nand2 C60 ( .a(n134), .b(n135), .out(N71) );
  nand2 C59 ( .a(state[2]), .b(state[1]), .out(N70) );
  nand2 C58 ( .a(N35), .b(N36), .out(N69) );
  nand2 C53 ( .a(n132), .b(n133), .out(N66) );
  nand2 C52 ( .a(state[2]), .b(N38), .out(N65) );
  nand2 C51 ( .a(N35), .b(N36), .out(N64) );
  nand2 C46 ( .a(n130), .b(n131), .out(N61) );
  nand2 C45 ( .a(state[2]), .b(N38), .out(N60) );
  nand2 C44 ( .a(N35), .b(N36), .out(N59) );
  nand2 C40 ( .a(n128), .b(n129), .out(N56) );
  nand2 C39 ( .a(N37), .b(state[1]), .out(N55) );
  nand2 C38 ( .a(N35), .b(N36), .out(N54) );
  nand2 C33 ( .a(n126), .b(n127), .out(N51) );
  nand2 C32 ( .a(N37), .b(state[1]), .out(N50) );
  nand2 C31 ( .a(N35), .b(N36), .out(N49) );
  nand2 C27 ( .a(n124), .b(n125), .out(N46) );
  nand2 C26 ( .a(N37), .b(N38), .out(N45) );
  nand2 C25 ( .a(N35), .b(N36), .out(N44) );
  nand2 C22 ( .a(N40), .b(N41), .out(n6) );
  nand2 C21 ( .a(N37), .b(N38), .out(n123) );
  nand2 C20 ( .a(N35), .b(N36), .out(n122) );
  dff \state_reg[0]  ( .d(N29), .gclk(clk), .rnot(1'b1), .q(state[0]) );
  dff \state_reg[4]  ( .d(N33), .gclk(clk), .rnot(1'b1), .q(state[4]) );
  dff \state_reg[1]  ( .d(N30), .gclk(clk), .rnot(1'b1), .q(state[1]) );
  dff \state_reg[2]  ( .d(N31), .gclk(clk), .rnot(1'b1), .q(state[2]) );
  dff \state_reg[3]  ( .d(N32), .gclk(clk), .rnot(1'b1), .q(state[3]) );
  nand4 U8 ( .a(n7), .b(n8), .c(n9), .d(n10), .out(quarter_out[0]) );
  inv U9 ( .in(N133), .out(n10) );
  inv U10 ( .in(n11), .out(product3) );
  nor3 U11 ( .a(N133), .b(N138), .c(N128), .out(n11) );
  nand4 U12 ( .a(n8), .b(n12), .c(n13), .d(n14), .out(product2) );
  inv U13 ( .in(N123), .out(n13) );
  inv U14 ( .in(N103), .out(n8) );
  nand3 U15 ( .a(n9), .b(n15), .c(n16), .out(product1) );
  nor3 U16 ( .a(N68), .b(N98), .c(N73), .out(n16) );
  inv U17 ( .in(quarter_out[2]), .out(n15) );
  nand4 U18 ( .a(n17), .b(n18), .c(n19), .d(n20), .out(i[2]) );
  nor3 U19 ( .a(n21), .b(quarter_out[2]), .c(N103), .out(n20) );
  inv U20 ( .in(n22), .out(n21) );
  nor3 U21 ( .a(N133), .b(N78), .c(N128), .out(n22) );
  aoi12 U22 ( .b(state[4]), .c(state[3]), .a(quarter_out[1]), .out(n19) );
  nand3 U23 ( .a(n9), .b(n12), .c(n23), .out(quarter_out[1]) );
  nor3 U24 ( .a(N123), .b(N98), .c(N138), .out(n23) );
  nand4 U25 ( .a(n24), .b(n7), .c(n25), .d(n26), .out(i[1]) );
  inv U26 ( .in(n27), .out(n26) );
  nand3 U27 ( .a(n28), .b(n29), .c(n30), .out(n27) );
  nor2 U28 ( .a(N63), .b(N68), .out(n28) );
  nor2 U29 ( .a(N138), .b(quarter_out[2]), .out(n25) );
  nor3 U30 ( .a(N73), .b(N78), .c(N123), .out(n7) );
  nand4 U31 ( .a(n9), .b(n12), .c(n31), .d(n32), .out(i[0]) );
  nor3 U32 ( .a(n33), .b(N58), .c(N48), .out(n32) );
  nand3 U33 ( .a(n34), .b(n35), .c(n14), .out(n33) );
  inv U34 ( .in(N63), .out(n14) );
  inv U35 ( .in(N73), .out(n34) );
  nor3 U36 ( .a(N133), .b(N153), .c(N143), .out(n31) );
  inv U37 ( .in(N113), .out(n12) );
  inv U38 ( .in(N108), .out(n9) );
  nand2 U39 ( .a(n18), .b(n30), .out(dollar_out) );
  nand2 U40 ( .a(state[0]), .b(n36), .out(N97) );
  inv U41 ( .in(N96), .out(n36) );
  inv U42 ( .in(n37), .out(N92) );
  nor2 U43 ( .a(N91), .b(state[0]), .out(n37) );
  nand2 U44 ( .a(state[0]), .b(n38), .out(N87) );
  inv U45 ( .in(N86), .out(n38) );
  inv U46 ( .in(n39), .out(N82) );
  nor2 U47 ( .a(N81), .b(state[0]), .out(n39) );
  nand2 U48 ( .a(state[0]), .b(n40), .out(N77) );
  inv U49 ( .in(N76), .out(n40) );
  inv U50 ( .in(n41), .out(N72) );
  nor2 U51 ( .a(N71), .b(state[0]), .out(n41) );
  nand2 U52 ( .a(state[0]), .b(n42), .out(N67) );
  inv U53 ( .in(N66), .out(n42) );
  inv U54 ( .in(n43), .out(N62) );
  nor2 U55 ( .a(N61), .b(state[0]), .out(n43) );
  nand2 U56 ( .a(state[0]), .b(n44), .out(N57) );
  inv U57 ( .in(N56), .out(n44) );
  inv U58 ( .in(n45), .out(N52) );
  nor2 U59 ( .a(N51), .b(state[0]), .out(n45) );
  nand2 U60 ( .a(state[0]), .b(n46), .out(N47) );
  inv U61 ( .in(N46), .out(n46) );
  aoi12 U62 ( .b(n47), .c(n48), .a(reset), .out(N33) );
  nand2 U63 ( .a(N93), .b(n49), .out(n48) );
  inv U64 ( .in(n50), .out(n47) );
  oai22 U65 ( .a(n51), .b(n52), .c(n53), .d(n17), .out(n50) );
  inv U66 ( .in(n54), .out(n17) );
  nor2 U67 ( .a(reset), .b(n55), .out(N32) );
  nor3 U68 ( .a(n56), .b(n57), .c(n58), .out(n55) );
  oai22 U69 ( .a(n59), .b(n60), .c(n61), .d(n51), .out(n58) );
  aoi12 U70 ( .b(n62), .c(n63), .a(N48), .out(n61) );
  nor3 U71 ( .a(n64), .b(n49), .c(n65), .out(n60) );
  nor2 U72 ( .a(select3), .b(n66), .out(n65) );
  nand3 U73 ( .a(n67), .b(n68), .c(n69), .out(n64) );
  nor2 U74 ( .a(n70), .b(n71), .out(n57) );
  nand3 U75 ( .a(n18), .b(n72), .c(n73), .out(n56) );
  nand2 U76 ( .a(quarter_in), .b(N58), .out(n72) );
  nor3 U77 ( .a(N153), .b(N158), .c(N148), .out(n18) );
  nor2 U78 ( .a(reset), .b(n74), .out(N31) );
  nor3 U79 ( .a(n75), .b(n76), .c(n77), .out(n74) );
  aoi12 U80 ( .b(n24), .c(n35), .a(n69), .out(n77) );
  nor3 U81 ( .a(N58), .b(N93), .c(N53), .out(n24) );
  aoi12 U82 ( .b(n59), .c(n78), .a(n79), .out(n76) );
  inv U83 ( .in(N58), .out(n78) );
  oai22 U84 ( .a(n71), .b(n68), .c(n52), .d(n51), .out(n75) );
  nor2 U85 ( .a(n54), .b(N58), .out(n52) );
  nand2 U86 ( .a(n59), .b(n71), .out(n54) );
  nor2 U87 ( .a(N88), .b(N83), .out(n59) );
  inv U88 ( .in(N93), .out(n71) );
  nor2 U89 ( .a(reset), .b(n80), .out(N30) );
  nor2 U90 ( .a(n81), .b(n82), .out(n80) );
  nand3 U91 ( .a(n83), .b(n73), .c(n84), .out(n82) );
  aoi22 U92 ( .a(N93), .b(n79), .c(N48), .d(quarter_in), .out(n84) );
  aoi12 U93 ( .b(n85), .c(N53), .a(N78), .out(n73) );
  inv U94 ( .in(n86), .out(n83) );
  nand4 U95 ( .a(n87), .b(n88), .c(n89), .d(n29), .out(n81) );
  inv U96 ( .in(N158), .out(n29) );
  oai12 U97 ( .b(N58), .c(N83), .a(n90), .out(n89) );
  oai12 U98 ( .b(n91), .c(n92), .a(N53), .out(n88) );
  oai12 U99 ( .b(n49), .c(n93), .a(N88), .out(n87) );
  inv U100 ( .in(n79), .out(n49) );
  nand3 U101 ( .a(n91), .b(n68), .c(select2), .out(n79) );
  nor2 U102 ( .a(reset), .b(n94), .out(N29) );
  nor3 U103 ( .a(n95), .b(n86), .c(n96), .out(n94) );
  oai22 U104 ( .a(n97), .b(n69), .c(n70), .d(n35), .out(n96) );
  inv U105 ( .in(N88), .out(n35) );
  nor3 U106 ( .a(n90), .b(n92), .c(n98), .out(n70) );
  nor2 U107 ( .a(n99), .b(select3), .out(n98) );
  inv U108 ( .in(n100), .out(n99) );
  inv U109 ( .in(N53), .out(n97) );
  nand3 U110 ( .a(n101), .b(n30), .c(n102), .out(n86) );
  nand2 U111 ( .a(quarter_in), .b(N53), .out(n102) );
  inv U112 ( .in(N143), .out(n30) );
  oai12 U113 ( .b(n100), .c(n92), .a(N58), .out(n101) );
  inv U114 ( .in(n67), .out(n92) );
  nand2 U115 ( .a(N34), .b(n103), .out(n67) );
  nand4 U116 ( .a(n104), .b(n105), .c(n106), .d(n107), .out(n95) );
  inv U117 ( .in(N153), .out(n107) );
  nand3 U118 ( .a(n62), .b(n63), .c(quarter_in), .out(n106) );
  inv U119 ( .in(state[0]), .out(n63) );
  inv U120 ( .in(n6), .out(n62) );
  oai22 U121 ( .a(N83), .b(N93), .c(n90), .d(n93), .out(n105) );
  nand3 U122 ( .a(n51), .b(n68), .c(n53), .out(n93) );
  nand2 U123 ( .a(select3), .b(n100), .out(n53) );
  nor2 U124 ( .a(n66), .b(quarter_in), .out(n100) );
  nand2 U125 ( .a(n91), .b(n108), .out(n66) );
  inv U126 ( .in(select2), .out(n108) );
  nor3 U127 ( .a(dollar_in), .b(select1), .c(N34), .out(n91) );
  inv U128 ( .in(n69), .out(n90) );
  nand3 U129 ( .a(n103), .b(n109), .c(select1), .out(n69) );
  inv U130 ( .in(N34), .out(n109) );
  oai12 U131 ( .b(n103), .c(n85), .a(N48), .out(n104) );
  inv U132 ( .in(n51), .out(n85) );
  nand2 U133 ( .a(dollar_in), .b(n68), .out(n51) );
  inv U134 ( .in(quarter_in), .out(n68) );
  nor2 U135 ( .a(dollar_in), .b(quarter_in), .out(n103) );
  nand2 U136 ( .a(state[0]), .b(n110), .out(N157) );
  inv U137 ( .in(N156), .out(n110) );
  inv U138 ( .in(n111), .out(N152) );
  nor2 U139 ( .a(N151), .b(state[0]), .out(n111) );
  nand2 U140 ( .a(state[0]), .b(n112), .out(N147) );
  inv U141 ( .in(N146), .out(n112) );
  inv U142 ( .in(n113), .out(N142) );
  nor2 U143 ( .a(N141), .b(state[0]), .out(n113) );
  nand2 U144 ( .a(state[0]), .b(n114), .out(N137) );
  inv U145 ( .in(N136), .out(n114) );
  inv U146 ( .in(n115), .out(N132) );
  nor2 U147 ( .a(N131), .b(state[0]), .out(n115) );
  nand2 U148 ( .a(state[0]), .b(n116), .out(N127) );
  inv U149 ( .in(N126), .out(n116) );
  inv U150 ( .in(n117), .out(N122) );
  nor2 U151 ( .a(N121), .b(state[0]), .out(n117) );
  nand2 U152 ( .a(state[0]), .b(n118), .out(N117) );
  inv U153 ( .in(N116), .out(n118) );
  inv U154 ( .in(n119), .out(N112) );
  nor2 U155 ( .a(N111), .b(state[0]), .out(n119) );
  nand2 U156 ( .a(state[0]), .b(n120), .out(N107) );
  inv U157 ( .in(N106), .out(n120) );
  inv U158 ( .in(n121), .out(N102) );
  nor2 U159 ( .a(N101), .b(state[0]), .out(n121) );
  inv U160 ( .in(n122), .out(N40) );
  inv U161 ( .in(n123), .out(N41) );
  inv U162 ( .in(N44), .out(n124) );
  inv U163 ( .in(N45), .out(n125) );
  inv U164 ( .in(N49), .out(n126) );
  inv U165 ( .in(N50), .out(n127) );
  inv U166 ( .in(N54), .out(n128) );
  inv U167 ( .in(N55), .out(n129) );
  inv U168 ( .in(N59), .out(n130) );
  inv U169 ( .in(N60), .out(n131) );
  inv U170 ( .in(N64), .out(n132) );
  inv U171 ( .in(N65), .out(n133) );
  inv U172 ( .in(N69), .out(n134) );
  inv U173 ( .in(N70), .out(n135) );
  inv U174 ( .in(N74), .out(n136) );
  inv U175 ( .in(N75), .out(n137) );
  inv U176 ( .in(N79), .out(n138) );
  inv U177 ( .in(N80), .out(n139) );
  inv U178 ( .in(N84), .out(n140) );
  inv U179 ( .in(N85), .out(n141) );
  inv U180 ( .in(N89), .out(n142) );
  inv U181 ( .in(N90), .out(n143) );
  inv U182 ( .in(N94), .out(n144) );
  inv U183 ( .in(N95), .out(n145) );
  inv U184 ( .in(N99), .out(n146) );
  inv U185 ( .in(N100), .out(n147) );
  inv U186 ( .in(N104), .out(n148) );
  inv U187 ( .in(N105), .out(n149) );
  inv U188 ( .in(N109), .out(n150) );
  inv U189 ( .in(N110), .out(n151) );
  inv U190 ( .in(N114), .out(n152) );
  inv U191 ( .in(N115), .out(n153) );
  inv U192 ( .in(N119), .out(n154) );
  inv U193 ( .in(N120), .out(n155) );
  inv U194 ( .in(N124), .out(n156) );
  inv U195 ( .in(N125), .out(n157) );
  inv U196 ( .in(N129), .out(n158) );
  inv U197 ( .in(N130), .out(n159) );
  inv U198 ( .in(N134), .out(n160) );
  inv U199 ( .in(N135), .out(n161) );
  inv U200 ( .in(N139), .out(n162) );
  inv U201 ( .in(N140), .out(n163) );
  inv U202 ( .in(N144), .out(n164) );
  inv U203 ( .in(N145), .out(n165) );
  inv U204 ( .in(N149), .out(n166) );
  inv U205 ( .in(N150), .out(n167) );
  inv U206 ( .in(N154), .out(n168) );
  inv U207 ( .in(N155), .out(n169) );
  inv U208 ( .in(N211), .out(n170) );
endmodule

