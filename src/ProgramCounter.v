module ProgramCounter(PCNext, PCResult, Reset, Clk,PCWrite);

	input       [31:0]  PCNext;
	input               Reset, Clk,PCWrite;

	output reg  [31:0]  PCResult;

    /* Please fill in the implementation here... */

	initial begin
	
		PCResult <= 32'h00000000;
	end

    always @(posedge Clk)
    begin
    	if (Reset == 1)
    	begin
    		PCResult <= 32'h00000000;
    	end
    	else
    	begin
			if (PCWrite == 1) begin
				PCResult <= PCNext;
			end
    	end

		//$display("PC=%h",PCResult);
    end

endmodule