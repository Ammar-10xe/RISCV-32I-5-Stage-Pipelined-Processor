module alu(
  input  logic [31:0] SrcAE,SrcBE,
  input  logic [4:0] ALUControlE,
  input  logic [2:0] funct3E,
  output logic [31:0] ALUResult,
  output logic CarryOut,
  output logic  ZeroE
);
  logic [31:0] ALU_Result;
  logic [32:0] tmp;
  assign ALUResult = ALU_Result;
  assign tmp = {1'b0,SrcAE} + {1'b0,SrcBE};
  assign CarryOut = tmp[32];

	always_comb begin
    case(funct3E)
    3'b000:  ZeroE <= SrcAE == SrcBE; //beq
    3'b001:  ZeroE <=  SrcAE != SrcBE; //bne
    3'b100:  ZeroE <=  SrcAE < SrcBE; //blt
    3'b101:  ZeroE <=  SrcAE > SrcBE; //bge
    3'b110:  ZeroE <=  SrcAE < SrcBE; //bltu
    3'b111:  ZeroE <=  SrcAE >= SrcBE; //bgeu
    default: ZeroE <= 0;
    endcase
	end

  always_comb begin
    case(ALUControlE)
    5'b00000: ALU_Result = SrcAE + SrcBE ;           //Addition

    5'b00001: ALU_Result = SrcAE - SrcBE ;           //Subtraction

    5'b00010: ALU_Result = SrcAE<<SrcBE;             //Shift Left Logical

    5'b00011: ALU_Result = ($signed(SrcAE) < $signed(SrcBE)) ? 1 : 0;  //Set Less than

    5'b00100: ALU_Result = (SrcAE < SrcBE) ? 1 : 0;  //Set Less than unsigned

    5'b00101: ALU_Result = SrcAE ^ SrcBE;            //LOgical xor

    5'b00110: ALU_Result = SrcAE>>SrcBE;             //Shift Right Logical

    5'b00111: ALU_Result = SrcAE >>> SrcBE;          //Shift Right Arithmetic

    5'b01000: ALU_Result = SrcAE | SrcBE;            //Logical Or

    5'b01001: ALU_Result = SrcAE & SrcBE;            //Logical and

    default:  ALU_Result = SrcAE + SrcBE;
    endcase

  end

endmodule
