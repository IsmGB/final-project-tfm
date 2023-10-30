`include "alu.v"
`timescale 1ns/1ns

module alu_tb();

   reg [3:0] control;
   reg [31:0] data_in1, data_in2;
   wire [31:0] data_out;
   
   alu DUT (.control(control),
            .data_in1(data_in1),
            .data_in2(data_in2),
            .data_out(data_out));
   
   initial
   begin
      $dumpfile("alu.vcd");
      $dumpvars(0, alu_tb);
   
      control = 4'b0000;
      data_in1 = 32'h00000006;
      data_in2 = 32'h00000002;
      
      #10 control = 4'b0001;
      #10 control = 4'b1110;
      #10 control = 4'b1100;
      #10 control = 4'b1000;
      #10 control = 4'b0010;
      #10 control = 4'b1010;
      #10 control = 4'b1011; data_in1 = 32'hF0000006;
      #10 control = 4'b0100;
      #10 control = 4'b0110;
      #10 control = 4'b1111;
      #10 control = 4'b0111;
      #10 $finish;
   end
endmodule
