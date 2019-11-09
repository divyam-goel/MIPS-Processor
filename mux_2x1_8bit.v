`include "mux_2x1.v"

module mux_2x1_8bit (out, inp1, inp2, sel);
	output [7:0] out;
	input [7:0] inp1, inp2;
	input sel;

	generate 
		genvar j;
		for (j = 0; j < 8; j = j + 1) begin: mux_loop
			mux_2x1 m1 (out[j], inp1[j], inp2[j], sel);
		end
	endgenerate
endmodule

/*
module tb_mux_2x1_8bit;
	wire [7:0] out;
	reg [7:0] inp1, inp2;
	reg sel;
	
	mux_2x1_8bit m2 (out, inp1, inp2, sel);
	
	initial
		begin
			$monitor (, $time, " inp1=%8b, inp2=%8b, sel=%b, out=%8b", inp1, inp2, sel, out);
			inp1=8'b00000000;
			inp2=8'b11001100;
			#2 sel=1'b0;
			#2 sel=1'b1;
		end
endmodule
*/