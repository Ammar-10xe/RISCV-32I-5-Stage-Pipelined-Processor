module instruction_fetch (
    input  logic [31:0] instrD,
    output logic [4:0]  A1, A2, Rs1D, Rs2D, RdD,
    output logic [24:0] Imm,
    output logic [6:0]  OP,
    output logic [2:0]  funct3,
    output logic [6:0]  funct77,      // function 77 contains is 7 bit of function 7
    output logic        funct7
);

    // Fetching the instruction
    always_comb begin
        A1      = instrD [19:15];     
        A2      = instrD [24:20];
        Rs1D    = instrD [19:15];
        Rs2D    = instrD [24:20];
        RdD     = instrD [11:7];
        Imm     = instrD [31:7];
        OP      = instrD [6:0];
        funct3  = instrD [14:12];
        funct77 = instrD [31:25];
        funct7  = instrD [30];
    end

endmodule
