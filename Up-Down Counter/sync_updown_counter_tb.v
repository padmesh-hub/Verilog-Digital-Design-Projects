`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 10:50:35
// Design Name: 
// Module Name: sync_updown_counter_tb
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


module sync_updown_counter_tb();
reg clk,rst,enb,mode;
wire [1:0]b;
sync_updown_counter dut(clk,rst,enb,mode,b);

initial {clk,rst,enb,mode}=0;

always #10 clk=~clk;

initial 
   begin
   #5 rst=1'b1;
   #16 mode=1'b0;
   #2 rst=1'b0;
   #2 enb=1'b1;
   #60 mode=1'b1;
   #60 enb=1'b0;
   end
   
endmodule
