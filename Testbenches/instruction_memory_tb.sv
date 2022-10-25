module instruction_memory_tb ();

logic [31:0] PCF,instruction;

  logic         clk;
  logic         rst;
  logic         PCSrcE, StallF;  
  logic [31:0]  PCTargetE;       


program_counter UUT (clk, rst, PCSrcE, StallF, PCTargetE, PCF);
instruction_memory dut (.PCF(PCF),.instruction(instruction));


 initial begin    
    clk<= 0;
    forever #5 clk <=~ clk;  
  end

initial begin
    
    rst<=1;
    PCSrcE<=0;
    StallF = 0;
    PCTargetE = 32'd0; 
    
    #10
    rst=0;
    PCSrcE=0; //Should pick the first Instr from the .mem file
    StallF= 0;
    PCTargetE = 32'd10;
    
    #10
    rst=0;
    PCSrcE=0;
    StallF = 0;
    PCTargetE = 32'd20;
    
    #10
    rst=0;
    PCSrcE=0;
    StallF = 1;// should hold the previous Instr
    PCTargetE = 32'd30;

    #10
    rst=0;
    PCSrcE=1; // PCF should be PCTargetE
    StallF = 0;
    PCTargetE= 32'd40;//As the value is 40 it is pointing towards 11th Instr in .mem file (40/4==10 but we start form 0 )


     #10
    rst=0;
    PCSrcE=1; // PCF should be PCTargetE
    StallF = 0;
    PCTargetE= 32'd92;//2nd last Instr 


    #10
    rst=0;
    PCSrcE=0; // last Instr
    StallF = 0;
    PCTargetE = 32'd50;

    #10
    rst=0;
    PCSrcE=1;    
    StallF= 1; //Should hold the Instr
    PCTargetE = 32'd60;

    #10
    rst=1; // reset the PCF to 0
    PCSrcE=1;    
    StallF = 1; 
    PCTargetE = 32'd70;

    #10        
$stop;

end



endmodule