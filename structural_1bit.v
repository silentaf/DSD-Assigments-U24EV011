module full_adder_structural(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire w1, w2, w3, w4, w5;

    xor (w1, a, b);      // First XOR gate
    xor (sum, w1, cin);  // Second XOR gate for sum
    and (w2, a, b);      // First AND gate
    and (w3, b, cin);    // Second AND gate
    and (w4, a, cin);    // Third AND gate
    or  (w5, w2, w3);    // First OR gate
    or  (cout, w5, w4);  // Second OR gate for carry

endmodule
