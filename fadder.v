module fadder (sum, cout, inp1, inp2, cin);
	output sum, cout;
	input inp1, inp2, cin;

	assign {cout, sum} = inp1 + inp2 + cin;
endmodule

/*
module tb_fadder;
	wire sum, cout;
	reg inp1, inp2, cin;
	
	fadder fl (sum, cout, inp1, inp2, cin);
	
	initial
		$monitor(, $time," inp1 = %b, inp2 =%b, cin = %b, sum = %b, cout = %b",
			inp1, inp2, cin, sum, cout);	
	initial
		begin
			#0 inp1 =1'b0;inp2 =1'b0;cin =1'b0;
			#4 inp1 =1'b1;inp2 =1'b0;cin =1'b0;
			#4 inp1 =1'b0;inp2 =1'b1;cin =1'b0;
			#4 inp1 =1'b1;inp2 =1'b1;cin =1'b0;
			#4 inp1 =1'b0;inp2 =1'b0;cin =1'b1;
			#4 inp1 =1'b1;inp2 =1'b0;cin =1'b1;
			#4 inp1 =1'b0;inp2 =1'b1;cin =1'b1;
			#4 inp1 =1'b1;inp2 =1'b1;cin =1'b1;
		end
endmodule
*/