module fourbit_comparator(
            input A,
            input B,
            output Y
            ) ;
assign Y= A > B ? 1 : 0 ;

endmodule