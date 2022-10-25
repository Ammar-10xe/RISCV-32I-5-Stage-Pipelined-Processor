module Main_tb ();


logic        clk,rst,funct7,PCSrcE, StallF,RegWriteW,StallD,FlushD,RegWriteD,MemWriteD,JumpD, BranchD ,ALUSrcD ,ZeroE, FlushE,RegWriteE, MemWriteE, JumpE, BranchE, ALUSrcE,CarryOut,RegWriteM, MemWriteM;

logic [1:0]  ResultSrcD,ResultSrcE,ForwardAE,ForwardBE,ResultSrcM,ResultSrcW;

logic [2:0]  funct3,ImmSrcD,mem_mode,funct3E, mem_modeE,mem_modeM;

logic [4:0]  Rs1D, Rs2D, RdD,A1, A2, RdW,ALUControlD,ALUControlE,RdE, Rs1E, Rs2E,RdM;

logic [6:0]  OP,funct77;

logic [24:0] Imm;

logic [31:0] instrD,PCF,instruction,PCTargetE,PCE,ImmExtE,ResultW,RD1, RD2,PCPlus4F,ImmExtD,PCD ,PCPlus4D,PCPlus4E, RD1E, RD2E,ALUResultM,SrcAE,SrcBE,WriteDataE,ALUResult,WriteDataM,PCPlus4M,ReadData,DM0,ALUResultW,ReadDataW,PCPlus4W;






program_counter UUT (.clk(clk), .rst(rst), .PCSrcE(PCSrcE), .StallF(StallF), .PCTargetE(PCTargetE), .PCF(PCF));
instruction_memory aaa (.PCF(PCF),.instruction(instruction));
first_register ddd(.clk(clk),.rst(rst),.StallD(StallD),.FlushD(FlushD),.instruction(instruction),.PCF(PCF),.PCPlus4F(PCPlus4F),.instrD(instrD),.PCD(PCD),.PCPlus4D(PCPlus4D));
instruction_fetch bbb (.instrD(instrD),.A1(A1), .A2(A2), .Rs1D(Rs1D), .Rs2D(Rs2D), .RdD(RdD),.Imm(Imm),.OP(OP),.funct3(funct3),.funct77(funct77),.funct7(funct7));
register_file ccc(.clk(clk),.rst(rst),.RegWriteW(RegWriteW),.A1(A1),.A2(A2),.RdW(RdW),.ResultW(ResultW),.RD1(RD1),.RD2(RD2));
PCPlus4 fff(.PCF(PCF),.PCPlus4F(PCPlus4F));
PCTargetE eee(.PCE(PCE),.ImmExtE(ImmExtE),.PCTargetE(PCTargetE));
extend GGG (.Imm(Imm),.ImmSrcD(ImmSrcD),.ImmExtD(ImmExtD));
second_register HHH (.rst(rst), .clk(clk),.RegWriteD(RegWriteD),.MemWriteD(MemWriteD),.JumpD(JumpD),.BranchD(BranchD),.ALUSrcD(ALUSrcD),.ZeroE(ZeroE),.FlushE(FlushE),.RdD(RdD),.Rs1D(Rs1D),.Rs2D(Rs2D),.funct3(funct3),.mem_mode(mem_mode),.ResultSrcD(ResultSrcD),.ALUControlD(ALUControlD),.PCD(PCD),.ImmExtD(ImmExtD),.PCPlus4D(PCPlus4D),.RD1(RD1),.RD2(RD2),.PCE(PCE),.ImmExtE(ImmExtE),.PCPlus4E(PCPlus4E),.RD1E(RD1E),.RD2E(RD2E),.ALUControlE(ALUControlE),.ResultSrcE(ResultSrcE),.funct3E(funct3E),.mem_modeE(mem_modeE),.RdE(RdE),.Rs1E(Rs1E),.Rs2E(Rs2E),.RegWriteE(RegWriteE),.MemWriteE(MemWriteE),.JumpE(JumpE),.BranchE(BranchE),.ALUSrcE(ALUSrcE),.PCSrcE(PCSrcE) );
forward_mux1  RRR (.RD1E(RD1E), .ResultW(ResultW), .ALUResultM(ALUResultM),.ForwardAE(ForwardAE),.SrcAE(SrcAE));
forward_mux2  SSS (.RD2E(RD2E), .ResultW(ResultW), .ALUResultM(ALUResultM),.ForwardBE(ForwardBE),.WriteDataE(WriteDataE));
mux_alu  JJJ (.ALUSrcE(ALUSrcE),.WriteDataE(WriteDataE), .ImmExtE(ImmExtE),.SrcBE(SrcBE));
alu KKK (.SrcAE(SrcAE),.SrcBE(SrcBE),.ALUControlE(ALUControlE),.funct3E(funct3E),.ALUResult(ALUResult),.CarryOut(CarryOut),.ZeroE(ZeroE));
third_register LLL (.clk(clk),.rst(rst),.RegWriteE(RegWriteE),.MemWriteE(MemWriteE),.WriteDataE(WriteDataE),.ALUResult(ALUResult),.PCPlus4E(PCPlus4E),.RdE(RdE),.mem_modeE(mem_modeE),.ResultSrcE(ResultSrcE),.WriteDataM(WriteDataM),.ALUResultM(ALUResultM),.PCPlus4M(PCPlus4M),.RdM(RdM),.mem_modeM(mem_modeM),.ResultSrcM(ResultSrcM),.RegWriteM(RegWriteM),.MemWriteM(MemWriteM));
data_memory MMM (.clk(clk),.rst(rst),.MemWriteM(MemWriteM),.mem_modeM(mem_modeM),.WriteDataM(WriteDataM),.ALUResultM(ALUResultM),.ReadData(ReadData),.DM0(DM0));
fourth_register NNN (.rst(rst),.clk(clk),.RegWriteM(RegWriteM),.ALUResultM(ALUResultM),.ReadData(ReadData),.PCPlus4M(PCPlus4M),.RdM(RdM),.ResultSrcM(ResultSrcM),.ALUResultW(ALUResultW),.ReadDataW(ReadDataW),.PCPlus4W(PCPlus4W),.RdW(RdW),.ResultSrcW(ResultSrcW),.RegWriteW(RegWriteW));
mux_result OOO (.ALUResultW(ALUResultW), .ReadDataW(ReadDataW), .PCPlus4W(PCPlus4W),.ResultSrcW(ResultSrcW),.ResultW(ResultW));
hazard_unit QQQ (.RegWriteM(RegWriteM),.RegWriteW(RegWriteW),.PCSrcE(PCSrcE),.Rs1D(Rs1D),.Rs2D(Rs2D),.Rs1E(Rs1E),.Rs2E(Rs2E),.RdE(RdE),.RdM(RdM),.RdW(RdW),.ResultSrcE(ResultSrcE),.ForwardAE(ForwardAE),.ForwardBE(ForwardBE),.StallF(StallF),.StallD(StallD),.FlushE(FlushE),.FlushD(FlushD));


controller PPP (.funct7(funct7),.OP(OP),.funct77(funct77),.funct3(funct3),.ResultSrcD(ResultSrcD),.ALUControlD(ALUControlD),.ImmSrcD(ImmSrcD),.mem_mode(mem_mode),.RegWriteD(RegWriteD),.MemWriteD(MemWriteD),.JumpD(JumpD),.BranchD(BranchD),.ALUSrcD(ALUSrcD));






 initial begin    
    clk<= 0;
    rst<=1;
    forever #5 clk <=~ clk;  
  end
  initial begin
  #5
  rst<=0;



  #100

  $stop;
end


endmodule
