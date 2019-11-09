module mux_2x1 (out, inp1, inp2, sel);
	output out;
	input inp1, inp2, sel;

	assign out = sel ? inp2: inp1;
endmodule

/*
module tb_mux_2x1;
	wire out;
	reg inp1, inp2, sel;
	
	mux_2x1 m1 (out, inp1, inp2, sel);
	
	initial
		begin
			$monitor (, $time, " inp1=%b, inp2=%b, sel=%b, out=%b", inp1, inp2, sel, out);
			inp1=1'b0;
			inp2=1'b1;
			#2 sel=1'b0;
			#2 sel=1'b1;
		end
endmodule
*/