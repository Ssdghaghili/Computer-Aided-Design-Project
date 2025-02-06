module fsm_controller (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [2:0] n,            // Accuracy
    output reg [1:0] state,        // FSM states
    output reg enable_stage1,
    output reg enable_stage2,
    output reg enable_stage3,
    output reg enable_stage4,
    output reg cascade,            // Activation of the second round of the pipeline
    output reg valid,             
    output reg ready,              
    output reg error,              
    output reg overflow          
);

    // FSM states
    localparam IDLE = 2'b00;
    localparam LOAD = 2'b01;
    localparam CALCULATE = 2'b10;
    localparam OUTPUT = 2'b11;

    reg [2:0] current_n;
    reg stage1_overflow, stage2_overflow, stage3_overflow, stage4_overflow;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            valid <= 0;
            ready <= 1;
            error <= 0;
            cascade <= 0;
            overflow <= 0;
            stage1_overflow <= 0;
            stage2_overflow <= 0;
            stage3_overflow <= 0;
            stage4_overflow <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= LOAD;
                        ready <= 0;
                    end
                end

                LOAD: begin
                    current_n <= n;
                    state <= CALCULATE;
                end

                CALCULATE: begin
                    if (current_n > 4) begin
                        // Cascade mode
                        cascade <= 1;
                        enable_stage1 <= 1;
                        enable_stage2 <= 1;
                        enable_stage3 <= 1;
                        enable_stage4 <= 1;
                    end else begin
                        // Use part of the pipeline
                        cascade <= 0;
                        enable_stage1 <= (current_n >= 1);
                        enable_stage2 <= (current_n >= 2);
                        enable_stage3 <= (current_n >= 3);
                        enable_stage4 <= (current_n >= 4);
                    end

                    // Capture overflow from stages
                    stage1_overflow <= overflow;
                    stage2_overflow <= overflow;
                    stage3_overflow <= overflow;
                    stage4_overflow <= overflow;

                    // Combine overflow from all stages
                    overflow <= stage1_overflow | stage2_overflow | stage3_overflow | stage4_overflow;

                    state <= OUTPUT;
                end

                OUTPUT: begin
                    valid <= 1;
                    ready <= 1;
                    state <= IDLE; // Back to idle mode
                end

                default: begin
                    error <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule