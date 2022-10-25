module data_memory_tb();
  logic        clk, rst, MemWriteM;
  logic [2:0]  mem_modeM;
  logic [31:0] WriteDataM;
  logic [31:0] ALUResultM;

   logic [31:0] ReadData;
   logic [31:0] DM0;
   

   data_memory dut (.clk(clk),.rst( rst),.MemWriteM(MemWriteM),.mem_modeM(mem_modeM),.WriteDataM(WriteDataM),.ALUResultM(ALUResultM),.ReadData(ReadData),.DM0(DM0));


   initial begin
    clk<=0;
    rst<=1;
    forever #5 clk<=~clk;
   end

initial begin
    //Storing
    #10
    rst<=0;
    MemWriteM<=1;
    mem_modeM<=3'b000;//Store Byte
    ALUResultM<=32'd1;
    WriteDataM<=32'h299b842f;

    #50
     rst<=0;
    MemWriteM<=1;
    mem_modeM<=3'b001;//Store Halfword
    ALUResultM<=32'd2;
    WriteDataM<=32'h3730c8cf;


    #50
     rst<=0;
    MemWriteM<=1;
    mem_modeM<=3'b010;//Store Word
    ALUResultM<=32'd3;
    WriteDataM<=32'h9926e3dc;

    //Loading
    #50
    rst<=0;
    MemWriteM<=0;
    mem_modeM<=3'b000;//Load Byte
    ALUResultM<=32'd1;//ReadData should be a byte of 32'h299b842f
    
    #50
    rst<=0;
    MemWriteM<=0;
    mem_modeM<=3'b001;//Load Halfword
    ALUResultM<=32'd2;
   
    #50
    rst<=0;
    MemWriteM<=0;
    mem_modeM<=3'b010;//Load word
    ALUResultM<=32'd3;
    #50

    $stop;


end
endmodule