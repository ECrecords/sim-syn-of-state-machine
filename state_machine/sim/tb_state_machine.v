
`ifndef state_machine
`include "state_machine.v"
`endif

`default_nettype none
`timescale 1ns/100ps

module tb_state_machine;
reg clk;
reg rst_n;
reg [3:1] b;
wire outp;

state_machine uut
(
    .clk (clk),
    .rst_n (rst_n),
    .b(b),
    .outp(outp)
);

localparam CLK_PERIOD = 100;
always #(CLK_PERIOD/2) clk=~clk;

`ifdef iverilog
initial begin
    $dumpfile("tb_state_machine.vcd");
    $dumpvars(0, tb_state_machine);
end
`endif

`ifndef iverilog
initial $vcdpluson();
`endif

initial begin
    rst_n<=1'b1;clk<=1'b0;
    #(CLK_PERIOD/4) rst_n<=1; b <= 3'h1;
    #(CLK_PERIOD*24) b <= 3'h2;
    #(CLK_PERIOD*24) b <= 3'h5;
    #(CLK_PERIOD*24) b <= 3'h6;
    #(CLK_PERIOD*24)$finish;
end

always @(b, outp) begin
    $display("\nFSM State: %h", uut.curr_state);
    $display("clk: %b, B1: %b, B2: %b, B3: %b, | OUTPUT: %b", clk, b[1], b[2], b[3], outp);
end

endmodule
`default_nettype wire
