`timescale 1ns/1ps

module tb_alu;

  localparam N = 16;

  reg clk, reset;
  reg load_A, load_B, load_Op, updateRes;
  reg [N-1:0] data_in;
  wire [N-1:0] result;
  wire [4:0] flags;

  alu #(.N(N)) dut (
    .clk(clk),
    .reset(reset),
    .load_A(load_A),
    .load_B(load_B),
    .load_Op(load_Op),
    .updateRes(updateRes),
    .data_in(data_in),
    .result(result),
    .flags(flags)
  );

  initial clk = 0;
  always #5 clk = ~clk;  // 10 ns clk

  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);
  end

  initial begin
    // init
    reset = 1; load_A = 0; load_B = 0; load_Op = 0; updateRes = 0;
    data_in = 0;

    #15 reset = 0; 

    // ---- Test 1: NOR ----
    load_operand(16'h00F0, 1); // Load A
    load_operand(16'h0F00, 0); // Load B
    load_opcode(2'd0);         // NOR
    pulse_update();
    #10 $display("NOR:  result=%h flags=%b", result, flags);

    // ---- Test 2: NAND ----
    load_operand(16'hAAAA, 1); // Load A
    load_operand(16'h0F0F, 0); // Load B
    load_opcode(2'd1);         // NAND
    pulse_update();
    #10 $display("NAND: result=%h flags=%b", result, flags);

    // ---- Test 3: SUM ----
    load_operand(16'h1234, 1); // Load A
    load_operand(16'h0101, 0); // Load B
    load_opcode(2'd2);         // SUM
    pulse_update();
    #10 $display("SUM:   result=%h flags=%b", result, flags);

    // ---- Test 4: SUB ----
    load_operand(16'h8000, 1); // Load A
    load_operand(16'h7FFF, 0); // Load B
    load_opcode(2'd3);         // SUB
    pulse_update();
    #10 $display("SUB:   result=%h flags=%b", result, flags);

    #20 $finish;
  end

  // Task to load operand into A (sel=1) or B (sel=0)
  task load_operand(input [N-1:0] val, input selA);
  begin
    @(negedge clk);
    data_in = val;
    load_A = selA;
    load_B = ~selA;
    @(negedge clk);
    load_A = 0; 
    load_B = 0;
  end
  endtask

  // Task para cargar opcode (2 bits de data_in[1:0])
  task load_opcode(input [1:0] op);
  begin
    @(negedge clk);
    data_in = {14'd0, op};
    load_Op = 1;
    @(negedge clk);
    load_Op = 0;
  end
  endtask

  // Task para pulsar updateRes para latchear a result
  task pulse_update;
  begin
    @(negedge clk);
    updateRes = 1;
    @(negedge clk);
    updateRes = 0;
  end
  endtask

endmodule
