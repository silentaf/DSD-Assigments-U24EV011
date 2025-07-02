module full_adder_behavioral (
  input A, B, Cin,
  output reg Sum, Cout
);

  always @ (A or B or Cin) begin

    Sum = (A ^ B) ^ Cin;

    Cout = (A & B) | (B & Cin) | (A & Cin);
  end

endmodule
