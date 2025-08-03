module piso(input clk, input reset, input load, input[3:0] in, output reg[3:0] out,output reg out_series);
  
  always @(posedge clk) 
    begin
      if(reset)
        out<=4'b0000;
      else if (load)
        out<=in;
      else
        begin

          out_series<= out[0];
          out[3:0]<= {1'b0, out[3:1]};
        end
      

    end
  
endmodule

module d(input clk, input reset, input in, output reg out);
  always @(posedge clk)
    begin 
      if(reset)
        out<= 1'b0;
      else
        out<=in;
      
    end
endmodule
