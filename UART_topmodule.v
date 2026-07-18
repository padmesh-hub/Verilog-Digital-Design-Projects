`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 08:22:13
// Design Name: 
// Module Name: UART_topmodule
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


module UART_topmodule(input clk,rst,write_enable,input wire[7:0]data_in,output tx_out);

wire tx_enable,rx_enable;

baudrate_generator dut1(clk,rst,tx_enable,rx_enable);
tx_module dut2(clk,rst,write_enable,tx_enable,data_in,tx_out);
endmodule
