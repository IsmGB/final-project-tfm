/// sta-blackbox

module register(clk, reset, w_enable, data_addr, data_addr1, data_addr2, data_in, data_out1, data_out2);

   //Inputs & oututs
   input wire clk, reset, w_enable;
   input wire [4:0] data_addr, data_addr1, data_addr2;
   input wire [31:0] data_in;
   output reg [31:0] data_out1, data_out2;
   
   //Register
   reg [31:0] memory [31:0];
   
   //Functional block
   integer set = 0;
   
   always @(posedge clk)
   begin
      if (reset)
      begin
         set <= 0;
         for (integer i=1; i<32; i = i+1)
            memory[i] <= 32'h00000000;
      end
      else if (set==1)
      begin
         if (w_enable)
            memory[data_addr] <= data_in;
      end
      else
      begin
         set <= 1;
         for (integer i=1; i<32; i = i+1)
            memory[i] <= 32'h00000000;
      end
      
      memory[0] <= 32'h00000000;
   end
   
   always @(negedge clk)
   begin
      data_out1 <= memory[data_addr1];
      data_out2 <= memory[data_addr2];
   end
endmodule
