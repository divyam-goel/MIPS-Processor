module main_control (RegDst, ALUSrc, MemtoReg, RegWrite,
	MemRead, MemWrite, Branch, ALUOp1, ALUOp2, Op);
	
	output RegDst, ALUSrc, MemtoReg, RegWrite, 
		MemRead, MemWrite, Branch, ALUOp1, ALUOp2;
	input [5:0] Op;
	wire Rformat, lw, sw, beq;
	
	assign Rformat = (~Op[0]) & (~Op[1]) & (~Op[2])
		& (~Op[3]) & (~Op[4]) & (~Op[5]);
	assign lw = Op[0] & Op[1] & (~Op[2])
		& (~Op[3]) & (~Op[4]) & Op[5];
	assign sw = Op[0] & Op[1] & (~Op[2])
		& Op[3] & (~Op[4]) & Op[5];
	assign beq = (~Op[0]) & (~Op[1]) & Op[2]
		& (~Op[3]) & (~Op[4]) & (~Op[5]);
	
	assign RegDst = Rformat;
	assign ALUSrc = lw | sw;
	assign MemtoReg = lw;
	assign RegWrite = Rformat | lw;
	assign MemRead = lw;
	assign MemWrite = sw;
	assign Branch = beq;
	assign ALUOp1 = Rformat;
	assign ALUOp2 = beq;
endmodule

/*
module tb_main_control;
	wire RegDst, ALUSrc, MemtoReg, RegWrite, 
		MemRead, MemWrite, Branch, ALUOp1, ALUOp2;
	reg [5:0] Op;

	main_control m1 (RegDst, ALUSrc, MemtoReg, RegWrite,
		MemRead, MemWrite, Branch, ALUOp1, ALUOp2, Op);

	initial
		begin
			$monitor (, "\nOp = %6b\nRegDst = %b, ALUSrc = %b, MemtoReg = %b, RegWrite = %b,", 
				Op, RegDst, ALUSrc, MemtoReg, RegWrite,
				"MemRead = %b, MemWrite = %b, Branch = %b, ALUOp1 = %b, ALUOp2 = %b",
				MemRead, MemWrite, Branch, ALUOp1, ALUOp2);
			#0 Op = 6'b000000; // R-format
			#2 Op = 6'b100011; // LW
			#2 Op = 6'b101011; // SW
			#2 Op = 6'b000100; // BEQ
		end
endmodule
*/