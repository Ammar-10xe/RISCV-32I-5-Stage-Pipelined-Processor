module mux_result #(parameter WIDTH = 32)(
  input  logic [WIDTH-1:0] ALUResultW, ReadDataW, PCPlus4W,
  input  logic [1:0]       ResultSrcW,
  output logic [WIDTH-1:0] ResultW
  );

 // assign ResultW = ResultSrcW[1] ? PCPlus4W : (ResultSrcW[0] ? ReadDataW : ALUResultW);
always_comb begin

  case(ResultSrcW)

  2'b00:  ResultW =ALUResultW;
  2'b01:  ResultW =ReadDataW;
  2'b10:  ResultW =PCPlus4W;

  default: ResultW = ReadDataW;
endcase
end

endmodule





