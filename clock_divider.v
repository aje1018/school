`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2020 04:00:06 PM
// Design Name: 
// Module Name: clock_divider
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


`timescale 1ns / 1ps
// Code your design here
module clock_divider(input clk_in, output reg clk_out);
  localparam DIV = 10000; // 1000 -> 1MHz output
  reg [31:0] count = 32'b0;
  
  always @(posedge clk_in) begin
    if (count == DIV - 1) 
      clk_out <= ~clk_out;
    else 
      clk_out <= clk_out;
  end
  
  always @(posedge clk_in) begin
    if (count == DIV - 1) 
      count <= 32'b0;
    else
      count <= count + 1;
  end
  
endmodule
