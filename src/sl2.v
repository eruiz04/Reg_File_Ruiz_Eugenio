module sl2 #(parameter DW = 32) (
input [DW-1:0] a,
output [DW-1:0] y);

assign y = {a[29:0], 2'b00};
endmodule 