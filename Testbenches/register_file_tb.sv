module register_file_tb ();

logic [31:0] instrD;
logic [4:0]  Rs1D, Rs2D, RdD;
logic [24:0] Imm;
logic [6:0]  OP;
logic [2:0]  funct3;
logic [6:0]  funct77;      // function 77 contains is 7 bit of function 7
logic        funct7;
logic [31:0] PCF,instruction;
logic         clk;
logic         rst;
logic         PCSrcE, StallF;  
logic [31:0]  PCTargetE,PCE,ImmExtE;       
logic        RegWriteW;
logic [4:0]  A1, A2, RdW;
logic [31:0] ResultW;
logic [31:0] RD1, RD2;
logic        StallD;
logic        FlushD;
logic [31:0] PCPlus4F;
logic [31:0] PCD ,PCPlus4D;







program_counter UUT (.clk(clk), .rst(rst), .PCSrcE(PCSrcE), .StallF(StallF), .PCTargetE(PCTargetE), .PCF(PCF));
instruction_memory aaa (.PCF(PCF),.instruction(instruction));
first_register ddd(.clk(clk),.rst(rst),.StallD(StallD),.FlushD(FlushD),.instruction(instruction),.PCF(PCF),.PCPlus4F(PCPlus4F),.instrD(instrD),.PCD(PCD),.PCPlus4D(PCPlus4D));
instruction_fetch bbb (.instrD(instrD),.A1(A1), .A2(A2), .Rs1D(Rs1D), .Rs2D(Rs2D), .RdD(RdD),.Imm(Imm),.OP(OP),.funct3(funct3),.funct77(funct77),.funct7(funct7));
register_file ccc(.clk(clk),.rst(rst),.RegWriteW(RegWriteW),.A1(A1),.A2(A2),.RdW(RdW),.ResultW(ResultW),.RD1(RD1),.RD2(RD2));
PCPlus4 fff(.PCF(PCF),.PCPlus4F(PCPlus4F));
PCTargetE eee(.PCE(PCE),.ImmExtE(ImmExtE),.PCTargetE(PCTargetE));









 initial begin    
    clk<= 0;
    rst<=1;
    forever #5 clk <=~ clk;  
  end
  initial begin
  #5
  rst<=0;
  #50
  $stop;
end


endmodule
