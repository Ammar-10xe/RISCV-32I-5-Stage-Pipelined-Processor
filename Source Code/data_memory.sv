module data_memory (
  input  logic        clk, rst, MemWriteM,
  input  logic [2:0]  mem_modeM,
  input  logic [31:0] WriteDataM,
  input  logic [31:0] ALUResultM,

  output logic [31:0] ReadData,
  output logic [31:0] DM0
);

  parameter Byte = 3'b000;
  parameter HalfWord = 3'b001;
  parameter Word = 3'b010;

  logic [7:0] Data_Mem [1023:0];    //Byte addressable of 1kb Data Memory

  initial begin
	//Initializing Data Memory
	$readmemh("data_memory.mem", Data_Mem);
  end

  // Asynchronus Read
  always_comb begin
    case (mem_modeM)
    Byte:     ReadData = $signed(Data_Mem[ALUResultM]);
    HalfWord: ReadData = $signed({Data_Mem[ALUResultM+1], Data_Mem[ALUResultM]});
    Word:     ReadData = ({Data_Mem[ALUResultM+3], Data_Mem[ALUResultM+2], Data_Mem[ALUResultM+1], Data_Mem[ALUResultM]});
    endcase
  end

  // Synchronous Write
  integer i;

  always_ff @( posedge clk or posedge rst) begin
    if (rst) begin
      for(i = 0; i < 1023; i = i + 1)
        Data_Mem[i] <= 32'd0;
      end else if (MemWriteM) begin
      case (mem_modeM)
      Byte: begin
        Data_Mem[ALUResultM]   <= WriteDataM[7:0];
      end
      HalfWord: begin
        Data_Mem[ALUResultM]   <= WriteDataM[7:0];
        Data_Mem[ALUResultM+1] <= WriteDataM[15:8];
      end
      Word: begin
        Data_Mem[ALUResultM]   <= WriteDataM[7:0];
        Data_Mem[ALUResultM+1] <= WriteDataM[15:8];
        Data_Mem[ALUResultM+2] <= WriteDataM[23:16];
        Data_Mem[ALUResultM+3] <= WriteDataM[31:24];
      end
      endcase
      end
  end

  always_comb begin
    DM0 <= Data_Mem[32'h0];
  end

endmodule

