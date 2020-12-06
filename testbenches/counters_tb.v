`ifndef COUNTERS_TB
`define COUNTERS_TB

`timescale 1 ns / 1 ps

module counters_tb(

// general inputs
input wire clk,

// from behav
input wire [31:0] Q,
input wire RCO,
input wire [7:0] LOAD,

// Generated signals
output reg RESET, ENABLE,
output reg [31:0] D,
output reg [1:0] MODO
);


`include "./testers/driver.v"

parameter ITERATIONS = 10000;
integer log;

// WIRES
wire          wRCO;
wire [7:0]   wLOAD;
wire [31:0]    wQ;

initial begin

  $dumpfile("./test.vcd");
  $dumpvars(0);

  log = $fopen("./log/tb.log");
  $fdisplay(log, "time=%5d, Simulation Start", $time); ////////
  $fdisplay(log, "time=%5d, Starting Reset", $time); ///////

  drv_init();

  $fdisplay(log, "time=%5d, Reset Completed", $time); /////

  $fdisplay(log, "time=%5d, Starting Test", $time);
  fork
    drv_MODO_request(ITERATIONS);
    //checker(ITERATIONS);
  join
    //RESET <= 1;     // TESTING reset
    //ENABLE <= 1;
    //drv RESET2 request(ITERATIONS);

  $fdisplay(log, "time=%5d, MODO Test Completed", $time);
  /*
  $fdisplay(log, "time=%5d, Simulation Completed", $time);

  $fdisplay(log, "time=%5d, Starting Reset", $time); ///////

  drv init();

  $fdisplay(log, "time=%5d, Reset Completed", $time); /////

  $fdisplay(log, "time=%5d, Starting Random Test", $time);
  fork
    drv random request(ITERATIONS);
    checker(ITERATIONS);
  join
  $fdisplay(log, "time=%5d, MODO Test Completed", $time);
*/
  $fdisplay(log, "time=%5d, Simulation Completed", $time);

  $fclose(log);
  #200 $finish;
end

  contador count_TB(
    //INPUTS
    .clk      ( clk ),
    .ENABLE   ( ENABLE  ),
    .RESET    ( RESET ),
    .D        ( D ),
    .MODO     ( MODO  ),
    // OUTPUTS
    .Q     (   wQ ),
    .RCO   (   wRCO ),
    .LOAD  (   wLOAD  )
  );

endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif