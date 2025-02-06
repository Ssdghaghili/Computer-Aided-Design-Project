`timescale 1ns/1ns

//simple multiplier. 1 clock
(* use_dsp = "yes" *) module Multiplier #(
    parameter integer INPUT_WIDTH_A = 8, //first input bit width
    parameter integer INPUT_WIDTH_B = 8, //second input bit width
    parameter integer OUTPUT_WIDTH = INPUT_WIDTH_A + INPUT_WIDTH_B //output bitwidth
) (
    input clk,
    input en, //enable
    input rstn,
    input signed [INPUT_WIDTH_A - 1 : 0] data_in_a, //first input data
    input signed [INPUT_WIDTH_B - 1 : 0] data_in_b, //second input data
    output reg signed [OUTPUT_WIDTH - 1 : 0] data_out //output data
);

//multiply at one clock
always @(posedge clk) begin
    if (~rstn)
        data_out <= 0;
        
    if (en)
        data_out <= data_in_a * data_in_b;

    
end
    
endmodule