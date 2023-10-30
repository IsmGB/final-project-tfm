module program_counter(clk, reset, addition, count);

   //Inputs & outputs
   input wire clk, reset;
   input wire [11:0] addition;
   output reg [11:0] count;
   
   //Functional block
   integer set = 0;
   
   always @(posedge clk)
   begin
      if (reset)
      begin
         count <= 12'bx;
         set <= 0;
      end
      else if (set==1)
         count <= count + addition;
      else
      begin
         count <= 12'b000000000000;
         set <= 1;
      end
   end
endmodule
