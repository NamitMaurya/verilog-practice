module four_one_muxtb ;

reg A;
reg B ;
reg C ;
reg D ;
reg s ;
wire Y ;

four_one_mux uut(.A(A) , .B(B) , .C(C) , .D(D) , .s(s) , .Y(Y) ) ;

integer i ;

initial begin
$monitor (" A=%b B=%b C=%b D=%b -> s=%b Y=%b",A,B,C,D,s,Y) ;

for (i=0;i<32;i=i+1) begin
{A,B,C,D,s}=i ;
#10 ;
end
$finish ;
end 
endmodule
