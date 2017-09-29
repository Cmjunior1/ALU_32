module alu32(input logic[3:0] A,B,
	     input logic[1:0] F,
	     output logic[3:0]Y,
	     output logic Zero, Overflow, Carry, cout, Neg);
	logic [3:0] S, Bout; 
	assign Bout = F[0] ? ~B : B;          //Se bit 2 de F for 1, recebe NB, inverte B caso SubtraÇão
	assign {cout,S} = A + Bout + F[0];               //Complemento de 2, o que sobra da soma fica armazenada em cout

	assign Carry = cout;

	always_comb
		case(F)
			2'b00: Y<=S;              // SOMA
			2'b01: Y<=S;              //SUB
			2'b10: Y<=A&B;             //AND
			2'b11: Y<=A|B;            //OR
		endcase
	
	assign Zero = (Y == 4'b0); //Flag de Zero, sempre que a condição for verdade, Zero=1

	always_comb
	case(F)	
 	2'b00: Overflow <= A[3] & B[3] & ~S[3] | ~A[3] & ~B[3] & S[3];
 	2'b01: Overflow <= ~A[3] & B[3] & S[3] | A[3] & ~B[3] & ~S[3];
 	default: Overflow <= 1'b0;	
	endcase
endmodule
