module instruction_memory (
  input  logic [31:0] PCF,
  output logic [31:0] instruction
);

  reg [7:0] mem [1023:0];

  initial begin
    //Initializing Memory
    $readmemh("instruction.mem", mem);
  end

  //Fetching Instruction
  assign instruction = {mem[PCF+3], mem[PCF+2], mem[PCF+1], mem[PCF]};  //Byte adressable

endmodule
