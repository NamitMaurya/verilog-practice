module sd_tb ;

reg X ;
reg clk ;
reg rst ;
wire Y ;

sequence_101_detector uut(
            .X(X),
            .clk(clk),
            .rst(rst),
            .Y(Y)
            );

initial begin
     clk=0 ;
     forever #5 clk=~clk ;
  end

initial begin 
  $monitor("Timw=%0t Input=%b state=%b Output=%b",$time,X,uut.state,Y) ;
end

initial begin
   rst=1 ;
   X=0 ;
   repeat(3) @(posedge clk) ;
   rst=0 ;

//Input sequence

    X=0 ;
    @(posedge clk) ;
    X=1 ;
    @(posedge clk) ;
    X=0 ;
    @(posedge clk) ;
    X=1 ;
    @(posedge clk) ;
    X=0 ;
    @(posedge clk) ;
    X=1 ;
    @(posedge clk) ;
    X=0 ;
    @(posedge clk) ;
    X=0 ;
    repeat(3)@(posedge clk) ;
    rst=1 ;
    $finish ;
end
endmodule

