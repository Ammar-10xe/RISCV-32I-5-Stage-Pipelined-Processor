module  forward_mux2_tb();

logic [31:0] RD2E, ResultW, ALUResultM;
logic [1:0]       ForwardBE;
logic [31:0] WriteDataE;

forward_mux2 dut( .RD2E(RD2E),.ResultW(ResultW),.ALUResultM(ALUResultM),.ForwardBE(ForwardBE),. WriteDataE( WriteDataE));

initial
begin

    RD2E =32'd5;
    ResultW= 32'd10;
    ALUResultM= 32'd15;
    ForwardBE =00;
#10

 RD2E =32'd5;
    ResultW= 32'd10;
    ALUResultM= 32'd15;
    ForwardBE =01;
#10
     RD2E =32'd5;
    ResultW= 32'd10;
    ALUResultM= 32'd15;
    ForwardBE =10;

    #10
$stop;
    
end

endmodule