module two_one_mux(
            input A,
            input B,
            input s,
            output Y
            );

assign Y= s ? A : B ;
endmodule