module adder #(parameter DW = 32)
(
	input [DW-1:0] in0, in1,
	output [DW-1:0] sum
);
	
	//Output the sum of the two inputs
	
	assign sum = in0 + in1;
	
endmodule