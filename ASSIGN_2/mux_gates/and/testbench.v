`timescale 1ns/1ps

module and_mux_tb;
  reg[1:0] in; reg sel;
  wire out;
  
  and_mux dut(.in(in),.sel(sel), .out(out));
  initial begin
    $dumpfile("and_mux.vcd");
    $dumpvars(0, and_mux_tb);
  end
  
  initial begin 
    $display("time\t in sel | out");
    $monitor("%g\t %b  %b | %b ", $time, in, sel, out);
    in= 2'b00;sel=0;#10;
    in= 2'b01; sel=0;#10;
    in= 2'b10;sel=0; #10;
    in= 2'b11;sel=0; #10;
    in= 2'b00;sel=1;#10;
    in= 2'b01; sel=1;#10;
    in= 2'b10;sel=1; #10;
    in= 2'b11;sel=1; #10;
  
    $finish;
  end
endmodule
    
