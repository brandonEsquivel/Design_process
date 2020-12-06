/*	Brandon Esquive Molina
	brandon.esquivel@ucr.ac.cr
  32-bits Counter module with 4-modes operation
*/

/*DEFINES */
`ifndef COUNTER
`define COUNTER

/*TIMESCALE*/
`timescale 1 ns / 1 ps

/*INCLUDES*/
`include "./src/counter_4b.v"


module contador(
  // inputs
  input wire ENABLE, RESET, clk,
  input wire [31:0]  D,
  input wire [1:0]  MODO,
  //outputs
  output reg [31:0]    Q,
  output reg  RCO,
  output reg [7:0] LOAD

);
/* LOCAL PARAMS */
localparam COUNT_UP = 2'b00;
localparam COUNT_DOWN = 2'b01;
localparam COUNT_3_DOWN = 2'b10;
localparam CHARGE = 2'b11;
localparam SIZE = 8;

/* REGS AND WIRES */
reg [1:0] MODO_reg [7:0];
reg [7:0] nRCO;
reg [31:0] D_reg;
wire [31:0] wQ;
wire [7:0] wLOAD;
wire [7:0] WnRCO;



//////////// RESET stage, init of arrays and regs ///////////////
integer x, y;
   always @(posedge clk) begin
      if (RESET) begin
        nRCO <= 8'b00000000;
        D_reg <= D;
        for (x = 0; x < SIZE; x = x + 1) begin
          for (y = 0; y < SIZE; y = y + 1) begin
            MODO_reg[x][y] <= CHARGE;
          end
        end
        MODO_reg[0] = MODO;
      end
   end



////// Assign - combinational & sequential logic to interconnect the 32b counter //////

always@( negedge clk )begin

  D_reg = wQ;

  if(nRCO[0]) begin
    MODO_reg[1] = MODO;
  end else begin
    MODO_reg[1] = CHARGE;
  end

  if(nRCO[1]) begin
    MODO_reg[2] = MODO;
  end else begin
    MODO_reg[2] = CHARGE;
  end

 if(nRCO[2]) begin
    MODO_reg[3] = MODO;
  end else begin
    MODO_reg[3] = CHARGE;
  end

  if(nRCO[3]) begin
    MODO_reg[4] = MODO;
  end else begin
    MODO_reg[4] = CHARGE;
  end

 if(nRCO[4]) begin
    MODO_reg[5] = MODO;
  end else begin
    MODO_reg[5] = CHARGE;
  end

 if(nRCO[5]) begin
    MODO_reg[6] = MODO;
  end else begin
    MODO_reg[6] = CHARGE;
  end

 if(nRCO[6]) begin
    MODO_reg[7] = MODO;
  end else begin
    MODO_reg[7] = CHARGE;
  end

end



////////////////// 8 4-bit counter submodules are instantiated /////////

contador_4b cont4b_0(
  .clk        (   clk       ),
  .RESET      (   RESET     ),
  .ENABLE     (   ENABLE    ),
  .MODO       (   MODO      ),
  .D          (   D_reg[3:0]    ),
  .LOAD       (   wLOAD[0]   ),
  .RCO        (   WnRCO[0]   ),
  .Q          (   wQ[3:0]    )
);


contador_4b cont4b_1(
  .clk        (   clk       ),
  .RESET      (   RESET     ),
  .ENABLE     (   ENABLE    ),
  .MODO       (   MODO_reg[1]),
  .D          (   D_reg[7:4]    ),
  .LOAD       (   wLOAD[1]   ),
  .RCO        (   WnRCO[1]   ),
  .Q          (  wQ[7:4]    )
);


contador_4b cont4b_2(
  .clk        (   clk       ),
  .RESET      (   RESET     ),
  .ENABLE     (   ENABLE    ),
  .MODO       (   MODO_reg[2]),
  .D          (   D_reg[11:8]   ),
  .LOAD       (   wLOAD[2]   ),
  .RCO        (   WnRCO[2]   ),
  .Q          (   wQ[11:8]   )
);



contador_4b cont4b_3(
  .clk        (   clk       ),
  .RESET      (   RESET     ),
  .ENABLE     (   ENABLE    ),
  .MODO       (   MODO_reg[3]),
  .D          (   D_reg[15:12]   ),
  .LOAD       (   wLOAD[3]   ),
  .RCO        (   WnRCO[3]   ),
  .Q          (   wQ[15:12]   )
);



contador_4b cont4b_4(
  .clk        (   clk       ),
  .RESET      (   RESET     ),
  .ENABLE     (   ENABLE    ),
  .MODO       (   MODO_reg[4]),
  .D          (   D_reg[19:16]   ),
  .LOAD       (   wLOAD[4]   ),
  .RCO        (   WnRCO[4]   ),
  .Q          (   wQ[19:16]   )
);




contador_4b cont4b_5(
  .clk        (   clk       ),
  .RESET      (   RESET     ),
  .ENABLE     (   ENABLE    ),
  .MODO       (   MODO_reg[5]),
  .D          (   D_reg[23:20]   ),
  .LOAD       (   wLOAD[5]   ),
  .RCO        (   WnRCO[5]   ),
  .Q          (   wQ[23:20]   )
);



contador_4b cont4b_6(
  .clk        (   clk       ),
  .RESET      (   RESET     ),
  .ENABLE     (   ENABLE    ),
  .MODO       (   MODO_reg[6]),
  .D          (   D_reg[27:24]   ),
  .LOAD       (   wLOAD[6]   ),
  .RCO        (   WnRCO[6]   ),
  .Q          (   wQ[27:24]   )
);


contador_4b cont4b_7(
  .clk        (   clk       ),
  .RESET      (   RESET     ),
  .ENABLE     (   ENABLE    ),
  .MODO       (   MODO_reg[7]),
  .D          (   D_reg[31:28]   ),
  .LOAD       (   wLOAD[7]   ),
  .RCO        (   WnRCO[7]   ),
  .Q          (   wQ[31:28]  )
);


/////////////////////// end counter submodules


/// Final spreads /////

always@(*)begin
  RCO     = nRCO[7];
  Q       = wQ;
  LOAD    = wLOAD;
  nRCO    = WnRCO;
end

endmodule

`endif
// Local Variables:
// verilog-library-directories:("."):
// verilog-auto-wire-type:\"logic\"
// End:


