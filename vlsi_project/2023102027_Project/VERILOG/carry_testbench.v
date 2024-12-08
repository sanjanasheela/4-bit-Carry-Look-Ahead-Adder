`timescale 1ns / 1ps

module carry_testbench;
    reg p1, p2, p3, p4;
    reg g1, g2, g3, g4;
    reg c0;
    wire c1, c2, c3, c4;
    cblock uut (
        .p1(p1), .p2(p2), .p3(p3), .p4(p4),
        .g1(g1), .g2(g2), .g3(g3), .g4(g4),
        .c0(c0),
        .c1(c1), .c2(c2), .c3(c3), .c4(c4)
    );
    
    integer i;
    
    initial begin
        $dumpfile("carryblock.vcd");
        $dumpvars(0, carry_testbench);
        

    $display("p1 p2 p3 p4 | g1 g2 g3 g4 | c0 | c1 c2 c3 c4");
    $display("--------------------------------------------------");

    for (i = 0; i < 512; i = i + 1) begin
        // Assign propagate and generate inputs as well as c0
        {p1, p2, p3, p4, g1, g2, g3, g4, c0} = i; 
        #10;

        // Display the results
        $display(" p1=%b  p2=%b  p3=%b  p4=%b |  g1=%b g2= %b  g3=%b  g4=%b |  c0=%b  |  c1=%b  c2=%b  c3=%b  c4=%b",
            p1, p2, p3, p4,  // Propagate inputs
            g1, g2, g3, g4,  // Generate inputs
            c0,              // Initial carry
            c1, c2, c3, c4   // Carry outputs
        );
    end
end

  
endmodule