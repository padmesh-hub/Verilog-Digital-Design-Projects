`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 21:57:15
// Design Name: 
// Module Name: D-flipflop_fsm
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


module d_ff_fsm(input clk,rst,d,output reg q,qbar);
reg ps,ns;

parameter s0=1'b0;
parameter s1=1'b1;

always @(posedge clk or posedge rst)
      begin
        if(rst)
        ps<=s0;
        else
         begin
          ps<=ns;
         end
      end
always @(*) 
     begin
       case (ps)
       s0:begin
         if(d==1'b0) begin
         ns=s0;
         end
         else if(d==1'b1)begin
         ns=s1;
         end
       end
       s1:begin
         if(d==1'b0) begin
         ns=s0;
         end
         else if(d==1'b1)begin
         ns=s1;
         end
       end
       endcase
     end

always @(*) begin
    case (ps)
        s0: begin
            q    = 1'b0;
            qbar = 1'b1;
        end
        s1: begin
            q    = 1'b1;
            qbar = 1'b0;
        end
        default: begin
            q    = 1'b0;
            qbar = 1'b1;
        end
    endcase
end
endmodule 