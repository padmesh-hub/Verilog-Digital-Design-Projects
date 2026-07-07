`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2026 22:09:42
// Design Name: 
// Module Name: T-flipflop_tb
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


module t_ff_fsm_tb();
reg clk,rst,t;
wire q,qbar;
t_ff_fsm dut(clk,rst,t,q,qbar);

initial
    begin
    {clk,rst,t}=0;
    end
always #10 clk=~clk;
initial
    begin
    #5 rst=1'b1;
    #18 rst=1'b0;
    #2 t=1'b0;
    #20 t=1'b1;
    #20 $finish;
    end
endmodule

