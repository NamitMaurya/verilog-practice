module upDown_tb ;

reg clk ;
reg rst ;
reg up ;
wire [3:0]count ;

up_down_counter uut(
           .clk(clk),
           .rst(rst),
           .up(up),
           .count(count)
           );

initial begin
     clk=0 ;
     forever #5 clk = ~clk ;
end

initial begin
     rst=1 ;
     up=1 ;
     repeat(3) @(posedge clk) ;
     rst=0 ;
     repeat(14) @(posedge clk) ;
     up=0 ;
     repeat(12) @(posedge clk) ;
     rst=1 ;
end 

initial begin
      $monitor("Time=%0t Reset=%b Count=%d UP=%b",$time,rst,count,up) ;
end

initial begin
   #200 ;
   $finish ;
end

endmodule
        