module mux_4to1 (
    input wire [2:0] sel,          // Selection input
    input wire [31:0] in0,         // LUT value for 1/n when n=4
    input wire [31:0] in1,         // LUT value for 1/n when n=3
    input wire [31:0] in2,         // LUT value for 1/n when n=2
    input wire [31:0] in3,         // LUT value for 1/n when n=1
    output wire [31:0] out         // Selected output
);
    assign out = (sel == 3'd0) ? in0 :
                 (sel == 3'd1) ? in1 :
                 (sel == 3'd2) ? in2 :
                 (sel == 3'd3) ? in3 : 32'b0;  // Default case to avoid latches
endmodule