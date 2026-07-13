`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2026 13:50:43
// Design Name: 
// Module Name: design_101101_moore_approach
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module detect_101101_moore (input clk,rst,b_in,output reg b_out);
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
parameter s5=3'b101;
parameter s6=3'b110;
reg[2:0] ps,ns;

always @ (posedge clk or posedge rst) begin
       if(rst) ps<=s0;
       else ps<=ns;
end

always @ (*) begin
       case  (ps)
       s0:begin
          if(b_in==1'b0) ns<=s0;
          else if(b_in==1'b1) ns<=s1;
       end
       s1:begin
          if(b_in==1'b0) ns<=s2;
          else if(b_in==1'b1) ns<=s1;
       end
       s2:begin
          if(b_in==1'b0) ns<=s0;
          else if(b_in==1'b1) ns<=s3;
       end
       s3:begin
          if(b_in==1'b0) ns<=s2;
          else if(b_in==1'b1) ns<=s4;
       end
       s4:begin
          if(b_in==1'b0) ns<=s5;
          else if(b_in==1'b1) ns<=s1;
       end
       s5:begin
          if(b_in==1'b0) ns<=s0;
          else if(b_in==1'b1) ns<=s6;
       end
       s6:begin
          if(b_in==1'b0) ns<=s2;
          else if(b_in==1'b1) ns<=s4;
       end
       default:ns<=s0;
       endcase
end
always @ (*) begin
      case(ps)
      s0:b_out=0;
      s1:b_out=0;
      s2:b_out=0;
      s3:b_out=0;
      s4:b_out=0;
      s5:b_out=0;
      s6:b_out=1;
      default:b_out=1;
      endcase
end

endmodule
