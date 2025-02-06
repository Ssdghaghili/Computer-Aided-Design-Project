module pipeline_stage_first (
    input wire clk,
    input wire reset,
    input wire [31:0] x,           
    input wire [31:0] constant,    // 1/n from LUT
    output wire [31:0] stage_out, 
    output reg overflow           
);
    wire [31:0] product;

    multiplier mul (
        .a(x),
        .b(constant),
        .product(product)
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            overflow <= 0;
        end else if (product > 32'h7FFFFFFF || product < 32'h80000000) begin
            overflow <= 1; 
        end else begin
            overflow <= 0;
        end
    end

    register stage_register (
        .clk(clk),
        .reset(reset),
        .d(product),
        .q(stage_out)
    );
endmodule