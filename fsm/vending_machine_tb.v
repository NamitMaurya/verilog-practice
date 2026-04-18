module vending_machine_tb;

    reg  clk;
    reg  rst;
    reg  x;
    wire Y;

    vending_machine uut(
        .x(x),
        .clk(clk),
        .rst(rst),
        .Y(Y)
    );

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t rst=%b x=%b(%s) state=%d Y=%b",
                 $time, rst, x, x?"$10":"$5", uut.state, Y);
    end

    // Stimulus
    initial begin
        // Initialize and reset
        rst = 1;
        x = 0;
        repeat(2) @(posedge clk);
        rst = 0;

        // Test 1: $5 + $5 + $5 = $15 → Dispense
        $display("=== Test 1: $5 + $5 + $5 ===");
        x = 0;                          // $5
        @(posedge clk);
        x = 0;                          // $5
        @(posedge clk);
        x = 0;                          // $5
        @(posedge clk);                 // Should dispense!
        @(posedge clk);                 // Let output settle

        // Reset for next test
        rst = 1;
        @(posedge clk);
        rst = 0;

        // Test 2: $5 + $10 = $15 → Dispense
        $display("=== Test 2: $5 + $10 ===");
        x = 0;                          // $5
        @(posedge clk);
        x = 1;                          // $10
        @(posedge clk);                 // Should dispense!
        @(posedge clk);                 // Let output settle

        // Reset for next test
        rst = 1;
        @(posedge clk);
        rst = 0;

        // Test 3: $10 + $5 = $15 → Dispense
        $display("=== Test 3: $10 + $5 ===");
        x = 1;                          // $10
        @(posedge clk);
        x = 0;                          // $5
        @(posedge clk);                 // Should dispense!
        @(posedge clk);                 // Let output settle

        // Reset for next test
        rst = 1;
        @(posedge clk);
        rst = 0;

        // Test 4: $10 + $10 = $20 → Dispense (overpay)
        $display("=== Test 4: $10 + $10 ===");
        x = 1;                          // $10
        @(posedge clk);
        x = 1;                          // $10
        @(posedge clk);                 // Should dispense!
        @(posedge clk);                 // Let output settle

        $display("=== All tests done ===");
        $finish;
    end

endmodule