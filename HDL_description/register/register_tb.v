`include "register.v"
`timescale 1ns/1ns

module register_tb();

   //Inputs & outputs
   reg clk, reset, w_enable;
   reg [4:0] data_addr, data_addr1, data_addr2;
   reg [31:0] data_in;
   wire [31:0] data_out1, data_out2;
   
   //Description
   register DUT (.clk(clk),
                 .reset(reset),
                 .w_enable(w_enable),
                 .data_addr(data_addr),
                 .data_addr1(data_addr1),
                 .data_addr2(data_addr2),
                 .data_in(data_in),
                 .data_out1(data_out1),
                 .data_out2(data_out2));
   
   initial
   begin
      $dumpfile("register.vcd");
      $dumpvars(0, register_tb);
      for (integer i=0; i<32; i = i+1)
         $dumpvars(0, DUT.memory[i]);
      
      #20 data_in = 32'hFFFFFFFF; data_addr = 5'd4;
      #20 w_enable = 1'b1;
      #20 data_addr1 = 5'd0; data_addr2 = 5'd4;
      #20 data_addr = 5'd0;
      #20 reset = 1'b1;
      #20 reset = 1'b0;
      #40 $finish;
   end
   
   //Clock
   initial
   begin
     clk = 1'b0;
     forever #10 clk = ~clk;
   end
endmodule
