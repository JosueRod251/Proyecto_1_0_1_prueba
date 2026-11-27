
module temporizador #(parameter n=1000) (RST, CLK, ENA, Z);
	input RST, CLK, ENA;
										  
	output Z;
	
	reg [31:0] q;
	
	assign Z = (q == n);
	
	
	
	always @ (negedge RST or posedge CLK)
		if(~RST)
			q <= 32'b0;
		else if(Z)
			q <= 32'b0;
		else if (ENA)
			q <= q + 1'b1;  
	
endmodule

