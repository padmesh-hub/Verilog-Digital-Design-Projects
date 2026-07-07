`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 20:02:10
// Design Name: 
// Module Name: sr latch
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


module sr_latch_synch(input enb,rst,s,r,output reg q,qbar);
     always@(enb)
       begin
       if(enb)
          if(rst) begin
          q<=1'b0;
          qbar<=1'b1;
          end
          else if(s==0 && r==0)
          begin
          q<=q;
          qbar<=qbar;
          end
          else if(s==0 && r==1)
          begin
          q<=0;
          qbar<=1;
          end
          else if(s==1 && r==0)
          begin
          q<=1;
          qbar<=0;
          end
          else if(s==1 && r==1)
          begin
          q<='bx;
          qbar<='bx;
          end
       end
    
endmodule     
