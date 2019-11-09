module d_ff (q, d, clk, reset);
	output q;
	reg q;
	input d, clk, reset;

	always @(posedge clk or negedge reset) begin
		if (!reset) q = 1'b0;
		else q = d;
	end
endmodule