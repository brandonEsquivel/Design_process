module counter_4b ( gnd, vdd, ENABLE, RESET, clk, D, MODO, Q, RCO, LOAD);

input gnd, vdd;
input ENABLE;
input RESET;
input clk;
output RCO;
output LOAD;
input [3:0] D;
input [1:0] MODO;
output [3:0] Q;

	INVX1 INVX1_1 ( .gnd(gnd), .vdd(vdd), .A(RESET), .Y(_2_) );
	NAND2X1 NAND2X1_1 ( .gnd(gnd), .vdd(vdd), .A(ENABLE), .B(_2_), .Y(_3_) );
	INVX1 INVX1_2 ( .gnd(gnd), .vdd(vdd), .A(MODO[0]), .Y(_4_) );
	INVX1 INVX1_3 ( .gnd(gnd), .vdd(vdd), .A(MODO[1]), .Y(_5_) );
	NOR2X1 NOR2X1_1 ( .gnd(gnd), .vdd(vdd), .A(_4_), .B(_5_), .Y(_6_) );
	INVX1 INVX1_4 ( .gnd(gnd), .vdd(vdd), .A(_6_), .Y(_7_) );
	NOR2X1 NOR2X1_2 ( .gnd(gnd), .vdd(vdd), .A(_3_), .B(_7_), .Y(_0_) );
	NAND2X1 NAND2X1_2 ( .gnd(gnd), .vdd(vdd), .A(D[0]), .B(_6_), .Y(_8_) );
	INVX1 INVX1_5 ( .gnd(gnd), .vdd(vdd), .A(_42__0_), .Y(_9_) );
	OAI21X1 OAI21X1_1 ( .gnd(gnd), .vdd(vdd), .A(_4_), .B(_5_), .C(_9_), .Y(_10_) );
	AOI21X1 AOI21X1_1 ( .gnd(gnd), .vdd(vdd), .A(_8_), .B(_10_), .C(_3_), .Y(_1__0_) );
	NOR2X1 NOR2X1_3 ( .gnd(gnd), .vdd(vdd), .A(MODO[1]), .B(_4_), .Y(_11_) );
	NAND2X1 NAND2X1_3 ( .gnd(gnd), .vdd(vdd), .A(_42__0_), .B(_42__1_), .Y(_12_) );
	INVX1 INVX1_6 ( .gnd(gnd), .vdd(vdd), .A(_12_), .Y(_13_) );
	NOR2X1 NOR2X1_4 ( .gnd(gnd), .vdd(vdd), .A(_42__0_), .B(_42__1_), .Y(_14_) );
	NOR2X1 NOR2X1_5 ( .gnd(gnd), .vdd(vdd), .A(_14_), .B(_13_), .Y(_15_) );
	AOI21X1 AOI21X1_2 ( .gnd(gnd), .vdd(vdd), .A(_15_), .B(MODO[0]), .C(_3_), .Y(_16_) );
	OAI21X1 OAI21X1_2 ( .gnd(gnd), .vdd(vdd), .A(_11_), .B(_15_), .C(_16_), .Y(_17_) );
	NAND2X1 NAND2X1_4 ( .gnd(gnd), .vdd(vdd), .A(D[1]), .B(_0_), .Y(_18_) );
	NAND2X1 NAND2X1_5 ( .gnd(gnd), .vdd(vdd), .A(_18_), .B(_17_), .Y(_1__1_) );
	NOR2X1 NOR2X1_6 ( .gnd(gnd), .vdd(vdd), .A(MODO[0]), .B(MODO[1]), .Y(_19_) );
	NAND3X1 NAND3X1_1 ( .gnd(gnd), .vdd(vdd), .A(_42__0_), .B(_42__1_), .C(_42__2_), .Y(_20_) );
	INVX1 INVX1_7 ( .gnd(gnd), .vdd(vdd), .A(_42__1_), .Y(_21_) );
	INVX1 INVX1_8 ( .gnd(gnd), .vdd(vdd), .A(_42__2_), .Y(_22_) );
	OAI21X1 OAI21X1_3 ( .gnd(gnd), .vdd(vdd), .A(_9_), .B(_21_), .C(_22_), .Y(_23_) );
	NAND2X1 NAND2X1_6 ( .gnd(gnd), .vdd(vdd), .A(_20_), .B(_23_), .Y(_24_) );
	OAI21X1 OAI21X1_4 ( .gnd(gnd), .vdd(vdd), .A(MODO[0]), .B(_5_), .C(_24_), .Y(_25_) );
	OAI21X1 OAI21X1_5 ( .gnd(gnd), .vdd(vdd), .A(_19_), .B(_24_), .C(_25_), .Y(_26_) );
	NAND3X1 NAND3X1_2 ( .gnd(gnd), .vdd(vdd), .A(_9_), .B(_21_), .C(_22_), .Y(_27_) );
	OAI21X1 OAI21X1_6 ( .gnd(gnd), .vdd(vdd), .A(_42__0_), .B(_42__1_), .C(_42__2_), .Y(_28_) );
	NAND2X1 NAND2X1_7 ( .gnd(gnd), .vdd(vdd), .A(_28_), .B(_27_), .Y(_29_) );
	AOI22X1 AOI22X1_1 ( .gnd(gnd), .vdd(vdd), .A(D[2]), .B(_6_), .C(_29_), .D(_11_), .Y(_30_) );
	AOI21X1 AOI21X1_3 ( .gnd(gnd), .vdd(vdd), .A(_26_), .B(_30_), .C(_3_), .Y(_1__2_) );
	XNOR2X1 XNOR2X1_1 ( .gnd(gnd), .vdd(vdd), .A(_20_), .B(_42__3_), .Y(_31_) );
	AOI22X1 AOI22X1_2 ( .gnd(gnd), .vdd(vdd), .A(D[3]), .B(_6_), .C(_31_), .D(_19_), .Y(_32_) );
	NAND2X1 NAND2X1_8 ( .gnd(gnd), .vdd(vdd), .A(_42__3_), .B(_27_), .Y(_33_) );
	INVX1 INVX1_9 ( .gnd(gnd), .vdd(vdd), .A(_42__3_), .Y(_34_) );
	NAND3X1 NAND3X1_3 ( .gnd(gnd), .vdd(vdd), .A(_22_), .B(_34_), .C(_14_), .Y(_35_) );
	NAND2X1 NAND2X1_9 ( .gnd(gnd), .vdd(vdd), .A(_35_), .B(_33_), .Y(_36_) );
	NAND3X1 NAND3X1_4 ( .gnd(gnd), .vdd(vdd), .A(_42__3_), .B(_22_), .C(_12_), .Y(_37_) );
	NAND2X1 NAND2X1_10 ( .gnd(gnd), .vdd(vdd), .A(MODO[1]), .B(_4_), .Y(_38_) );
	AOI21X1 AOI21X1_4 ( .gnd(gnd), .vdd(vdd), .A(_23_), .B(_34_), .C(_38_), .Y(_39_) );
	AOI22X1 AOI22X1_3 ( .gnd(gnd), .vdd(vdd), .A(_37_), .B(_39_), .C(_36_), .D(_11_), .Y(_40_) );
	AOI21X1 AOI21X1_5 ( .gnd(gnd), .vdd(vdd), .A(_40_), .B(_32_), .C(_3_), .Y(_1__3_) );
	BUFX2 BUFX2_1 ( .gnd(gnd), .vdd(vdd), .A(_41_), .Y(LOAD) );
	BUFX2 BUFX2_2 ( .gnd(gnd), .vdd(vdd), .A(_42__0_), .Y(Q[0]) );
	BUFX2 BUFX2_3 ( .gnd(gnd), .vdd(vdd), .A(_42__1_), .Y(Q[1]) );
	BUFX2 BUFX2_4 ( .gnd(gnd), .vdd(vdd), .A(_42__2_), .Y(Q[2]) );
	BUFX2 BUFX2_5 ( .gnd(gnd), .vdd(vdd), .A(_42__3_), .Y(Q[3]) );
	BUFX2 BUFX2_6 ( .gnd(gnd), .vdd(vdd), .A(gnd), .Y(RCO) );
	DFFPOSX1 DFFPOSX1_1 ( .gnd(gnd), .vdd(vdd), .CLK(clk), .D(_1__0_), .Q(_42__0_) );
	DFFPOSX1 DFFPOSX1_2 ( .gnd(gnd), .vdd(vdd), .CLK(clk), .D(_1__1_), .Q(_42__1_) );
	DFFPOSX1 DFFPOSX1_3 ( .gnd(gnd), .vdd(vdd), .CLK(clk), .D(_1__2_), .Q(_42__2_) );
	DFFPOSX1 DFFPOSX1_4 ( .gnd(gnd), .vdd(vdd), .CLK(clk), .D(_1__3_), .Q(_42__3_) );
	DFFPOSX1 DFFPOSX1_5 ( .gnd(gnd), .vdd(vdd), .CLK(clk), .D(_0_), .Q(_41_) );
endmodule
