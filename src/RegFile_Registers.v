module RegFile_Registers #(parameter DW = 32)(
input clk, 
input [DW-1:0] rd1, rd2,
output [DW-1:0] q1, q2
);

Simple_Register #(.DW(DW)) RD1 (.clk(clk), .d(rd1), .Q(q1));
Simple_Register #(.DW(DW)) RD2 (.clk(clk), .d(rd2), .Q(q2));

endmodule 