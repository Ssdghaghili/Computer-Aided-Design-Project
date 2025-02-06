module lut (
    input wire [2:0] n,           
    output reg [31:0] value
);
    always @(*) begin
        case (n)
            3'd1: value = 32'h3F800000; // 1.0 in IEEE-754
            3'd2: value = 32'hBF000000; // -0.5 in IEEE-754
            3'd3: value = 32'h3EAAAAAB; // 0.3333 in IEEE-754
            3'd4: value = 32'hBE800000; // -0.25 in IEEE-754
            3'd5: value = 32'h3E4CCCCD; // 0.2 in IEEE-754
            3'd6: value = 32'hBE2AAAAA; // -0.1667 in IEEE-754
            3'd7: value = 32'h3E124925; // 0.142857 in IEEE-754
            3'd8: value = 32'hBE000000; // -0.125 in IEEE-754
            default: value = 32'h00000000; // Default value
        endcase
    end
endmodule