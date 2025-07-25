module decoder(input[2:0] in, input en, output reg[7:0] out);
  always @(*)
    begin
      if(en)
        begin

          case(in)
            3'd0: out=8'd0;
            3'd1: out=8'd1;
            3'd2: out=8'd2;
            3'd3: out=8'd3;
            3'd4: out= 8'd4;
            3'd5: out= 8'd5;
            3'd6: out= 8'd6;
            3'd7: out= 8'd7;
          endcase
        end
      else
        out=8'd0;
    end

endmodule
