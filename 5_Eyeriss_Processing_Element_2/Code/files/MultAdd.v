`define SIM
(* use_dsp = "yes" *)
module MultAdd #(
    parameter INPUT_WIDTH_A = 8,
    parameter INPUT_WIDTH_B = 8,
    parameter OUTPUT_WIDTH = INPUT_WIDTH_A + INPUT_WIDTH_B
) (
    input clk,
    input en, //enable
    input clear,
    input sel_b,
    input signed [INPUT_WIDTH_A - 1 : 0] data_in_a,
    input signed [INPUT_WIDTH_B - 1 : 0] data_in_b,
    input signed [OUTPUT_WIDTH - 1 : 0] add_data_in_a,
    input signed [OUTPUT_WIDTH - 1 : 0] add_data_in_b,

    output reg signed [OUTPUT_WIDTH - 1 : 0] data_out
);

`ifdef SIM
reg signed [OUTPUT_WIDTH - 1 : 0] mult_res;
always @(posedge clk) begin
    if (en) begin
        mult_res = data_in_a * data_in_b;
    end
    if (sel_b) begin
        data_out <= add_data_in_a + add_data_in_b;
    end else begin
        data_out <= add_data_in_a + mult_res;
    end

    if (clear) begin
        mult_res = 0;
        data_out <= 0;
    end
end
`else
// Internal signals for DSP48E1
    wire [29:0] dsp_A;
    wire [17:0] dsp_B;
    wire [47:0] dsp_C;
    wire [47:0] dsp_P;
    reg  [6:0]  dsp_OPMODE;

    // Sign extension and assignments
    assign dsp_A = {{(30-INPUT_WIDTH_A){data_in_a[INPUT_WIDTH_A-1]}}, data_in_a};
    assign dsp_B = {{(18-INPUT_WIDTH_B){data_in_b[INPUT_WIDTH_B-1]}}, data_in_b};
    assign dsp_C = {{(48-OUTPUT_WIDTH){add_data_in_a[OUTPUT_WIDTH-1]}}, add_data_in_a};

    always @(posedge clk) begin
        if (clear) begin
            data_out <= 0;
        end else if (en) begin
            data_out <= dsp_P[OUTPUT_WIDTH-1:0];
        end
    end

    // Control OPMODE based on sel_b
    always @(*) begin
        if (sel_b) begin
            // Perform addition: P = C + PCIN (PCIN=add_data_in_b)
            dsp_OPMODE = 7'b0110011;
        end else begin
            // Perform multiply-add: P = A * B + C
            dsp_OPMODE = 7'b0000101;
        end
    end

    // Instantiate DSP48E1
    DSP48E1 #(
        .A_INPUT("DIRECT"),
        .B_INPUT("DIRECT"),
        .USE_DPORT("FALSE"),
        .USE_MULT("MULTIPLY"),
        .USE_SIMD("ONE48")
    ) dsp_inst (
        .A(dsp_A),
        .B(dsp_B),
        .C(dsp_C),
        .P(dsp_P),
        .OPMODE(dsp_OPMODE),
        .CLK(clk),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b1),
        .CEP(1'b1),
        .RSTP(clear),
        // Unused ports
        .BCIN(18'b0),
        .BCOUT(),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(),
        .PCIN({add_data_in_b, {48-OUTPUT_WIDTH{1'b0}}}),
        .PCOUT()
    );
`endif
endmodule

// (* use_dsp = "yes" *)
// module MultAdd_SIMD #(
//     parameter INPUT_WIDTH_A = 8, // Max 12 bits per input for FOUR12 mode
//     parameter INPUT_WIDTH_B = 8,
//     parameter OUTPUT_WIDTH = INPUT_WIDTH_A + INPUT_WIDTH_B // Adjusted for TWO24 mode
// ) (
//     input clk,
//     input en_a,
//     input en_b,
//     input clear,
//     input sel_b,
//     input signed [INPUT_WIDTH_A - 1 : 0] data_in_a0,
//     input signed [INPUT_WIDTH_B - 1 : 0] data_in_b0,
//     input signed [INPUT_WIDTH_A - 1 : 0] data_in_a1,
//     input signed [INPUT_WIDTH_B - 1 : 0] data_in_b1,
//     input signed [OUTPUT_WIDTH - 1 : 0] add_data_in_a0,
//     input signed [OUTPUT_WIDTH - 1 : 0] add_data_in_b0,
//     input signed [OUTPUT_WIDTH - 1 : 0] add_data_in_a1,
//     input signed [OUTPUT_WIDTH - 1 : 0] add_data_in_b1,

//     output reg signed [OUTPUT_WIDTH - 1 : 0] data_out0,
//     output reg signed [OUTPUT_WIDTH - 1 : 0] data_out1
// );

//     // Internal signals for DSP48E1
//     wire [29:0] dsp_A;
//     wire [17:0] dsp_B;
//     wire [47:0] dsp_C;
//     wire [47:0] dsp_P;
//     reg  [6:0]  dsp_OPMODE;
//     reg  [3:0]  dsp_ALUMODE;

//     // Combine inputs for SIMD operation
//     // For TWO24 mode, we use the upper and lower 24 bits
//     wire [23:0] A_lower = {{(24 - INPUT_WIDTH_A){1'b0}}, data_in_a0};
//     wire [23:0] A_upper = {{(24 - INPUT_WIDTH_A){1'b0}}, data_in_a1};
//     assign dsp_A = {A_upper, A_lower}; // 48 bits total

//     wire [17:0] B_lower = {{(18 - INPUT_WIDTH_B){1'b0}}, data_in_b0};
//     wire [17:0] B_upper = {{(18 - INPUT_WIDTH_B){1'b0}}, data_in_b1};
//     assign dsp_B = {B_upper[17:9], B_lower[8:0]}; // Packed into 18 bits for TWO24 mode

//     wire [47:0] C_lower = {{(24 - OUTPUT_WIDTH){1'b0}}, add_data_in_a0, {(24){1'b0}}};
//     wire [47:0] C_upper = {add_data_in_a1, {(24){1'b0}}};
//     assign dsp_C = C_upper | C_lower; // Combine the two add_data_in_a

//     // Control OPMODE and ALUMODE based on sel_b
//     always @(*) begin
//         if (sel_b) begin
//             // Perform addition: P = C + PCIN (PCIN = add_data_in_b)
//             dsp_OPMODE = 7'b0110011;
//             dsp_ALUMODE = 4'b0000; // Add
//         end else begin
//             // Perform multiply-add: P = A * B + C
//             dsp_OPMODE = 7'b0000101;
//             dsp_ALUMODE = 4'b0000; // Add
//         end
//     end

//     // Sign extension for PCIN inputs
//     wire [47:0] PCIN_lower = {{(24 - OUTPUT_WIDTH){1'b0}}, add_data_in_b0, {(24){1'b0}}};
//     wire [47:0] PCIN_upper = {add_data_in_b1, {(24){1'b0}}};
//     wire [47:0] dsp_PCIN = PCIN_upper | PCIN_lower;

//     // Instantiate DSP48E1
//     DSP48E1 #(
//         .A_INPUT("DIRECT"),
//         .B_INPUT("DIRECT"),
//         .USE_DPORT("FALSE"),
//         .USE_MULT("MULTIPLY"),
//         .USE_SIMD("TWO24") // Set SIMD mode to TWO24
//     ) dsp_inst (
//         .A(dsp_A),
//         .B(dsp_B),
//         .C(dsp_C),
//         .P(dsp_P),
//         .OPMODE(dsp_OPMODE),
//         .ALUMODE(dsp_ALUMODE),
//         .CLK(clk),
//         .CEA1(1'b1),
//         .CEA2(1'b1),
//         .CEB1(1'b1),
//         .CEB2(1'b1),
//         .CEC(1'b1),
//         .CEP(1'b1),
//         .RSTP(clear),
//         // Unused ports
//         .BCIN(18'b0),
//         .BCOUT(),
//         .CARRYCASCIN(1'b0),
//         .CARRYCASCOUT(),
//         .MULTSIGNIN(1'b0),
//         .MULTSIGNOUT(),
//         .PCIN(dsp_PCIN),
//         .PCOUT()
//     );

//     // Output assignments
//     always @(posedge clk) begin
//         if (en_a)
//             data_out0 <= dsp_P[23:0];
        
//         if (en_b)
//             data_out1 <= dsp_P[47:24];

//         if (clear) begin
//             data_out0 <= 0;
//             data_out1 <= 0;
//         end
//     end

// endmodule

