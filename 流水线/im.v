`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/03 16:17:54
// Design Name: 
// Module Name: im
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


module im(
          input[31:0] addr,
          output[31:0] dout
          );
         reg [31:0]im_4k[1023:0];
         assign dout = im_4k[addr[11:2]];
         initial 
         begin
         $readmemb("D:/code1.txt",im_4k);
         end
          
         
endmodule
