module hazard_unit (
    input  logic       RegWriteM, RegWriteW, PCSrcE,
    input  logic [4:0] Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW,
    input  logic [1:0] ResultSrcE,

    output logic [1:0] ForwardAE, ForwardBE,
    output logic       StallF, StallD, FlushE, FlushD
);


  logic lwStall;

  always_comb begin
    if (((Rs1E == RdM) && RegWriteM) && (Rs1E != 0) ) begin
      ForwardAE <= 2'b10;
    end
    else if ( ((Rs1E == RdW) && RegWriteW) && (Rs1E != 0) ) begin
      ForwardAE <= 2'b01;
    end
    else begin
      ForwardAE <= 2'b00;
    end

  end

  always_comb begin
    if (((Rs2E == RdM) && RegWriteM) && (Rs2E != 0) ) begin
      ForwardBE <= 2'b10;
    end
    else if ( ((Rs2E == RdW) && RegWriteW) && (Rs2E != 0) ) begin
      ForwardBE <= 2'b01;
    end
    else begin
      ForwardBE <= 2'b00;
    end

  end

  always_comb begin//Stall when a load hazard occur
    lwStall <= (ResultSrcE[0] & ((Rs1D == RdE) | (Rs2D == RdE)));//Page 450 
    StallD <= lwStall;
    StallF <= lwStall;
    //Flush When a branch is taken or a load initroduces a bubble
    FlushE <= lwStall | PCSrcE;
    FlushD <= PCSrcE;
  end

endmodule
