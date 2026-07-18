`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.07.2026 07:52:35
// Design Name: 
// Module Name: tx_module
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


module tx_module(input clk,rst,write_enable,tx_enable,input wire[7:0]data_in,output reg tx_out);

reg [7:0]data_reg;
reg [2:0]index;
reg[1:0]ps,ns;
parameter idle=2'b00;
parameter start=2'b01;
parameter data=2'b10;
parameter stop=2'b11;

always @ (posedge clk or posedge rst) begin
        if(rst) ps<=idle;
        else ps<=ns;
end

always @ (*) begin
          case(ps)
          idle:begin
            if(write_enable)begin
             ns<=start;
             data_reg<=data_in;
             end
          end
          start:begin
            if(tx_enable) begin
                ns<=data;
                index<=0;
                end
          end
          data: begin
          if(tx_enable) begin
              if(index==7) ns<=stop;
              else index<=index+1;
              end
          end
          stop: begin
          if(tx_enable) ns<=idle;
          end
          default:begin
          ns<=idle;
          end
          endcase
end

always @ (*) begin
       case(ps)
       data:tx_out=data_reg[index];
       start:tx_out=1'b0;
       default:tx_out=1'b1;
       endcase
end
endmodule
