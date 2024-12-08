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






module cblock (
    input c0,          
    input p1, p2, p3, p4,
    input g1, g2, g3, g4, 
    output c1, c2, c3, c4 
);
    wire w1, w2, w3, w4;          
    wire w5, w6, w7, w8, w9;      
    
 
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
