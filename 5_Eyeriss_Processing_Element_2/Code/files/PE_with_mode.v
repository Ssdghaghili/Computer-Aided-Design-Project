
module PE_with_mode (
    input clk,
    input reset,
    input [1:0] mode, // Mode selector: 00, 01, or 10
    // Inputs and outputs
    input [31:0] filter_data,
    input [31:0] ifmap_data,
    input [31:0] input_psum, // Input PSum for accumulation mode
    output reg [31:0] psum_out // Output PSum
);
    // Internal registers
    reg [31:0] psum_scratchpad [0:15]; // Psum ScratchPad with 16 entries
    reg [3:0] addr; // Address for the ScratchPad
    reg [31:0] psum_accumulator;

    // Reset or update logic for the ScratchPad and PSum accumulator
    integer i;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            psum_accumulator <= 32'd0;
            psum_out <= 32'd0;
            addr <= 4'd0;
            // Clear the ScratchPad
            for (i = 0; i < 16; i = i + 1) begin
                psum_scratchpad[i] <= 32'd0;
            end
        end else begin
            case (mode)
                2'b00: begin
                    // Mode 0: Filter reuse (standard convolution)
                    psum_accumulator <= filter_data * ifmap_data;
                    psum_out <= psum_accumulator;
                end
                2'b01: begin
                    // Mode 1: IFMap reuse (standard convolution)
                    psum_accumulator <= filter_data * ifmap_data;
                    psum_out <= psum_accumulator;
                end
                2'b10: begin
                    // Mode 2: Accumulate PSums in ScratchPad
                    psum_scratchpad[addr] <= psum_scratchpad[addr] + input_psum;
                    psum_out <= psum_scratchpad[addr];
                    // Increment address (cyclic)
                    addr <= addr + 4'd1;
                end
                default: begin
                    psum_accumulator <= 32'd0;
                    psum_out <= 32'd0;
                end
            endcase
        end
    end
endmodule
