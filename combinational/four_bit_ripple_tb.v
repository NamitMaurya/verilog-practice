module tb;

reg  [3:0] A;
reg  [3:0] B;
reg        Cin;
wire [3:0] S;
wire       Cout;

four_bit_ripple_carry uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
);

integer i;

initial begin

   
    $monitor("A=%d B=%d Cin=%d -> S=%d Cout=%d",
              A, B, Cin, S, Cout);

    
    for (i = 0; i < 512; i = i + 1) begin
        {A, B, Cin} = i;
        #10;

        
        if ({Cout, S} !== (A + B + Cin)) begin
            $display("ERROR at A=%d B=%d Cin=%d", A, B, Cin);
        end
    end

    $display("Simulation Finished.");
    $finish;

end

endmodule
