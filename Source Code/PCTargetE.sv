module PCTargetE (
  input  logic [31:0] PCE, ImmExtE,
  output logic [31:0] PCTargetE
);

  assign PCTargetE = PCE + ImmExtE;

endmodule
