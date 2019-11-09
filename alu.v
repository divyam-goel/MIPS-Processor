`include "mux_4x1_32bit.v"
`include "and_32bit.v"
`include "or_32bit.v"
`include "adder_32bit.v"

module alu (res, cout, inp1, inp2, cin, binv, op);
	output [31:0] res;
	output cout;
	input [31:0] inp1, inp2;
	input cin, binv;
	input [1:0] op;
	wire [31:0] inp2_mux;
	wire [31:0] wa, wo, ws;

	mux_2x1_32bit m1 (inp2_mux, inp2, ~inp2, binv);
	and_32bit a1 (wa, inp1, inp2_mux);
	or_32bit o1 (wo, inp1, inp2_mux);
	adder_32bit fa1 (ws, cout, inp1, inp2_mux, cin);
 	mux_4x1_32bit m2 (res, wa, wo, ws, 0, op);
endmodule

/*
module tb_alu;
	wire [31:0] res;
	wire cout;
	reg [31:0] inp1, inp2;
	reg cin, binv;
	reg [1:0] op;
	
	alu a1 (res, cout, inp1, inp2, cin, binv, op);
	
	initial begin
		$monitor (, $time, "\ninp1 = %32b\ninp2 = %32b\ncin = %b, binv = %b, op = %2b\nres  = %32b\ncout = %b",
			inp1, inp2, cin, binv, op, res, cout);
		inp1 = 32'ha5a5a5a5;
		inp2 = 32'h5a5a5a5a;
		cin = 1'b0;
		binv = 1'b0;
		op = 2'b00;
	
		#100 op = 2'b01; //OR
		#100 op = 2'b10; //ADD
		#100 binv = 1'b1;//SUB
		#200 $finish;
	end
endmodule
*/