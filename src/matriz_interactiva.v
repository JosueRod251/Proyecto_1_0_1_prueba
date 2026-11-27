
module matriz_interactiva (
	input RST, CLK,
	input BT_DER, BT_IZQ, BT_ARR, BT_ABA,
	
	output [3:0] FIL, COL
	
	);
	
	wire bt_der, bt_izq, bt_arr, bt_aba;
	
	
	control_botones 	U01	(
	.RST	(RST), .CLK	(CLK),
	.BT		({BT_ABA, BT_ARR, BT_IZQ, BT_DER}),
	.S_BT	({bt_aba, bt_arr, bt_izq, bt_der})
	
	);
	
	
	control_pantalla 	U02 (
	.RST(RST), .CLK(CLK),
	.BT_DER(bt_der), .BT_IZQ(bt_izq), .BT_ARR(bt_arr), .BT_ABA(bt_aba),
	.FIL(FIL), .COL(COL)
	);
	
endmodule