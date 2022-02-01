module insertion(input clk, 
                 input reset,
                 input quarter_in,
                 //input dollar_in,
                 input select1,
		 input select2,
                 output i[2:0], 
		 output quarter);
	input clk;
	input reset;
	input quarter_in;
	//input dollar_in;
	//input t_complete;
  output i[2:0];
	output s1;
	output s2;
  
  reg [3:0] state;

  // State encodings
  parameter [3:0]
    I0    	= 3'b000,
    I1 		= 3'b001,
    I2   	= 3'b010;
    I3   	= 3'b011;
    I4   	= 3'b100;
    I5   	= 3'b101;
    I6   	= 3'b110;
  // State transitions
  always @(posedge clk) begin
    case (state)
      I0: 
	i <= 2'b00;
	s1 <= 0;
 	s2 <= 0;
	quarter <= 0;
        if (quarter_in) 
          state <= I1;
        end if
      I1:
	i <= 2'b01;
	s1 <= 0;
 	s2 <= 0;
	quarter <= 0;
	if (quarter_in) 
          state <= I2;
        end if
      I2:
	i <= 2'b10;
	s1 <= 0;
 	s2 <= 0;
	quarter <= 0;
	if (quarter_in) 
          state <= I3;
	else if (select1)
	  state <= I5;
        end if
      I3:
	i <= 2'b11;
	s1 <= 0;
 	s2 <= 0;
	quarter <= 0;
	if (select1) 
	  state <= I6;
	if (select2)
	  state <= I4;	
	end if
	I4:
	i <= 2'b11;
	s1 <= 0;
 	s2 <= 1;
`	quarter <= 0;
	  state <= I0;
	I5:
	i <= 2'b10;
	s1 <= 1;
 	s2 <= 0;
`	quarter <= 0;
	  state <= I0;		  
	I6:
	i <= 2'b11;
	s1 <= 0;
 	s2 <= 1;
`	quarter <= 1;
	  state <= I0;			  
      default:
        state <= I0;
    endcase
  end

endmodule
