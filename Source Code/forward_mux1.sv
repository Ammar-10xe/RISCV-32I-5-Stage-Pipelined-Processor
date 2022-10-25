module forward_mux1 #(parameter WIDTH = 32)(
  input  logic [WIDTH-1:0] RD1E, ResultW, ALUResultM,
  input  logic [1:0]       ForwardAE,
  output logic [WIDTH-1:0] SrcAE
);

//assign SrcAE = ForwardAE[1] ? ALUResultM : (ForwardAE[0] ? ResultW : RD1E);
always_comb
begin
case (ForwardAE)
 
 2'b00: SrcAE = RD1E;
 2'b01: SrcAE = ResultW;
 2'b10: SrcAE = ALUResultM;

 default: SrcAE =RD1E;

endcase

end
endmodule
