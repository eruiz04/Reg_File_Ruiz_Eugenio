module MIPS_Multi_Cycle #(
parameter DW = 32, 
parameter ADDR = 32)
(
input clk, reset,
output [7:0] GPIO_o

);
	
//Building the datapath 
wire PCEn;


wire [DW-1:0] ALUOut;   //se usa mas adelante 


wire PC; 
mipsPC #(.DW(DW)) ProgramCounter (.clk(clk), .reset(reset), .pc(PC), .PC_en(PCEn));

wire IorD; //Ctrl
wire Adr;
mux2to1 #(.DW(DW)) AdrMux (.Y(Adr), .S(IorD), .D0(PC), .D1(ALUOut));  


wire MemWrite; //Ctrl
wire [DW-1:0] WD; //Se usa mas tarde 

wire RD;
Memory_System #(.DW(DW)) InstrDataMem (.Write_Enable_i(MemWrite), .clk(clk),.Write_Data_i(WD), .Address_i(Adr), .Instruction_o(RD));




wire IRWrite; //Ctrl

wire [DW-1:0] Instr, Data;
Simple_Register #(.DW(DW)) InstrRegister (.clk(clk & IRWrite), .d(RD), .Q(Instr));
Simple_Register #(.DW(DW)) DataRegister (.clk(clk), .d(RD), .Q(Data));


wire RegWrite; //Ctrl

wire [5:0] MuxInstr;
wire [DW-1:0] MuxData;

wire RegDst; //Ctrl

registerfile #(.DW(DW)) RegisterFile (.clk(clk), .we(RegWrite), .Addr1(Instr[25:21]), .Addr2(Instr[20:16]), 
					.Addr3(MuxInstr), .WriteData3(MuxData), .ReadData1(RD1), .ReadData2(RD2));
					
mux2to1 #(.DW(5)) MuxA3 (.Y(MuxInstr), .S(RegDst), .D1(Instr[15:11]), .D0(Instr[20:16]));


wire MemtoReg; //Ctrl
mux2to1 #(.DW(DW)) MuxWD3 (.Y(MuxData), .S(MemtoReg), .D0(ALUOut), .D1(Data));



wire [DW-1:0] RD1, RD2, A;

RegFile_Registers #(.DW(DW)) RegisterFile_Registers (.clk(clk), .rd1(RD1), .rd2(RD2), .q1(A), .q2(WD)); 


wire ALUSrcA; //Ctrl

wire SrcA;
mux2to1 #(.DW(DW)) MuxPC_RegFile (.S(ALUSrcA), .Y(SrcA), .D0(PC), .D1(A));


wire [DW-1:0] SignImm; //checar despues

wire [1:0] ALUSrcB; //Ctrl

wire [DW-1:0] SrcB, leftshift2;

mux4to1 #(.DW(DW)) ToALU (.S(ALUSrcB), .a(WD), .b(32'b100), .c(SignImm), .d(leftshift2), .out(SrcB));



signext #(.DW(DW)) SignExtend (.a(Instr[15:0]), .y(SignImm));

sl2 #(.DW(DW)) LeftShift2 (.a(SignImm), .y(leftshift2));

wire [1:0] ALUControl; //Ctrl
wire [DW-1:0] ALUResult; 

ALU Modificame (.y(ALUResult), .a(SrcA), .b(SrcB), .select(ALUControl));   //MODIFICAME



Simple_Register #(.DW(DW)) (.clk(clk), .d(ALUResult), .Q(ALUOut));

wire PCSrc; //Ctrl

//mux2to1 #(.DW(DW)) MuxAlu_PC (.S(PCSrc), .D1(ALUOut), .D0(ALUResult), .Y(PC));   //Arreglar lazo a PC





//CONECTAME CON GPIO
assign GPIO_o[7] = ALUOut[7];
assign GPIO_o[6] = ALUOut[6];
assign GPIO_o[5] = ALUOut[5];
assign GPIO_o[4] = ALUOut[4];
assign GPIO_o[3] = ALUOut[3];
assign GPIO_o[2] = ALUOut[2];
assign GPIO_o[1] = ALUOut[1];
assign GPIO_o[0] = ALUOut[0];

endmodule 