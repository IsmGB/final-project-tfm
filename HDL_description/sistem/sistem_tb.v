`include "sistem.v"
`include "../register/register.v"
`include "../alu/alu.v"
`include "../memory_ram/memory_ram.v"
`include "../program_counter/program_counter.v"
`include "../instruction_coder/instruction_coder.v"
`include "../control_unity/control_unity.v"
`timescale 1ns/1ns

module sistem_tb ();

	reg clk, reset;
	reg [31:0] data_in;
	wire [11:0] count;
	
	reg [7:0] memory [4095:0];
	
	sistem DUT (.clk(clk),
				.reset(reset),
				.data_in(data_in),
				.count(count));

	//Data dumping -----------------------------------------
	initial
	begin
		$dumpfile("sistem.vcd");
		$dumpvars(0, sistem_tb);
		for (integer i=0; i<32; i = i+1)
        	$dumpvars(0, DUT.Register.memory[i]);
        for (integer i=0; i<256; i = i+1)
        	$dumpvars(0, DUT.RAM.memory[i]);
        for (integer i=0; i<4096; i = i+1)
        	$dumpvars(0, sistem_tb.memory[i]);   
		
		reset = 1'b0;
		#40 reset = 1'b1;
		#20 reset = 1'b0;
		#1000 $finish;
	end
	
	//Memory program & Assambler -----------------------------------
	integer array;
	reg [31:0] instr;

	integer scan_file;
	integer text_file;
	reg [8*100:1] line;
	reg [8*25:1] code;
	reg [4:0] var1;
	reg [4:0] var2;
	reg [11:0] var3;
	
	
	//Functional block
	initial
	begin
		text_file = $fopen("test_program.txt", "r");		
		array = 0;
		
		while (!$feof(text_file))
		begin
			line = "";
			code = "";
			var1 = 5'b00000;
			var2 = 5'b00000;
			var3 = 12'b000000000000;
			instr = 32'bx;
			
			scan_file = $fgets(line, text_file);
			scan_file = $sscanf(line, "%s %d %d %d", code, var1, var2, var3);
			
			case (code)
				//R-type instructions
				"add": instr = {7'b0000000, var3[4:0], var2, 3'b000, var1, 7'b0110011};
				"sub": instr = {7'b0100000, var3[4:0], var2, 3'b000, var1, 7'b0110011};
				"and": instr = {7'b0000000, var3[4:0], var2, 3'b111, var1, 7'b0110011};
				"or": instr = {7'b0000000, var3[4:0], var2, 3'b110, var1, 7'b0110011};
				"xor": instr = {7'b0000000, var3[4:0], var2, 3'b100, var1, 7'b0110011};
				"slt": instr = {7'b0000000, var3[4:0], var2, 3'b010, var1, 7'b0110011};
				"sltu": instr = {7'b0000000, var3[4:0], var2, 3'b011, var1, 7'b0110011};
				"sll": instr = {7'b0000000, var3[4:0], var2, 3'b001, var1, 7'b0110011};
				"srl": instr = {7'b0000000, var3[4:0], var2, 3'b101, var1, 7'b0110011};
				"sra": instr = {7'b0100000, var3[4:0], var2, 3'b101, var1, 7'b0110011};
				
				//I-type instructions
				"addi": instr = {var3, var2, 3'b000, var1, 7'b0010011};
				"andi": instr = {var3, var2, 3'b111, var1, 7'b0010011};
				"ori": instr = {var3, var2, 3'b110, var1, 7'b0010011};
				"xori": instr = {var3, var2, 3'b100, var1, 7'b0010011};
				"slti": instr = {var3, var2, 3'b010, var1, 7'b0010011};
				"sltui": instr = {var3, var2, 3'b011, var1, 7'b0010011};
				"slli": instr = {7'b0000000, var3[4:0], var2, 3'b001, var1, 7'b0010011};
				"srli": instr = {7'b0000000, var3[4:0], var2, 3'b101, var1, 7'b0010011};
				"srai": instr = {7'b0100000, var3[4:0], var2, 3'b101, var1, 7'b0010011};
				
				//I-type load instructions
				"lb": instr = {var3, var2, 3'b000, var1, 7'b0000011};
				"lh": instr = {var3, var2, 3'b001, var1, 7'b0000011};
				"lw": instr = {var3, var2, 3'b010, var1, 7'b0000011};
				"lbu": instr = {var3, var2, 3'b100, var1, 7'b0000011};
				"lhu": instr = {var3, var2, 3'b101, var1, 7'b0000011};
				
				//S-type instructions
				"sb": instr = {var3[11:5], var1, var2, 3'b000, var3[4:0], 7'b0100011};
				"sh": instr = {var3[11:5], var1, var2, 3'b001, var3[4:0], 7'b0100011};
				"sw": instr = {var3[11:5], var1, var2, 3'b010, var3[4:0], 7'b0100011};
				
				//B-type instructions
				"beq": instr = {var3[11], var3[9:4], var2, var1, 3'b000, var3[3:0], var3[10], 7'b1100011};
				"bne": instr = {var3[11], var3[9:4], var2, var1, 3'b001, var3[3:0], var3[10], 7'b1100011};
				"blt": instr = {var3[11], var3[9:4], var2, var1, 3'b100, var3[3:0], var3[10], 7'b1100011};
				"bge": instr = {var3[11], var3[9:4], var2, var1, 3'b101, var3[3:0], var3[10], 7'b1100011};
				"bltu": instr = {var3[11], var3[9:4], var2, var1, 3'b110, var3[3:0], var3[10], 7'b1100011};
				"bgeu": instr = {var3[11], var3[9:4], var2, var1, 3'b111, var3[3:0], var3[10], 7'b1100011};
				
				default:;
			endcase
			
			memory[array] = instr[7:0];
			memory[array+1] = instr[15:8];
			memory[array+2] = instr[23:16];
			memory[array+3] = instr[31:24];
			
			array = array + 4;
		end
		
		$fclose(text_file);		
	end
	
	always @(count)
	begin
		data_in <= {memory[count+12'd3], memory[count+12'd2], memory[count+12'd1], memory[count]};
	end
	
	//Clock -----------------------------------------------
	initial
	begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end
endmodule
