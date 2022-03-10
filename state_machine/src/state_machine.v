/***************************
    Elvis Chino-Islas
    ECE 527L - LAB5
    Spring 2022
***************************/
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

// state encoding
localparam S0 = 3'h0;
localparam S1 = 3'h1;
localparam S2 = 3'h2;
localparam S3 = 3'h3;
localparam S4 = 3'h4;
localparam S5 = 3'h5;
localparam S6 = 3'h6;
localparam S7 = 3'h7;

// input combinations
localparam B1	 = 3'b001;
localparam B3B1	 = 3'b101;
localparam B2	 = 3'b010;
localparam B3B2	 = 3'b110;


reg [2:0] pr_state, nx_state;

// the combinational calculated nx_state is assigned sequentially to pr_state
always @(posedge clk, negedge rst_n) begin : STATE_ASSIGNMENT
    if (~rst_n) begin
        pr_state <= S0;
    end else begin
        pr_state <= nx_state;
    end
end

// the nx_state is calculated combinatorially
always @(*) begin: NEXT_STATE_LOGIC
    case (pr_state)
        S0: 
            if ( b == B1 || b == B3B1 || b == B2 || b == B3B2 ) begin
                nx_state <= S1;
            end

            else begin
                nx_state <= S0;
            end
        S1:
            nx_state <= S2;
        S2:
            nx_state <= S3;
        S3:
            if (b == B2 || b == B3B2) begin
                nx_state <= S4;
            end

            else begin
                nx_state <= S0;
            end
        S4:
            nx_state <= S5;
        S5:
            nx_state <= S6;
        S6:
            nx_state <= S7;
        S7:
            nx_state <= S0;
        default:
            nx_state <= S0;
    endcase
end

// output is determined combinatorially
always @(*) begin: OUTPUT_LOGIC
    case (pr_state)
        S2:
            if (b[3]) begin
                outp = 1;
            end
            else begin
                outp = 0;
            end
        S3:
            outp = 1; 
        default:
            outp = 0;
    endcase
end
endmodule
`endif
