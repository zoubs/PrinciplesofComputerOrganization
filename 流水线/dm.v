`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/03 16:31:05
// Design Name: 
// Module Name: dm
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

module dm(
    input [31:0] addr,
    input MemWrite,MemRead,rst,
    input [31:0] din,
    output reg [31:0] dmread
    
    );
    wire [9:0] dmaddr;
    integer i;
    reg [31:0] dm_4k [1023:0];
    assign dmaddr = addr[11:2];
    always@(*)
    begin
         if(rst)              for(i=0;i<1024;i=i+1)dm_4k [i] = 0;
         else if(MemWrite)   dm_4k [dmaddr] = din;
    end
    always@(*)
    begin
         if(MemRead)  dmread <= dm_4k [dmaddr];
    end
    
endmodule
