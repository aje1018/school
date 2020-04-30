`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 06:37:08 PM
// Design Name: 
// Module Name: 8to1mux
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


module mux_8to1(
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    input [3:0] in5,
    input [3:0] in6,
    input [3:0] in7,
    input [2:0]sel,
    output [3:0] out
    );
    assign out = (sel == 0) ? in0 : (sel == 1) ? in1 : (sel == 2) ? in2 : (sel == 3) ? in3 : (sel == 4) ? in4 : (sel == 5) ? in5 : (sel == 6) ? in6 : in7;
endmodule
