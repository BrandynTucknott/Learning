/*
This is code for 2-1 multiplexor using sequential logic
*/
/*
GATE LEVEL MODEL

describes
(A AND NOT(X)) OR (B AND X)
*/
module multiplex_gatelevel(A, B, X, out1);

    input A, B, X;
    output out1;

    wire not_X;
    wire out_and1, out_and2;

    not not1(not_X, X);
    and and1(out_and1, not_X, A);
    and and2(out_and2, X, B);
    or or1(out_or, out_and1, out_and2);

endmodule

/*
DATAFLOW LEVEL

describes
(A AND NOT(X)) OR (B AND X)
*/
module multiplex_datalevel(A, B, X, out1);

    input A, B, X;
    output out1;

    assign out1 = (~X & A) | (X & B);

endmodule


/*
BEHAVIORAL LEVEL

describes
*/

module multiplex_behavior(A, B, X, out1);
    input A, B, X;
    output out1;

    // procedural block
    // execute anytime any of the signals change
    always@(*)
    begin
        if (X == 0)
            out1 = A;
        else
            out1 = B;
    end
endmodule






