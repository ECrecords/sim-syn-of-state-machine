`ifndef state_machine
`define state_machine

`timescale 1ns/100ps

module state_machine ( 
    clk,
    rst_n,
    b,
    outp
);

input clk;
input rst_n;
input [3:1] b;
output reg outp;

localparam S0 = 3'h0;
localparam S1 = 3'h1;
localparam S2 = 3'h2;
localparam S3 = 3'h3;
localparam S4 = 3'h4;
localparam S5 = 3'h5;
localparam S6 = 3'h6;
localparam S7 = 3'h7;

reg [2:0] curr_state;

always @(posedge clk, negedge rst_n) begin : STATE_ASSIGNMENT
    if (~rst_n) begin
        curr_state <= S0;
    end else begin
        case (curr_state)
            S0:
                curr_state <= S1;
            S1:
                curr_state <= S2;
            S2:
                curr_state <= S3;
            S3:
                if (b[2] | (b[3] & b[2])) begin
                    curr_state <= S4;
                end

                else begin
                    curr_state <= S0;
                end
            S4:
                curr_state <= S5;
            S5:
                curr_state <= S6;
            S6:
                curr_state <= S7;
            S7:
                curr_state <= S0;
        endcase
    end
end

always @(*) begin: OUTPUT_LOGIC
    case (curr_state)
            S0:
                outp = 0;
            S1:
                outp = 0;
            S2:
                if ((b[3] & b[1]) | (b[3] & b[2])) begin
                    outp = 1;
                end
                else begin
                    outp = 0;
                end
            S3:
                if ( b[1] | b[2] | (b[3] & b[1]) | (b[3] & b[2]) ) begin
                    outp = 1; 
                end 

                else begin
                    outp = 0;    
                end
            S4:
                outp = 0;
            S5:
                outp = 0;
            S6:
                outp = 0;
            S7:
                outp = 0;
    endcase
end
endmodule
`endif
