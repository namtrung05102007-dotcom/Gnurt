`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2026 06:38:57 PM
// Design Name: 
// Module Name: video_timing
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


module video_timing#(
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
    input  wire iClk, iRst,
    output wire [H_bits-1:0] oCountH,
    output wire [V_bits-1:0] oCountV,
    output wire oHS, oVS
);

wire Venb;
counter #(
.LIM(H_TOT-1))
 instance_counterH (.iClk(iClk),.iRst(iRst), .oCount(oCountH));
 
counter_with_enable#
(.LIM(V_TOT-1)) instance_counterV(.iClk(iClk),.iRst(iRst), .oCount(oCountV),.iEnb(Venb));

assign Venb = (oCountH == H_TOT - 1) ? 1 : 0;
assign oHS = (H_FP + WIDTH <= oCountH || oCountH <= H_FP + WIDTH + H_PW) ? 0 : 1;
assign oVS = (V_FP + HEIGHT <= oCountV || oCountV <= V_FP + HEIGHT + V_PW) ? 0 : 1;



endmodule
