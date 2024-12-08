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

module or_gate(
    input a, b,
    output or_out
);
    wire n1, n2;
    nand(n1, a, a);
    nand(n2, b, b);
    nand(or_out, n1, n2);
endmodule

module pggen(
    input a, b,
    output p, g
);
    and_gate and1(a, b, g);
    xor_gate xor1(a, b, p);
endmodule

module pgblock(
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






module cblock (
    input c0,          
    input p1, p2, p3, p4,
    input g1, g2, g3, g4, 
    output c1, c2, c3, c4 
);
    wire w1, w2, w3, w4;          
    wire w5, w6, w7, w8, w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23;      
    
 
    and_gate and1(p1, c0, w1);
    or_gate or1(w1, g1, c1);


   
    and_gate and3(p2, p1, w3);         
    and_gate and4(w3, c0, w4);         
    and_gate and5(p2, g1, w5);        
    or_gate or3(w4, w5, w6);           
    or_gate or4(w6, g2, c2);           

   
    and_gate and6(p3, p2, w7);         
    and_gate and7(w7, p1, w8);        
    and_gate and8(w8, c0, w9);         
    and_gate and9(w7, g1, w10);        
    and_gate and10(p3, g2, w11);       
    or_gate or5(w9, w10, w12);         
    or_gate or6(w12, w11, w13);        
    or_gate or7(w13, g3, c3);          

    and_gate and11(p4, p3, w14);       
    and_gate and12(w14, p2, w15);      
    and_gate and13(w15, p1, w16);      
    and_gate and14(w16, c0, w17);      
    and_gate and15(w15, g1, w18);      
    and_gate and16(w14, g2, w19);      
    and_gate and17(p4, g3, w20);      
    or_gate or8(w17, w18, w21);        
    or_gate or9(w21, w19, w22);        
    or_gate or10(w22, w20, w23);      
    or_gate or11(w23, g4, c4);         

endmodule

// Sum Block for CLA
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

// D Flip-Flop for Synchronization
module dff(
    input clk, D,
    output reg Q
);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

// 4-bit Carry Lookahead Adder with flip-flops for inputs and outputs
module CLA(
    input clk,
    input a1, a2, a3, a4,
    input b1, b2, b3, b4,
    input c0,
    output s1, s2, s3, s4,
    output c4
);
    wire p1, p2, p3, p4;
    wire g1, g2, g3, g4;
    wire c1, c2, c3;
    wire a1_d, a2_d, a3_d, a4_d;
    wire b1_d, b2_d, b3_d, b4_d;
    wire c0_d;
    wire s1_d, s2_d, s3_d, s4_d;
    wire c4_d;

    // Synchronize inputs using D flip-flops
    dff dff_a1(clk, a1, a1_d);
    dff dff_a2(clk, a2, a2_d);
    dff dff_a3(clk, a3, a3_d);
    dff dff_a4(clk, a4, a4_d);
    dff dff_b1(clk, b1, b1_d);
    dff dff_b2(clk, b2, b2_d);
    dff dff_b3(clk, b3, b3_d);
    dff dff_b4(clk, b4, b4_d);
    dff dff_c0(clk, c0, c0_d);

    // Propagate and Generate Block
    pgblock pg(
        .a1(a1_d), .a2(a2_d), .a3(a3_d), .a4(a4_d),
        .b1(b1_d), .b2(b2_d), .b3(b3_d), .b4(b4_d),
        .p1(p1), .p2(p2), .p3(p3), .p4(p4),
        .g1(g1), .g2(g2), .g3(g3), .g4(g4)
    );

    // Carry Block
    cblock carry(
        .c0(c0_d),
        .p1(p1), .p2(p2), .p3(p3), .p4(p4),
        .g1(g1), .g2(g2), .g3(g3), .g4(g4),
        .c1(c1), .c2(c2), .c3(c3), .c4(c4_d)
    );

    // Sum Block
    sumblock sum(
        .p1(p1), .p2(p2), .p3(p3), .p4(p4),
        .c0(c0_d), .c1(c1), .c2(c2), .c3(c3),
        .s1(s1_d), .s2(s2_d), .s3(s3_d), .s4(s4_d)
    );

    // Synchronize outputs using D flip-flops
    dff dff_s1(clk, s1_d, s1);
    dff dff_s2(clk, s2_d, s2);
    dff dff_s3(clk, s3_d, s3);
    dff dff_s4(clk, s4_d, s4);
    dff dff_c4(clk, c4_d, c4);
endmodule
