module alu32_tb;
	reg[31:0] A,B;
	reg[1:0]F;
	reg clk;
	wire[31:0]Y;
	wire Zero, Carry, Overflow, Neg, cout;

	alu32 DUT (
	.A(A),
	.B(B),
	.F(F),
	.Y(Y),
	.Zero(Zero),
	.Carry(Carry),
	.Overflow(Overflow),
	.Neg(Neg),
	.cout(cout)
	);

	initial begin
		A=32'h0000000;
		B=32'h0000000;
		F=2'b00;
		clk=0;
	end

//GERADOR DE CLOCK
	always
		#5 clk=!clk;
endmodule 
