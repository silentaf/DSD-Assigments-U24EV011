`timescale 1ns/1ps

module fa_tb;
  reg a, b, c;
  wire sum, cout;

  fa_stru uut( .a(a), .b(b), .cin(c), .cout(cout), .sum(sum));

  initial begin
    $dumpfile("fa_stu.vcd");   
    $dumpvars(1, fa_tb);       
  end

  initial begin
    $display("Time \t a b c | sum cout");
    $monitor("%g \t %b %b %b |  %b   %b", $time, a, b, c, sum, cout);

    a=0; b=0; c=0; #10;
    a=0; b=0; c=1; #10;
    a=0; b=1; c=0; #10;
    a=0; b=1; c=1; #10;
    a=1; b=0; c=0; #10;
    a=1; b=0; c=1; #10;
    a=1; b=1; c=0; #10;
    a=1; b=1; c=1; #10;

    $finish;
  end
endmodule
