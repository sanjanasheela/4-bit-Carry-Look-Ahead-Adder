module dff(clk, D, Q);
    input clk, D;
    output Q;
    wire clk_bar, M, O, P, N, X_bar, Q_bar, X;
    not (clk_bar, clk);
    nand (M, clk_bar, D);
    nand (N, clk_bar, ~D);
    nand (X, M, X_bar);
    nand (X_bar, N, X);
    nand (O, clk, X);
    nand (P, clk, X_bar);
    nand (Q, O, Q_bar);
    nand (Q_bar, P, Q);

endmodule
