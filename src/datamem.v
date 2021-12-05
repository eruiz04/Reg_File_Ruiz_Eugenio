module datamem #(
parameter DW = 32) (

input clk, we,
input [DW-1:0] a, WriteData,
output [DW-1:0] rd);

reg [DW-1:0] RAM [2*DW-1:0];

assign rd = RAM[a[DW-1:2]];

always @ (posedge clk) begin
	if(we) RAM[a[31:2]] <= WriteData; 
end 
endmodule 