`timescale 1ns/1ps

module decoder_tb;
  reg[2:0] in;reg en;
  wire[7:0] out;
  
  decoder dut(.in(in), .en(en), .out(out));
  initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0, decoder_tb);
  end
  
  initial begin 
    $display("time\t en in | out");
    $monitor("%g\t %b %b | %b ", $time, en, in, out);
    en=1;
    in= 3'd0; #10;
    in= 3'd1; #10;
    in= 3'd2; #10;
    in= 3'd3; #10;
    in= 3'd4; #10;
    in= 3'd5; #10;
    in= 3'd6; #10;
    in= 3'd7; #10;
    en=0;
    in= 3'd0; #10;
    in= 3'd0; #10;
    in= 3'd0; #10;
    in= 3'd0; #10;
    in= 3'd0; #10;
    in= 3'd0; #10;
    in= 3'd0; #10;
    in= 3'd0; #10;
    
    $finish;
  end
endmodule
    
