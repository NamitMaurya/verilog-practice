module full_adder(
        input A,
        input B,
        input cin,
        output sum,
        output cout
        );
 wire s1 ;
 wire c1,c2 ;
 
  half_adder ha0(
        .A(A),
        .B(B),
        .sum(s1),
        .cout(c1)
        );
    
 half_adder ha1(
        .A(s1),
        .B(cin),
        .sum(sum),
        .cout(c2)
        );
 
assign cout= c1 | c2 ;

endmodule