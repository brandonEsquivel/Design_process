`ifndef TB_TOP
`define TB_TOP

// Includes

`include "./src/clock.v"
`include "./src/counter.v"
`include "./testbenches/counters_tb.v"


/*This is the top module of the structure, it maintains the include,
the clock, and the instance of the behavioral module, while the synthesized
structural counter is instantiated and handled within the internal testbench.*/
`timescale 1 ns / 1 ps


module tb_top;


// clock instance
clk clock (.clock (clock));

// WIRES
wire RESET, ENABLE, RCO;
wire [7:0] LOAD;
wire [31:0] D, Q;
wire [1:0] MODO;

counters_tb tb(
 //OUTPUTS
.RESET      (RESET),                 // generated from driver
.ENABLE     (ENABLE),                // generated from driver
.D          (D),                     // generated from driver
.MODO       (MODO),                  // generated from driver
//INPUTS
.Q          (Q),
.RCO        (RCO),
.LOAD       (LOAD),
.clk        (clock)
);

/// Counter behavorial instance

contador     Behav (
.clk        (clock),
.RESET      (RESET),
.ENABLE     (ENABLE),
.MODO       (MODO),
.D          (D),
.LOAD       (LOAD),
.RCO        (RCO),
.Q          (Q)
);


endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif