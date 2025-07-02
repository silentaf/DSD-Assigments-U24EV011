module full_adder_structural(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    wire w1, w2, w3, w4, w5;

    xor (w1, a, b);      
    xor (sum, w1, cin);  
    and (w2, a, b);      
    and (w3, b, cin);    
    and (w4, a, cin);    
    or  (w5, w2, w3);    
    or  (cout, w5, w4);  

endmodule
