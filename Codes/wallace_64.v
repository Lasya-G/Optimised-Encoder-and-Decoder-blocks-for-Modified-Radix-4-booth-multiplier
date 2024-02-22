`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2023 02:15:54
// Design Name: 
// Module Name: wallace_64
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


module wallace_64(
input [127:0] p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,
output [127:0] sum
    );
    
wire [127:0] ts1,ts2,ts3,ts4,ts5,ts6,ts7,ts8,ts9,ts10,ts11,ts12,ts13,ts14,ts15,ts16,ts17,ts18,ts19,ts20,ts21,ts22,ts23,ts24,ts25,ts26,ts27,ts28,ts29,ts30,ts31;
wire [127:0] c1, c2, c3, c4, c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32;

//common for all stages (line1)
genvar i;
generate 
for(i=0; i<=127;i=i+1) begin
fa fa1(p1[i], p2[i],p3[i],ts1[i],c1[i]);
fa fa2(p4[i],p5[i],p6[i], ts2[i], c2[i]);
fa fa3(p7[i],p8[i],p9[i],ts3[i],c3[i]);
fa fa4(p10[i],p11[i],p12[i],ts4[i],c4[i]);
fa fa5(p13[i],p14[i],p15[i],ts5[i],c5[i]);
fa fa6(p16[i],p17[i],p18[i],ts6[i],c6[i]);
fa fa7(p19[i],p20[i],p21[i],ts7[i],c7[i]);
fa fa8(p22[i],p23[i],p24[i],ts8[i],c8[i]);
fa fa9(p25[i],p26[i],p27[i],ts9[i],c9[i]);
fa fa10(p28[i],p29[i],p30[i],ts10[i],c10[i]);
end
endgenerate

//stage1
fa fa111(ts1[0],ts2[0],ts3[0],ts11[0],c11[0]);
fa fa112(ts4[0],ts5[0],ts6[0],ts12[0],c12[0]);
fa fa113(ts7[0],ts8[0],ts9[0],ts13[0],c13[0]);
fa fa114(ts10[0],p31[0],p32[0],ts14[0],c14[0]);
fa fa115(ts11[0],ts12[0],ts13[0],ts15[0],c15[0]);
ha ha116(ts15[0],ts14[0],sum[0], c16[0]);

//stage2 and all following stages (line2)
genvar j;
generate
for (j=1; j<=127; j=j+1) begin
fa fa11(ts1[j],ts2[j],c1[j-1],ts11[j],c11[j]);
fa fa12(ts3[j],c2[j-1],c3[j-1],ts12[j],c12[j]);
fa fa13(ts4[j],ts5[j],c4[j-1],ts13[j],c13[j]);
fa fa14(ts6[j], c5[j-1], c6[j-1], ts14[j],c14[j]);
fa fa15(ts7[j],ts8[j],c7[j-1],ts15[j],c15[j]);
fa fa16(ts9[j],c8[j-1],c9[j-1],ts16[j-1],c16[j]);
fa fa17(ts10[j],p31[j],c10[j-1],ts17[j-1],c17[j-1]);
end
endgenerate

//stage2
fa fa218(ts12[1],ts11[1],c11[0],ts18[0],c18[0]);
fa fa219(ts13[1],c12[0],c13[0],ts19[0],c19[0]);
fa fa220(ts15[1],ts14[1],c14[0],ts20[0],c20[0]);
fa fa221(ts16[0],ts17[0],p32[1],ts21[0],c21[0]);
fa fa222(ts18[0],ts19[0],c15[0],ts22[0],c22[0]);
ha ha223(ts20[0],ts21[0],ts23[0],c23[0]);
fa fa224(ts22[0],ts23[0],c16[0],sum[1],c24[0]);

//stage3 and all next stages (line3)
genvar k;
generate
for(k=2;k<=127;k=k+1) begin
fa fa18(ts11[k],ts12[k],c11[k-1],ts18[k-1],c18[k-1]);
fa fa19(ts13[k],c12[k-1],c13[k-1],ts19[k-1],c19[k-1]);
fa fa20(ts14[k],ts15[k],c14[k-1],ts20[k-1],c20[k-1]);
fa fa21(ts16[k-1],c15[k-1],c16[k-1],ts21[k-1],c21[k-1]);
fa fa22(p32[k],ts17[k-1],c17[k-1],ts22[k-1],c22[k-1]);
end
endgenerate

//stage3
fa fa323(ts18[1],ts19[1],c18[0],ts23[1],c23[1]);
fa fa324(ts20[1],c19[0],c20[0], ts24[0],c24[1]);
fa fa325(ts22[1],ts21[1],c21[0],ts25[0],c25[0]);
fa fa326(ts23[1],ts24[0],c22[0],ts26[0],c26[0]);
ha ha327(ts25[0],c23[0],ts27[0],c27[0]);
fa fa328(ts26[0],ts27[0],c24[0],sum[2],c28[0]);

//stage4 and following (line4 & 6)
genvar l;
generate
for(l=3; l<=127; l=l+1) begin
fa fa23(ts18[l-1],ts19[l-1],c18[l-2],ts23[l-1],c23[l-1]);
fa fa24(ts20[l-1],c19[l-2],c20[l-2],ts24[l-2],c24[l-1]);
ha ha29 (ts22[l-1],c27[l-3],ts29[l-3],c29[l-3]);
end
endgenerate

//stage4
fa fa425 (ts21[2],c21[1],c22[1],ts25[1],c25[1]);
fa fa426 (ts23[2],ts24[1],c23[1],ts26[1],c26[1]);
fa fa427 (ts25[1],c24[1],c25[0],ts27[1],c27[1]);
fa fa428 (ts26[1],ts27[1],c26[0],ts28[0],c28[1]);
fa fa430 (ts28[0],ts29[0],c28[0],sum[3],c30[0]);

//stage5 and continuous(line4,5)
genvar m;
generate 
for(m=4;m<=127;m=m+1) begin
fa fa25(ts21[m-1],c21[m-2],c22[m-2],ts25[m-2],c25[m-2]);
fa fa26(ts23[m-1],ts24[m-2],c23[m-2],ts26[m-2],c26[m-2]);
fa fa27(ts25[m-2],c24[m-2],c25[m-3],ts27[m-2],c27[m-2]);
fa fa28(ts26[m-2],ts27[m-2],c26[m-3],ts28[m-3],c28[m-2]);
end
endgenerate

//stage5
fa fa530(ts28[1],c28[1],c29[0],ts30[0],c30[1]);
fa fa531(ts30[0],c30[0],ts29[1],sum[4],c31[0]);

//stage6 and next
genvar n;
generate 
for(n=5; n<=127; n=n+1) begin
fa fa30(ts28[n-3],c28[n-3],c29[n-4],ts30[n-4],c30[n-3]);
fa fa31(ts30[n-4],ts29[n-3],c30[n-4],ts31[n-5],c31[n-4]);
end
endgenerate

//stage6
ha ha632(ts31[0],c31[0],sum[5],c32[0]);

//stage7 and next
genvar o;
generate
for(o=6;o<=127;o=o+1) begin
fa fa32(ts31[o-5],c31[o-5],c32[o-6],sum[o],c32[o-5]);
end
endgenerate

endmodule
