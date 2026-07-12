`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2026 21:16:20
// Design Name: 
// Module Name: VGA_controller_tb
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


module VGA_controller_tb(
    input clk_100mhz ,
    input rst,
    input [11:0]rgb_in,
    output hsync,vsync,
    output [11:0]rgb_out
    );
    
    reg[11:0]rgb_reg;
    wire video_on;
    
    VGA_controller dut(.clk_100mhz(clk_100mhz),.rst(rst),.hsync(hsync),.vsync(vsync));
    
    always @ (posedge clk_100mhz or posedge rst) begin
             if(rst) rgb_reg <=0;
             else rgb_reg<=rgb_in;
    end
    assign rgb_out = (video_on)?rgb_reg:12'b0;
endmodule
