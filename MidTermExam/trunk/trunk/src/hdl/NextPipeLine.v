module pipeline_stage_next (
    input wire clk,
    input wire reset,
    input wire [31:0] prev_out,    
    input wire [31:0] x,           
    input wire [31:0] constant,    // 1/n from LUT
    output wire [31:0] stage_out,  
    output reg overflow           
);
    wire [31:0] product, sum;

    multiplier mul (
        .a(prev_out),
        .b(x),
        .product(product)
    );

    adder add (
        .a(product),
        .b(constant),
        .sum(sum)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            overflow <= 0;
        end else if (sum > 32'h7FFFFFFF || sum < 32'h80000000) begin
            overflow <= 1; 
        end else begin
            overflow <= 0; 
        end
    end

    register stage_register (
        .clk(clk),
        .reset(reset),
        .d(sum),
        .q(stage_out)
    );
endmodule