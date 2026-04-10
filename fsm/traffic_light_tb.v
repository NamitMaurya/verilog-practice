module traffic_light_tb;

    reg  clk;
    reg  rst;
    wire red;
    wire green;
    wire yellow;

    traffic_light uut (
        .clk(clk),
        .rst(rst),
        .red(red),
        .green(green),
        .yellow(yellow)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        $monitor("Time=%0t rst=%b R=%b G=%b Y=%b count=%d state=%d",
                 $time, rst, red, green, yellow, uut.count, uut.state);
    end

    
    initial begin
        rst = 1;
        repeat(2) @(posedge clk);

        rst = 0;

        
        repeat(20) @(posedge clk);

        $finish;
    end

endmodule