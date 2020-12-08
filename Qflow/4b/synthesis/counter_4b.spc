*SPICE netlist created from BLIF module counter_4b by blif2BSpice
.include /usr/share/qflow/tech/osu050/osu050_stdcells.sp
.subckt counter_4b vdd gnd ENABLE RESET clk D<0> D<1> D<2> D<3> MODO<0> MODO<1> Q<0> Q<1> Q<2> Q<3> RCO LOAD 
XINVX1_1 RESET _2_ vdd gnd INVX1
XNAND2X1_1 vdd _3_ gnd ENABLE _2_ NAND2X1
XINVX1_2 MODO<0> _4_ vdd gnd INVX1
XINVX1_3 MODO<1> _5_ vdd gnd INVX1
XNOR2X1_1 vdd _5_ gnd _6_ _4_ NOR2X1
XINVX1_4 _6_ _7_ vdd gnd INVX1
XNOR2X1_2 vdd _7_ gnd _0_ _3_ NOR2X1
XNAND2X1_2 vdd _8_ gnd D<0> _6_ NAND2X1
XINVX1_5 _42_<0> _9_ vdd gnd INVX1
XOAI21X1_1 gnd vdd _4_ _5_ _10_ _9_ OAI21X1
XAOI21X1_1 gnd vdd _8_ _10_ _1_<0> _3_ AOI21X1
XNOR2X1_3 vdd _4_ gnd _11_ MODO<1> NOR2X1
XNAND2X1_3 vdd _12_ gnd _42_<0> _42_<1> NAND2X1
XINVX1_6 _12_ _13_ vdd gnd INVX1
XNOR2X1_4 vdd _42_<1> gnd _14_ _42_<0> NOR2X1
XNOR2X1_5 vdd _13_ gnd _15_ _14_ NOR2X1
XAOI21X1_2 gnd vdd _15_ MODO<0> _16_ _3_ AOI21X1
XOAI21X1_2 gnd vdd _11_ _15_ _17_ _16_ OAI21X1
XNAND2X1_4 vdd _18_ gnd D<1> _0_ NAND2X1
XNAND2X1_5 vdd _1_<1> gnd _18_ _17_ NAND2X1
XNOR2X1_6 vdd MODO<1> gnd _19_ MODO<0> NOR2X1
XNAND3X1_1 _42_<1> vdd gnd _42_<0> _42_<2> _20_ NAND3X1
XINVX1_7 _42_<1> _21_ vdd gnd INVX1
XINVX1_8 _42_<2> _22_ vdd gnd INVX1
XOAI21X1_3 gnd vdd _9_ _21_ _23_ _22_ OAI21X1
XNAND2X1_6 vdd _24_ gnd _20_ _23_ NAND2X1
XOAI21X1_4 gnd vdd MODO<0> _5_ _25_ _24_ OAI21X1
XOAI21X1_5 gnd vdd _19_ _24_ _26_ _25_ OAI21X1
XNAND3X1_2 _21_ vdd gnd _9_ _22_ _27_ NAND3X1
XOAI21X1_6 gnd vdd _42_<0> _42_<1> _28_ _42_<2> OAI21X1
XNAND2X1_7 vdd _29_ gnd _28_ _27_ NAND2X1
XAOI22X1_1 gnd vdd _29_ _11_ _30_ D<2> _6_ AOI22X1
XAOI21X1_3 gnd vdd _26_ _30_ _1_<2> _3_ AOI21X1
XXNOR2X1_1 _20_ _42_<3> gnd vdd _31_ XNOR2X1
XAOI22X1_2 gnd vdd _31_ _19_ _32_ D<3> _6_ AOI22X1
XNAND2X1_8 vdd _33_ gnd _42_<3> _27_ NAND2X1
XINVX1_9 _42_<3> _34_ vdd gnd INVX1
XNAND3X1_3 _34_ vdd gnd _22_ _14_ _35_ NAND3X1
XNAND2X1_9 vdd _36_ gnd _35_ _33_ NAND2X1
XNAND3X1_4 _22_ vdd gnd _42_<3> _12_ _37_ NAND3X1
XNAND2X1_10 vdd _38_ gnd MODO<1> _4_ NAND2X1
XAOI21X1_4 gnd vdd _23_ _34_ _39_ _38_ AOI21X1
XAOI22X1_3 gnd vdd _36_ _11_ _40_ _37_ _39_ AOI22X1
XAOI21X1_5 gnd vdd _40_ _32_ _1_<3> _3_ AOI21X1
XBUFX2_1 vdd gnd _41_ LOAD BUFX2
XBUFX2_2 vdd gnd _42_<0> Q<0> BUFX2
XBUFX2_3 vdd gnd _42_<1> Q<1> BUFX2
XBUFX2_4 vdd gnd _42_<2> Q<2> BUFX2
XBUFX2_5 vdd gnd _42_<3> Q<3> BUFX2
XBUFX2_6 vdd gnd gnd RCO BUFX2
XDFFPOSX1_1 vdd _1_<0> gnd _42_<0> clk DFFPOSX1
XDFFPOSX1_2 vdd _1_<1> gnd _42_<1> clk DFFPOSX1
XDFFPOSX1_3 vdd _1_<2> gnd _42_<2> clk DFFPOSX1
XDFFPOSX1_4 vdd _1_<3> gnd _42_<3> clk DFFPOSX1
XDFFPOSX1_5 vdd _0_ gnd _41_ clk DFFPOSX1
.ends counter_4b
 