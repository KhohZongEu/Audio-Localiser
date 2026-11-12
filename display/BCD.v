module BCD (
    input [3:0] data,
    output [6:0] X
);

	wire segA, segB, segC, segD, segE, segF, segG;
	
	assign segA = (~data[3] & ~data[2] & ~data[1] & data[0]) | (data[2] & ~data[1] & ~data[0]);
	assign X[0] = segA;
	
	assign segB = (data[2] & ~data[1] & data[0]) | (data[2] & data[1] & ~data[0]);
	assign X[1] = segB;
	
	assign segC = ~data[3] & ~data[2] & data[1] & ~data[0];
	assign X[2] = segC;
	
	assign segD = (~data[3] & ~data[2] & ~data[1] & data[0]) | (data[2] & data[1] & data[0]) | (data[2] & ~data[1] & ~data[0]);
	assign X[3] = segD;
	
	assign segE = (data[2] & ~data[1]) | (data[0]);
	assign X[4] = segE;
	
	assign segF = (data[1] & data[0]) | (~data[3] & ~data[2] & data[1]) | (~data[3] & ~data[2] & data[0]);
	assign X[5] = segF;
	
	assign segG = (~data[3] & ~data[2] & ~data[1]) | (data[2] & data[1] & data[0]);
	assign X[6] = segG;

endmodule
