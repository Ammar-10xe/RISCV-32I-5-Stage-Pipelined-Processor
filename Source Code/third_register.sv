module third_register (
    input  logic        clk, rst, RegWriteE, MemWriteE,
    input  logic [31:0] WriteDataE, ALUResult, PCPlus4E,
    input  logic [4:0]  RdE,
    input  logic [2:0]  mem_modeE,
    input  logic [1:0]  ResultSrcE,
    output logic [31:0] WriteDataM, ALUResultM, PCPlus4M,
    output logic [4:0]  RdM,
    output logic [2:0]  mem_modeM,
    output logic [1:0]  ResultSrcM,
    output logic        RegWriteM, MemWriteM
);
  always_ff @( posedge clk ) begin
    if (rst) begin
      RegWriteM <= 0;
      MemWriteM <= 0;
      ResultSrcM <= 2'b00;
      ALUResultM <= 32'd0;
      WriteDataM <= 32'd0;
      RdM <= 5'd0;
      PCPlus4M <= 32'd0;
      mem_modeM <= 3'd0;
    end else begin
      RegWriteM <= RegWriteE;
      MemWriteM <= MemWriteE;
      ResultSrcM <= ResultSrcE;
      ALUResultM <= ALUResult;
      WriteDataM <= WriteDataE;
      RdM <= RdE;
      PCPlus4M <= PCPlus4E;
      mem_modeM <= mem_modeE;
    end

  end

endmodule
