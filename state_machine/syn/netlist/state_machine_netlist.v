/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Mar 10 09:55:11 2022
/////////////////////////////////////////////////////////////


module state_machine ( clk, rst_n, b, outp );
  input [3:1] b;
  input clk, rst_n;
  output outp;
  wire   N44, N45, N46, n1, n2, n3, n4, n5, n6, n7;
  wire   [2:0] curr_state;

  FD2 \curr_state_reg[0]  ( .D(N44), .CP(clk), .CD(rst_n), .Q(curr_state[0])
         );
  FD2 \curr_state_reg[1]  ( .D(N45), .CP(clk), .CD(rst_n), .Q(curr_state[1])
         );
  FD2 \curr_state_reg[2]  ( .D(N46), .CP(clk), .CD(rst_n), .Q(curr_state[2]), 
        .QN(n1) );
  AN2P U6 ( .A(curr_state[0]), .B(curr_state[1]), .Z(n4) );
  OR2 U12 ( .A(curr_state[0]), .B(b[3]), .Z(n3) );
  AO7 U13 ( .A(n4), .B(n1), .C(n5), .Z(N46) );
  ND4 U14 ( .A(b[2]), .B(n4), .C(n2), .D(n1), .Z(n5) );
  NR2 U15 ( .A(curr_state[0]), .B(n6), .Z(N44) );
  NR3 U16 ( .A(n7), .B(curr_state[2]), .C(curr_state[1]), .Z(n6) );
  EN U17 ( .A(b[2]), .B(n2), .Z(n7) );
  EO U18 ( .A(curr_state[1]), .B(curr_state[0]), .Z(N45) );
  IVP U19 ( .A(b[1]), .Z(n2) );
  AN3 U20 ( .A(curr_state[1]), .B(n1), .C(n3), .Z(outp) );
endmodule

