module first_register (
	input  logic        clk,
	input  logic        rst,
	input  logic        StallD,
	input  logic        FlushD,
	input  logic [31:0] instruction, PCF, PCPlus4F,
	output logic [31:0] instrD, PCD ,PCPlus4D
);


	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			instrD <= 32'd0;
			PCD <= 32'd0;
			PCPlus4D <= 32'd0;
		end

		else if (StallD) begin
			instrD <= instrD;
			PCD <= PCD;
			PCPlus4D <= PCPlus4D;
		end

		else if (FlushD) begin
			instrD <= 32'd0;
			PCD <= 32'd0;
			PCPlus4D <= 32'd0;
		end

		else begin
			instrD <= instruction;
			PCD <= PCF;
			PCPlus4D <= PCPlus4F;
		end
	end

endmodule
