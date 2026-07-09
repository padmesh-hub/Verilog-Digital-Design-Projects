`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 10:42:56
// Design Name: 
// Module Name: sync_updown_sounter
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


module sync_updown_counter(input clk,rst,enb,mode,output reg[1:0]b);

always @ (posedge clk) begin
          if(rst) b<=2'b00;
          else if (enb) begin
            if(mode==1'b0) b<=b + 1'b1;
            else if(mode==1'b1) b<=b- 1'b1;
          end
          else b<=b;
end
endmodule
