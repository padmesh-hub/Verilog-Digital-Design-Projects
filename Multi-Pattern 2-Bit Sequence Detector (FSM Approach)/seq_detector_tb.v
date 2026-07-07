`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 22:16:06
// Design Name: 
// Module Name: seq_detector_tb
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


module seq_detector_tb ();
reg clk,rst;
reg[1:0]i;
wire z;

seq_detector dut(clk,rst,i,z);

initial begin
    {clk,rst,i}=0;
   end
   
always #10 clk=~clk;

initial begin
    #5 rst=1'b1;
    #18 rst=1'b0;
    #2 i=2'b11;
    #20 i=2'b00;
    #20 i=2'b10;
    #20 i=2'b10;
    #20 i=2'b10;
    #20 i=2'b01;
    #20 $finish;
end
endmodule





