module AddressGenerator #(
    parameter CONFIG_BIT = 5,
    parameter IFMAP_SPAD_ADDRESS_WIDTH = 16,
    parameter IFMAP_SPAD_DEPTH = 12,
    parameter FILTER_SPAD_DEPTH = 225,
    parameter FILTER_SPAD_ADDRESS_WIDTH = 12

)(
    input clk, rstn,
    input if_clear,
    input[CONFIG_BIT-1 : 0] filter_size, //filter size
    input[CONFIG_BIT-1 : 0] ifmap_size, //ifmap size

    input pipe_en,

    output [IFMAP_SPAD_ADDRESS_WIDTH-1 : 0] if_read_address,
    output[FILTER_SPAD_ADDRESS_WIDTH-1 : 0] filter_read_address,     //read address to filter spad
    output [IFMAP_SPAD_ADDRESS_WIDTH-1 : 0] if_base_address,
    output if_co,
    output offset_co
);
    wire [FILTER_SPAD_ADDRESS_WIDTH-1 : 0 ] offset_cnt;
    wire offset_cnt_clear;

    Counter #(.WIDTH(FILTER_SPAD_ADDRESS_WIDTH)) offset_counter (
        .clk(clk), .rstn(rstn),
        .clear(offset_cnt_clear | if_clear),
        .en(pipe_en),
        .count(offset_cnt)
    );




    IFAddressGenerator #(
        .CONFIG_BIT(CONFIG_BIT),
        .IFMAP_SPAD_ADDRESS_WIDTH(IFMAP_SPAD_ADDRESS_WIDTH),
        .FILTER_SPAD_ADDRESS_WIDTH(FILTER_SPAD_ADDRESS_WIDTH),
        .IFMAP_SPAD_DEPTH(IFMAP_SPAD_DEPTH)

    ) if_address_generator (
        .clk(clk), .rstn(rstn),
        .ifmap_size(ifmap_size),
        .offset_co(offset_co),
        .clear(if_co),
        .offset_cnt(offset_cnt),
        .readAddress(if_read_address),
        .if_base_address(if_base_address),
        .if_co(if_co)
    );


    assign offset_co = (offset_cnt == filter_size-1);
    assign offset_cnt_clear = offset_co;
    assign filter_read_address = offset_cnt;

endmodule