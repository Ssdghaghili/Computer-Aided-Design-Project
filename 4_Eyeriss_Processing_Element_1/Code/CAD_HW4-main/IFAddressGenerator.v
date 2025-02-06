module IFAddressGenerator #(
    parameter CONFIG_BIT = 5,
    parameter IFMAP_SPAD_ADDRESS_WIDTH = 16,
    parameter FILTER_SPAD_ADDRESS_WIDTH = 16,
    parameter IFMAP_SPAD_DEPTH = 12
)(
    input clk, rstn,
    input offset_co,
    input clear,
    input[FILTER_SPAD_ADDRESS_WIDTH-1 : 0] offset_cnt,
    input[CONFIG_BIT-1: 0] ifmap_size,
    output [IFMAP_SPAD_ADDRESS_WIDTH-1 : 0] readAddress,   
    output [IFMAP_SPAD_ADDRESS_WIDTH-1 : 0] if_base_address,
    output if_co

); 

    localparam ROW_MAX_WIDTH = $clog2(IFMAP_SPAD_DEPTH);

    wire [IFMAP_SPAD_ADDRESS_WIDTH-1 : 0] base_address;
    
    reg [IFMAP_SPAD_ADDRESS_WIDTH - 1 : 0] if_adr_reg;

    // round counter counts the number of rounds that
    Counter #(.WIDTH(IFMAP_SPAD_ADDRESS_WIDTH), .MAX(IFMAP_SPAD_DEPTH)) if_base_counter(
        .clk(clk),
        .rstn(rstn),
        .clear(clear),
        .en(offset_co),
        .count(base_address)
    );

    always @(posedge clk) begin
        if(~rstn)
            if_adr_reg = 0;

        else if(if_co) begin
            if_adr_reg <= readAddress + 1'b1;
        end

        
    end

    assign if_base_address = base_address + if_adr_reg;
    assign readAddress = ((offset_cnt + base_address + if_adr_reg) < IFMAP_SPAD_DEPTH) ? (offset_cnt + base_address + if_adr_reg) :
                                                                                         (offset_cnt + base_address + if_adr_reg - IFMAP_SPAD_DEPTH);
    assign if_co = (offset_cnt + base_address == ifmap_size - 1);

endmodule