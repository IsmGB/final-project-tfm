module sistem(clk, reset, data_in, count);

	//Inputs & outputs ---------------------------------
	input wire clk;
	input wire reset;
	input wire [31:0] data_in;
	output wire [11:0] count;
	
	//Internal ports -----------------------------------
	
	//Register
	reg [31:0] register_data_in;
	wire [4:0] register_data_addr;
	wire [4:0] register_data_addr1;
	wire [4:0] register_data_addr2;
	wire [31:0] register_data_out1;
	wire [31:0] register_data_out2;
	
	//ALU
	reg [31:0] alu_data_in1;
	reg [31:0] alu_data_in2;
	wire [31:0] alu_data_out;
	
	//RAM_memory
	reg [31:0] ram_data_in;
	wire [31:0] ram_data_out;
	wire [7:0] ram_data_addr;
	
	//Program_counter
	reg [11:0] pc_addition;
	
	//Instruction_coder
	wire [6:0] funct7;
	wire [2:0] funct3;
	wire [6:0] opcode;
	wire [4:0] rd, rs1, rs2;
	wire [11:0] immediateI, immediateS;
	wire [11:0] immediateB;
	
	//Control_unity
	wire register_w_enable;
	wire imm_rd;
	wire [3:0] alu_control;
	wire alu_mux_in, alu_mux_out;
	wire ram_w_enable;
	wire br_mux_inv;
	wire br_enable;
	wire [2:0] databus; 
	
	
	//Functional blocks ----------------------------
	
	//Register	
	assign register_data_addr = rd;
	assign register_data_addr1 = rs1;
	assign register_data_addr2 = rs2; 
	
	always @(*)
	begin
		if (alu_mux_out)
			register_data_in = alu_data_out;
		else
			case (databus)
				3'b000: register_data_in = ram_data_out;
				3'b001: register_data_in = {{16{ram_data_out[15]}}, ram_data_out[15:0]};
				3'b010: register_data_in = {{24{ram_data_out[7]}}, ram_data_out[7:0]};
				3'b011: register_data_in = {{16{1'b0}}, ram_data_out[15:0]};
				3'b100: register_data_in = {{24{1'b0}}, ram_data_out[7:0]};
				default: register_data_in = 32'bx;
			endcase
	end
	
	register Register(.clk(clk),
					  .reset(reset),
					  .w_enable(register_w_enable),
					  .data_addr(register_data_addr),
					  .data_addr1(register_data_addr1),
					  .data_addr2(register_data_addr2),
					  .data_in(register_data_in),
					  .data_out1(register_data_out1),
					  .data_out2(register_data_out2));
	
	//ALU
	always @(*)
	begin
		alu_data_in1 = register_data_out1;
		if (alu_mux_in)
			alu_data_in2 = register_data_out2;
		else if (imm_rd)
			alu_data_in2 = {{20{immediateS[11]}}, immediateS};
		else
			alu_data_in2 = {{20{immediateI[11]}}, immediateI};
	end
	
	alu ALU(.control(alu_control),
			.data_in1(alu_data_in1),
			.data_in2(alu_data_in2),
			.data_out(alu_data_out));
	
	//RAM_memory
	assign ram_data_addr = alu_data_out[7:0];
	
	always @(*)
		case (databus)
			3'b000: ram_data_in = register_data_out2;
			3'b001: ram_data_in = {ram_data_out[31:16], register_data_out2[15:0]};
			3'b010: ram_data_in = {ram_data_out[31:8], register_data_out2[7:0]};
			default: ram_data_in = register_data_out2;
		endcase
	
	memory_ram RAM(.clk(clk),
				   .w_enable(ram_w_enable),
				   .data_addr(ram_data_addr),
				   .data_in(ram_data_in),
				   .data_out(ram_data_out));
	
	//Program_counter
	always @(*)
	begin
		if (br_mux_inv)
			if (br_enable && !alu_data_out[0])
				pc_addition = immediateB;
			else
				pc_addition = 12'b000000000100;
		else
			if (br_enable && alu_data_out[0])
				pc_addition = immediateB;
			else
				pc_addition = 12'b000000000100;
	end
	
	program_counter ProgramCounter(.clk(clk),
								   .reset(reset),
								   .addition(pc_addition),
								   .count(count));
	
	//Instruction_coder
	instruction_coder InstructionCoder(.data_in(data_in),
									   .funct7(funct7),
									   .funct3(funct3),
									   .opcode(opcode),
									   .rd(rd),
									   .rs1(rs1),
									   .rs2(rs2),
									   .immediateI(immediateI),
									   .immediateS(immediateS),
									   .immediateB(immediateB));
	
	//Control_unity
	control_unity ControlUnity(.funct7(funct7),
							   .funct3(funct3),
							   .opcode(opcode),
							   .register_w_enable(register_w_enable),
							   .imm_rd(imm_rd),
							   .alu_control(alu_control),
							   .alu_mux_in(alu_mux_in),
							   .alu_mux_out(alu_mux_out),
							   .ram_w_enable(ram_w_enable),
							   .br_mux_inv(br_mux_inv),
							   .br_enable(br_enable),
							   .databus(databus));
	
endmodule
