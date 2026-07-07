`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 20:17:50
// Design Name: 
// Module Name: sr_latch_tb
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


module sr_latch_synch_tb();
reg enb,rst,s,r;
wire q,qbar;
integer i;
sr_latch_synch dut(enb,rst,s,r,q,qbar);
initial
   begin
   {enb,rst,s,r}=0;
   end
   always #5 enb=~enb;
initial
     begin
     rst=1;
     #10
     rst=0;
     
     for(i=0;i<3;i=i+1)begin
     {s,r}=i;
     #10;
     end
     end
endmodule