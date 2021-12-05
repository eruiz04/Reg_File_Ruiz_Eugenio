module mux4to1 #(parameter DW = 32)( a, b, c, d, S, out);

input wire [DW-1:0] a, b, c, d;
input wire [1:0] S;
output reg [DW-1:0] out;

always @ (a or b or c or d or S)
begin

case (S)
2'b00 : out <= a;
2'b01 : out <= b;
2'b10 : out <= c;
2'b11 : out <= d;
endcase

end

endmodule