module fourth_register (
  input  logic        rst, clk, RegWriteM,
  input  logic [31:0] ALUResultM, ReadData, PCPlus4M,
  input  logic [4:0]  RdM,
  input  logic [1:0]  ResultSrcM,
  output logic [31:0] ALUResultW,ReadDataW,PCPlus4W,
  output logic [4:0]  RdW,
  output logic [1:0]  ResultSrcW,
  output logic        RegWriteW
);

  always_ff @( posedge clk ) begin
    if(rst) begin
      ALUResultW <= 32'd0;
      ReadDataW <= 32'd0;
      PCPlus4W <= 32'd0;
      RdW <= 5'd0;
      ResultSrcW <= 2'd0;
      RegWriteW <= 0;
    end else begin
      ALUResultW <= ALUResultM;
      ReadDataW <= ReadData;
      PCPlus4W <= PCPlus4M;
      RdW <= RdM;
      ResultSrcW <= ResultSrcM;
      RegWriteW <= RegWriteM;
    end

  end

endmodule
