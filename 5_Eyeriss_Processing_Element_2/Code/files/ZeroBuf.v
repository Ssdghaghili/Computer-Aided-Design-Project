module Zero_buffer #(
	parameter DATA_WIDTH = 16 //data bitwidth
)(
	input wire [DATA_WIDTH - 1 : 0] in_data, //input data
	output wire [DATA_WIDTH - 1 : 0] out_data, //output data
	output wire zero_buffer //zero check signal
);

assign zero_buffer = |in_data; //check if zero

// Multiplexer for data_out
assign out_data = in_data;

endmodule