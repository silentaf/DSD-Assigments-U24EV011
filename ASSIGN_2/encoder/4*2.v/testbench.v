`timescale 1ns/1ps

module encoder_tb;
  reg[3:0] in;reg en;
  wire[1:0] out;
  
  encoder dut(.in(in), .en(en), .out(out));
  initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(0, encoder_tb);
  end
  
  initial begin 
    $display("time\t en in | out");
    $monitor("%g\t %b %b | %b ", $time, en, in, out);
    en=1;
    in= 4'b0001; #10;
    in= 4'b0010; #10;
    in= 4'b0100; #10;
    in= 4'b1000; #10;
 
 
    en=0;
    in= 4'b0001; #10;
    in= 4'b0010; #10;
    in= 4'b0100; #10;
    in= 4'b1000; #10;
    $finish;
  end
endmodule
    
