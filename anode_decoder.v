`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 06:43:48 PM
// Design Name: 
// Module Name: anode_decoder
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


module anode_decoder(
    input [2:0] in,
    output [3:0] AN
    );
    assign AN[0] = ~(~in[2] & ~in[1] & ~in[0]);
    assign AN[1] = ~(~in[2] & ~in[1] & in[0]);
    assign AN[2] = ~(~in[2] & in[1] & ~in[0]);
    assign AN[3] = ~(~in[2] & in[1] & in[0]);
endmodule
