module signext #(parameter DW = 32)(
input [15:0] a,
output [DW-1:0] y);

assign y = {{16{a[15]}},a};

endmodule 