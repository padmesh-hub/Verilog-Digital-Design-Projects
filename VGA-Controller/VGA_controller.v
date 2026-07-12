`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2026 21:22:21
// Design Name: 
// Module Name: VGA_controller
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


module VGA_controller(
input clk_100mhz,rst,
output video_on,hsync,vsync,
output [9:0]x,y,
output clk_25mhz
);

reg[1:0]freq;
wire f_25mhz;

parameter hp=680;
parameter hf=16;
parameter hr=96;
parameter hb=48;
parameter hmax=799;
parameter vmax=524;
parameter vp=680;
parameter vf=33;
parameter vr=2;
parameter vb=10;



always @ (posedge clk_100mhz or posedge rst) begin
        if(rst) freq<=2'b00;
        else  begin
           if(freq==2'b11)  freq<=2'b00;
           else freq<=freq + 1'b1;
        end
end

assign f_25mhz= (freq==0);
reg[9:0] hcount_reg,vcount_reg;
reg[9:0] hcount_next,vcount_next;
reg hsync_reg,vsync_reg,video_on_reg;
wire hsync_next,vsync_next,video_on_next;

always @ (posedge clk_100mhz or posedge rst) begin
          if(rst) begin
              hcount_reg<=0;
              vcount_reg<=0;
              hsync_reg<=1'b0;
              vsync_reg<=1'b0;
              video_on_reg<=1'b0;
          end
          else begin
              hcount_reg<=hcount_next;
              vcount_reg<=vcount_next;
              hsync_reg<=hsync_next;
              vsync_reg<=vsync_next;
              video_on_reg<= video_on_next;
          end
end

always @ (posedge f_25mhz or posedge rst) begin
         if(rst) hcount_next<=0;
         else begin
              if(hcount_reg==799) hcount_next<=0;
              else hcount_next<= hcount_reg + 1;
         end
end

always @ (posedge f_25mhz or posedge rst) begin
         if(rst) vcount_next<=0;
         else begin
              if(hcount_reg==799) begin
                   if(vcount_reg==524) vcount_next<=0;
                   else vcount_next<= vcount_reg + 1;
                   end
         end
end

assign hsync_next = (hcount_reg >=656 && hcount_reg<=799);
assign vsync_next = (vcount_reg >=513 && vcount_reg<=524);
assign video_on_next = (hcount_reg<=639 && vcount_reg<=479);

assign hsync=hsync_reg;
assign vsync=vsync_reg;
assign x= hcount_reg;
assign y= vcount_reg;
assign clk_25mhz=f_25mhz;

endmodule
