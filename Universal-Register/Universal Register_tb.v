`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.07.2026 22:36:07
// Design Name: 
// Module Name: Universal Register_tb
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


module universal_register_tb();
reg clk,rst,b_in,load;
reg [2:0] mode;
reg [3:0] w_in;
wire b_out;
wire [3:0] w_out;

universal_register uut (clk,rst,b_in,load,w_in,mode,b_outw_out);
        
initial {clk,rst,b_in,load,w_in,mode}=0;

always #10 clk=~clk;

initial begin
     #5 rst=1'b1;
     #18 rst=1'b0;
     #2 $display("Testing PIPO Mode");
        mode = 3'b110;
        w_in = 4'b1011;
        load = 1;
     #20 load = 0;
         mode = 3'b110;         
         w_in = 4'b1111;   // Changed the input to check retention
     #20 $display("Testing SIPO Mode");
         mode = 3'b100;
         b_in = 1; #20;   
        b_in = 0; #20;    
        b_in = 1; #20;    
        b_in = 0; #20;    // output is 0101
     #20 $display("Testing PISO Mode");
        mode = 3'b010;
        w_in = 4'b1101;   
        load = 1;         
        #20 load = 0;         
        #20;              
        #20;             
        #20;              
        #20;
        $finish;              
end

endmodule