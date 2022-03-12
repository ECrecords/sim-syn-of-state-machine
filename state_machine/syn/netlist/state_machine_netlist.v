/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Mar 11 23:36:25 2022
/////////////////////////////////////////////////////////////


module state_machine ( clk, rst_n, b, outp );
  input [3:1] b;
  input clk, rst_n;
  output outp;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [7:0] pr_state;
  wire   [7:0] nx_state;

  FD4 \pr_state_reg[0]  ( .D(nx_state[0]), .CP(clk), .SD(rst_n), .Q(
        pr_state[0]), .QN(n10) );
  FD2 \pr_state_reg[1]  ( .D(nx_state[1]), .CP(clk), .CD(rst_n), .Q(
        pr_state[1]), .QN(n9) );
  FD2 \pr_state_reg[6]  ( .D(nx_state[6]), .CP(clk), .CD(rst_n), .Q(
        pr_state[6]), .QN(n5) );
  FD2 \pr_state_reg[7]  ( .D(nx_state[7]), .CP(clk), .CD(rst_n), .Q(
        pr_state[7]), .QN(n3) );
  FD2 \pr_state_reg[2]  ( .D(nx_state[2]), .CP(clk), .CD(rst_n), .Q(
        pr_state[2]) );
  FD2 \pr_state_reg[3]  ( .D(nx_state[3]), .CP(clk), .CD(rst_n), .Q(
        pr_state[3]), .QN(n8) );
  FD2 \pr_state_reg[5]  ( .D(nx_state[5]), .CP(clk), .CD(rst_n), .Q(
        pr_state[5]), .QN(n6) );
  FD2 \pr_state_reg[4]  ( .D(nx_state[4]), .CP(clk), .CD(rst_n), .Q(
        pr_state[4]), .QN(n7) );
  OR3 U31 ( .A(pr_state[2]), .B(n15), .C(n8), .Z(n13) );
  NR4 U32 ( .A(nx_state[7]), .B(nx_state[6]), .C(nx_state[5]), .D(nx_state[2]), 
        .Z(n22) );
  IVP U33 ( .A(n27), .Z(n1) );
  IVP U34 ( .A(n23), .Z(n4) );
  NR2 U35 ( .A(n17), .B(n18), .Z(nx_state[1]) );
  NR4 U36 ( .A(n24), .B(n8), .C(pr_state[4]), .D(pr_state[5]), .Z(n27) );
  NR4 U37 ( .A(pr_state[3]), .B(pr_state[4]), .C(pr_state[5]), .D(pr_state[7]), 
        .Z(n26) );
  NR4 U38 ( .A(n9), .B(n23), .C(pr_state[2]), .D(pr_state[6]), .Z(nx_state[2])
         );
  NR2 U39 ( .A(pr_state[2]), .B(pr_state[1]), .Z(n25) );
  ND4 U40 ( .A(n25), .B(n10), .C(n5), .D(n3), .Z(n24) );
  ND2 U41 ( .A(n26), .B(n10), .Z(n23) );
  AO3 U42 ( .A(n18), .B(n11), .C(n19), .D(n20), .Z(nx_state[0]) );
  IVP U43 ( .A(n17), .Z(n11) );
  AO7 U44 ( .A(b[1]), .B(n12), .C(n27), .Z(n19) );
  ND4 U45 ( .A(n1), .B(n18), .C(n21), .D(n22), .Z(n20) );
  NR4 U46 ( .A(n7), .B(n24), .C(pr_state[3]), .D(pr_state[5]), .Z(nx_state[5])
         );
  NR4 U47 ( .A(n6), .B(n24), .C(pr_state[3]), .D(pr_state[4]), .Z(nx_state[6])
         );
  AN3 U48 ( .A(n25), .B(n4), .C(pr_state[6]), .Z(nx_state[7]) );
  NR3 U49 ( .A(n12), .B(b[1]), .C(n13), .Z(nx_state[4]) );
  ND4 U50 ( .A(n9), .B(n7), .C(n10), .D(n16), .Z(n15) );
  AN3 U51 ( .A(n6), .B(n3), .C(n5), .Z(n16) );
  ND4 U52 ( .A(n4), .B(pr_state[2]), .C(n9), .D(n5), .Z(n21) );
  ND4 U53 ( .A(pr_state[0]), .B(n25), .C(n26), .D(n5), .Z(n18) );
  AN3 U54 ( .A(n8), .B(n2), .C(pr_state[2]), .Z(nx_state[3]) );
  IVP U55 ( .A(n15), .Z(n2) );
  EO U56 ( .A(b[1]), .B(n12), .Z(n17) );
  IVP U57 ( .A(b[2]), .Z(n12) );
  ND2 U58 ( .A(n13), .B(n14), .Z(outp) );
  ND2 U59 ( .A(b[3]), .B(nx_state[3]), .Z(n14) );
endmodule

