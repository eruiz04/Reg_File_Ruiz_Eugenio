module Memory_System
#(
	parameter DW = 32
)
(
	input Write_Enable_i, clk,
	input [(DW-1):0] Write_Data_i,
	input [(DW-1):0] Address_i,
	output [(DW-1):0] Instruction_o
);

	//Aqui instanciare mis modulos
	wire [(DW-1):0] Qinstr, Qdata;
	
	IntrMem #(.DW(DW)) Instructions (.addr(Address_i),.q(Qinstr));
	datamem #(.DW(DW)) Data (.clk(clk), .we(Write_Enable_i), .a(Address_i), .WriteData(Write_Data_i), .rd(Qdata));
	
	mux2to1 #(.DW(DW)) InstrorD (.Y(Instruction_o), .S(Write_Enable_i), .D0(Qinstr), .D1(Qdata));
	
endmodule