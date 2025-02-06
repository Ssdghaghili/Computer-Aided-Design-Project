`timescale 1ns/1ns

`define HALF_CLK 5
`define CLK (2 * `HALF_CLK)
module PE_testbench;
    parameter CONFIG_BIT = 5;
    
    parameter IFMAP_DATA_WIDTH = 16; 
    parameter IFMAP_BUFFER_DEPTH = 25; 
    parameter IFMAP_PAR_WRITE = 1; 
    parameter IFMAP_PAR_READ = 1; 
    parameter IFMAP_SPAD_DEPTH = 10; 
     

    parameter FILTER_DATA_WIDTH = 16; 
    parameter FILTER_BUFFER_DEPTH = 8; 
    parameter FILTER_PAR_WRITE = 1; 
    parameter FILTER_PAR_READ = 1; 
    parameter FILTER_SPAD_DEPTH = 5;

    parameter PSUM_BUFFER_DEPTH = 20;
    parameter PSUM_PAR_WRITE = 1;
    parameter PSUM_PAR_READ = 1;  
    parameter PSUM_WIDTH = 16;
    parameter PSUM_NUM = 15;

    
    parameter FILTER_SIZE = 4;
    parameter FILTER_NUM = 1;
    parameter IFMAP_SIZE = 8;
    parameter IFMAP_NUM = 3;


    logic clk;
    logic rstn;
    logic en;
    logic ifmap_wen;
    logic ifmap_ready;

    logic filter_wen;
    logic filter_ready;
    logic filter_start;
    logic filter_done;

    logic start;

    logic [IFMAP_PAR_WRITE * IFMAP_DATA_WIDTH - 1 : 0] ifmap_din;

    logic[IFMAP_DATA_WIDTH - 1 : 0] ifmap_rand_data [0:IFMAP_PAR_WRITE-1];

    logic [FILTER_PAR_WRITE * FILTER_DATA_WIDTH - 1 : 0] filter_din;

    logic[FILTER_DATA_WIDTH - 1 : 0] filter_rand_data [0:FILTER_PAR_WRITE-1];

    logic[FILTER_DATA_WIDTH - 1 : 0] filters [0 : FILTER_SIZE * FILTER_NUM - 1];
    logic[IFMAP_DATA_WIDTH - 1 : 0] ifmaps [0 : IFMAP_SIZE * IFMAP_NUM - 1];
    logic[PSUM_WIDTH - 1 : 0] psums [0 : PSUM_NUM - 1];

    initial begin
        $readmemb("./testCases/test_final1_filter.txt", filters);
        $readmemb("./testCases/test_final1_ifmap.txt", ifmaps);
        $readmemb("./testCases/test_final1_psum.txt", psums);
    end



    PE #(
        .CONFIG_BIT(CONFIG_BIT),
        .IFMAP_DATA_WIDTH(IFMAP_DATA_WIDTH),
        .IFMAP_BUFFER_DEPTH(IFMAP_BUFFER_DEPTH),
        .IFMAP_PAR_WRITE(IFMAP_PAR_WRITE),
        .IFMAP_PAR_READ(IFMAP_PAR_READ),
        .IFMAP_SPAD_DEPTH(IFMAP_SPAD_DEPTH),
        .FILTER_DATA_WIDTH(FILTER_DATA_WIDTH),
        .FILTER_BUFFER_DEPTH(FILTER_BUFFER_DEPTH),
        .FILTER_PAR_WRITE(FILTER_PAR_WRITE),
        .FILTER_PAR_READ(FILTER_PAR_READ),
        .FILTER_SPAD_DEPTH(FILTER_SPAD_DEPTH),
        .PSUM_BUFFER_DEPTH(PSUM_BUFFER_DEPTH),
        .PSUM_PAR_WRITE(PSUM_PAR_WRITE),
        .PSUM_PAR_READ(PSUM_PAR_READ)

    ) dut (
        .clk(clk),
        .rstn(rstn),
        .en(en), //enable
        .filter_done(filter_done),
        .ifmap_wen(ifmap_wen), //write enable
        .ifmap_din(ifmap_din), //input data
        .ifmap_ready(ifmap_ready),
        .filter_size(FILTER_SIZE),
        .ifmap_size(IFMAP_SIZE),
        .psum_ren(0),
        .filter_wen(filter_wen),
        .filter_din(filter_din),
        .filter_ready(filter_ready),
        .start(start)
    );

    always @(clk)begin
        # `HALF_CLK
        clk <= ~clk;
    end

    task automatic sendIfmapData(
        ref logic wen,
        ref logic ready,
        ref logic [IFMAP_PAR_WRITE * IFMAP_DATA_WIDTH - 1 : 0] din,
        // ref logic [IFMAP_DATA_WIDTH - 1 : 0] data_in [0:IFMAP_PAR_WRITE - 1]
        ref logic [IFMAP_DATA_WIDTH - 1 : 0] data_in

    );
        begin
            wen = 1;
            while (!ready) begin
                @(posedge clk);
            end

            // din = 0;
            // for (int i = 0; i < IFMAP_PAR_WRITE; i++)
            //     din |= data_in[i] << (i * IFMAP_DATA_WIDTH);

            din = data_in;

            @(posedge clk);
            wen = 0;
        end
    endtask

    task automatic sendFilterData(
        ref logic wen,
        ref logic ready,
        ref logic [FILTER_PAR_WRITE * FILTER_DATA_WIDTH - 1 : 0] din,
        // ref logic [FILTER_DATA_WIDTH - 1 : 0] data_in [0:FILTER_PAR_WRITE - 1]
        ref logic [FILTER_DATA_WIDTH - 1 : 0] data_in

    );
        begin

            while (!ready) begin
                @(posedge clk);
            end

            wen = 1;

            // din = 0;
            // for (int i = 0; i < FILTER_PAR_WRITE; i++)
            //     din |= data_in[i] << (i * FILTER_DATA_WIDTH);

            din = data_in;

            @(posedge clk);
            wen = 0;
            #(`CLK/2);
        end
    endtask
    
    //for writing
    initial begin
        clk = 0;
        rstn = 0;
        en = 0;
        ifmap_wen = 0;
        filter_done = 0;
        start = 1'b0;

        #`CLK;
        rstn = 1;
        en = 1;

        #`CLK;
        #`CLK;


        filter_done = 0;
        for(int i = 0; i < FILTER_SIZE; i++) begin
            sendFilterData(filter_wen, filter_ready, filter_din, filters[i]);
        end
        filter_done = 1;


        #`CLK;
        #`CLK;
        start = 1'b1;
        begin
            for(int i = 0; i < IFMAP_NUM * IFMAP_SIZE; i++) begin
                sendIfmapData(ifmap_wen, ifmap_ready, ifmap_din, ifmaps[i]);
            end
        end
        start = 1'b0;

    
        
        #5000 $stop;
    end

endmodule
