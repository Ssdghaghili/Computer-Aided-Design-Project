module stage_register (
    input wire clk,
    input wire reset,
    input wire [31:0] in,
    output reg [31:0] out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 0;
        else
            out <= in;
    end
endmodule