/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_1 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_adder1_sum1;
  wire [1-1:0] M_adder1_z;
  wire [1-1:0] M_adder1_v;
  wire [1-1:0] M_adder1_n;
  wire [1-1:0] M_adder1_addiover;
  reg [6-1:0] M_adder1_alufn;
  reg [16-1:0] M_adder1_a;
  reg [16-1:0] M_adder1_b;
  adder_18 adder1 (
    .alufn(M_adder1_alufn),
    .a(M_adder1_a),
    .b(M_adder1_b),
    .sum1(M_adder1_sum1),
    .z(M_adder1_z),
    .v(M_adder1_v),
    .n(M_adder1_n),
    .addiover(M_adder1_addiover)
  );
  
  wire [16-1:0] M_boolean1_out;
  reg [16-1:0] M_boolean1_a;
  reg [16-1:0] M_boolean1_b;
  reg [6-1:0] M_boolean1_alufn;
  boolean_19 boolean1 (
    .a(M_boolean1_a),
    .b(M_boolean1_b),
    .alufn(M_boolean1_alufn),
    .out(M_boolean1_out)
  );
  
  wire [16-1:0] M_compare1_cmp;
  reg [6-1:0] M_compare1_alufn;
  reg [16-1:0] M_compare1_a;
  reg [16-1:0] M_compare1_b;
  compare_20 compare1 (
    .alufn(M_compare1_alufn),
    .a(M_compare1_a),
    .b(M_compare1_b),
    .cmp(M_compare1_cmp)
  );
  
  wire [16-1:0] M_shifter1_out;
  reg [6-1:0] M_shifter1_alufn;
  reg [16-1:0] M_shifter1_a;
  reg [16-1:0] M_shifter1_b;
  shifter_21 shifter1 (
    .alufn(M_shifter1_alufn),
    .a(M_shifter1_a),
    .b(M_shifter1_b),
    .out(M_shifter1_out)
  );
  
  always @* begin
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    M_adder1_alufn = alufn;
    M_adder1_a = a;
    M_adder1_b = b;
    M_boolean1_alufn = alufn;
    M_boolean1_a = a;
    M_boolean1_b = b;
    M_compare1_alufn = alufn;
    M_compare1_a = a;
    M_compare1_b = b;
    M_shifter1_alufn = alufn;
    M_shifter1_a = a;
    M_shifter1_b = b;
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = M_adder1_sum1;
        z = M_adder1_z;
        v = M_adder1_v;
        n = M_adder1_n;
      end
      2'h1: begin
        out = M_boolean1_out;
      end
      2'h2: begin
        out = M_shifter1_out;
      end
      2'h3: begin
        out = M_compare1_cmp;
      end
      default: begin
        out = 8'h00;
      end
    endcase
  end
endmodule