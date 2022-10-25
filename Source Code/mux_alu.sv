module mux_alu #(parameter WIDTH = 32)(
  input  logic ALUSrcE,
  input  logic [WIDTH-1:0] WriteDataE, ImmExtE,
  output logic [WIDTH-1:0] SrcBE
  );

  assign SrcBE = ALUSrcE ?  ImmExtE:WriteDataE;

endmodule


// To call this module:
//  mux_alu #(32)   mux(RegisterData, ImmValue, ContSelector, OutB);
