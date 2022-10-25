module controller (
  input  logic       funct7,
  input  logic [6:0] OP,funct77,
  input  logic [2:0] funct3,
  output logic [1:0] ResultSrcD,
  output logic [4:0] ALUControlD,
  output logic [2:0] ImmSrcD, mem_mode,
  output logic       RegWriteD, MemWriteD, JumpD, BranchD, ALUSrcD
);

  parameter Byte = 2'b00;
  parameter HalfWord = 2'b01;
  parameter Word = 2'b10;

  logic [16:0] checker1;
  assign checker1={{OP},{funct3},{funct77}};
  
  always_comb begin
    casex (OP)
      7'b0000011: begin  //lw
      BranchD <= 0;
      ResultSrcD <= 2'b01;
      MemWriteD <= 0;
      ALUSrcD <= 1;
      RegWriteD <= 1;
      ImmSrcD <= 3'b000;
      JumpD <= 0;
      case (funct3)
        000: mem_mode <=  Byte;      //Load Byte
        001: mem_mode <=  HalfWord;  // Load HalfWord
        010: mem_mode <=  Word;      //Load Word
      endcase
      end

      7'b0100011:begin  //sw
      BranchD <= 0;
      ResultSrcD <= 2'bxx;
      MemWriteD <= 1;
      ALUSrcD <= 1;
      RegWriteD <= 0;
      ImmSrcD <= 3'b001;
      JumpD <= 0;
      case (funct3)
        000: mem_mode <=  Byte;       //Store Byte
        001: mem_mode <=  HalfWord;   //Store HalfWord
        010: mem_mode <=  Word;       //Store Word
      endcase
      end

      7'b0110011:begin  //R-type
      BranchD <= 0;
      ResultSrcD <= 2'b00;
      MemWriteD <= 0;
      ALUSrcD <= 0;
      RegWriteD <= 1;
      ImmSrcD <= 3'bxxx;
      JumpD <= 0;
      end

      7'b1100011:begin  //branch
      BranchD <= 1;
      ResultSrcD <= 2'bxx;
      MemWriteD <= 0;
      ALUSrcD <= 0;
      RegWriteD <= 0;
      ImmSrcD <= 3'b010;
      JumpD <= 0;
      end

      7'b0010011:begin  //I-Type
      BranchD <= 0;
      ResultSrcD <= 2'b00;
      MemWriteD <= 0;
      ALUSrcD <= 1;
      RegWriteD <= 1;
      ImmSrcD <= 3'b000;
      JumpD <= 0;
      end

      7'b1101111:begin //J-Type
      BranchD <= 0;
      ResultSrcD <= 2'b10;
      MemWriteD <= 0;
      ALUSrcD <= 1'bx;
      RegWriteD <= 1;
      ImmSrcD <= 3'b011;
      JumpD <= 1;
      end

      default:begin
      BranchD <= 0;
      ResultSrcD <= 2'b00;
      MemWriteD <= 0;
      ALUSrcD <= 1'bx;
      RegWriteD <= 0;
      ImmSrcD <= 3'b000;
      JumpD <= 0;
      end

    endcase

  end

  // always_comb begin
  //     PCSrc <= Zero && Branch;
  // end

  always_comb begin
    casex (checker1)
      // R Type instructions
      17'b01100110000000000: ALUControlD <= 5'b00000;   //add (0)
      17'b01100110000100000: ALUControlD <= 5'b00001;   //subtract (1)
      17'b01100110010000000: ALUControlD <= 5'b00010;   //Shift Left Logical (2)
      17'b01100110100000000: ALUControlD <= 5'b00011;   //Set Less than (3)
      17'b01100110110000000: ALUControlD <= 5'b00100;   //Set Less unsigned (4)
      17'b01100111000000000: ALUControlD <= 5'b00101;   //xor (5)
      17'b01100111010000000: ALUControlD <= 5'b00110;   //Shift Right Logical (6)
      17'b01100111010100000: ALUControlD <= 5'b00111;   //Shift Right Arithmetic (7)
      17'b01100111100000000: ALUControlD <= 5'b01000;   //or (8)
      17'b01100111110000000: ALUControlD <= 5'b01001;   //and (9)

    // I Type Instructions
      17'b0000011000xxxxxxx: ALUControlD <= 5'b00000;   //load byte
      17'b0000011001xxxxxxx: ALUControlD <= 5'b00000;   //load half
      17'b0000011010xxxxxxx: ALUControlD <= 5'b00000;   //load word
      17'b0010011000xxxxxxx: ALUControlD <= 5'b00000;   //addi
      17'b00100110010000000: ALUControlD <= 5'b00010;   //shift left logical immediate
      17'b0010011010xxxxxxx: ALUControlD <= 5'b00100;   //set less than immediate
      17'b00100111010000000: ALUControlD <= 5'b00100;   //shift right logical immediate
      17'b0010011110xxxxxxx: ALUControlD <= 5'b01000;   //or immediate
      17'b0010011111xxxxxxx: ALUControlD <= 5'b01001;   //and immediate

    // S Type Instructions
      17'b0100011000xxxxxxx: ALUControlD <= 5'b00000;  //store byte
      17'b0100011001xxxxxxx: ALUControlD <= 5'b00000;  //store half
      17'b0100011010xxxxxxx: ALUControlD <= 5'b00000 ; //store word

    // B Type Instructions
      17'b1100011000xxxxxxx: ALUControlD <= 5'b00001;   //branch if =
      17'b1100011001xxxxxxx: ALUControlD <= 5'b00001;   //branch if not equal
      17'b1100011100xxxxxxx: ALUControlD <= 5'b00011;   //branch if <

      default: ALUControlD <= 5'b00000;
    endcase

  end

endmodule
