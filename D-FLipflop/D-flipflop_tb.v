`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 21:58:00
// Design Name: 
// Module Name: D-flipflop_tb
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


module d_ff_fsm_tb();
 reg clk,rst,d;
 wire q,qbar;
 
 d_ff_fsm dut(clk,rst,d,q,qbar);
 
 initial begin
   {clk,rst,d}=0;
   end

always #10 clk=~clk;

initial begin
#5 rst=1'b1;
#18 rst=1'b0;
#2 d=1'b0;
#20 d=1'b1;

end
 
 endmodule