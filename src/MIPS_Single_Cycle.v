module MIPS_Single_Cycle
(
input clk, reset,
output [7:0] GPIO_o

//SEÑALES DE CONTROL AQUI MERO
);


//Aqui instanciare 
reg IorD;

ProgramCounter (.PCNext(), .Reset(), .Clk() ,.PCWrite(), .PCResult());


endmodule 