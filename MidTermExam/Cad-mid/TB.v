`timescale 1ns / 1ps

module mclaurin_pipeline_tb;

    // Inputs
    reg clk;
    reg reset;
    reg [7:0] x;           // 8-bit Input x
    reg [2:0] N;           // Precision (0 to 7, for different stages)

    // Outputs
    wire [31:0] y;         // Final output y
    wire overflow;         // Overflow signal

    // Instantiate the mclaurin_pipeline module
    mclaurin_pipeline uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .N(N),
        .y(y),
        .overflow(overflow)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // 100 MHz clock (period 10 ns)
    end

    // Test vectors
    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        x = 8'b0;
        N = 3'b0;

        // Apply reset
        #10;
        reset = 1;  // Apply reset
        #10;
        reset = 0;  // Release reset
        
        // Test case 1: Test with a positive value for x
        x = 8'd16;  // x = 16
        N = 3'd4;   // Precision = 4 (selecting constant1 from LUT)
        #10;        // Wait for a clock cycle
        
        // Test case 2: Test with another value for x
        x = 8'd5;   // x = 5
        N = 3'd3;   // Precision = 3 (selecting constant2 from LUT)
        #10;        // Wait for a clock cycle
        
        // Test case 3: Test with a negative value for x
        x = 8'd240; // x = -16 (two's complement)
        N = 3'd2;   // Precision = 2 (selecting constant3 from LUT)
        #10;        // Wait for a clock cycle
        
        // Test case 4: Test with a higher precision (N=4)
        x = 8'd1;   // x = 1
        N = 3'd1;   // Precision = 1 (selecting constant4 from LUT)
        #10;        // Wait for a clock cycle

        // Test case 5: Reset and observe behavior
        reset = 1;  // Apply reset again
        #10;
        reset = 0;  // Release reset
        
        // Test case 6: Test with edge case for x
        x = 8'd127; // x = Max positive 8-bit value
        N = 3'd4;   // Precision = 4 (selecting constant1 from LUT)
        #10;        // Wait for a clock cycle
        
        // Test case 7: Test overflow scenario
        x = 8'd127; // x = Max positive 8-bit value
        N = 3'd3;   // Precision = 3 (selecting constant2 from LUT)
        #10;        // Wait for a clock cycle
        
        // End the simulation
        #10;
        $finish;
    end

    // Display outputs during simulation
    initial begin
        $monitor("Time: %0t | x: %h | N: %d | y: %h | Overflow: %b", $time, x, N, y, overflow);
    end

endmodule