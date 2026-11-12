`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 06:04:51 PM
// Design Name: 
// Module Name: counter
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


module counter#(
   parameter LIM = 799,
   parameter WIDTH = $clog2(LIM-1)
 )(
    input wire iClk,
    input wire iRst,
    output wire [WIDTH:0] oCount 
);

reg [WIDTH:0] count_curr;
reg [WIDTH:0]count_next;

always@(posedge iClk)
begin
   if (iRst <= 0)
      count_curr <= 0;
   else
      count_curr <= count_next;
end

always@(*)
begin
   if (count_curr == LIM)
      count_next = 0;
   else
      count_next = count_curr + 1;
end
      
assign oCount = count_curr;
endmodule
