`include "instruction_coder.v"
`timescale 1ns/1ns

module instruction_coder_tb();

	reg [31:0] data_in;
	wire [6:0] funct7;
	wire [2:0] funct3;
	wire [6:0] opcode;
	wire [4:0] rd, rs1, rs2;
	wire [11:0] immediateI, immediateS;
	wire [11:0] immediateB;
	
	instruction_coder DUT (.data_in(data_in),
						   .funct7(funct7),
						   .funct3(funct3),
						   .opcode(opcode),
						   .rd(rd),
						   .rs1(rs1),
						   .rs2(rs2),
						   .immediateI(immediateI),
						   .immediateS(immediateS),
						   .immediateB(immediateB));
	
	initial
	begin
		$dumpfile("instruction_coder.vcd");
		$dumpvars(0, instruction_coder_tb);
		
		data_in = 32'b11111110000011111000111110000000;
		#20 data_in = 32'b11111111111100000111000001111111;
		#20 $finish;
	end
endmodule
