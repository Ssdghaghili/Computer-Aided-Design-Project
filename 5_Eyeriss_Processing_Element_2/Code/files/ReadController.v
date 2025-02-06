module ReadController #(
    parameter CONFIG_BIT = 5
)(
    input clk,
    input rstn, // Active low reset
    input en, //enable
    input empty, //indicating buffer is empty
    input write_grant,
    output reg first_write,
    output reg ready //indicating one data is read
);

    // State encoding
    localparam S_IDLE = 2'b00;
    localparam S_WRITE_SPAD = 2'b01;

    reg [1:0] ps;
    wire[1:0] ns;

    
    // Output logic
    always @(*) begin
        ready = 0;

        case (ps)
            S_IDLE: begin 
                ready = 0;
            end
            S_WRITE_SPAD: begin
                ready = ~empty & write_grant;
            end
        endcase

    end


    assign ns = (~empty & write_grant) ? S_WRITE_SPAD : S_IDLE;

    // State transition logic
    always @(posedge clk) begin
        if (~rstn) begin
            ps <= S_IDLE;
            first_write <= 0;
        end
        else if (en) begin
            ps <= ns;

            if(ns == S_WRITE_SPAD)
                first_write <= 1'b1;
        end
    end

endmodule
