module insertion(input clk, 
                 input reset,
                 input quarter_in,
                 input dollar_in,
                 input t_complete,
                 output i[2:0], 
                 output Q,
                 output D);
	input clk;
	input reset;
	input quarter_in;
	input dollar_in;
	input t_complete;
  output i[2:0];
	output Q;
	output D;
  
  reg [3:0] state;

  // State encodings
  parameter [3:0]
    I0    	= 4'B0000,
    I1 		= 4'b0001,
    I2   	= 4'b0010;
  
  // State transitions
  always @(posedge clk) begin
    case (state)
      I0:
        if (quarter_in) begin
          state <= I1;
          i <= 3'B000;
          Q <= 0;
          D <= 0;
        end elseif (dollar_in) begin
          
        end elseif (t_complete) begin
          
        end
      I1:

      I2:

      default:
        state <= I0;
    endcase
  end

endmodule
