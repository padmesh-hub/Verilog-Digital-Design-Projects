`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 22:03:13
// Design Name: 
// Module Name: JK-flipflop_fsm
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


module jk_ff_fsm(input clk,rst,j,k,output reg q,qbar);
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
    i={j,k};
    case (ps)
    s0: begin
        if(i==2'b00) ns=ps;
        else if (i==2'b01) ns=s0;
        else if (i==2'b10) ns=s1;
        else if (i==2'b11) ns=s1;
         end
     s1: begin
        if(i==2'b00) ns=ps;
        else if (i==2'b01) ns=s0;
        else if (i==2'b10) ns=s1; 
        else if (i==2'b11) ns=s0;
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
