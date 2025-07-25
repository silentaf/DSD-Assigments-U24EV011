`timescale 1ns/1ps

module bcd_encoder_tb;

  reg[3:0] a;
  wire [3:0] out;
  bcd_encoder uut (
    .a(a),
    .out(out)
  );

  initial begin
    $dumpfile("bcd.vcd");
    $dumpvars(0, bcd_encoder_tb);
    $display("Time\t a \t| out");
    $monitor("%g\t %b \t| %b", $time, a, out);
  end

  initial begin
    a=4'd0; #10;
    a= 4'd1; #10;
    a=4'd2; #10;
    a = 4'd3; #10;
    a = 4'd4; #10;
    a = 4'd5; #10;
    a = 4'd6; #10;
    a = 4'd7; #10;
    a = 4'd8; #10;
    a = 4'd9; #10;
    a = 4'd10; #10;  // Invalid BCD
    a = 4'd15; #10; //invalid

    $finish;
  end

endmodule
