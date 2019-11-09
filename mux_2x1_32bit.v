`include "mux_2x1_8bit.v"

module mux_2x1_32bit (out, inp1, inp2, sel);
	output [31:0] out;
	input [31:0] inp1, inp2;
	input sel;

	generate
		genvar j;
		for (j = 0; j < 4; j = j + 1) begin: mux_loop
			mux_2x1_8bit m1 (out[8 * j + 7:8 * j],
				inp1[8 * j + 7:8 * j],
				inp2[8 * j + 7:8 * j], sel);
		end
	endgenerate
endmodule

/*
module tb_mux_2x1_32bit;
	wire [31:0] out;
	reg [31:0] inp1, inp2;
	reg sel;
	
	mux_2x1_32bit m1 (out, inp1, inp2, sel);
	
	initial
		begin
			$monitor (, $time, " inp1=%32b, inp2=%32b, sel=%b, out=%32b",
				inp1, inp2, sel, out);
			inp1=32'b00000000000000000000000000000000;
			inp2=32'b11001100110011001100110011001100;
			#2 sel=1'b0;
			#2 sel=1'b1;
		end
endmodule
*/