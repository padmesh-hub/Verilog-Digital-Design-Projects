`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2026 21:40:32
// Design Name: 
// Module Name: Universal Register
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


module universal_register(input clk,rst,b_in,load,input wire[3:0]w_in,input wire [2:0]mode,output reg b_out,output reg[3:0]w_out);
reg[3:0] temp;
/*mode: 000-siso l2r, 001-siso r2l, 010-piso l2r, 011-piso r2l, 100-sipo l2r, 101-sipo r2l
110-pipo*/

always @ (posedge clk or posedge rst) begin
            if (rst) begin
            temp<=4'b0000;
            b_out<=1'b0;
            w_out<=4'b0000;
            end
            else begin
                  if(mode==3'b000) begin
                  temp<={b_in,temp[3:1]};
                  b_out<=temp[0];
                  end
                  else if(mode==3'b001) begin
                  temp<={temp[2:0],b_in};
                  b_out<=temp[3];
                  end
                  else if(mode==3'b010) begin
                    if(load) temp<=w_in;
                    else begin
                    temp<={1'b0,temp[3:1]};
                    b_out<=temp[0];
                    end
                  end
                  else if(mode==3'b011) begin
                    if(load) temp<=w_in;
                    else begin
                    temp<={temp[2:0],1'b0};
                    b_out<=temp[3];
                    end
                  end
                  else if(mode==3'b100) begin
                   temp<={b_in,temp[3:1]};
                   w_out<={b_in,temp[3:1]};
                  end
                  else if(mode==3'b101) begin
                   temp<={temp[2:0],b_in};
                   w_out<={temp[2:0],b_in};
                  end
                  else if(mode==3'b110) begin
                   if (load) begin temp<=w_in;
                   w_out<=w_in;
                  end
                  end
            
            end

end

endmodule
