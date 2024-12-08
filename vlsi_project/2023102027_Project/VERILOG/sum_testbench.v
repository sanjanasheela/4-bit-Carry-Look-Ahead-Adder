`timescale 1ns / 1ps

module sum_testbench;
    reg p1, p2, p3, p4;
    reg c0, c1, c2, c3;
    wire s1, s2, s3, s4;
    
    sumblock uut(
        .p1(p1), .p2(p2), .p3(p3), .p4(p4),
        .c0(c0), .c1(c1), .c2(c2), .c3(c3),
        .s1(s1), .s2(s2), .s3(s3), .s4(s4)
    );
    
    integer i;
    
    initial begin
        $dumpfile("sumblock.vcd");
        $dumpvars(0, sum_testbench);
        
        $display("p1=%b p2=%b p3=%b p4=%b c0=%b c1=%b c2=%b c3=%b s1=%b s2=%b s3=%b s4=%b",
            p1, p2, p3, p4,
            c0, c1, c2, c3,
            s1, s2, s3, s4
        );
        
        for (i = 0; i < 256; i = i + 1) begin
            {p1, p2, p3, p4, c0, c1, c2, c3} = i;
            #10;
            
            $display("p1=%b p2=%b p3=%b p4=%b c0=%b c1=%b c2=%b c3=%b s1=%b s2=%b s3=%b s4=%b",
                p1, p2, p3, p4,
                c0, c1, c2, c3,
                s1, s2, s3, s4
            );
        end
        $finish;
    end
endmodule