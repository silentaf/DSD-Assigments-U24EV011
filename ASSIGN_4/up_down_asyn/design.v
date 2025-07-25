//Asynchronous up and down counte

module bcd_count(input reset,input m, input clk, output reg[3:0] out);
  always @(posedge clk or posedge reset)
    begin
      if(reset )
        out=4'b0000;
      else
        begin
          if(m)
            begin
              if(out==4'd9)
                out=4'b0000;
              else
                out=out+1;
            end
          else
            begin
              if(out==4'b0000)
                out=4'd9;
              else
                out=out-1;
            end
        end       
    end
endmodule
