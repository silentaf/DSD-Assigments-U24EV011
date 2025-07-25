`timescale 1ns/1ps

module decoder_tb;
  reg[1:0] in;reg en;
  wire[3:0] out;
  
  decoder dut(.in(in), .en(en), .out(out));
  initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0, decoder_tb);
  end
  
  initial begin 
    $display("time\t en in | out");
    $monitor("%g\t %b %b | %b ", $time, en, in, out);
    en=1;
    in= 2'b00; #10;
    in= 2'b01; #10;
    in= 2'b10; #10;
    in= 2'b11; #10;
    
    en = 0;
    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;
    $finish;
  end
endmodule
    
