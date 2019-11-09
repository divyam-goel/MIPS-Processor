`include "mux_2x1_32bit.v"

module mux_4x1_32bit (out, inp1, inp2, inp3, inp4, sel);
	output [31:0] out;
	input [31:0] inp1, inp2, inp3, inp4;
	input [1:0] sel;
	wire [31:0] w1, w2;

	mux_2x1_32bit m1 (w1, inp1, inp2, sel[0]);
	mux_2x1_32bit m2 (w2, inp3, inp4, sel[0]);
	mux_2x1_32bit m3 (out, w1, w2, sel[1]);
endmodule

/*
module tb_mux_4x1_32bit;
	wire [31:0] out;
	reg [31:0] inp1, inp2, inp3, inp4;
	reg [1:0] sel;
	
	mux_4x1_32bit m1 (out, inp1, inp2, inp3, inp4, sel);
	
	initial
		begin
			$monitor (, $time, "\ninp1=%32b,\ninp2=%32b,\ninp3=%32b,\ninp4=%32b,\nsel=%b,\nout=%32b\n",
				inp1, inp2, inp3, inp4, sel, out);
			inp1 = 32'ha5a5a5a5;
			inp2 = 32'h5a5a5a5a;
			inp3 = 32'h3b3b3b3b;
			inp4 = 32'hb3b3b3b3;
			#2 sel=2'b00;
			#2 sel=2'b01;
			#2 sel=2'b10;
			#2 sel=2'b11;
		end
endmodule
*/