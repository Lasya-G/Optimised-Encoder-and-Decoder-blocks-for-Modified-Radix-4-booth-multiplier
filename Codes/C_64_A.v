`timescale 1ns/1ps
module C_64_A #(parameter n=32)(input clk, reset,
input [63:0]md, 
input [63:0]mr,
output reg [127:0] out );

reg [63:0] md_reg, mr_reg;
wire [127:0] out_wire;
reg [127:0] pp, pp1, pp2, pp3, pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16,pp17,pp18,pp19,pp20,pp21,pp22,pp23,pp24,pp25,pp26,pp27,pp28,pp29,pp30,pp31,pp32;
reg [2047:0] part;
reg [2:0]mr_window ;
reg [32:0]tmp_mr;
//reg flag=0,flag1;
reg  b2, b3, b6, b4_msb;
reg [31:0] a1 ,b1, b4,b5;
reg [30:0] b4_2, b4_slice;
reg [31:0] neg_md, two_md, neg_two_md;
integer i;
reg [4:0] count;


always @(posedge clk) begin
	md_reg <= md;
	mr_reg <= mr;
end

array_adder_64 d1 (pp1, pp2, pp3, pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16,pp17,pp18,pp19,pp20,pp21,pp22,pp23,pp24,pp25,pp26,pp27,pp28,pp29,pp30,pp31,pp32,out_wire);

always @(posedge clk)
	out <= out_wire;


always@(negedge clk)begin

neg_md = ~(md) + 1'b1;
two_md = md <<1;
neg_two_md = ~(two_md) +1'b1;
//a1 = mr_window[2] ? neg_two_md : two_md ;
a1 = mr_window[2] ? neg_md : md ;
b6 = mr_window[1] ^ mr_window[0];
b2 = mr_window[2] | mr_window[1]|mr_window[0];
b3 = ~(mr_window[2] & mr_window[1] & mr_window[0]);
for (i=0; i<=31; i=i+1) begin
b1[i] = b2 & b3;
b4[i] = a1[i] & b1[i];
b5[i] = (mr_window[2] ^ md[i]);
end
b4_msb = b4[31];
b4_slice = b4[30:0];
b4_2 = b4_slice <<1;
a1 = b6 ? b4_slice : b4_2;

if(count == 28) begin
pp1 = {{64{part[2047]}},part [2047:1984]};
pp2 = {{62{part[1983]}},part [1983:1920],2'b0};
pp3 = {{60{part[1919]}},part[1919:1856],4'b0};
pp4 = {{58{part[1856]}},part[1855:1792],6'b0};
pp5 = {{56{part[1791]}},part[1791:1728],8'b0};
pp6 = {{54{part[1727]}},part[1727:1664],10'b0};
pp7 = {{52{part[1663]}},part[1663:1600],12'b0};
pp8 = {{50 {part[1599]}},part[1599:1536],14'b0};
pp9 = {{48{part[1535]}},part [1535:1472],16'b0};
pp10 = {{46{part[1471]}},part [1471:1408],18'b0};
pp11 = {{44{part[1407]}},part[1407:1344],20'b0};
pp12 = {{42{part[1343]}},part[1343:1280],22'b0};
pp13 = {{40{part[1279]}},part[1279:1216],24'b0};
pp14 = {{38{part[1215]}},part[1215:1152],26'b0};
pp15 = {{36{part[1151]}},part[1151:1088],28'b0};
pp16 = {{34 {part[1087]}},part[1087:1024],30'b0};
pp17 = {{32{part[1023]}},part [1023:960],32'b0};
pp18 = {{30{part[959]}},part [959:896],34'b0};
pp19 = {{28{part[895]}},part[895:832],36'b0};
pp20 = {{26{part[831]}},part[831:768],38'b0};
pp21 = {{24{part[767]}},part[767:704],40'b0};
pp22 = {{22{part[703]}},part[703:640],42'b0};
pp23 = {{20{part[639]}},part[639:576],44'b0};
pp24 = {{28 {part[575]}},part[575:512],46'b0};
pp25 = {{16{part[511]}},part [511:448],48'b0};
pp26 = {{14{part[447]}},part [447:384],50'b0};
pp27 = {{12{part[383]}},part[383:320],52'b0};
pp28 = {{10{part[319]}},part[319:256],54'b0};
pp29 = {{8{part[255]}},part[255:192],56'b0};
pp30 = {{6{part[191]}},part[191:128],58'b0};
pp31 = {{4{part[127]}},part[127:64],60'b0};
pp32 = {{2 {part[63]}},part[63:0],62'b0};
end
//a3 = b1 ? a2: a1;
//a4 = b2 ? a3 : 8'b0;
end


always@(posedge clk) begin
if(reset) begin
tmp_mr <= {mr_reg, 1'b0};
mr_window <= 3'b0;
i=0;
count<=0;
end

else begin
mr_window <= tmp_mr[2:0];
tmp_mr <= tmp_mr >>2;
pp <= {b4_msb,a1};
count <= count+1;
end
end


always@(count) begin
if(count < 18) begin
part = (part <<n) | pp;
end
end



endmodule








