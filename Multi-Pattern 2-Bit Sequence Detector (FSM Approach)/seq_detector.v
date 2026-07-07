`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 22:15:17
// Design Name: 
// Module Name: seq_detector
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


module seq_detector(input clk,rst,input wire[1:0]i,output reg z);
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;
reg[1:0] ps,ns;
always @ (posedge clk or posedge rst) begin
          if(rst) ps<=s0;
          else ps<=ns;
end
always @(*) begin
          case(ps)
          s0: begin
          if(i==2'b00 || i==2'b01)  ns=s0;
          else if(i==2'b10)  ns=s1;
          else if(i==2'b11)  ns=s2;
          end
          s1: begin
          if(i==2'b00) ns=s0;
          else if(i==2'b01 || i==2'b10) ns=s3;
          else if(i==2'b11) ns=s2;
          end
          s2: begin
          if(i==2'b00) ns=s3;
          else if(i==2'b01) ns=s0;
          else if(i==2'b10) ns=s1;
          else if(i==2'b11) ns=s2;
          end
          s3: ns=s0;
          endcase
end
always @ (*)
     begin
     case(ps)
     s3:z=1'b1;
     default:z=1'b0;
     endcase
     end
endmodule
