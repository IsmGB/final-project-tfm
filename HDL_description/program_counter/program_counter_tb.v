`include "program_counter.v"
`timescale 1ns/1ns

module program_counter_tb();

   reg clk, reset;
   reg [11:0] addition;
   wire [11:0] count;
   
   program_counter DUT (.clk(clk),
                        .reset(reset),
                        .addition(addition),
                        .count(count));
   initial
   begin
      $dumpfile("program_counter.vcd");
      $dumpvars(0, program_counter_tb);
      
      reset = 1'b0;
      addition = 12'b000000000100;
      #60 reset = 1'b1;
      #20 reset = 1'b0;
      #40 $finish;
   end
   
   initial
   begin
      clk = 1'b0;
      forever #10 clk = ~clk;
   end
endmodule
