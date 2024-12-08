`timescale 1ns / 1ps
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
module pggen( a,b,p,g);
  
  input a;
  input b;
  output p;
  output g;

and_gate a1(a,b,g);
xor_gate x1(a,b,p);


endmodule

module pgblock (
    input a1, a2, a3, a4,
    input b1, b2, b3, b4,
    output p1, p2, p3, p4,
    output g1, g2, g3, g4
);
    pggen pg1(a1, b1, p1, g1);
    pggen pg2(a2, b2, p2, g2);
    pggen pg3(a3, b3, p3, g3);
    pggen pg4(a4, b4, p4, g4);
    
endmodule