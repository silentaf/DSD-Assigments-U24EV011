// sync down counter 

module count(input reset, input clk, output reg[3:0] out);
  always @(posedge clk)
    begin
      if(reset)
        out<=4'd9;
      else if ( out==4'd0)
        out<=4'd9;
      else
        out<= out-1;
      
        
    end
endmodule
