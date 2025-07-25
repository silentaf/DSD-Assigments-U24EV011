`timescale 1ns/1ps

module encoder_tb;
  reg[7:0] in;
  wire[2:0] out;
  
  encoder dut(.in(in), .out(out));
  initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(0, encoder_tb);
  end
  
  initial begin 
    $display("time\t in | out");
    $monitor("%g\t %b | %b ", $time, in, out);
    in= 8'b00000001; #10;
    in= 8'b10010101; #10;
    in= 8'b00000000; #10;
    $finish;
  end
endmodule


