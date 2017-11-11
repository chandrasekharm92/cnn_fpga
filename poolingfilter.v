`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:23 11/05/2017 
// Design Name: 
// Module Name:    poolingfilter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module poolingfilter(in1,in2,in3,in4,out);
	 
	input [7:0] in1;
	input [7:0] in2;
	input [7:0] in3;
	input [7:0] in4;
	output [7:0] out;
	reg [7:0] tmp1;
	reg [7:0] tmp2;
	
	always @(*)
	begin
		if (in1 > in2 )
			tmp1 = in1;
		else
			tmp1 = in2;
		if (in3 > in4)
			tmp2 = in3;
		else
			tmp2 = in4;
	end
	
	assign out = (tmp1>tmp2)?tmp1:tmp2;

endmodule
