				 
module control_pantalla (
	input RST, CLK,
	input BT_DER, BT_IZQ, BT_ARR, BT_ABA,
	
	output [3:0] FIL, COL
	
	
	
	);		  				  
	
	reg [3:0] fil_actual, col_actual;
	
	
	
	
	always @(negedge RST or posedge CLK)
		if (~RST) begin 
			fil_actual = 4'b0001;	  
			col_actual = 4'b1110;		
		end					 
		
		else begin	   
			if (BT_DER) begin
				col_actual = {col_actual[0], col_actual[3:1]};
			end		   
			
			else if (BT_IZQ) begin
				col_actual = {col_actual[2:0], col_actual[3]};
			end		   
			
			if (BT_ARR) begin
				fil_actual = {fil_actual[0], fil_actual[3:1]};						   
			end		   
			
			else if (BT_ABA) begin
				fil_actual = {fil_actual[2:0], fil_actual[3]};
			end		   
			
			
		end
	
	assign FIL = fil_actual;	  
	assign COL = col_actual;	  	
	
	
	
	
	
endmodule
