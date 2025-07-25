`timescale 1ns/1ps

module encoder_tb;
  reg[7:0] in;reg en;
  wire[2:0] out;
  
  encoder dut(.in(in), .en(en), .out(out));
  initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(0, encoder_tb);
  end
  
  initial begin 
    $display("time\t en in | out");
    $monitor("%g\t %b %b | %b ", $time, en, in, out);
    en=1;
    in= 8'b00000001; #10;
    in= 8'b00000010; #10;
    in= 8'b00000100; #10;
    in= 8'b00001000; #10;
    in= 8'b00010000; #10;
    in= 8'b00100000; #10;
    in= 8'b01000000; #10;
    in= 8'b10000000; #10;
 
 
    en=0;
    in= 8'b00000001; #10;
    in= 8'b00000010; #10;
    in= 8'b00000100; #10;
    in= 8'b00001000; #10;
    in= 8'b00010000; #10;
    in= 8'b00100000; #10;
    in= 8'b01000000; #10;
    in= 8'b10000000; #10;
   
    $finish;
  end
endmodule
    
