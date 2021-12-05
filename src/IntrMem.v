// Quartus Prime Verilog Template
// Single Port ROM

module IntrMem
#(parameter DW=32)
(
	input [5:0] addr,  //checar tamaño
	output [(DW-1):0] q
);

	// Declare the ROM variable
	//reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];
	reg [DW-1:0] RAM [2*DW-1:0];

	initial
	begin
		$readmemh("C:/Users/aleja/Documents/GitHub/Reg_File_Ruiz_Eugenio/src/text.dat", RAM);
	end

	assign q = RAM[addr];

endmodule
