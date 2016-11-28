`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2016 09:37:02 PM
// Design Name: 
// Module Name: MUX2_1
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


module MUX2_1(
    input [31:0] a,
    input [31:0] b,
    input sel,
    output [31:0] out
    );
    // select a when sel is 0, b when sel is 1
   assign out = (~sel)? a : b ;    
endmodule
