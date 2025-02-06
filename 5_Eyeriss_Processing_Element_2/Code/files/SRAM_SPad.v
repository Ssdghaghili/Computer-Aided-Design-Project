`timescale 1ns/1ns

module SRAM_SPad #(
    parameter integer DATA_WIDTH = 24, //data bitwidth
    parameter integer DEPTH = 96, //total size
    parameter integer ADDR_WIDTH = $clog2(DEPTH) //address bitwidth
) (
    input clk,
    input chip_en, //chip enable
    input wen, //write enable
    input ren, //read enable
    input [ADDR_WIDTH - 1 : 0] waddr, //write address
    input [ADDR_WIDTH - 1 : 0] raddr, //write address
    input [DATA_WIDTH - 1 : 0] din, //input data to write into the SRAM
    output reg [DATA_WIDTH - 1 : 0] dout //output data to read from the SRAM
);

//allocated memory
reg [DATA_WIDTH - 1 : 0] mem [0 : DEPTH - 1];

initial begin
    mem[0] = 0;
    dout = 0;    
end

//read/write at one clock, on chip enable
always @(posedge clk) begin
    if (chip_en) begin
        if (wen)
            mem[waddr] <= din;
         
        if (ren)
            dout <= mem[raddr];
    end
end

endmodule