`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 22:04:15
// Design Name: 
// Module Name: JK-flipflop_tb
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


module jk_ff_fsm_tb ();
reg clk,rst,j,k;
wire q,qbar;
jk_ff_fsm dut(clk,rst,j,k,q,qbar);
initial 
    begin
     {clk,rst,j,k}=0;
     end
 always #10 clk=~clk;
initial
   begin
   #5 rst=1'b1;
   #18 rst=1'b0;
   #2 {j,k}=2'b00;
   #20 {j,k}=2'b01;
   #20 {j,k}=2'b10;
   #20 {j,k}=2'b11;
   #20 $finish ;
   end 
endmodule
