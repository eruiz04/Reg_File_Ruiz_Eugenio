// Quartus Prime Verilog Template
// Single port RAM with single read/write address 

module single_port_ram 
#(parameter DW=32)
(
	input [(DW-1):0] data,
	input [7:2] addr,
	input we, clk,
	output [(DW-1):0] q
);

	// Declare the RAM variable
	reg [DW-1:0] ram [2*DW-1:0];

	// Variable to hold the registered read address
	//reg [DW-1:0] addr_reg;
	
	/*
	//Initial conditions
	initial
	begin
		$readmemh("C:/Users/aleja/Documents/GitHub/Sistema_Mem_Ruiz_Eugenio/source/ram.txt", ram);
	end
	*/

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[addr[7:2]] <= data;

		//addr_reg <= addr;
	end

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	
	//assign q = ram[addr_reg];

endmodule
