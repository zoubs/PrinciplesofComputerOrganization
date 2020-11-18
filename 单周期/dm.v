`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/21 23:23:42
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
    input MemWrite,clk,rst,
    input [31:0] din,
    input MemtoReg,
    output [31:0] dout
    
    );
    wire [31:0] dmread;
    wire [9:0] dmaddr;
    integer i;
    reg [31:0] dm_4k [1023:0];
    assign dmaddr = addr[11:2];
    always@( posedge clk )
    begin
         if(rst)              for(i=0;i<1024;i=i+1)dm_4k [i] = 0;
         else if(MemWrite)   dm_4k [dmaddr] = din;
    end
    assign dmread = dm_4k [dmaddr];
    mux_32 MUX (.a(addr),.b(dmread),.c(MemtoReg),.o(dout));
endmodule
