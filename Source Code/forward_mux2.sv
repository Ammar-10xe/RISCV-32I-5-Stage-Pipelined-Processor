module forward_mux2 #(parameter WIDTH =32)(
  input  logic [WIDTH-1:0] RD2E, ResultW, ALUResultM,
  input  logic [1:0]       ForwardBE,
  output logic [WIDTH-1:0] WriteDataE
);

 // assign WriteDataE = ForwardBE[1] ? ALUResultM : (ForwardBE[0] ? ResultW : RD2E);


always_comb
begin
case (ForwardBE)
 
 2'b00: WriteDataE = RD2E;
 2'b01: WriteDataE = ResultW;
 2'b10: WriteDataE = ALUResultM;

 default: WriteDataE = RD2E;

endcase

end
endmodule

