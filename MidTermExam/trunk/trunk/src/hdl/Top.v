module mclaurin_pipeline (
    input wire clk,
    input wire reset,
    input wire [7:0] x,         // 8-bit input x
    input wire [2:0] N,         // Precision (0 to 7, for different stages)
    output wire [31:0] y,       // Final output y
    output wire overflow        // Overall overflow signal
);
    wire [31:0] stage1_out, stage2_out, stage3_out, stage4_out;
    wire [31:0] constant1, constant2, constant3, constant4;
    wire [31:0] selected_constant;
    wire stage1_overflow, stage2_overflow, stage3_overflow, stage4_overflow;

    // LUT Instances for each stage
    lut lut1 (.n(3'd4), .value(constant1)); // -1/4
    lut lut2 (.n(3'd3), .value(constant2)); //  1/3
    lut lut3 (.n(3'd2), .value(constant3)); // -1/2
    lut lut4 (.n(3'd1), .value(constant4)); //  1

    // MUX to select correct LUT constant based on N
    mux_4to1 lut_mux (
        .sel(N),
        .in0(constant1),
        .in1(constant2),
        .in2(constant3),
        .in3(constant4),
        .out(selected_constant)
    );

    // First stage
    pipeline_stage_first stage1 (
        .clk(clk),
        .reset(reset),
        .x({24'b0, x}),          // Extend 8-bit x to 32-bit
        .constant(selected_constant),
        .stage_out(stage1_out),
        .overflow(stage1_overflow)
    );

    // Subsequent stages
    pipeline_stage_next stage2 (
        .clk(clk),
        .reset(reset),
        .prev_out(stage1_out),
        .x({24'b0, x}),          // Extend 8-bit x to 32-bit
        .constant(selected_constant),
        .stage_out(stage2_out),
        .overflow(stage2_overflow)
    );

    pipeline_stage_next stage3 (
        .clk(clk),
        .reset(reset),
        .prev_out(stage2_out),
        .x({24'b0, x}),          // Extend 8-bit x to 32-bit
        .constant(selected_constant),
        .stage_out(stage3_out),
        .overflow(stage3_overflow)
    );

    pipeline_stage_next stage4 (
        .clk(clk),
        .reset(reset),
        .prev_out(stage3_out),
        .x({24'b0, x}),          // Extend 8-bit x to 32-bit
        .constant(selected_constant),
        .stage_out(stage4_out),
        .overflow(stage4_overflow)
    );

    // Final output assignment
    assign y = stage4_out;

    // Overall overflow: OR of all stage overflows
    assign overflow = stage1_overflow | stage2_overflow | stage3_overflow | stage4_overflow;

endmodule