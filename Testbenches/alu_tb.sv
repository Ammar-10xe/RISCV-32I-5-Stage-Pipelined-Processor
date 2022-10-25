module alu_tb ();
logic [31:0] SrcAE,SrcBE,ALUResult;
logic [4:0] ALUControlE;
logic [2:0] funct3E;
logic CarryOut,ZeroE;

alu dut (.SrcAE(SrcAE),.SrcBE(SrcBE),.ALUControlE(ALUControlE),.funct3E(funct3E),.ALUResult(ALUResult),.CarryOut(CarryOut),.ZeroE(ZeroE));

initial begin

    SrcAE=32'd0;
    SrcBE=32'd0;
    ALUControlE=5'b00000; 
    funct3E=3'b000;

  
    #10

    SrcAE=32'd3;
    SrcBE=32'd3;
    ALUControlE=5'b00000; //Add
    funct3E=3'b000; //Zero Flag should be 1 as SrcA==SrcB

    #10

    SrcAE=32'd5;
    SrcBE=32'd10;
    ALUControlE=5'b00001;
    funct3E= 3'b000;//Zero Flag should be 0 as SrcA!=SrcB
    
    #10
    SrcAE=32'd17;
    SrcBE=32'd15;
    ALUControlE=5'b01000; //logical OR
    funct3E=3'b101;

    #10
    
    $stop;

end
endmodule