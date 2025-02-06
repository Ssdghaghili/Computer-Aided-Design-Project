`timescale 1ns/1ns

//counter from 0 to MAX
//reset counting when:
//1. reset is set
//2. reaching max

//enable signal need to be set for counting
module Counter #(
    parameter integer MAX = 7, //upper bound of count
    parameter integer WIDTH = $clog2(MAX) //bitwidth of counter
)
(
    input clk,
    input en, //enable
    input rstn, //active low reset
    input clear, //clear counter
    output at_max, //counter finish signal
    output reg [WIDTH - 1 : 0] count, //current counter output value
    output reg [WIDTH - 1 : 0] prev_count //previous value of counter
);

always @(posedge clk) begin
    if (!rstn) begin
        count <= 0;
        prev_count <= 0;
    end else if (clear) begin
        count <= 0;
        prev_count <= 0;
    end else if (en) begin
        if (at_max) begin
            count <= 0;
        end else if(en) begin
            count <= count + {{(WIDTH - 1){1'b0}}, 1'b1};
        end
        prev_count <= count;
    end
end

assign at_max = (count == (MAX - 1));
endmodule
