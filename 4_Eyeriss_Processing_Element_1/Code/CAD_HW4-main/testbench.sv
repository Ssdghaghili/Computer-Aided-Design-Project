`timescale 1ns/1ns

`define HALF_CLK 5
`define CLK (2 * `HALF_CLK)
module testbench;
    parameter BUFFER_WIDTH = 16;
    parameter BUFFER_DEPTH = 8;
    parameter PAR_WRITE = 4;
    parameter PAR_READ = 1;

    reg clk;
    reg rstn;
    reg en, wen, ready, ready_out;
    reg [PAR_WRITE * BUFFER_WIDTH - 1 : 0] din;
    wire [PAR_READ * BUFFER_WIDTH - 1 : 0] dout;

    Top #(
        .BUFFER_WIDTH(BUFFER_WIDTH),
        .BUFFER_DEPTH(BUFFER_DEPTH), 
        .PAR_WRITE(PAR_WRITE),
        .PAR_READ(PAR_READ)
    ) dut (
        .clk(clk),
        .rstn(rstn),
        .en(en), //enable
        .wen(wen), //write enable
        .din(din), //input data
        .dout(dout), //data out
        .ready(ready),
        .ready_out(ready_out) //one data is read
    );

    always @(clk)begin
        # `HALF_CLK
        clk <= ~clk;
    end
    
    //for writing
    initial begin
        clk = 0;
        rstn = 0;
        en = 0;
        wen = 0;

        #`CLK;
        rstn = 1;
        en = 1;

        #`CLK;
        #`CLK;

        wen = 1;
        while (!ready) begin
            #`CLK;
        end
        din = {16'd12, 16'd8, 16'd1, 16'd5};
        #`CLK;

        while (!ready) begin
            #`CLK;
        end
        din = {16'd120, 16'd130, 16'd150, 16'd170};
        #`CLK;

        while (!ready) begin
            #`CLK;
        end
        din = {-16'd3, -16'd1, -16'd4, -16'd17};
        #`CLK;

        wen = 0;
        #`CLK;
        
    end

endmodule
