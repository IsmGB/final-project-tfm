/// sta-blackbox

module instruction_coder(data_in, funct7, funct3, opcode, rd, rs1, rs2, immediateI, immediateS, immediateB);

	//Inputs & outputs
	input wire [31:0] data_in;
	output reg [6:0] funct7;
	output reg [2:0] funct3;
	output reg [6:0] opcode;
	output reg [4:0] rd, rs1, rs2;
	output reg [11:0] immediateI, immediateS;
	output reg [11:0] immediateB;

	//Functional block	
	always @*
	begin
		funct7 = data_in[31:25];
		funct3 = data_in[14:12];
		opcode = data_in[6:0];
		rd = data_in[11:7];
		rs1 = data_in[19:15];
		rs2 = data_in[24:20];
		immediateI = data_in[31:20];
		immediateS = {data_in[31:25], data_in[11:7]};
		immediateB = {data_in[31], data_in[7], data_in[30:25], data_in[11:8]};
	end
endmodule
