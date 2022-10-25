module  forward_mux1_tb();

logic [31:0] RD1E, ResultW, ALUResultM;
logic [1:0]       ForwardAE;
logic [31:0] SrcAE;

forward_mux1 dut( .RD1E(RD1E),.ResultW(ResultW),.ALUResultM(ALUResultM),.ForwardAE(ForwardAE),.SrcAE(SrcAE));

initial
begin

    RD1E =32'd5;
    ResultW= 32'd10;
    ALUResultM= 32'd15;
    ForwardAE =00;
#10

 RD1E =32'd5;
    ResultW= 32'd10;
    ALUResultM= 32'd15;
    ForwardAE =01;
#10
     RD1E =32'd5;
    ResultW= 32'd10;
    ALUResultM= 32'd15;
    ForwardAE =10;

    #10
$stop;
    
end

endmodule