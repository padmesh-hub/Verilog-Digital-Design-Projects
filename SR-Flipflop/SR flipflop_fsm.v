`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 21:46:07
// Design Name: 
// Module Name: SR flipflop_fsm
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

module sr_ff_fsm(input clk,rst,s,r,output reg q,qbar);
parameter s0=1'b0;
parameter s1=1'b1;
reg ps,ns;
reg[1:0]i;
always @ (posedge clk) begin
        if(rst)
          ps<=s0;
        else
           ps<=ns;
           
       end
           
always @ (*) begin
    i={s,r};
    case (ps)
    s0: begin
        if(i==2'b00) begin
               ns=ps;
               q=1'b0;
               qbar=1'b0;
               end
         else if (i==2'b01) begin
                ns=s0;
                q=1'b0;
                qbar=1'b1;
                end
         else if (i==2'b10) begin
                ns=s1;
                q=1'b1;
                qbar=1'b0;
                end
         else if (i==2'b11) begin
                ns=1'bx;
                q=1'bx;
                qbar=1'bx;
                end
         end
     s1: begin
        if(i==2'b00) begin
               ns=ps;
               q=1'b1;
               qbar=1'b0;
               end
         else if (i==2'b01) begin
                ns=s0;
                q=1'b0;
                qbar=1'b1;
                end
         else if (i==2'b10) begin
                ns=s1;
                q=1'b1;
                qbar=1'b0;
                end
         else if (i==2'b11) begin
                ns=1'bx;
                q=1'bx;
                qbar=1'bx;
                end
        end
 endcase
end
endmodule
