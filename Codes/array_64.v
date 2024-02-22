`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 22:05:51
// Design Name: 
// Module Name: array_adder_32
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


module array_adder_64(
input [127:0] p1, p2, p3, p4, p5, p6, p7, p8, p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,
output [127:0] sum

    );
    
wire [127:0] ts1, ts2, ts3, ts4, ts5, ts6, ts7, ts8, ts9, ts10, ts11, ts12, ts13, ts14,ts15,ts16,ts17,ts18,ts19,ts20,ts21,ts22,ts23,ts24,ts25,ts26,ts27,ts28,ts29,ts30;
wire [127:0] c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31;

half_adder ha1 (p1[0], p2[0], ts1[0], c1[0]);
half_adder ha2 (ts1[0], p3[0], ts2[0], c2[0]);
half_adder ha3 (ts2[0], p4[0], ts3[0], c3[0]);
half_adder ha4 (ts3[0], p5[0], ts4[0], c4[0]);
half_adder ha5 (ts4[0], p6[0], ts5[0], c5[0]);
half_adder ha6 (ts5[0], p7[0], ts6[0], c6[0]);
half_adder ha7 (ts6[0], p8[0], ts7[0], c7[0]);
half_adder ha8 (ts7[0], p9[0], ts8[0], c8[0]);
half_adder ha9 (ts8[0], p10[0], ts9[0], c9[0]);
half_adder ha10 (ts9[0], p11[0], ts10[0], c10[0]);
half_adder ha11 (ts10[0], p12[0], ts11[0], c11[0]);
half_adder ha12 (ts11[0], p13[0], ts12[0], c12[0]);
half_adder ha13 (ts12[0], p14[0], ts13[0], c13[0]);
half_adder ha14 (ts13[0], p15[0], ts14[0], c14[0]);
half_adder ha15 (p16[0], ts14[0], ts15[0], c15[0]);
half_adder ha16 (ts15[0], p17[0], ts16[0], c16[0]);
half_adder ha17 (ts16[0], p18[0], ts17[0], c17[0]);
half_adder ha18 (ts17[0], p19[0], ts18[0], c18[0]);
half_adder ha19 (ts18[0], p20[0], ts19[0], c19[0]);
half_adder ha20 (ts19[0], p21[0], ts20[0], c20[0]);
half_adder ha21 (ts20[0], p22[0], ts21[0], c21[0]);
half_adder ha22 (ts21[0], p23[0], ts22[0], c22[0]);
half_adder ha23 (ts22[0], p24[0], ts23[0], c23[0]);
half_adder ha24 (ts23[0], p25[0], ts24[0], c24[0]);
half_adder ha25 (ts24[0], p26[0], ts25[0], c25[0]);
half_adder ha26 (ts25[0], p27[0], ts26[0], c26[0]);
half_adder ha27 (ts26[0], p28[0], ts27[0], c27[0]);
half_adder ha28 (ts27[0], p29[0], ts28[0], c28[0]);
half_adder ha29 (ts28[0], p30[0], ts29[0], c29[0]);
half_adder ha30 (ts29[0], p31[0], ts30[0], c30[0]);
half_adder ha31 (ts30[0], p32[0], sum[0], c31[0]);

genvar i;
generate
for (i=1; i<=127; i=i+1) begin
full_adder fa1 (p1[i], p2[i], c1[i-1], ts1[i], c1[i]);
full_adder fa2 (p3[i], ts1[i], c2[i-1], ts2[i], c2[i]);
full_adder fa3 (p4[i], ts2[i], c3[i-1], ts3[i], c3[i]);
full_adder fa4 (p5[i], ts3[i], c4[i-1], ts4[i], c4[i]);
full_adder fa5 (p6[i], ts4[i], c5[i-1], ts5[i], c5[i]);
full_adder fa6 (p7[i], ts5[i], c6[i-1], ts6[i], c6[i]);
full_adder fa7 (p8[i], ts6[i], c7[i-1], ts7[i], c7[i]);
full_adder fa8 (p9[i], ts7[i], c8[i-1], ts8[i], c8[i]);
full_adder fa9 (p10[i], ts8[i], c9[i-1], ts9[i], c9[i]);
full_adder fa10 (p11[i], ts9[i], c10[i-1], ts10[i], c10[i]);
full_adder fa11 (p12[i], ts10[i], c11[i-1], ts11[i], c11[i]);
full_adder fa12 (p13[i], ts11[i], c12[i-1], ts12[i], c12[i]);
full_adder fa13 (p14[i], ts12[i], c13[i-1], ts13[i], c13[i]);
full_adder fa14 (p15[i], ts13[i], c14[i-1], ts14[i], c14[i]);
full_adder fa15 (p16[i], ts14[i], c15[i-1], ts15[i], c15[i]);
full_adder fa16 (p17[i], ts15[i], c16[i-1], ts16[i], c16[i]);
full_adder fa17 (p18[i], ts16[i], c17[i-1], ts17[i], c17[i]);
full_adder fa18 (p19[i], ts17[i], c18[i-1], ts18[i], c18[i]);
full_adder fa19 (p20[i], ts18[i], c19[i-1], ts19[i], c19[i]);
full_adder fa20 (p21[i], ts19[i], c20[i-1], ts20[i], c20[i]);
full_adder fa21 (p22[i], ts20[i], c21[i-1], ts21[i], c21[i]);
full_adder fa22 (p23[i], ts21[i], c22[i-1], ts22[i], c22[i]);
full_adder fa23 (p24[i], ts22[i], c23[i-1], ts23[i], c23[i]);
full_adder fa24 (p25[i], ts23[i], c24[i-1], ts24[i], c24[i]);
full_adder fa25 (p26[i], ts24[i], c25[i-1], ts25[i], c25[i]);
full_adder fa26 (p27[i], ts25[i], c26[i-1], ts26[i], c26[i]);
full_adder fa27 (p28[i], ts26[i], c27[i-1], ts27[i], c27[i]);
full_adder fa28 (p29[i], ts27[i], c28[i-1], ts28[i], c28[i]);
full_adder fa29 (p30[i], ts28[i], c29[i-1], ts29[i], c29[i]);
full_adder fa30 (p31[i], ts29[i], c30[i-1], ts30[i], c30[i]);
full_adder fa31 (p32[i], ts30[i], c31[i-1], sum[i], c31[i]);
end
endgenerate

endmodule
