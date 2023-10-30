module memory_ram(clk, w_enable, data_addr, data_in, data_out);

   //Inputs & outputs
   input wire clk, w_enable;
   input wire [7:0] data_addr;
   input wire [31:0] data_in;
   output reg [31:0] data_out;
   
   //Register
   reg [31:0] memory [255:0];
   
   //Functional block
   always @(posedge clk)
   begin
      if (w_enable)
         memory[data_addr] <= data_in;
   end
   
   always @(negedge clk)
   begin
      data_out <= memory[data_addr];
   end
endmodule
