module ripple_carry_adder(
        input [3:0]A,
        input [3:0]B,
        output [3:0]Y,
        output cout
        );
wire c1,c2,c3 ;

full_adder fa0(
        .A(A[0]),
        .B(B[0]),
        .cin(0),
        .sum(Y[0]),
        .cout(c1)
        );
        
full_adder fa1(
        .A(A[1]),
        .B(B[1]),
        .cin(c1),
        .sum(Y[1]),
        .cout(c2)
        );
        
full_adder fa2(
        .A(A[2]),
        .B(B[2]),
        .cin(c2),
        .sum(Y[2]),
        .cout(c3)
        );
        
full_adder fa3(
        .A(A[3]),
        .B(B[3]),
        .cin(c3),
        .sum(Y[3]),
        .cout(cout)
        );
        
endmodule