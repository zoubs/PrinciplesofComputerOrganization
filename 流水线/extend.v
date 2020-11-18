`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/03 16:24:51
// Design Name: 
// Module Name: extend
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


module extend(
    input [15:0] imme,input Sign,
    output [31:0]imextend
     );
     
    assign imextend = (Sign==1) ?  {{16{imme[15]}},imme}:{16'b0000000000000000,imme} ;
endmodule
