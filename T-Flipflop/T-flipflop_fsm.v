`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 22:08:55
// Design Name: 
// Module Name: T-flipflop_fsm
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


module t_ff_fsm(input clk,rst,t,output reg q,qbar);
reg ps,ns;
parameter s0=1'b0;
parameter s1=1'b1;
always @ (posedge clk or posedge rst) begin
   if(rst) ps<=s0;
   else ps<=ns;
   end
always @ (*) begin
     case (ps) 
     s0: begin
     if(t==1'b1) ns=s1;
     else ns=s0;
     end
     s1: begin
     if(t==1'b0) ns=s1;
     else ns=s0;
     end
     endcase
end
always @ (*) begin
    case (ps)
        s0: begin
            q    = 1'b0;
            qbar = 1'b1;
        end
        s1: begin
            q    = 1'b1;
            qbar = 1'b0;
        end
      endcase
end
endmodule 
