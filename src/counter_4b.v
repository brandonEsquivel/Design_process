/*	Brandon Esquive Molina
	brandon.esquivel@ucr.ac.cr
   Counter module with 4-modes operation
*/

`ifndef COUNTER_4B
`define COUNTER_4B

`timescale 1 ns / 1 ps


module contador_4b(
  // inputs
  input wire ENABLE, RESET, clk,
  input wire [3:0]  D,
  input wire [1:0]  MODO,
  //outputs
  output reg [3:0]    Q,
  output reg  RCO,  LOAD

);

localparam COUNT_UP = 2'b00;
localparam COUNT_DOWN = 2'b01;
localparam COUNT_3_DOWN = 2'b10;
localparam CHARGE = 2'b11;

reg [1:0] MODO_reg;

  // saving actual state of operation mode
  always@(*) begin
      MODO_reg =  MODO;
  end

   always @(negedge clk) begin         // RCO ACTIVE ONLY BY HALF CLOCK CYCLE
      if(RCO) begin
         RCO <= 0;
      end
   end


   always @(posedge clk) begin
      if (RESET) begin
         Q <= 0;
         LOAD <= 0;
         RCO <= 0;
      end else begin    // END RESET = 1
         if(ENABLE) begin
            case ({MODO})
               COUNT_3_DOWN: begin
                  if( Q == 2 ||  Q < 2 /*4'b0010*/ ) begin
                     RCO   <= 1'b1;
                     Q     <= Q[3:0] - 4'b0011;
                     LOAD  <= 0;
                  end else begin
                     Q     <= Q[3:0] - 4'b0011;
                     LOAD  <= 0;
                     RCO   <= 1'b0;
                  end
               end

               COUNT_DOWN: begin
                  if( Q == 4'b0000 ) begin
                     RCO   <=  1'b1;
                     Q     <=  Q[3:0] - 4'b0001;
                     LOAD  <= 0;
                  end else begin
                     Q     <=  Q[3:0] - 4'b0001;
                     LOAD  <= 0;
                     RCO   <=  1'b0;
                  end
               end

               COUNT_UP: begin
                  if( Q == 4'b1111 ) begin
                     RCO   <= 1'b1;
                     Q     <= Q[3:0] + 4'b0001;
                     LOAD  <= 0;
                  end else begin
                     Q     <= Q[3:0] + 4'b0001;
                     LOAD  <= 0;
                     RCO   <= 1'b0;
                  end
               end

               CHARGE: begin
                  RCO   <= 0;
                  Q     <=  D;
                  LOAD  <= 1;
               end

               default: begin
                  RCO   <= 0;
                  Q     <= 0;
                  LOAD  <= 0;
               end
            endcase
         end //end if ENABLE = 1
         else begin  // ENABLE == 0 & RESET == 0
            Q     <= 0;    // condition -> 0
            RCO   <= 0;
            LOAD  <= 0;
         end   // end enable == 0
      end      // end else reset == 0
   end         // end always posedge clk
endmodule      // end module

`endif
// Local Variables:
// verilog-library-directories:("."):
// verilog-auto-wire-type:\"logic\"
// End: