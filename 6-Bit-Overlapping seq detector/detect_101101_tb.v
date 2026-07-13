`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2026 12:54:58
// Design Name: 
// Module Name: detect_101101_tb
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


module detect_101101_overlapping_tb();
reg clk,rst,b_in;
wire b_out;
detect_101101_overlapping dut(clk,rst,b_in,b_out);

initial {clk,rst,b_in}=0;

always #10 clk=~clk;

initial begin
     #5 rst=1;
     #18 rst=0;
     #2 b_in=1;
     #20 b_in=0;
     #20 b_in=1;
     #20 b_in=1;
     #20 b_in=0;
     #20 b_in=1;
     #20 b_in=1;
     #20 b_in=0;
     #20 b_in=1;
     #20 $finish;
end
endmodule