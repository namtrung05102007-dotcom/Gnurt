`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 10:57:20 PM
// Design Name: 
// Module Name: video_patterns
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


module video_patterns#(
    parameter WIDTH  = 640,
    parameter H_FP   = 16,
    parameter H_PW   = 96,
    parameter H_BP   = 48,
    parameter H_TOT  = WIDTH + H_FP + H_PW + H_BP,
    parameter H_bits = $clog2(H_TOT),

    parameter HEIGHT = 480,
    parameter V_FP   = 10,
    parameter V_PW   = 2,   
    parameter V_BP   = 33,
    parameter V_TOT  = HEIGHT + V_FP + V_PW + V_BP,
    parameter V_bits = $clog2(V_TOT)
)(  
    input wire iClk,
    input wire iRst,
    input wire [H_bits-1:0] iCountH,
    input wire [V_bits-1:0] iCountV,
    output wire [7:0] oRed,
    output wire [7:0] oGreen, 
    output wire [7:0] oBlue,
    output wire oActive
);


assign oActive = ( iCountH < WIDTH ) && (iCountV < HEIGHT);
assign oRed = oActive ? 8'hFF : 8'h00;
assign oBlue = 8'h0;
assign oGreen = 8'h00;

endmodule
