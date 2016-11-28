`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2016 07:37:27 PM
// Design Name: 
// Module Name: SignExtender
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


module SignExtender(
   input signed [14:0] A,
   output signed [31:0] extended
 );

 wire [16:0] ext_part;
 
 assign ext_part = {17{A[14]}};   // Replicate A[2] by 17 before concatenation
 assign extended = {ext_part, A}; // Concatenation
    
endmodule
