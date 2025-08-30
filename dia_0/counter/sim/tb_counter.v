`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg rst;
    wire [7:0] out;

    counter uut (
        .out(out),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation: toggle every 10 ns (50 MHz)
    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst = 0;

        rst = 1;
        #20;
        rst = 0;

        #200;

        rst = 1;
        #20;
        rst = 0;

        #200;

        $stop;
    end

    initial begin
        $dumpfile("signals.vcd");
        $dumpvars(0, tb_counter);
    end

endmodule
