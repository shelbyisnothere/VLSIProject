/*
 * Filename: vending_testbench.vhd
 * Authors: Anna Nguyen, David Wang, Shelby King
 * Date: 2/8/2022
 * Course: Introduction to VLSI Design EE4325.001 Spring 2022
 * Description:
 *	Test bench for vending machine FSM.
 */

module vending_fsm_testbench;
  reg clk, reset, quarter_in, select1, select2;
  reg [1:0] i;
  wire product1, product2, quarter_out;
  
  vending_machine_fsm FSM(.clk(clk), .reset(reset), .quarter_in(quarter_in),
                      .select1(select1), .select2(select2), .i(i),
                      .product1(product1), .product2(product2), .quarter_out(quarter_out));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, vending_fsm_testbench);
    
    // Purchase item 1 with $0.50
    clk = 0;
    quarter_in = 1;
    quarter_in = 1;
    select1 = 1;
    $display("Products (1): %0h, and (2) %0h", product1, product2);
    toggle_clk;
    
  end
  
  task toggle_clk;
    begin
      #10 clk = ~clk;
      #10 clk = ~clk;
    end
  endtask
endmodule


