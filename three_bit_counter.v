`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 06:50:44 PM
// Design Name: 
// Module Name: three_bit_counter
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


module three_bit_counter(
    input clk,
    input reset,
    output reg [2:0] out
    );
    
    always @(posedge clk) begin
        if (reset == 7)
            out <= 0;
        else
            out <= out + 1;
    end
    
endmodule
