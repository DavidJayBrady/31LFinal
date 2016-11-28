`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2016 05:57:07 PM
// Design Name: 
// Module Name: Logic
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


module Logic(
    input a,
    input b,
    input cin,
    input [2:0] opsel,
    output cout,
    output result
    );
       
    assign result = (opsel == 3'b000)? a&b:
                    (opsel == 3'b001)? a|b:
                    (opsel == 3'b010)? a^b:
                    (opsel == 3'b011)? ~a:
                                      cin;
    
    assign cout = (opsel == 3'b101)? a:
                                     0;

endmodule
