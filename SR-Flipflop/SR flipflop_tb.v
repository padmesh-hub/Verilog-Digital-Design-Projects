`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 21:47:21
// Design Name: 
// Module Name: SR flipflop_tb
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


module sr_ff_fsm_tb ();

reg clk,rst,s,r;
wire q,qbar;

sr_ff_fsm dut(clk,rst,s,r,q,qbar);

initial 
    begin
     {clk,rst,s,r}=0;
     end
 always #10 clk=~clk;

initial
   begin
   #5 rst=1'b1;
   #20 rst=1'b0;
   {s,r}=2'b00;
   #20 {s,r}=2'b01;
   #20 {s,r}=2'b10;
   #20 {s,r}=2'b11;
   $finish ;
   end 
    
 endmodule 