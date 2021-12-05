module mux2to1 #(parameter DW = 32)(
output reg [DW-1:0] Y,
input S,
input [DW-1:0] D0, D1
);

always @(S or D1 or D0)
begin

	if (S)
	Y = D1;
	else
	Y = D0;
end 

endmodule