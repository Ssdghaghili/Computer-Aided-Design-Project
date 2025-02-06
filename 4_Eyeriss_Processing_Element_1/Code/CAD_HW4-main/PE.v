module PE #(
    parameter CONFIG_BIT = 5,
    parameter IFMAP_DATA_WIDTH = 16, //buffer data width
    parameter IFMAP_BUFFER_DEPTH = 8, //buffer depth
    parameter IFMAP_PAR_WRITE = 1, //parallel input bus
    parameter IFMAP_PAR_READ = 1, //parallel output bus
    parameter IFMAP_SPAD_DEPTH = 12, 
     

    parameter FILTER_DATA_WIDTH = 16, //buffer data width
    parameter FILTER_BUFFER_DEPTH = 8, //buffer depth
    parameter FILTER_PAR_WRITE = 4, //parallel input bus
    parameter FILTER_PAR_READ = 1, //parallel output bus
    parameter FILTER_SPAD_DEPTH = 224,



    parameter MULTIPLIER_WIDTH = FILTER_DATA_WIDTH + IFMAP_DATA_WIDTH,
    parameter ADDER_WIDTH = MULTIPLIER_WIDTH,

    parameter PSUM_BUFFER_DEPTH = 8,
    parameter PSUM_PAR_WRITE = 1,
    parameter PSUM_PAR_READ = 1

) (
    input clk,
    input rstn,
    input en, //enable
    input start,
    input filter_done,
    input [CONFIG_BIT-1: 0] filter_size,
    input [CONFIG_BIT-1: 0] ifmap_size,
    input ifmap_wen, //write enable
    input [IFMAP_PAR_WRITE * IFMAP_DATA_WIDTH - 1 : 0] ifmap_din, //input data
    output ifmap_ready, //buffer ready to be written

    input filter_wen, //write enable
    input psum_ren,
    input [FILTER_PAR_WRITE * FILTER_DATA_WIDTH - 1 : 0] filter_din, //input data
    output filter_ready,
    output psum_ready,
    output psum_buffer_empty,
    output [ADDER_WIDTH-1 : 0] psum_dout

);
    localparam IF_SPAD_ADDRESS_WIDTH = $clog2(IFMAP_SPAD_DEPTH);
    localparam FILTER_SPAD_ADDRESS_WIDTH = $clog2(FILTER_SPAD_DEPTH);
    
    


    //ifmap wires :
    wire ifmap_full, ifmap_empty, ifmap_valid;
    wire if_read;
    wire ifmap_buf_clear;
    wire [IFMAP_DATA_WIDTH-1 : 0] ifmap_spad_dout, ifmap_spad_dout_1;
    wire [FILTER_PAR_READ * FILTER_DATA_WIDTH - 1 : 0] ifmap_buf_dout;

    // wire ifmap_spad_empty;
    wire[IF_SPAD_ADDRESS_WIDTH-1 : 0] if_base_address;
    wire if_write_grant;
    

    wire ifmap_rcnt_clear, ifmap_wcnt_clear;
    wire[IF_SPAD_ADDRESS_WIDTH-1 : 0] if_spad_raddr, if_spad_waddr;

    //filter wires :
    wire filter_full, filter_empty, filter_valid;
    wire filter_read;
    wire filter_buf_clear;
    wire [FILTER_DATA_WIDTH-1 : 0] filter_spad_dout;
    wire [FILTER_PAR_READ * FILTER_DATA_WIDTH - 1 : 0] filter_buf_dout;

    // wire filter_spad_empty;
    wire filter_write_grant;


    wire filter_rcnt_clear, filter_wcnt_clear;
    wire[FILTER_SPAD_ADDRESS_WIDTH-1 : 0] filter_spad_raddr, filter_spad_waddr;


    wire filter_read_grant, if_read_grant;
    wire if_addr_clear, filter_addr_clear;
    wire psum_ready_0, psum_ready_1, psum_ready_3;
    wire psum_ready_2, psum_clear_2;
    wire pipe_en;
    wire address_cnt_up;
    wire stride_grant;



    // stage 1 : multiplier
    wire[FILTER_DATA_WIDTH-1 : 0] filter_mult_in; 
    wire[IFMAP_DATA_WIDTH-1 : 0] ifmap_mult_in;
    wire[MULTIPLIER_WIDTH-1 : 0] mult_out;

    //stage 2 : Accumulate
    wire[ADDER_WIDTH-1 : 0] adder_out;
    wire[ADDER_WIDTH-1 : 0] psum;

    wire offset_co;


    // Psum Buffer :
    wire psum_buffer_full;
    wire psum_wen;
    wire psum_write_grant;
    wire psum_clear;



    // IFMAP :
    Fifo_buffer #(
        .DATA_WIDTH(IFMAP_DATA_WIDTH),
        .DEPTH(IFMAP_BUFFER_DEPTH),
        .PAR_WRITE(IFMAP_PAR_WRITE),
        .PAR_READ(IFMAP_PAR_READ)
    ) ifmap_buffer (
        .clk(clk),
        .rstn(rstn),
        .clear(1'b0),
        .wen(ifmap_wen),
        .ren(if_read),
        .din(ifmap_din),
        .dout(ifmap_buf_dout),
        .full(ifmap_full),
        .empty(ifmap_empty)
    );


    // can be replaced by the registered value of ifmap_empty:
    ReadController ifmap_read_controller (
        .clk(clk),
        .rstn(rstn),
        .en(en),
        .empty(ifmap_empty),
        .write_grant(if_write_grant),
        .ready(if_read)
    );


    // --------------------------------------------------------------


    Reg_SPad #(
        .DATA_WIDTH(IFMAP_DATA_WIDTH),
        .NUM_REGS(IFMAP_SPAD_DEPTH),
        .ADDR_WIDTH(IF_SPAD_ADDRESS_WIDTH)
    ) ifmap_spad (
        .clk(clk), 
        .rstn(rstn),
        .en(en),
        .wen(if_read),
        .raddr(if_spad_raddr),
        .waddr(if_spad_waddr),
        .din(ifmap_buf_dout),
        .dout(ifmap_spad_dout)
    );

    
    Counter #(
        .MAX(IFMAP_SPAD_DEPTH),
        .WIDTH(IF_SPAD_ADDRESS_WIDTH)
    ) ifmap_spad_write_counter (
        .clk(clk),
        .rstn(rstn),
        .en(if_read),
        .clear(ifmap_wcnt_clear),
        .count(if_spad_waddr)
    );



    // FILTER :
    Fifo_buffer #(
        .DATA_WIDTH(FILTER_DATA_WIDTH),
        .DEPTH(FILTER_BUFFER_DEPTH),
        .PAR_WRITE(FILTER_PAR_WRITE),
        .PAR_READ(FILTER_PAR_READ)
    ) filter_buffer (
        .clk(clk),
        .rstn(rstn),
        .clear(1'b0),
        .wen(filter_wen),
        .ren(filter_read),
        .din(filter_din),
        .dout(filter_buf_dout),
        .full(filter_full),
        .empty(filter_empty)
    );

    ReadController #(
        .CONFIG_BIT(CONFIG_BIT)
    ) filter_read_controller (
        .clk(clk),
        .rstn(rstn),
        .en(en),
        .empty(filter_empty),
        .write_grant(filter_write_grant),
        .first_write(filter_wcnt_clear),
        .ready(filter_read)
    );

    SRAM_SPad #(
        .DATA_WIDTH(FILTER_DATA_WIDTH),
        .DEPTH(FILTER_SPAD_DEPTH),
        .ADDR_WIDTH(FILTER_SPAD_ADDRESS_WIDTH)
    ) filter_spad (
        .clk(clk),
        .chip_en(en),
        .wen(filter_read),
        .ren(pipe_en),
        .waddr(filter_spad_waddr),
        .raddr(filter_spad_raddr),
        .din(filter_buf_dout),
        .dout(filter_spad_dout)
    );

    Counter #(
        .MAX(FILTER_SPAD_DEPTH),
        .WIDTH(FILTER_SPAD_ADDRESS_WIDTH)
    ) filter_spad_write_counter (
        .clk(clk),
        .rstn(rstn),
        .en(filter_read),
        .clear(~filter_wcnt_clear),
        .count(filter_spad_waddr)
    );

    // Address Generator : 
    AddressGenerator #(
        .CONFIG_BIT(CONFIG_BIT),
        .IFMAP_SPAD_ADDRESS_WIDTH(IF_SPAD_ADDRESS_WIDTH),
        .IFMAP_SPAD_DEPTH(IFMAP_SPAD_DEPTH),
        .FILTER_SPAD_ADDRESS_WIDTH(FILTER_SPAD_ADDRESS_WIDTH),
        .FILTER_SPAD_DEPTH(FILTER_SPAD_DEPTH)

    ) address_generator (
        .clk(clk),.rstn(rstn),
        .if_clear(if_addr_clear),
        .filter_size(filter_size),
        .ifmap_size(ifmap_size),
        .pipe_en(address_cnt_up), 
        .if_read_address(if_spad_raddr),
        .filter_read_address(filter_spad_raddr),
        .if_base_address(if_base_address),
        .offset_co(offset_co)
    );

    // Stage 1 : multiply
    DFFClear #(
        .DATA_WIDTH(FILTER_DATA_WIDTH)
    ) filter_reg (
        .clk(clk),  
        .en(pipe_en),
        .rstn(rstn), 
        .clear(psum_ready_1),
        .data_in(filter_spad_dout),
        .data_out(filter_mult_in)
    );


    DFF #(
        .DATA_WIDTH(IFMAP_DATA_WIDTH)
    ) ifmap_reg_0 (
        .clk(clk),  
        .en(pipe_en),
        .rstn(rstn), 
        .data_in(ifmap_spad_dout),
        .data_out(ifmap_spad_dout_1)
    );

    
    DFFClear #(
        .DATA_WIDTH(IFMAP_DATA_WIDTH)
    ) ifmap_reg_1 (
        .clk(clk),  
        .en(pipe_en),
        .rstn(rstn), 
        .clear(psum_ready_1),
        .data_in(ifmap_spad_dout_1),
        .data_out(ifmap_mult_in)
    );

    Multiplier #(
        .INPUT_WIDTH_A(IFMAP_DATA_WIDTH), 
        .INPUT_WIDTH_B(FILTER_DATA_WIDTH)
    ) mult (
        .clk(clk),
        .rstn(rstn & ~psum_ready_2),
        .en(pipe_en),
        .data_in_a(ifmap_mult_in),
        .data_in_b(filter_mult_in),
        .data_out(mult_out)
    );


    // stage 2 : accumulate
    Adder #(
        .INPUT_WIDTH(ADDER_WIDTH)
    ) adder (
        .data_in_a(mult_out),
        .data_in_b(psum),
        .data_out(adder_out) 
    );

    DFFClear #(
        .DATA_WIDTH(ADDER_WIDTH)
    ) psum_reg (
        .clk(clk),  
        .en(pipe_en),
        .rstn(rstn),
        .clear(psum_clear),
        .data_in(adder_out),
        .data_out(psum)
    );



    PipeController controller_unit(
        .clk(clk),
        .rstn(rstn),
        .en(en),
        .start(start),

        .filter_done(filter_done),
        .filter_read_grant(filter_read_grant),
        .if_read_grant(if_read_grant),
        .stride_grant(stride_grant),
        .offset_co(offset_co),
        .if_spad_wen(if_read),
        .filter_spad_wen(filter_read),
        .if_buffer_empty(ifmap_empty),
        .if_addr_clear(if_addr_clear),
        .pipe_en(pipe_en),
        .psum_ready(psum_ready_0),
        .address_cnt_up(address_cnt_up),
        .psum_ready_out(psum_ready_3),
        .psum_write_grant(psum_write_grant)
    );


    DFF #(
        .DATA_WIDTH(1)
    ) psum_control_reg_0 (
        .clk(clk),  
        .en(pipe_en),
        .rstn(rstn), 
        .data_in({psum_ready_0}),
        .data_out({psum_ready_1})
    );

    DFF #(
        .DATA_WIDTH(1)
    ) psum_control_reg_1 (
        .clk(clk),  
        .en(pipe_en),
        .rstn(rstn), 
        .data_in({psum_ready_1}),
        .data_out({psum_ready_2})
    );

    DFF #(
        .DATA_WIDTH(1)
    ) psum_control_reg_2 (
        .clk(clk),  
        .en(pipe_en),
        .rstn(rstn), 
        .data_in({psum_ready_2}),
        .data_out({psum_ready_3})
    );



    Fifo_buffer #(
        .DATA_WIDTH(ADDER_WIDTH),
        .DEPTH(PSUM_BUFFER_DEPTH),
        .PAR_WRITE(PSUM_PAR_WRITE),
        .PAR_READ(PSUM_PAR_READ)
    ) psum_buffer (
        .clk(clk),
        .rstn(rstn),
        .clear(1'b0),
        .wen(psum_wen),
        .ren(psum_ren),
        .din(psum),
        .dout(psum_dout),
        .full(psum_buffer_full),
        .empty(psum_buffer_empty)
    );

    
    WriteController psum_buffer_write_controller (
        .full(psum_buffer_full),
        .psum_ready(psum_ready_3),
        .write_grant(psum_write_grant),
        .psum_buffer_wen(psum_wen),
        .psum_reg_clear(psum_clear)
    );

    assign ifmap_ready = ~ifmap_full;
    assign ifmap_valid = ~ifmap_empty;

    assign filter_ready = ~filter_full;
    assign filter_valid = ~filter_empty;


 
    assign filter_read_grant = ~(filter_spad_raddr == filter_spad_waddr);
    assign if_read_grant = ~(if_spad_raddr == if_spad_waddr);

    assign filter_write_grant = ~(filter_spad_waddr == filter_size);
    assign if_write_grant = ~(if_spad_waddr + 1'b1 == if_base_address);
    
    assign stride_grant = (if_spad_waddr - if_spad_raddr >= filter_size);
    assign psum_ready = psum_ready_3;


endmodule