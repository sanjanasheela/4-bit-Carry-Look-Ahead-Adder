`timescale 1ns / 1ps

module pg_testbench;

    reg a1, a2, a3, a4;
    reg b1, b2, b3, b4;
    wire p1, p2, p3, p4;
    wire g1, g2, g3, g4;

    pgblock uut (
        .a1(a1), .a2(a2), .a3(a3), .a4(a4),
        .b1(b1), .b2(b2), .b3(b3), .b4(b4),
        .p1(p1), .p2(p2), .p3(p3), .p4(p4),
        .g1(g1), .g2(g2), .g3(g3), .g4(g4)
    );

    integer i;

    initial begin
        $display("Testing pgblock with all combinations of a1 and b1");
        $dumpfile("pg.vcd"); 
        $dumpvars(0, pg_testbench);
        for (i = 0; i < 256; i = i + 1) begin
            {a1, a2, a3, a4, b1, b2, b3, b4} = i;
            #10;
            $display("Test Case %d: a1=%b a2=%b a3=%b a4=%b, b1=%b b2=%b b3=%b b4=%b     p1=%b p2=%b p3=%b p4=%b, g1=%b g2=%b g3=%b g4=%b", 
                    i, a1, a2, a3, a4, b1, b2, b3, b4, p1, p2, p3, p4, g1, g2, g3, g4);
        end

        $finish;
    end

endmodule
