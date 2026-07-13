`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2026 12:56:08
// Design Name: 
// Module Name: detect_101101_overlap
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


module detect_101101_mealy_approach (input clk,rst,b_in,output reg b_out);
parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;
parameter s5=3'b101;
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
          else if(b_in==1'b1) ns<=s3;
       end
       default:ns<=s0;
       endcase
end
always @ (posedge clk or posedge rst) begin
    if (rst) b_out <= 1'b0;
    else b_out <= (ps == s5 && b_in == 1'b1);
 
end

endmodule  

