module control_unity(funct7, funct3, opcode, register_w_enable, imm_rd, alu_control, alu_mux_in, alu_mux_out, ram_w_enable, br_mux_inv, br_enable, databus);

   //Inputs & outputs
   input wire [6:0] funct7;
   input wire [2:0] funct3;
   input wire [6:0] opcode;
   
   output reg register_w_enable; //Write enable on register
   output reg imm_rd; //Sets immediate for I-type or S-type
   
   output reg [3:0] alu_control; //Sets alu operation
   output reg alu_mux_in; //Sets alu input
   output reg alu_mux_out; //Set alu output
   
   output reg ram_w_enable; //Write enable on memory ram
   
   output reg br_mux_inv; //Sets some branch operations
   output reg br_enable; //Enable branch operations
   
   output reg [2:0] databus; //Sets databus for load and store
   
   
   //Functional block
   always @*
   begin
      if (opcode==7'b0110011) //R-type
         case (funct3)
            3'b000: if (funct7==7'b0000000) //add
                    begin
                       register_w_enable = 1'b1;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end
                    else if (funct7==7'b0100000) //sub
                    begin
                       register_w_enable = 1'b1;
                       alu_control = 4'b0001;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end
                    
            3'b111: begin //and
                       register_w_enable = 1'b1;
                       alu_control = 4'b1110;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0; 
                    end
                    
            3'b110: begin //or
                       register_w_enable = 1'b1;
                       alu_control = 4'b1100;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end
            
            3'b100: begin //xor
                       register_w_enable = 1'b1;
                       alu_control = 4'b1000;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end
            
            3'b010: begin //slt
                       register_w_enable = 1'b1;
                       alu_control = 4'b0100;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end
            
            3'b011: begin //sltu
                       register_w_enable = 1'b1;
                       alu_control = 4'b0110;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end
            
            3'b001: begin //sll
                       register_w_enable = 1'b1;
                       alu_control = 4'b0010;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end
            
            3'b101: if (funct7==7'b0000000) //srl
                    begin
                       register_w_enable = 1'b1;
                       alu_control = 4'b1010;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end
                    else if (funct7==7'b0100000) //sra
                    begin
                       register_w_enable = 1'b1;
                       alu_control = 4'b1011;
                       alu_mux_in = 1'b1;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                    end   
         endcase
      else if (opcode==7'b0010011) //I-type immediate
         case (funct3)
            3'b000: begin //addi
                       register_w_enable = 1'b1;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
            
            3'b111: begin //andi
                       register_w_enable = 1'b1;
                       alu_control = 4'b1110;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
            
            3'b110: begin //ori
                       register_w_enable = 1'b1;
                       alu_control = 4'b1100;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
            
            3'b100: begin //xori
                       register_w_enable = 1'b1;
                       alu_control = 4'b1000;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
            
            3'b010: begin //slti
                       register_w_enable = 1'b1;
                       alu_control = 4'b0100;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
            
            3'b011: begin //sltui
                       register_w_enable = 1'b1;
                       alu_control = 4'b0110;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
            
            3'b001: begin //slli
                       register_w_enable = 1'b1;
                       alu_control = 4'b0010;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
            
            3'b101: if (funct7==7'b0000000) //srli
                    begin
                       register_w_enable = 1'b1;
                       alu_control = 4'b1010;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
                    else if (funct7==7'b0100000) //srai
                    begin
                       register_w_enable = 1'b1;
                       alu_control = 4'b1011;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                    end
         endcase
      else if (opcode==7'b0000011) //I-type load
         case (funct3)
            3'b000: begin //lb
                       register_w_enable = 1'b1;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b0;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                       databus = 3'b010;
                    end
                    
            3'b001: begin //lh
                       register_w_enable = 1'b1;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b0;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                       databus = 3'b001;
                    end
            
            3'b010: begin //lw
                       register_w_enable = 1'b1;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b0;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                       databus = 3'b000;
                    end
            
            3'b100: begin //lbu
                       register_w_enable = 1'b1;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b0;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                       databus = 3'b100;
                    end
            
            3'b101: begin //lhu
                       register_w_enable = 1'b1;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       alu_mux_out = 1'b0;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
                       imm_rd = 1'b0;
                       databus = 3'b011;
                    end
                    
            default: begin
            		   register_w_enable = 1'b0;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
            		 end
         endcase
      else if (opcode==7'b0100011) //S-type
         case (funct3)
            3'b000: begin //sb
                       register_w_enable = 1'b0;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       ram_w_enable = 1'b1;
                       br_enable = 1'b0;
                       imm_rd = 1'b1;
                       databus = 3'b010;
                    end
            
            3'b001: begin //sb
                       register_w_enable = 1'b0;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       ram_w_enable = 1'b1;
                       br_enable = 1'b0;
                       imm_rd = 1'b1;
                       databus = 3'b001;
                    end
            
            3'b010: begin //sw
                       register_w_enable = 1'b0;
                       alu_control = 4'b0000;
                       alu_mux_in = 1'b0;
                       ram_w_enable = 1'b1;
                       br_enable = 1'b0;
                       imm_rd = 1'b1;
                       databus = 3'b000;
                    end
            
            default: begin
            		   register_w_enable = 1'b0;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
            		 end
         endcase
      else if (opcode==7'b1100011) //B-type
         case (funct3)
            3'b000: begin //beq
                       register_w_enable = 1'b0;
                       alu_control = 4'b0111;
                       alu_mux_in = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b1;
                       br_mux_inv = 1'b0;
                    end
            
            3'b001: begin //bne
                       register_w_enable = 1'b0;
                       alu_control = 4'b0111;
                       alu_mux_in = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b1;
                       br_mux_inv = 1'b1;
                    end
            
            3'b100: begin //blt
                       register_w_enable = 1'b0;
                       alu_control = 4'b0100;
                       alu_mux_in = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b1;
                       br_mux_inv = 1'b0;
                    end
            
            3'b101: begin //bge
                       register_w_enable = 1'b0;
                       alu_control = 4'b0100;
                       alu_mux_in = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b1;
                       br_mux_inv = 1'b1;
                    end
            
            3'b110: begin //bltu
                       register_w_enable = 1'b0;
                       alu_control = 4'b0110;
                       alu_mux_in = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b1;
                       br_mux_inv = 1'b0;
                    end
            
            3'b111: begin //bgeu
                       register_w_enable = 1'b0;
                       alu_control = 4'b0110;
                       alu_mux_in = 1'b1;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b1;
                       br_mux_inv = 1'b1;
                    end
            
            default: begin
            		   register_w_enable = 1'b0;
                       ram_w_enable = 1'b0;
                       br_enable = 1'b0;
            		 end
         endcase
   end
endmodule
