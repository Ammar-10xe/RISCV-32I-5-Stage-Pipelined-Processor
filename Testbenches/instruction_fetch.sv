module instruction_fetch_tb ();
    logic [31:0] instrD;
    logic [4:0]  A1, A2, Rs1D, Rs2D, RdD;
    logic [24:0] Imm;
    logic [6:0]  OP;
    logic [2:0]  funct3;
    logic [6:0]  funct77;      // function 77 contains is 7 bit of function 7
    logic        funct;

   
    instruction_fetch dut (instrD,A1, A2, Rs1D, Rs2D, RdD,Imm,OP,funct3,funct77,funct7);
    initial begin
        #10
        instrD =32'h930fc001;

        #10
    $stop;
    end
endmodule