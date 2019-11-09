module alu_control (Op, ALUOp0, ALUOp1, Funct);
	output [2:0] Op;
	input ALUOp0, ALUOp1;
	input [5:0] Funct;

	assign Op[0] = ALUOp1 & (Funct[0] | Funct[3]);
	assign Op[1] = ~ALUOp1 | ~Funct[2];
	assign Op[2] = ALUOp0 | (ALUOp1 & Funct[1]);
endmodule

module tb_alu_control;
	wire [2:0] Op;
	reg ALUOp0, ALUOp1;
	reg [5:0] Funct;

	alu_control a1 (Op, ALUOp0, ALUOp1, Funct);

	initial
		begin
			$monitor (, "ALUOp1 = %b, ALUOp0 = %b, Funct = %6b, Op = %3b",
				ALUOp1, ALUOp0, Funct, Op);
			#0 ALUOp1 = 1'b0; ALUOp0 = 1'b0; Funct = 6'b000000;
			#2 ALUOp1 = 1'b0; ALUOp0 = 1'b1; Funct = 6'b000000;
			#2 ALUOp1 = 1'b1; ALUOp0 = 1'b0; Funct = 6'b000000;
			#2 ALUOp1 = 1'b1; ALUOp0 = 1'b0; Funct = 6'b000010;
			#2 ALUOp1 = 1'b1; ALUOp0 = 1'b0; Funct = 6'b000100;
			#2 ALUOp1 = 1'b1; ALUOp0 = 1'b0; Funct = 6'b000101;
			#2 ALUOp1 = 1'b1; ALUOp0 = 1'b0; Funct = 6'b001010;
		end
endmodule