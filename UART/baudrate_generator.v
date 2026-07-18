`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 07:31:45
// Design Name: 
// Module Name: baudrate_generator
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


module baudrate_generator(input clk,rst,output tx_enable,rx_enable);
reg [13:0]tx_count=0;
reg [9:0] rx_count=0;

always @ (posedge clk or posedge rst) begin
     if(rst) tx_count<=0;
     else begin
       if(tx_count == 10417)tx_count<=0;
        else tx_count<=tx_count + 1;
      end
end

always @ (posedge clk or posedge rst) begin
     if(rst) rx_count<=0;
     else begin
       if(rx_count == 651)rx_count<=0;
        else rx_count<=rx_count + 1;
      end
end

assign tx_enable=(tx_count==0)?1'b1:1'b0;
assign rx_enable=(rx_count==0)?1'b1:1'b0;

endmodule
