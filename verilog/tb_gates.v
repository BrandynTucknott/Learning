module mux_tb;
    // ANSI escape for colors
    parameter GREEN = "\033[32m";
    parameter RED = "\033[31m";
    parameter RESET = "\033[0m";

    reg A, B, X;
    wire out_gate, out_data, out_behav;

    // instantiate all three
    // all of these are different implementations of
    // (A and NOT(X)) OR (B and X) := B if X else A
    multiplex_gatelevel uut_gate(A, B, X, out_gate);
    multiplex_datalevel uut_data(A, B, X, out_data);
    multiplex_behavior  uut_behav(A, B, X, out_behav);

    // entry point (like main, but you are allowed to have more than one)
    // initial begin
    reg expected[0:7];
    integer i;
    initial begin
        expected[0] = 0;
        expected[1] = 0;
        expected[2] = 0;
        expected[3] = 1;
        expected[4] = 1;
        expected[5] = 0;
        expected[6] = 1;
        expected[7] = 1;

        for (i = 0; i < 8; i = i + 1) begin
            {A, B, X} = i; // assign bits of i to A, B, X
            #10; // wait 10 ns
            $display("A=%b B=%b X=%b | gate=%b data=%b behav=%b | expected=%b | %s%s%s", A, B, X, out_gate, out_data, out_behav, expected[i],
            (out_gate === expected[i]) ? GREEN : RED,// change color
            (out_gate === expected[i]) ? "PASS" :"FAIL", // TB result
            RESET); // reset color
        end
        $finish;
    end

endmodule