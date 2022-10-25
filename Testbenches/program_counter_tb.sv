module program_counter_tb ();
  logic         clk;
  logic         rst;
  logic         PCSrcE, StallF;  
  logic [31:0]  PCTargetE;       
  logic [31:0]  PCF;

  program_counter UUT (clk, rst, PCSrcE, StallF, PCTargetE, PCF);

  initial begin    
    clk<= 0;
    forever #10 clk <=~ clk;  
  end

  initial begin
    rst=1;
    PCSrcE=0;
    StallF = 0;

    #10
    rst=0;
    PCSrcE=0;
    StallF = 0;
    PCTargetE = 32'd10;

    #10
    rst=0;
    PCSrcE=1;
    StallF = 0;
    PCTargetE = 32'd20;
    #10
    rst=0;
    PCSrcE=0;
    StallF = 1;
    PCTargetE = 32'd20;

    #10
    rst=0;
    PCSrcE=0;
    StallF = 0;
    PCTargetE = 32'd30;

    #10
    rst=0;
    PCSrcE=1;
    StallF = 0;
    PCTargetE = 32'd10;
          
    $stop;
  end

endmodule