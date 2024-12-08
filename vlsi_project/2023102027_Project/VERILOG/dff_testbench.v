module dff_tb;
    reg clk;
    reg D;
    wire Q;

    dff uut (
        .clk(clk),
        .D(D),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        D = 0;
        #15 D = 1;
        #20 D = 0;
        #30 D = 1;
        #40 D = 0;
        #50 $finish;
    end

    initial begin
        $dumpfile("dff_tb.vcd"); 
        $dumpvars(0, dff_tb);   
        $monitor("Time=%0t | clk=%b | D=%b | Q=%b ", $time, clk, D, Q);
    end

endmodule