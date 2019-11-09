`include "fadder.v"

module adder_32bit (sum, cout, inp1, inp2, cin);
	output [31:0] sum;
	output cout;
	input [31:0] inp1, inp2;
	input cin;
	wire [30:0] w;

	fadder f1 (sum[0], w[0], inp1[0], inp2[0], cin);
	generate
		genvar j;
		for (j = 1; j < 31; j = j + 1) begin: adder_loop
			fadder f2 (sum[j], w[j], inp1[j], inp2[j], w[j - 1]);
		end
	endgenerate
	fadder f3 (sum[31], cout, inp1[31], inp2[31], w[30]);
endmodule

/*
module tb_adder_32bit;
	wire [31:0] sum;
	wire cout;
	reg [31:0] inp1, inp2;
	reg cin;
	
	adder_32bit fl (sum, cout, inp1, inp2, cin);
	
	initial
		$monitor(, $time,"\ninp1 = %32b,\ninp2 = %32b,\ncin  = %32b,\nsum  = %32b,\ncout = %32b",
			inp1, inp2, cin, sum, cout);	
	initial
		begin
			#0 inp1 =32'h3333; inp2 =32'h1111; cin =1'b0;
			#4 inp1 =32'h3333; inp2 =32'h1111; cin =1'b0;
			#4 inp1 =32'hFFFFFFFF; inp2 =32'h11111111; cin =1'b1;
			// #4 inp1 =1'b1;inp2 =1'b0;cin =1'b0;
			// #4 inp1 =1'b0;inp2 =1'b1;cin =1'b0;
			// #4 inp1 =1'b1;inp2 =1'b1;cin =1'b0;
			// #4 inp1 =1'b0;inp2 =1'b0;cin =1'b1;
			// #4 inp1 =1'b1;inp2 =1'b0;cin =1'b1;
			// #4 inp1 =1'b0;inp2 =1'b1;cin =1'b1;
			// #4 inp1 =1'b1;inp2 =1'b1;cin =1'b1;
		end
endmodule
*/