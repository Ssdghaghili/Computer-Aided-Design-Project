`timescale 1ns/1ns

module Adder #(
    parameter INPUT_WIDTH = 16,
    parameter OUTPUT_WIDTH = INPUT_WIDTH
) (
    input [INPUT_WIDTH - 1 : 0] data_in_a, //first input data
    input [INPUT_WIDTH - 1 : 0] data_in_b, //second input data

    output [OUTPUT_WIDTH - 1 : 0] data_out   //output data
);
    
    assign data_out = data_in_a + data_in_b;


endmodule

