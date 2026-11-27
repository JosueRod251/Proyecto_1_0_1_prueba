
module control_botones (
	input RST, CLK,
	input [3:0] BT,
	output reg [3:0] S_BT
	
	);
	
	
	reg [4:0] estado;
	
	reg en_temp;
	wire z;	   
	
	
	temporizador #(1000) U1 (RST, CLK, en_temp, z);
	
	
	always @(*)
		case(estado)
			5'd00: begin S_BT = 4'b0000; en_temp = 0; end
									   
			5'd01: begin S_BT = 4'b0000; en_temp = 1; end
			5'd02: begin S_BT = 4'b0001; en_temp = 0; end
			5'd03: begin S_BT = 4'b0000; en_temp = 0; end
			5'd04: begin S_BT = 4'b0000; en_temp = 1; end 
									   
			5'd05: begin S_BT = 4'b0000; en_temp = 1; end
			5'd06: begin S_BT = 4'b0010; en_temp = 0; end
			5'd07: begin S_BT = 4'b0000; en_temp = 0; end
			5'd08: begin S_BT = 4'b0000; en_temp = 1; end
									   
			5'd09: begin S_BT = 4'b0000; en_temp = 1; end
			5'd10: begin S_BT = 4'b0100; en_temp = 0; end
			5'd11: begin S_BT = 4'b0000; en_temp = 0; end
			5'd12: begin S_BT = 4'b0000; en_temp = 1; end
									   
			5'd13: begin S_BT = 4'b0000; en_temp = 1; end
			5'd14: begin S_BT = 4'b1000; en_temp = 0; end
			5'd15: begin S_BT = 4'b0000; en_temp = 0; end
			5'd16: begin S_BT = 4'b0000; en_temp = 1; end
				
			default: begin S_BT = 4'b0000; en_temp = 0; end
		endcase	 
		
	always @(negedge RST or posedge CLK)
		if (~RST)
			estado = 0;
		else 
			case(estado)				 
				5'd00:
					if (BT[0]) estado = 5'd01;
					else if (BT[1]) estado = 5'd05;
					else if (BT[2]) estado = 5'd09;
					else if (BT[3]) estado = 5'd13;
					else estado = 5'd00;
					   
				//----------------- DER ----------------------
				5'd01:
					if (z) 	estado = 5'd02;
					else 	estado = 5'd01;

				5'd02:
					estado = 5'd03;
				
				5'd03:
					if (BT[0]) estado = 5'd03;
					else estado = 5'd04;
						
				5'd04: 
					if (z) 	estado = 5'd00;
					else 	estado = 5'd04;
						
									   
				//----------------- IZQ ----------------------
				5'd05:
					if (z) 	estado = 5'd06;
					else 	estado = 5'd05;

				5'd06:
					estado = 5'd07;
				
				5'd07:
					if (BT[1]) estado = 5'd07;
					else estado = 5'd08;
						
				5'd08: 
					if (z) 	estado = 5'd00;
					else 	estado = 5'd08;

						
									   
				//----------------- ARR ----------------------
				5'd09:
					if (z) 	estado = 5'd10;
					else 	estado = 5'd09;

				5'd10:
					estado = 5'd11;
				
				5'd11:
					if (BT[2]) estado = 5'd11;
					else estado = 5'd12;
						
				5'd12: 
					if (z) 	estado = 5'd00;
					else 	estado = 5'd12;

				
									   
				//----------------- ABA ----------------------
				5'd13:
					if (z) 	estado = 5'd14;
					else 	estado = 5'd13;

				5'd14:
					estado = 5'd15;
				
				5'd15:
					if (BT[3]) estado = 5'd15;
					else estado = 5'd16;
						
				5'd16: 
					if (z) 	estado = 5'd00;
					else 	estado = 5'd16;

			endcase
			
		
	
endmodule
