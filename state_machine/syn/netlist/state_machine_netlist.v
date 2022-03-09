/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Mar  9 04:26:19 2022
/////////////////////////////////////////////////////////////


module state_machine ( clk, rst_n, b, outp );
  input [3:1] b;
  input clk, rst_n;
  output outp;
  wire   N44, N45, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [2:0] curr_state;

  FD2 \curr_state_reg[2]  ( .D(N45), .CP(clk), .CD(rst_n), .Q(curr_state[2]), 
        .QN(n1) );
  FT2 \curr_state_reg[0]  ( .CP(clk), .CD(rst_n), .Q(curr_state[0]), .QN(n3)
         );
  FD2 \curr_state_reg[1]  ( .D(N44), .CP(clk), .CD(rst_n), .QN(n2) );
  AO4 U11 ( .A(n7), .B(n1), .C(n4), .D(n8), .Z(N45) );
  IVP U12 ( .A(b[2]), .Z(n4) );
  ND2 U13 ( .A(n7), .B(n1), .Z(n8) );
  NR2 U14 ( .A(n2), .B(n3), .Z(n7) );
  EN U15 ( .A(n2), .B(curr_state[0]), .Z(N44) );
  NR4 U16 ( .A(curr_state[2]), .B(n5), .C(n6), .D(n2), .Z(outp) );
  NR2 U17 ( .A(b[3]), .B(curr_state[0]), .Z(n5) );
  NR2 U18 ( .A(b[2]), .B(b[1]), .Z(n6) );
endmodule

