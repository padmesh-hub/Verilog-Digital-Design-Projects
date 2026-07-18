`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 08:32:09
// Design Name: 
// Module Name: UART_topmodule_tb
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


module UART_topmodule_tb();
reg clk,rst,write_enable;
reg[7:0]data_in;
wire tx_out;

UART_topmodule dut(clk,rst,write_enable,data_in,tx_out);

initial {clk,rst,write_enable,data_in}=0;

always #10 clk=~clk;

initial begin
       #5 rst=1;
       #18 rst=0;
       #2 write_enable=1;
       data_in=8'b10101010;
       #2100000 $finish;
       // 10bits * 10418 clock cycles per bit * 20ns
end
endmodule
