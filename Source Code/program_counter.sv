module program_counter (
	input  logic clk,
	input  logic rst,
	input  logic PCSrcE,
	input  logic StallF,
	input  logic [31:0] PCTargetE,
	output logic [31:0] PCF
);

	logic [31:0] PCFbar;
	always_comb begin
		if (PCSrcE)  PCFbar = PCTargetE;
    	else PCFbar = PCF + 4;
	end

	always_ff @(posedge clk or posedge rst) begin
	 if      (rst)   PCF <= 32'd0;
	 else if(StallF) PCF <= PCF;
	 else            PCF <= PCFbar;
	end

endmodule

