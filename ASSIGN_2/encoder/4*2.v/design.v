module encoder(input[3:0] in, input en, output reg[1:0] out);  //4*2
  always @(*)
   begin
     if (en)
       begin
         case( in)
           4'b0001: out=2'b00;
           4'b0010: out= 2'b01;
           4'b0100: out= 2'b10;
           4'b1000: out= 2'b11;
           default: out= 2'bxx;
         endcase
       end
     else
       out= 2'b00;
     
   end
  

endmodule
