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

module sumblock(
    input p1, p2, p3, p4,
    input c0, c1, c2, c3,
    output s1, s2, s3, s4
);
    xor_gate xor1(p1, c0, s1);
    xor_gate xor2(p2, c1, s2);
    xor_gate xor3(p3, c2, s3);
    xor_gate xor4(p4, c3, s4);
endmodule