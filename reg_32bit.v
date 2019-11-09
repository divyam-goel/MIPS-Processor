`include "d_ff.v"

module reg_32bit(q,d,clk,reset);
	output [31:0] q;
	input [31:0] d;
	input clk, reset;

	generate
		genvar i;
		for (i = 0; i < 32; i = i + 1)
		begin: reg_loop
			d_ff d1 (q[i], d[i], clk, reset);
		end
	endgenerate
endmodule

/*
module tb32reg;
	wire [31:0] q;
	reg [31:0] d;
	reg clk, reset;
	
	reg_32bit r1 (q, d, clk, reset);
	
	always @ (clk)
		#5 clk<=~clk;
	
	initial
		begin
			$monitor (, $time, " d = %32b, clk = %b, reset = %b, q = %32b",
				d, clk, reset, q);
			clk = 1'b1;
			reset =1'b0; //reset the register
			#20 reset = 1'b1;
			#20 d = 32'hAFAFAFAF;
			#200 $finish;
		end
endmodule
*/