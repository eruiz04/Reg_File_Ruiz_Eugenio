module Simple_Register #(parameter DW = 32)(
input clk,
input [DW-1:0] d, 
output reg [DW-1:0] Q
);

always @ (posedge clk)
      Q <= d;
		
endmodule 