module or_32bit (out, inp1, inp2);
	output [31:0] out;
	input [31:0] inp1, inp2;

	assign {out} = inp1 | inp2;
endmodule

/*
module tb_or_32bit;
	wire [31:0] out;
	reg [31:0] inp1, inp2;

	or_32bit o1 (out, inp1, inp2);

	initial begin
		$monitor (, "inp1 = %32b\n inp2 = %32b\n out  = %32b\n\n",
			inp1, inp2, out);
		inp1 = 32'hA5A5;
		inp2 = 32'h5A5A;
		#20 inp1 = 32'h5A5A;
		#20 $finish;
	end
endmodule
*/