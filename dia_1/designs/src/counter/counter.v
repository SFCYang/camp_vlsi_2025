module counter(out, rst, clk);

output reg [7:0] out;
input clk, rst;

always @(posedge clk or posedge rst)
    if (rst)
        out <= 0;
    else
        out <= out + 1;
endmodule
