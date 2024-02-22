`timescale 1ns/1ps

module booth_mult_B_tb;
reg clk,reset;
reg  [7:0] a,b;
wire [15:0] out;

booth_mult_B uut(clk, reset, a,b,out);

initial begin
clk=0;
reset = 1'b1; 
#10 
reset = 1'b0;
end


always #5 clk = ~clk;

initial begin
a = 8'd35;
b = 8'd15;

end


endmodule
