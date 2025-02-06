module WriteController (
    input full,
    input psum_ready,

    output write_grant,
    output psum_buffer_wen,
    output psum_reg_clear
);
    
    assign write_grant = ~full;
    assign psum_buffer_wen = psum_ready;
    assign psum_reg_clear = psum_ready & (~full);

endmodule