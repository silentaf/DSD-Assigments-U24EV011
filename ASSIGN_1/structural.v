module fa_stru(input a, input b, input cin, output cout, output sum);
    wire t1, t2, t3;
    
    xor(t1, a, b);
    xor(sum, t1, cin);
    and(t2, a, b);
    and(t3, t1, cin);
    or(cout, t3, t2);
endmodule
