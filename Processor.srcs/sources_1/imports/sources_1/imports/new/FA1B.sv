`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2016 01:09:51 PM
// Design Name: 
// Module Name: FA1B
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


module FA1B(
    input a,
    input b,
    input cin,
    output cout,
    output out
    );
    
    assign out = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
    
    
endmodule
