module register_file_tb ();

logic        clk, rst, RegWriteW;
logic [4:0]  A1, A2, RdW;
logic [31:0] ResultW;
logic [31:0] RD1, RD2;


register_file ccc(.clk(clk),.rst(rst),.RegWriteW(RegWriteW),.A1(A1),.A2(A2),.RdW(RdW),.ResultW(ResultW),.RD1(RD1),.RD2(RD2));


initial begin
    clk = 0;
    forever #1 clk = ~clk;  
end
initial begin
rst=1;A1=5'd2;A2=5'd3;
#4
ResultW=32'd13;
RdW=5'd2;
RegWriteW=1;//store ResultW at 5bit address of Rdw 
rst=0;
#4
ResultW=32'd10;RdW=5'd3;RegWriteW=1;rst=0;
#4
A1=5'd2;A2=5'd3;RegWriteW=0;rst=0;
#4

$stop;
end
endmodule
