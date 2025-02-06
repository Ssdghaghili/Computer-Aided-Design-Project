`timescale 1ns/1ns

module FilterAddressGenerator #(
    parameter FILTER_SPAD_DEPTH = 225,
    parameter CONFIG_BIT = 5,
    parameter FILTER_SPAD_ADDRESS_WIDTH = $clog2(FILTER_SPAD_DEPTH)
) (
    input clk,
    input rstn,                                                     //active low reset
    input[CONFIG_BIT-1 : 0] offset_cnt,                             //window size
    input[CONFIG_BIT-1 : 0] filter_size,                            //filter size
    input en_filter,                                                //next filter insertion
    input clear,                                              //reset filter
    
    output[FILTER_SPAD_ADDRESS_WIDTH-1 : 0] filter_read_address,     //read address to filter spad
    output [FILTER_SPAD_ADDRESS_WIDTH-1 : 0] filter_base_address

);

    wire [FILTER_SPAD_ADDRESS_WIDTH-1 : 0] extended_offset_cnt;
    wire [FILTER_SPAD_ADDRESS_WIDTH-1 : 0] extended_filter_size;
    wire [FILTER_SPAD_ADDRESS_WIDTH-1 : 0] filter_num;
    wire [FILTER_SPAD_ADDRESS_WIDTH-1 : 0] filter_num_next;


    DFF #(
       .DATA_WIDTH(FILTER_SPAD_ADDRESS_WIDTH)
    ) filter_cnt (
       .clk(clk),  
       .rstn(rstn | clear),
       .en(en_filter),
       .data_in(filter_num_next),
       .data_out(filter_num)
    );  


    Adder #(
        .INPUT_WIDTH(FILTER_SPAD_ADDRESS_WIDTH),
        .OUTPUT_WIDTH(FILTER_SPAD_ADDRESS_WIDTH)
    ) adder_filter (
        .data_in_a(extended_filter_size),
        .data_in_b(filter_num),
        .data_out(filter_num_next)
    );

    Adder #(
        .INPUT_WIDTH(FILTER_SPAD_ADDRESS_WIDTH),
        .OUTPUT_WIDTH(FILTER_SPAD_ADDRESS_WIDTH)
    ) adder_address (
        .data_in_a(filter_num),
        .data_in_b(extended_offset_cnt),
        .data_out(filter_read_address)
    );


    assign extended_offset_cnt = {{(FILTER_SPAD_ADDRESS_WIDTH - CONFIG_BIT){1'b0}}, offset_cnt};
    assign extended_filter_size = {{(FILTER_SPAD_ADDRESS_WIDTH - CONFIG_BIT){1'b0}}, filter_size};
    assign filter_base_address = filter_num;
endmodule