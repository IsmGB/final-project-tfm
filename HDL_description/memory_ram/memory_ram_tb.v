`include "memory_ram.v"
`timescale 1ns/1ns

module memory_ram_tb();

   reg clk, w_enable;
   reg [7:0] data_addr;
   reg [31:0] data_in;
   wire [31:0] data_out;
   
   memory_ram DUT (.clk(clk),
                   .w_enable(w_enable),
                   .data_addr(data_addr),
                   .data_in(data_in),
                   .data_out(data_out));
   
   initial
   begin
      $dumpfile("memory_ram.vcd");
      $dumpvars(0,memory_ram_tb);
      for (integer i=0; i<256; i = i+1)
         $dumpvars(0, DUT.memory[i]);
      
      w_enable = 1'b1;
      data_addr = 8'b00000000;
      data_in = 32'h0000BA7E;
      #20 data_addr = 8'b00000001; data_in = 32'h0000BEBE;
      #20 data_addr = 8'b00000011; data_in = 32'hFFFFFFFF;
      
      #20 w_enable = 1'b0; data_addr = 8'b00000000; data_in = 32'h000000AA;
      #20 data_addr = 8'b00000001; data_in = 32'h000000AA;
      #20 data_addr = 8'b00000011; data_in = 32'h000000AA;
      #20 $finish;
   end
   
   initial
   begin
      clk = 1'b0;
      forever #10 clk = ~clk;
   end
endmodule
