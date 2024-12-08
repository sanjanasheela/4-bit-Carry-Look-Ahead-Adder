`timescale 1ns / 1ps

module CLA_testbench;

    reg clk;
    reg a1, a2, a3, a4;
    reg b1, b2, b3, b4;
    reg c0;
    wire s1, s2, s3, s4;
    wire c4;

    CLA uut (
        .clk(clk),
        .a1(a1), .a2(a2), .a3(a3), .a4(a4),
        .b1(b1), .b2(b2), .b3(b3), .b4(b4),
        .c0(c0),
        .s1(s1), .s2(s2), .s3(s3), .s4(s4),
        .c4(c4)
    );


    always begin
        #5 clk = ~clk;  
    end

    integer i;  
    initial begin
        $dumpfile("CLA_testbench.vcd"); 
        $dumpvars(0, CLA_testbench);
       
        clk = 0;
        a1 = 0; a2 = 0; a3 = 0; a4 = 0;
        b1 = 0; b2 = 0; b3 = 0; b4 = 0;
        c0 = 0;

        $monitor("Time = %0t | clk = %b | a1 = %b, a2 = %b, a3 = %b, a4 = %b | b1 = %b, b2 = %b, b3 = %b, b4 = %b | c0 = %b | s1 = %b, s2 = %b, s3 = %b, s4 = %b | c4 = %b", 
                 $time, clk, a1, a2, a3, a4, b1, b2, b3, b4, c0, s1, s2, s3, s4, c4);

        for (i = 0; i < 512; i = i + 1) begin
            {a1, a2, a3, a4, b1, b2, b3, b4, c0} = i;
            #5;  
        end

        $finish;
    end
endmodule
