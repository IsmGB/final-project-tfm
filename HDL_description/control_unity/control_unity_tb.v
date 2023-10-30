`include "control_unity.v"
`timescale 1ns/1ns

module control_unity_tb();

   reg [6:0] funct7;
   reg [2:0] funct3;
   reg [6:0] opcode;
   
   wire register_w_enable;
   wire imm_rd;
   wire [3:0] alu_control;
   wire alu_mux_in, alu_mux_out;
   wire ram_w_enable;
   wire br_mux_inv, br_enable;
   wire [2:0] databus;
   
   control_unity DUT (.funct7(funct7),
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
   
   initial
   begin
      $dumpfile("control_unity.vcd");
      $dumpvars(0, control_unity_tb);
      
      // Tests few configurations
      funct7 = 7'b0000000; funct3 = 3'b101; opcode = 7'b0110011; //srl
      #20 funct7 = 7'b0000000; funct3 = 3'b001; opcode = 7'b0010011; //slli
      #20 funct7 = 7'b0000000; funct3 = 3'b000; opcode = 7'b0000011; //lb
      #20 funct7 = 7'b0000000; funct3 = 3'b010; opcode = 7'b0100011; //sw
      #20 funct7 = 7'b0000000; funct3 = 3'b000; opcode = 7'b1100011; //beq
      
      #20 $finish;
   end
endmodule
