module mipsPC #(parameter DW=32)(
input clk, PC_en,
input reset,
output [DW-1:0] pc);

wire [DW-1:0] pcnext;

pcreg #(.DW(DW)) mips_pc (
	.clk(clk & PC_en),
	.reset(reset),
	.pc (pc),
	.pcnext(pcnext)
);

adder #(.DW(DW)) pc_add4 (
	.in0(pc),
	.in1(32'b100), //4
	.sum(pcnext)
);

endmodule 