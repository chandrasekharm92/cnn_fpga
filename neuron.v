`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:49 11/01/2017 
// Design Name: 
// Module Name:    neuron 
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

module Conv5D_controlpath(clk,control_state);

localparam WAIT = 2'd0; 
localparam MUL  = 2'd1; 
localparam ADD1 = 2'd2; 
localparam DONE = 2'd3;
/*localparam ADD2 = 4'd3;
localparam ADD3 = 4'd4;
localparam ADD4 = 4'd5;
localparam ADD5 = 4'd6;
localparam ADD6 = 4'd7;
localparam DONE = 4'd8;*/

input clk;
reg [1:0] state_next;
wire [1:0] state;
reg [1:0] cs;
output [1:0] control_state;

assign state = state_next;
assign control_state = cs;

always @(posedge clk)
begin
	state_next <= state;
	case (state)
		WAIT:
			begin
			cs <= 2'b00;
			state_next <= MUL;
			end
		MUL :
			begin
			cs <= 2'b01;
			state_next <= ADD1;
			end
		ADD1:
			begin
			cs <= 2'b10;
			state_next <= DONE;
			end
		DONE:
			begin
			cs <= 2'b00;
			state_next <= WAIT;
			end
		/*ADD3:
			begin
			cs <= 9'b100000000;
			state_next <= ADD4;
			end
		ADD4:
			begin
			cs <= 9'b100000000;
			state_next <= ADD5;
			end
		ADD5:
			begin
			cs <= 9'b100000000;
			state_next <= ADD6;
			end
		ADD6:
			begin
			cs <= 9'b100000000;
			state_next <= DONE;
			end
		DONE:
			begin
			cs <= 9'b000000000;
			state_next <= WAIT;
			end*/
		endcase
end
endmodule


module Conv5D(weight0, weight1, weight2, weight3, weight4, weight5, weight6, weight7, 
weight8, weight9, weight10, weight11, weight12, weight13, weight14, weight15, weight16, 
weight17, weight18, weight19, weight20, weight21, weight22, weight23, weight24,
 in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, 
 in16, in17, in18, in19, in20, in21, in22, in23, in24, bias, clk, out);
input [7:0] weight0;
input [7:0] weight1;
input [7:0] weight2;
input [7:0] weight3;
input [7:0] weight4;
input [7:0] weight5;
input [7:0] weight6;
input [7:0] weight7;
input [7:0] weight8;
input [7:0] weight9;
input [7:0] weight10;
input [7:0] weight11;
input [7:0] weight12;
input [7:0] weight13;
input [7:0] weight14;
input [7:0] weight15;
input [7:0] weight16;
input [7:0] weight17;
input [7:0] weight18;
input [7:0] weight19;
input [7:0] weight20;
input [7:0] weight21;
input [7:0] weight22;
input [7:0] weight23;
input [7:0] weight24;
input [7:0] in0;
input [7:0] in1;
input [7:0] in2;
input [7:0] in3;
input [7:0] in4;
input [7:0] in5;
input [7:0] in6;
input [7:0] in7;
input [7:0] in8;
input [7:0] in9;
input [7:0] in10;
input [7:0] in11;
input [7:0] in12;
input [7:0] in13;
input [7:0] in14;
input [7:0] in15;
input [7:0] in16;
input [7:0] in17;
input [7:0] in18;
input [7:0] in19;
input [7:0] in20;
input [7:0] in21;
input [7:0] in22;
input [7:0] in23;
input [7:0] in24;
input [7:0] bias;
input clk;
output [7:0] out;
reg [7:0] product0;
reg [7:0] product1;
reg [7:0] product2;
reg [7:0] product3;
reg [7:0] product4;
reg [7:0] product5;
reg [7:0] product6;
reg [7:0] product7;
reg [7:0] product8;
reg [7:0] product9;
reg [7:0] product10;
reg [7:0] product11;
reg [7:0] product12;
reg [7:0] product13;
reg [7:0] product14;
reg [7:0] product15;
reg [7:0] product16;
reg [7:0] product17;
reg [7:0] product18;
reg [7:0] product19;
reg [7:0] product20;
reg [7:0] product21;
reg [7:0] product22;
reg [7:0] product23;
reg [7:0] product24;
wire [1:0] cs;

Conv5D_controlpath cp(.clk(clk),.control_state(cs));
Conv5D_datapath dp(.cs(cs), .weight0(weight0), .weight1(weight1), .weight2(weight2), 
.weight3(weight3),.weight4(weight4), .weight5(weight5), .weight6(weight6), 
.weight7(weight7),.weight8(weight8), .weight9(weight9), .weight10(weight10), 
.weight11(weight11), .weight12(weight12),.weight13(weight13), .weight14(weight14), 
.weight15(weight15), .weight16(weight16), .weight17(weight17), .weight18(weight18), 
.weight19(weight19), .weight20(weight20), .weight21(weight21), .weight22(weight22), 
.weight23(weight23), .weight24(weight24), .in0(in0),.in1(in1), .in2(in2), .in3(in3),
.in4(in4), .in5(in5), .in6(in6), .in7(in7), .in8(in8), .in9(in9), .in10(in10), 
.in11(in11), .in12(in12), .in13(in13), .in14(in14), .in15(in15), .in16(in16),.in17(in17),
.in18(in18), .in19(in19), .in20(in20), .in21(in21), .in22(in22),.in23(in23), .in24(in24), 
.bias(bias), .clk(clk), .out(out));


endmodule




module Conv5D_datapath(cs, weight0, weight1, weight2, weight3, weight4, weight5, weight6, weight7, 
weight8, weight9, weight10, weight11, weight12, weight13, weight14, weight15, weight16, 
weight17, weight18, weight19, weight20, weight21, weight22, weight23, weight24, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, 
 in16, in17, in18, in19, in20, in21, in22, in23, in24, bias, clk, out);
input [7:0] weight0;
input [7:0] weight1;
input [7:0] weight2;
input [7:0] weight3;
input [7:0] weight4;
input [7:0] weight5;
input [7:0] weight6;
input [7:0] weight7;
input [7:0] weight8;
input [7:0] weight9;
input [7:0] weight10;
input [7:0] weight11;
input [7:0] weight12;
input [7:0] weight13;
input [7:0] weight14;
input [7:0] weight15;
input [7:0] weight16;
input [7:0] weight17;
input [7:0] weight18;
input [7:0] weight19;
input [7:0] weight20;
input [7:0] weight21;
input [7:0] weight22;
input [7:0] weight23;
input [7:0] weight24;
input [7:0] in0;
input [7:0] in1;
input [7:0] in2;
input [7:0] in3;
input [7:0] in4;
input [7:0] in5;
input [7:0] in6;
input [7:0] in7;
input [7:0] in8;
input [7:0] in9;
input [7:0] in10;
input [7:0] in11;
input [7:0] in12;
input [7:0] in13;
input [7:0] in14;
input [7:0] in15;
input [7:0] in16;
input [7:0] in17;
input [7:0] in18;
input [7:0] in19;
input [7:0] in20;
input [7:0] in21;
input [7:0] in22;
input [7:0] in23;
input [7:0] in24;
output [7:0] out;
input [7:0] bias;
input [1:0] cs;
input clk;

wire [7:0] product0;
wire [7:0] product1;
wire [7:0] product2;
wire [7:0] product3;
wire [7:0] product4;
wire [7:0] product5;
wire [7:0] product6;
wire [7:0] product7;
wire [7:0] product8;
wire [7:0] product9;
wire [7:0] product10;
wire [7:0] product11;
wire [7:0] product12;
wire [7:0] product13;
wire [7:0] product14;
wire [7:0] product15;
wire [7:0] product16;
wire [7:0] product17;
wire [7:0] product18;
wire [7:0] product19;
wire [7:0] product20;
wire [7:0] product21;
wire [7:0] product22;
wire [7:0] product23;
wire [7:0] product24;

reg [7:0] Regout0;
reg [7:0] Regout1;
reg [7:0] Regout2;
reg [7:0] Regout3;
reg [7:0] Regout4;
reg [7:0] Regout5;
reg [7:0] Regout6;
reg [7:0] Regout7;
reg [7:0] Regout8;
reg [7:0] Regout9;
reg [7:0] Regout10;
reg [7:0] Regout11;
reg [7:0] Regout12;
reg [7:0] Regout13;
reg [7:0] Regout14;
reg [7:0] Regout15;
reg [7:0] Regout16;
reg [7:0] Regout17;
reg [7:0] Regout18;
reg [7:0] Regout19;
reg [7:0] Regout20;
reg [7:0] Regout21;
reg [7:0] Regout22;
reg [7:0] Regout23;
reg [7:0] Regout24;
reg [7:0] Regout25;

wire [7:0] Regin0;
wire [7:0] Regin1;
wire [7:0] Regin2;
wire [7:0] Regin3;
wire [7:0] Regin4;
wire [7:0] Regin5;
wire [7:0] Regin6;
wire [7:0] Regin7;
wire [7:0] Regin8;
wire [7:0] Regin9;
wire [7:0] Regin10;
wire [7:0] Regin11;
wire [7:0] Regin12;
wire [7:0] Regin13;
wire [7:0] Regin14;
wire [7:0] Regin15;
wire [7:0] Regin16;
wire [7:0] Regin17;
wire [7:0] Regin18;
wire [7:0] Regin19;
wire [7:0] Regin20;
wire [7:0] Regin21;
wire [7:0] Regin22;
wire [7:0] Regin23;
wire [7:0] Regin24;
wire [7:0] Regin25;


wire [7:0] sum;

assign out = Regout25;


mux mux0(.a(Regout0),.b(product0),.sel(cs[0]),.out(Regin0));
mux mux1(.a(Regout1),.b(product1),.sel(cs[0]),.out(Regin1));
mux mux2(.a(Regout2),.b(product2),.sel(cs[0]),.out(Regin2));
mux mux3(.a(Regout3),.b(product3),.sel(cs[0]),.out(Regin3));
mux mux4(.a(Regout4),.b(product4),.sel(cs[0]),.out(Regin4));
mux mux5(.a(Regout5),.b(product5),.sel(cs[0]),.out(Regin5));
mux mux6(.a(Regout6),.b(product6),.sel(cs[0]),.out(Regin6));
mux mux7(.a(Regout7),.b(product7),.sel(cs[0]),.out(Regin7));
mux mux8(.a(Regout8),.b(product8),.sel(cs[0]),.out(Regin8));
mux mux9(.a(Regout9),.b(product9),.sel(cs[0]),.out(Regin9));
mux mux10(.a(Regout10),.b(product10),.sel(cs[0]),.out(Regin10));
mux mux11(.a(Regout11),.b(product11),.sel(cs[0]),.out(Regin11));
mux mux12(.a(Regout12),.b(product12),.sel(cs[0]),.out(Regin12));
mux mux13(.a(Regout13),.b(product13),.sel(cs[0]),.out(Regin13));
mux mux14(.a(Regout14),.b(product14),.sel(cs[0]),.out(Regin14));
mux mux15(.a(Regout15),.b(product15),.sel(cs[0]),.out(Regin15));
mux mux16(.a(Regout16),.b(product16),.sel(cs[0]),.out(Regin16));
mux mux17(.a(Regout17),.b(product17),.sel(cs[0]),.out(Regin17));
mux mux18(.a(Regout18),.b(product18),.sel(cs[0]),.out(Regin18));
mux mux19(.a(Regout19),.b(product19),.sel(cs[0]),.out(Regin19));
mux mux20(.a(Regout20),.b(product20),.sel(cs[0]),.out(Regin20));
mux mux21(.a(Regout21),.b(product21),.sel(cs[0]),.out(Regin21));
mux mux22(.a(Regout22),.b(product22),.sel(cs[0]),.out(Regin22));
mux mux23(.a(Regout23),.b(product23),.sel(cs[0]),.out(Regin23));
mux mux24(.a(Regout24),.b(product24),.sel(cs[0]),.out(Regin24));
mux mux25(.a(Regout25),.b(sum),.sel(cs[1]),.out(Regin25));


multiplier mul24(.a(weight24),.b(in24),.product(product24));
multiplier mul23(.a(weight23),.b(in23),.product(product23));
multiplier mul22(.a(weight22),.b(in22),.product(product22));
multiplier mul21(.a(weight21),.b(in21),.product(product21));
multiplier mul20(.a(weight20),.b(in20),.product(product20));
multiplier mul19(.a(weight19),.b(in19),.product(product19));
multiplier mul18(.a(weight18),.b(in18),.product(product18));
multiplier mul17(.a(weight17),.b(in17),.product(product17));
multiplier mul16(.a(weight16),.b(in16),.product(product16));
multiplier mul15(.a(weight15),.b(in15),.product(product15));
multiplier mul14(.a(weight14),.b(in14),.product(product14));
multiplier mul13(.a(weight13),.b(in13),.product(product13));
multiplier mul12(.a(weight12),.b(in12),.product(product12));
multiplier mul11(.a(weight11),.b(in11),.product(product11));
multiplier mul10(.a(weight10),.b(in10),.product(product10));
multiplier mul9(.a(weight9),.b(in9),.product(product9));
multiplier mul8(.a(weight8),.b(in8),.product(product8));
multiplier mul7(.a(weight7),.b(in7),.product(product7));
multiplier mul6(.a(weight6),.b(in6),.product(product6));
multiplier mul5(.a(weight5),.b(in5),.product(product5));
multiplier mul4(.a(weight4),.b(in4),.product(product4));
multiplier mul3(.a(weight3),.b(in3),.product(product3));
multiplier mul2(.a(weight2),.b(in2),.product(product2));
multiplier mul1(.a(weight1),.b(in1),.product(product1));
multiplier mul0(.a(weight0),.b(in0),.product(product0));
adder add1(.Regout0(Regout0),.Regout1(Regout1),.Regout2(Regout2),.Regout3(Regout3),
.Regout4(Regout4),.Regout5(Regout5),.Regout6(Regout6),.Regout7(Regout7),.Regout8(Regout8),
.Regout9(Regout9),.Regout10(Regout10),.Regout11(Regout11),.Regout12(Regout12),
.Regout13(Regout13),.Regout14(Regout14),.Regout15(Regout15),.Regout16(Regout16),
.Regout17(Regout17),.Regout18(Regout18),.Regout19(Regout19),.Regout20(Regout20),
.Regout21(Regout21),.Regout22(Regout22),.Regout23(Regout23),.Regout24(Regout24),.bias(bias),.sum(sum));

always @(posedge clk)
begin	
Regout0<=Regin0;
Regout1<=Regin1;
Regout2<=Regin2;
Regout3<=Regin3;
Regout4<=Regin4;
Regout5<=Regin5;
Regout6<=Regin6;
Regout7<=Regin7;
Regout8<=Regin8;
Regout9<=Regin9;
Regout10<=Regin10;
Regout11<=Regin11;
Regout12<=Regin12;
Regout13<=Regin13;
Regout14<=Regin14;
Regout15<=Regin15;
Regout16<=Regin16;
Regout17<=Regin17;
Regout18<=Regin18;
Regout19<=Regin19;
Regout20<=Regin20;
Regout21<=Regin21;
Regout22<=Regin22;
Regout23<=Regin23;
Regout24<=Regin24;
Regout25<=Regin25;
end


endmodule

module adder(Regout0, Regout1, Regout2, Regout3, Regout4, Regout5, Regout6, Regout7,
Regout8, Regout9, Regout10, Regout11, Regout12, Regout13, Regout14, Regout15, Regout16,
Regout17, Regout18, Regout19, Regout20, Regout21, Regout22, Regout23, Regout24, bias,sum);

input [7:0] Regout0;
input [7:0] Regout1;
input [7:0] Regout2;
input [7:0] Regout3;
input [7:0] Regout4;
input [7:0] Regout5;
input [7:0] Regout6;
input [7:0] Regout7;
input [7:0] Regout8;
input [7:0] Regout9;
input [7:0] Regout10;
input [7:0] Regout11;
input [7:0] Regout12;
input [7:0] Regout13;
input [7:0] Regout14;
input [7:0] Regout15;
input [7:0] Regout16;
input [7:0] Regout17;
input [7:0] Regout18;
input [7:0] Regout19;
input [7:0] Regout20;
input [7:0] Regout21;
input [7:0] Regout22;
input [7:0] Regout23;
input [7:0] Regout24;
input [7:0] bias;
output [7:0] sum;
assign sum = Regout0+ Regout1+ Regout2+ Regout3+ Regout4+ Regout5+ Regout6+ Regout7+ 
Regout8+ Regout9+ Regout10+ Regout11+ Regout12+ Regout13+ Regout14+ Regout15+ Regout16+ 
Regout17+ Regout18+ Regout19+ Regout20+ Regout21+ Regout22+ Regout23+ Regout24+ bias;

endmodule

module multiplier(a,b,product);

input [7:0] a;
input [7:0] b;
output [7:0] product;

assign product = a * b;

endmodule


module mux(a,b,sel,out);

input [7:0] a;
input [7:0] b;
input sel;
output [7:0] out;
reg [7:0] out;

always @(*)
begin
	if (sel == 0)
		out = a;
	else
		out = b;
end

endmodule