`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2016 01:09:51 PM
// Design Name: 
// Module Name: ALU1B
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


module ALU1B(
    input a,
    input b,
    input [2:0] opsel,
    input mode,
    input cin,
    output cout,
    output result
    );
        
    logic mathResult;
    logic mathCout;
    logic logicResult;
    logic logicCout; 
    logic NewB;
    logic NewCin;      
       
     assign NewB = (opsel == 3'b001)? ~b:
                   (opsel == 3'b010)?  0:
                   (opsel == 3'b011)? ~b:
                   (opsel == 3'b100)?  0:
                   (opsel == 3'b101)?  1:
                  //(opsel == 3'110)?  b;
                                       b;
                
      assign NewCin = (opsel == 3'b010)? 0:
      // DON'T ZERO OUT THE CARRY ON 3'b101
      // DONT CHANGE CIN IF ITS INCREMENT, IT STAYTS CIN
                                        cin;
                                      
                                             
     FA1B FullAdder (
                        .a(a),
                        .b(NewB),
                        .cin(NewCin),
                        .cout(mathCout),
                        .out(mathResult)
                    );
    
    Logic ALULogic (
                      .a(a),
                      .b(b),
                      .cin(cin),
                      .opsel(opsel),
                      .cout(logicCout),
                      .result(logicResult)
                   );
                   
     assign result = (mode == 1'b0)? mathResult:
                                     logicResult;
                                     
     assign cout = (mode == 1'b0)? mathCout:
                                     logicCout;

endmodule
