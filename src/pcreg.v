module pcreg #(parameter DW = 32)
(
input clk, reset,
output reg [DW-1:0] pc,
input [DW-1:0] pcnext
);

always @(posedge clk, posedge reset)
begin 
	if (reset) pc <= 32'h0000_0000;
	else pc <= pcnext;
end
endmodule 