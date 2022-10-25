module mux_result_tb();

logic [31:0] ALUResultW, ReadDataW, PCPlus4W;
logic [1:0]       ResultSrcW;
logic [31:0] ResultW;

mux_result dut (.ALUResultW(ALUResultW),.ReadDataW(ReadDataW),.PCPlus4W(PCPlus4W),.ResultSrcW(ResultSrcW),.ResultW(ResultW));

initial
begin

    ALUResultW =32'd5;
    ReadDataW= 32'd10;
    PCPlus4W= 32'd15;
    ResultSrcW =00;
#10

 ALUResultW =32'd5;
    ReadDataW= 32'd10;
    PCPlus4W= 32'd15;
    ResultSrcW =01;
#10
     ALUResultW =32'd5;
    ReadDataW= 32'd10;
    PCPlus4W= 32'd15;
    ResultSrcW =10;

    #10
$stop;
    
end

endmodule