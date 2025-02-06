module PipeController(
    input clk,
    input rstn,
    input en,

    input start,
    input filter_done,
    input offset_co,
    input filter_read_grant,
    input stride_grant,

    input if_read_grant,
    input if_buffer_empty,

    input if_spad_wen,
    input filter_spad_wen,
    input psum_ready_out,
    input psum_write_grant,

    output reg if_addr_clear,

    output reg pipe_en,
    output reg psum_ready,
    output reg psum_clear,
    output reg address_cnt_up

    );


localparam[2:0] IDLE = 3'd0, WAIT_FILTER = 3'd1, WAIT_IF = 3'd2,
                CALC = 3'd3, PSUM_READY = 3'd4, FINALIZE = 3'd5;


reg[2:0] ps, ns;


always @(posedge clk, negedge rstn) begin
    if(~rstn)
        ps <= IDLE;

    else if(en)
        ps <= ns;
end



always @(*) begin
    ns = IDLE;

    case(ps) 

        IDLE: ns = start ? WAIT_FILTER : IDLE;

        WAIT_FILTER: ns = filter_done ? WAIT_IF : WAIT_FILTER;

        WAIT_IF: ns = if_read_grant ? CALC : WAIT_IF;


        CALC: begin

            ns = offset_co ? PSUM_READY : CALC;

        end

        PSUM_READY : begin 
            ns = CALC;
            if(~psum_write_grant)
                ns = PSUM_READY;
                
            else if(if_buffer_empty) begin
                if(~if_read_grant) begin
                    ns = FINALIZE;
                end
                else if(~stride_grant) begin
                    ns = FINALIZE;
                end
            end
        end

        FINALIZE : ns = psum_ready_out ? IDLE : FINALIZE;


    endcase

end


always @(*) begin
    {if_addr_clear, pipe_en, psum_clear, psum_ready, address_cnt_up} = 0;

    case(ps)
        IDLE: {if_addr_clear} = 1'b1;

        WAIT_FILTER: {if_addr_clear} = 1'b1;

        WAIT_IF : ;

        CALC: begin 
            pipe_en = (if_read_grant & filter_read_grant);
            address_cnt_up = 1;
        end
        
        PSUM_READY: begin
            pipe_en = psum_write_grant;
            address_cnt_up = 0;
            psum_clear = 1;
            psum_ready = 1;
        end

        FINALIZE: begin
            pipe_en = 1;
            address_cnt_up = 0;
            psum_clear = 0;
            psum_ready = 0;
        end
        

    endcase

end


endmodule