module alu(control, data_in1, data_in2, data_out);

   //Inputs & outputs
   input wire [3:0] control;
   input wire [31:0] data_in1, data_in2;
   output reg [31:0] data_out;

   //Functional block   
   always @*
      case (control)
         4'b0000: data_out = data_in1 + data_in2; //add
         4'b0001: data_out = data_in1 - data_in2; //sub
         4'b0010: data_out = data_in1 << data_in2; //sll
         4'b0100: data_out = ($signed(data_in1) < $signed(data_in2))? 32'h00000001:32'h00000000; //slt
         4'b0110: data_out = (data_in1 < data_in2)? 32'h00000001:32'h00000000; //sltu
         4'b1000: data_out = data_in1 ^ data_in2; //xor
         4'b1010: data_out = data_in1 >> data_in2; //slr
         4'b1011: data_out = $signed(data_in1) >>> data_in2; //sra
         4'b1100: data_out = data_in1 | data_in2; //or
         4'b1110: data_out = data_in1 & data_in2; //and
         4'b0111: data_out = (data_in1 == data_in2)? 32'h00000001:32'h00000000; //seq
         default: data_out = 32'hxxxxxxxx;
      endcase
endmodule
