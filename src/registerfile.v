module registerfile #(parameter DW = 32)(
	input clk, we, 
	input [4:0] Addr1, Addr2, Addr3,
	input [DW-1:0] WriteData3,
	output [DW-1:0] ReadData1, ReadData2
	);
	
reg [DW-1:0] RegFile [DW-1:0];
integer i;
 initial begin
        for (i = 0; i < DW; i = i+1) 
            RegFile[i] = 32'b1;
    end

assign ReadData1 = RegFile[Addr1];
assign ReadData2 = RegFile[Addr2];

always @(posedge clk) begin
	if(we == 1) 
		RegFile[Addr3] <= WriteData3;
end 

endmodule 