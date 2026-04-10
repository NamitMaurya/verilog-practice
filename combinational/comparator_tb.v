module comparator ;

reg A ;
reg B ;
wire Y ;

comparator( .A(A) , .B(B) , .Y(Y) ) ;
integer i ;

initial begin
$monitor ("A = %b B=%b Y=%b",A,B,Y) ;

for(i=0;i<4;i=i+1) begin
{A,B}= i;
#10 ;
end
$finish ;
end
endmodule