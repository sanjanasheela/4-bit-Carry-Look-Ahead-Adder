module xor_gate(
    input a, b,
    output xor_out
);
    wire n1, n2, n3;
    nand(n1, a, b);
    nand(n2, a, n1);
    nand(n3, b, n1);
    nand(xor_out, n2, n3);
endmodule
module and_gate(
    input a, b,
    output and_out
);
    wire n1;
    nand(n1, a, b);
    nand(and_out, n1, n1);
endmodule
module or_gate (
    input a, b,
    output or_out
);
    wire n1, n2;
    nand(n1, a, a);
    nand(n2, b, b);
    nand(or_out, n1, n2);
endmodule