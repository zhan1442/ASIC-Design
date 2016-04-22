/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar  8 19:39:27 2016
/////////////////////////////////////////////////////////////
module lab7_out_ctrl (
	clk, 
	n_rst, 
	d_plus, 
	d_minus, 
	bus_mode, 
	tx_value, 
	FE_OFN38_nn_rst);
   input clk;
   input n_rst;
   output d_plus;
   output d_minus;
   input [1:0] bus_mode;
   input tx_value;
   input FE_OFN38_nn_rst;

   // Internal wires
   wire FE_OCPN264_bus_mode_int_1_;
   wire FE_RN_649_0;
   wire FE_RN_648_0;
   wire FE_RN_647_0;
   wire FE_OFN34_nd_minus;
   wire FE_OFN33_nd_plus;
   wire n10;
   wire n11;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;

   BUFX2 FE_OCPC264_bus_mode_int_1_ (.Y(FE_OCPN264_bus_mode_int_1_), 
	.A(bus_mode[1]));
   INVX1 FE_RC_1082_0 (.Y(FE_RN_649_0), 
	.A(bus_mode[1]));
   AOI22X1 FE_RC_1081_0 (.Y(n4), 
	.D(FE_RN_649_0), 
	.C(n5), 
	.B(bus_mode[1]), 
	.A(d_minus));
   INVX2 FE_RC_1080_0 (.Y(FE_RN_648_0), 
	.A(FE_OCPN264_bus_mode_int_1_));
   AND2X2 FE_RC_1079_0 (.Y(FE_RN_647_0), 
	.B(bus_mode[1]), 
	.A(n7));
   AOI21X1 FE_RC_1078_0 (.Y(n10), 
	.C(FE_RN_647_0), 
	.B(n6), 
	.A(FE_RN_648_0));
   BUFX4 FE_OFC34_nd_minus (.Y(d_minus), 
	.A(FE_OFN34_nd_minus));
   BUFX4 FE_OFC33_nd_plus (.Y(d_plus), 
	.A(FE_OFN33_nd_plus));
   DFFSR d_minus_reg_reg (.S(1'b1), 
	.R(FE_OFN38_nn_rst), 
	.Q(FE_OFN34_nd_minus), 
	.D(n11), 
	.CLK(clk));
   DFFSR d_plus_reg_reg (.S(FE_OFN38_nn_rst), 
	.R(1'b1), 
	.Q(FE_OFN33_nd_plus), 
	.D(n10), 
	.CLK(clk));
   NOR2X1 U5 (.Y(n11), 
	.B(n4), 
	.A(n3));
   INVX2 U7 (.Y(n5), 
	.A(tx_value));
   NAND2X1 U9 (.Y(n7), 
	.B(bus_mode[0]), 
	.A(d_plus));
   NOR2X1 U10 (.Y(n6), 
	.B(n3), 
	.A(tx_value));
   INVX2 U11 (.Y(n3), 
	.A(bus_mode[0]));
endmodule

module lab7_encoder (
	clk, 
	n_rst, 
	tx_bit, 
	shift_enable, 
	tx_value);
   input clk;
   input n_rst;
   input tx_bit;
   input shift_enable;
   output tx_value;

   // Internal wires
   wire last_bit;
   wire n1;
   wire n2;

   DFFSR last_bit_reg (.S(n_rst), 
	.R(1'b1), 
	.Q(last_bit), 
	.D(n2), 
	.CLK(clk));
   XNOR2X1 U2 (.Y(tx_value), 
	.B(last_bit), 
	.A(tx_bit));
   INVX2 U3 (.Y(n2), 
	.A(n1));
   MUX2X1 U4 (.Y(n1), 
	.S(shift_enable), 
	.B(last_bit), 
	.A(tx_bit));
endmodule

module lab7_tx_sr_1 (
	clk, 
	n_rst, 
	shift_enable, 
	tx_enable, 
	tx_data, 
	load_data, 
	tx_out, 
	FE_OFN40_nn_rst, 
	FE_OFN37_nn_rst, 
	nclk__L2_N3);
   input clk;
   input n_rst;
   input shift_enable;
   input tx_enable;
   input [7:0] tx_data;
   input load_data;
   output tx_out;
   input FE_OFN40_nn_rst;
   input FE_OFN37_nn_rst;
   input nclk__L2_N3;

   // Internal wires
   wire FE_OCPN263_load_data_0_int;
   wire FE_RN_630_0;
   wire FE_RN_629_0;
   wire FE_RN_628_0;
   wire FE_RN_627_0;
   wire FE_RN_626_0;
   wire FE_RN_625_0;
   wire FE_RN_624_0;
   wire FE_RN_623_0;
   wire FE_RN_622_0;
   wire FE_RN_621_0;
   wire FE_RN_620_0;
   wire FE_RN_619_0;
   wire FE_RN_618_0;
   wire FE_RN_617_0;
   wire FE_RN_616_0;
   wire FE_RN_615_0;
   wire FE_RN_614_0;
   wire FE_RN_613_0;
   wire FE_RN_612_0;
   wire FE_OCPN195_load_data_0_int;
   wire FE_OCPN135_FE_OFN77_n13;
   wire FE_OFN70_n12;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire [7:1] curr_val;

   BUFX2 FE_OCPC263_load_data_0_int (.Y(FE_OCPN263_load_data_0_int), 
	.A(load_data));
   INVX2 FE_RC_1053_0 (.Y(FE_RN_630_0), 
	.A(n9));
   INVX2 FE_RC_1052_0 (.Y(FE_RN_629_0), 
	.A(n10));
   NAND2X1 FE_RC_1051_0 (.Y(FE_RN_628_0), 
	.B(FE_RN_629_0), 
	.A(FE_RN_630_0));
   NAND2X1 FE_RC_1050_0 (.Y(n36), 
	.B(n11), 
	.A(FE_RN_628_0));
   INVX2 FE_RC_1049_0 (.Y(FE_RN_627_0), 
	.A(n9));
   INVX2 FE_RC_1048_0 (.Y(FE_RN_626_0), 
	.A(n14));
   NAND2X1 FE_RC_1047_0 (.Y(FE_RN_625_0), 
	.B(FE_RN_626_0), 
	.A(FE_RN_627_0));
   NAND2X1 FE_RC_1046_0 (.Y(n35), 
	.B(n15), 
	.A(FE_RN_625_0));
   INVX4 FE_RC_1045_0 (.Y(FE_RN_624_0), 
	.A(n9));
   INVX2 FE_RC_1044_0 (.Y(FE_RN_623_0), 
	.A(n16));
   NAND2X1 FE_RC_1043_0 (.Y(FE_RN_622_0), 
	.B(FE_RN_623_0), 
	.A(FE_RN_624_0));
   NAND2X1 FE_RC_1042_0 (.Y(n34), 
	.B(n17), 
	.A(FE_RN_622_0));
   OR2X1 FE_RC_1041_0 (.Y(FE_RN_621_0), 
	.B(n18), 
	.A(n9));
   NAND2X1 FE_RC_1040_0 (.Y(n33), 
	.B(n19), 
	.A(FE_RN_621_0));
   INVX2 FE_RC_1039_0 (.Y(FE_RN_620_0), 
	.A(n9));
   INVX2 FE_RC_1038_0 (.Y(FE_RN_619_0), 
	.A(n20));
   NAND2X1 FE_RC_1037_0 (.Y(FE_RN_618_0), 
	.B(FE_RN_619_0), 
	.A(FE_RN_620_0));
   NAND2X1 FE_RC_1036_0 (.Y(n32), 
	.B(n21), 
	.A(FE_RN_618_0));
   INVX4 FE_RC_1035_0 (.Y(FE_RN_617_0), 
	.A(n9));
   INVX2 FE_RC_1034_0 (.Y(FE_RN_616_0), 
	.A(n22));
   NAND2X1 FE_RC_1033_0 (.Y(FE_RN_615_0), 
	.B(FE_RN_616_0), 
	.A(FE_RN_617_0));
   NAND2X1 FE_RC_1032_0 (.Y(n31), 
	.B(n23), 
	.A(FE_RN_615_0));
   INVX2 FE_RC_1031_0 (.Y(FE_RN_614_0), 
	.A(n9));
   INVX2 FE_RC_1030_0 (.Y(FE_RN_613_0), 
	.A(n26));
   NAND2X1 FE_RC_1029_0 (.Y(FE_RN_612_0), 
	.B(FE_RN_613_0), 
	.A(FE_RN_614_0));
   NAND2X1 FE_RC_1028_0 (.Y(n29), 
	.B(n27), 
	.A(FE_RN_612_0));
   AOI22X1 FE_RC_1004_0 (.Y(n17), 
	.D(FE_OFN70_n12), 
	.C(curr_val[4]), 
	.B(FE_OCPN135_FE_OFN77_n13), 
	.A(curr_val[3]));
   AOI22X1 FE_RC_1002_0 (.Y(n21), 
	.D(FE_OFN70_n12), 
	.C(curr_val[6]), 
	.B(FE_OCPN135_FE_OFN77_n13), 
	.A(curr_val[5]));
   AOI22X1 FE_RC_1001_0 (.Y(n23), 
	.D(curr_val[7]), 
	.C(FE_OFN70_n12), 
	.B(FE_OCPN135_FE_OFN77_n13), 
	.A(curr_val[6]));
   BUFX2 FE_OCPC195_load_data_0_int (.Y(FE_OCPN195_load_data_0_int), 
	.A(load_data));
   BUFX4 FE_OCPC135_FE_OFN77_n13 (.Y(FE_OCPN135_FE_OFN77_n13), 
	.A(n13));
   BUFX4 FE_OFC70_n12 (.Y(FE_OFN70_n12), 
	.A(n12));
   DFFSR \curr_val_reg[7]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_val[7]), 
	.D(n30), 
	.CLK(clk));
   DFFSR \curr_val_reg[6]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_val[6]), 
	.D(n31), 
	.CLK(nclk__L2_N3));
   DFFSR \curr_val_reg[5]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_val[5]), 
	.D(n32), 
	.CLK(nclk__L2_N3));
   DFFSR \curr_val_reg[4]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_val[4]), 
	.D(n33), 
	.CLK(nclk__L2_N3));
   DFFSR \curr_val_reg[3]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_val[3]), 
	.D(n34), 
	.CLK(clk));
   DFFSR \curr_val_reg[2]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_val[2]), 
	.D(n35), 
	.CLK(clk));
   DFFSR \curr_val_reg[1]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_val[1]), 
	.D(n36), 
	.CLK(clk));
   DFFSR \curr_val_reg[0]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(tx_out), 
	.D(n29), 
	.CLK(clk));
   AOI22X1 U12 (.Y(n11), 
	.D(curr_val[1]), 
	.C(FE_OCPN135_FE_OFN77_n13), 
	.B(curr_val[2]), 
	.A(FE_OFN70_n12));
   INVX1 U13 (.Y(n10), 
	.A(tx_data[1]));
   AOI22X1 U15 (.Y(n15), 
	.D(curr_val[2]), 
	.C(FE_OCPN135_FE_OFN77_n13), 
	.B(curr_val[3]), 
	.A(FE_OFN70_n12));
   INVX2 U16 (.Y(n14), 
	.A(tx_data[2]));
   INVX2 U19 (.Y(n16), 
	.A(tx_data[3]));
   AOI22X1 U21 (.Y(n19), 
	.D(FE_OCPN135_FE_OFN77_n13), 
	.C(curr_val[4]), 
	.B(curr_val[5]), 
	.A(FE_OFN70_n12));
   INVX2 U22 (.Y(n18), 
	.A(tx_data[4]));
   INVX1 U25 (.Y(n20), 
	.A(tx_data[5]));
   INVX1 U28 (.Y(n22), 
	.A(tx_data[6]));
   NAND2X1 U29 (.Y(n30), 
	.B(n24), 
	.A(n25));
   INVX1 U30 (.Y(n25), 
	.A(FE_OFN70_n12));
   MUX2X1 U31 (.Y(n24), 
	.S(FE_OCPN135_FE_OFN77_n13), 
	.B(tx_data[7]), 
	.A(curr_val[7]));
   AOI22X1 U33 (.Y(n27), 
	.D(tx_out), 
	.C(FE_OCPN135_FE_OFN77_n13), 
	.B(curr_val[1]), 
	.A(FE_OFN70_n12));
   NOR2X1 U34 (.Y(n12), 
	.B(n13), 
	.A(FE_OCPN195_load_data_0_int));
   AOI21X1 U35 (.Y(n13), 
	.C(load_data), 
	.B(tx_enable), 
	.A(shift_enable));
   INVX2 U36 (.Y(n26), 
	.A(tx_data[0]));
   INVX8 U37 (.Y(n9), 
	.A(FE_OCPN263_load_data_0_int));
endmodule

module lab7_tx_sr_0 (
	clk, 
	n_rst, 
	shift_enable, 
	tx_enable, 
	tx_data, 
	load_data, 
	tx_out, 
	FE_OFN38_nn_rst, 
	FE_OFN43_nn_rst, 
	FE_OFN40_nn_rst, 
	FE_OFN37_nn_rst, 
	nclk__L2_N1);
   input clk;
   input n_rst;
   input shift_enable;
   input tx_enable;
   input [7:0] tx_data;
   input load_data;
   output tx_out;
   input FE_OFN38_nn_rst;
   input FE_OFN43_nn_rst;
   input FE_OFN40_nn_rst;
   input FE_OFN37_nn_rst;
   input nclk__L2_N1;

   // Internal wires
   wire FE_RN_646_0;
   wire FE_RN_645_0;
   wire FE_RN_644_0;
   wire FE_RN_643_0;
   wire FE_RN_642_0;
   wire FE_RN_641_0;
   wire FE_RN_640_0;
   wire FE_RN_639_0;
   wire FE_RN_638_0;
   wire FE_RN_637_0;
   wire FE_RN_636_0;
   wire FE_RN_635_0;
   wire FE_RN_634_0;
   wire FE_RN_604_0;
   wire FE_OCPN121_load_data_1_int;
   wire FE_OCPN120_load_data_1_int;
   wire FE_OFN76_n13;
   wire FE_OFN71_n12;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire [7:1] curr_val;

   OR2X1 FE_RC_1077_0 (.Y(FE_RN_646_0), 
	.B(n9), 
	.A(n10));
   NAND2X1 FE_RC_1076_0 (.Y(n28), 
	.B(n11), 
	.A(FE_RN_646_0));
   OR2X1 FE_RC_1075_0 (.Y(FE_RN_645_0), 
	.B(n9), 
	.A(n14));
   NAND2X1 FE_RC_1074_0 (.Y(n36), 
	.B(FE_RN_645_0), 
	.A(n15));
   OR2X2 FE_RC_1073_0 (.Y(FE_RN_644_0), 
	.B(n9), 
	.A(n16));
   NAND2X1 FE_RC_1072_0 (.Y(n37), 
	.B(n17), 
	.A(FE_RN_644_0));
   OR2X1 FE_RC_1071_0 (.Y(FE_RN_643_0), 
	.B(n9), 
	.A(n18));
   NAND2X1 FE_RC_1070_0 (.Y(n38), 
	.B(FE_RN_643_0), 
	.A(n19));
   INVX2 FE_RC_1069_0 (.Y(FE_RN_642_0), 
	.A(n9));
   INVX2 FE_RC_1068_0 (.Y(FE_RN_641_0), 
	.A(n20));
   NAND2X1 FE_RC_1067_0 (.Y(FE_RN_640_0), 
	.B(FE_RN_641_0), 
	.A(FE_RN_642_0));
   NAND2X1 FE_RC_1066_0 (.Y(n39), 
	.B(FE_RN_640_0), 
	.A(n21));
   INVX2 FE_RC_1065_0 (.Y(FE_RN_639_0), 
	.A(n9));
   INVX2 FE_RC_1064_0 (.Y(FE_RN_638_0), 
	.A(n22));
   NAND2X1 FE_RC_1063_0 (.Y(FE_RN_637_0), 
	.B(FE_RN_638_0), 
	.A(FE_RN_639_0));
   NAND2X1 FE_RC_1062_0 (.Y(n40), 
	.B(FE_RN_637_0), 
	.A(n23));
   INVX2 FE_RC_1061_0 (.Y(FE_RN_636_0), 
	.A(n9));
   INVX2 FE_RC_1060_0 (.Y(FE_RN_635_0), 
	.A(n26));
   NAND2X1 FE_RC_1059_0 (.Y(FE_RN_634_0), 
	.B(FE_RN_635_0), 
	.A(FE_RN_636_0));
   NAND2X1 FE_RC_1058_0 (.Y(n42), 
	.B(FE_RN_634_0), 
	.A(n27));
   AOI22X1 FE_RC_1027_0 (.Y(n11), 
	.D(curr_val[1]), 
	.C(FE_OFN76_n13), 
	.B(FE_OFN71_n12), 
	.A(curr_val[2]));
   AOI22X1 FE_RC_1026_0 (.Y(n15), 
	.D(curr_val[2]), 
	.C(FE_OFN76_n13), 
	.B(FE_OFN71_n12), 
	.A(curr_val[3]));
   AOI22X1 FE_RC_1025_0 (.Y(n17), 
	.D(curr_val[3]), 
	.C(FE_OFN76_n13), 
	.B(FE_OFN71_n12), 
	.A(curr_val[4]));
   AOI22X1 FE_RC_1024_0 (.Y(n19), 
	.D(curr_val[4]), 
	.C(FE_OFN76_n13), 
	.B(FE_OFN71_n12), 
	.A(curr_val[5]));
   AOI22X1 FE_RC_1023_0 (.Y(n21), 
	.D(curr_val[5]), 
	.C(FE_OFN76_n13), 
	.B(FE_OFN71_n12), 
	.A(curr_val[6]));
   AOI22X1 FE_RC_1022_0 (.Y(n23), 
	.D(curr_val[6]), 
	.C(FE_OFN76_n13), 
	.B(FE_OFN71_n12), 
	.A(curr_val[7]));
   AOI22X1 FE_RC_1021_0 (.Y(n27), 
	.D(tx_out), 
	.C(FE_OFN76_n13), 
	.B(FE_OFN71_n12), 
	.A(curr_val[1]));
   INVX2 FE_RC_999_0 (.Y(FE_RN_604_0), 
	.A(FE_OFN76_n13));
   AOI22X1 FE_RC_998_0 (.Y(n24), 
	.D(tx_data[7]), 
	.C(FE_RN_604_0), 
	.B(curr_val[7]), 
	.A(FE_OFN76_n13));
   BUFX4 FE_RC_185_0 (.Y(FE_OFN76_n13), 
	.A(n13));
   NOR2X1 FE_RC_184_0 (.Y(n12), 
	.B(n13), 
	.A(FE_OCPN120_load_data_1_int));
   BUFX2 FE_OCPC121_load_data_1_int (.Y(FE_OCPN121_load_data_1_int), 
	.A(load_data));
   BUFX2 FE_OCPC120_load_data_1_int (.Y(FE_OCPN120_load_data_1_int), 
	.A(load_data));
   BUFX4 FE_OFC71_n12 (.Y(FE_OFN71_n12), 
	.A(n12));
   DFFSR \curr_val_reg[7]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(curr_val[7]), 
	.D(n41), 
	.CLK(nclk__L2_N1));
   DFFSR \curr_val_reg[6]  (.S(1'b1), 
	.R(FE_OFN38_nn_rst), 
	.Q(curr_val[6]), 
	.D(n40), 
	.CLK(clk));
   DFFSR \curr_val_reg[5]  (.S(1'b1), 
	.R(FE_OFN43_nn_rst), 
	.Q(curr_val[5]), 
	.D(n39), 
	.CLK(clk));
   DFFSR \curr_val_reg[4]  (.S(1'b1), 
	.R(FE_OFN38_nn_rst), 
	.Q(curr_val[4]), 
	.D(n38), 
	.CLK(clk));
   DFFSR \curr_val_reg[3]  (.S(1'b1), 
	.R(FE_OFN38_nn_rst), 
	.Q(curr_val[3]), 
	.D(n37), 
	.CLK(nclk__L2_N1));
   DFFSR \curr_val_reg[2]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_val[2]), 
	.D(n36), 
	.CLK(nclk__L2_N1));
   DFFSR \curr_val_reg[1]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_val[1]), 
	.D(n28), 
	.CLK(nclk__L2_N1));
   DFFSR \curr_val_reg[0]  (.S(1'b1), 
	.R(n_rst), 
	.Q(tx_out), 
	.D(n42), 
	.CLK(nclk__L2_N1));
   INVX2 U13 (.Y(n10), 
	.A(tx_data[1]));
   INVX2 U16 (.Y(n14), 
	.A(tx_data[2]));
   INVX2 U19 (.Y(n16), 
	.A(tx_data[3]));
   INVX1 U22 (.Y(n18), 
	.A(tx_data[4]));
   INVX1 U25 (.Y(n20), 
	.A(tx_data[5]));
   INVX1 U28 (.Y(n22), 
	.A(tx_data[6]));
   NAND2X1 U29 (.Y(n41), 
	.B(n24), 
	.A(n25));
   INVX1 U30 (.Y(n25), 
	.A(FE_OFN71_n12));
   AOI21X1 U35 (.Y(n13), 
	.C(load_data), 
	.B(shift_enable), 
	.A(tx_enable));
   INVX2 U36 (.Y(n26), 
	.A(tx_data[0]));
   INVX2 U37 (.Y(n9), 
	.A(FE_OCPN121_load_data_1_int));
endmodule

module fiforam (
	wclk, 
	wenable, 
	waddr, 
	raddr, 
	wdata, 
	rdata, 
	FE_OFN3_wenable_fifo, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input wclk;
   input wenable;
   input [2:0] waddr;
   input [2:0] raddr;
   input [7:0] wdata;
   output [7:0] rdata;
   input FE_OFN3_wenable_fifo;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   // Internal wires
   wire FE_PSN361_n138;
   wire FE_OCP_RBN359_n173;
   wire FE_OCP_RBN358_n173;
   wire FE_OCP_RBN347_n172;
   wire FE_OCP_RBN346_n172;
   wire FE_OCP_RBN345_n172;
   wire FE_OCP_RBN344_n172;
   wire FE_OCP_RBN343_n172;
   wire FE_OCP_RBN342_n172;
   wire FE_OCP_RBN341_n172;
   wire FE_OCP_RBN330_n193;
   wire FE_OCP_RBN328_n191;
   wire FE_OCP_RBN326_n195;
   wire FE_OCP_RBN322_FE_OFN51_n174;
   wire FE_OCP_RBN321_FE_OFN51_n174;
   wire FE_OCP_RBN320_FE_OFN51_n174;
   wire FE_OCP_RBN319_FE_OFN51_n174;
   wire FE_OCP_RBN316_FE_OFN51_n174;
   wire FE_OCP_RBN315_FE_OFN51_n174;
   wire FE_OCP_RBN314_FE_OFN51_n174;
   wire FE_OCP_RBN313_FE_OFN51_n174;
   wire FE_OCP_RBN290_n180;
   wire FE_OCPN260_wenable_fifo;
   wire FE_OCPN248_FE_OFN44_n175;
   wire FE_OCPN243_n62;
   wire FE_RN_1024_0;
   wire FE_RN_1023_0;
   wire FE_RN_1022_0;
   wire FE_RN_1009_0;
   wire FE_RN_994_0;
   wire FE_RN_993_0;
   wire FE_RN_992_0;
   wire FE_RN_991_0;
   wire FE_RN_990_0;
   wire FE_RN_989_0;
   wire FE_RN_988_0;
   wire FE_RN_986_0;
   wire FE_RN_985_0;
   wire FE_RN_984_0;
   wire FE_RN_983_0;
   wire FE_RN_982_0;
   wire FE_RN_981_0;
   wire FE_RN_980_0;
   wire FE_RN_979_0;
   wire FE_RN_978_0;
   wire FE_RN_977_0;
   wire FE_RN_975_0;
   wire FE_RN_974_0;
   wire FE_RN_955_0;
   wire FE_RN_954_0;
   wire FE_RN_939_0;
   wire FE_RN_938_0;
   wire FE_RN_937_0;
   wire FE_RN_936_0;
   wire FE_RN_935_0;
   wire FE_RN_927_0;
   wire FE_RN_926_0;
   wire FE_RN_915_0;
   wire FE_RN_914_0;
   wire FE_RN_913_0;
   wire FE_RN_912_0;
   wire FE_RN_911_0;
   wire FE_RN_910_0;
   wire FE_RN_909_0;
   wire FE_RN_908_0;
   wire FE_RN_907_0;
   wire FE_RN_906_0;
   wire FE_RN_905_0;
   wire FE_RN_904_0;
   wire FE_RN_903_0;
   wire FE_RN_902_0;
   wire FE_RN_901_0;
   wire FE_RN_884_0;
   wire FE_RN_883_0;
   wire FE_RN_882_0;
   wire FE_RN_881_0;
   wire FE_RN_880_0;
   wire FE_RN_879_0;
   wire FE_RN_878_0;
   wire FE_RN_877_0;
   wire FE_RN_876_0;
   wire FE_RN_875_0;
   wire FE_RN_874_0;
   wire FE_RN_873_0;
   wire FE_RN_872_0;
   wire FE_RN_871_0;
   wire FE_RN_870_0;
   wire FE_RN_869_0;
   wire FE_RN_868_0;
   wire FE_RN_805_0;
   wire FE_RN_804_0;
   wire FE_RN_683_0;
   wire FE_RN_682_0;
   wire FE_RN_585_0;
   wire FE_RN_580_0;
   wire FE_RN_575_0;
   wire FE_RN_571_0;
   wire FE_RN_569_0;
   wire FE_RN_556_0;
   wire FE_RN_553_0;
   wire FE_OCPN233_n175;
   wire FE_RN_513_0;
   wire FE_RN_512_0;
   wire FE_RN_511_0;
   wire FE_RN_508_0;
   wire FE_RN_507_0;
   wire FE_RN_505_0;
   wire FE_RN_504_0;
   wire FE_RN_500_0;
   wire FE_RN_498_0;
   wire FE_RN_489_0;
   wire FE_RN_488_0;
   wire FE_OCPN212_FE_OFN72_n186;
   wire FE_OCPN194_wenable_fifo;
   wire FE_OCPN181_wenable_fifo;
   wire FE_OCPN165_FE_OFN44_n175;
   wire FE_OCPN153_n175;
   wire FE_RN_456_0;
   wire FE_RN_396_0;
   wire FE_RN_395_0;
   wire FE_RN_394_0;
   wire FE_RN_393_0;
   wire FE_RN_392_0;
   wire FE_RN_391_0;
   wire FE_RN_390_0;
   wire FE_RN_389_0;
   wire FE_RN_387_0;
   wire FE_RN_386_0;
   wire FE_RN_385_0;
   wire FE_RN_382_0;
   wire FE_RN_381_0;
   wire FE_RN_378_0;
   wire FE_RN_377_0;
   wire FE_RN_376_0;
   wire FE_RN_375_0;
   wire FE_RN_371_0;
   wire FE_RN_369_0;
   wire FE_RN_365_0;
   wire FE_RN_364_0;
   wire FE_RN_363_0;
   wire FE_RN_360_0;
   wire FE_RN_359_0;
   wire FE_RN_358_0;
   wire FE_RN_357_0;
   wire FE_RN_356_0;
   wire FE_RN_355_0;
   wire FE_RN_354_0;
   wire FE_RN_353_0;
   wire FE_RN_352_0;
   wire FE_RN_351_0;
   wire FE_RN_350_0;
   wire FE_RN_349_0;
   wire FE_RN_348_0;
   wire FE_RN_347_0;
   wire FE_RN_346_0;
   wire FE_RN_345_0;
   wire FE_RN_344_0;
   wire FE_RN_343_0;
   wire FE_RN_342_0;
   wire FE_RN_341_0;
   wire FE_RN_340_0;
   wire FE_RN_339_0;
   wire FE_RN_286_0;
   wire FE_RN_280_0;
   wire FE_RN_271_0;
   wire FE_RN_259_0;
   wire FE_RN_257_0;
   wire FE_RN_254_0;
   wire FE_RN_251_0;
   wire FE_RN_248_0;
   wire FE_RN_231_0;
   wire FE_OCPN143_wenable_fifo;
   wire FE_OCPN142_wenable_fifo;
   wire FE_OCPN141_wenable_fifo;
   wire FE_OCPN140_wenable_fifo;
   wire FE_OCPN136_FE_OFN72_n186;
   wire FE_OCPN125_FE_OFN44_n175;
   wire FE_OCPN116_n211;
   wire FE_OCPN111_n181;
   wire FE_OCPN106_wenable_fifo;
   wire FE_OCPN105_wenable_fifo;
   wire FE_OCPN99_n184;
   wire FE_OCPN98_n184;
   wire FE_OCPN97_n188;
   wire FE_OCPN96_n188;
   wire FE_OCPN95_n197;
   wire FE_OCPN94_n197;
   wire FE_OCPN91_FE_OFN44_n175;
   wire FE_OCPN90_FE_OFN44_n175;
   wire FE_OFN72_n186;
   wire FE_OFN69_n203;
   wire FE_OFN68_n223;
   wire FE_OFN67_n241;
   wire FE_OFN66_n183;
   wire FE_OFN64_n54;
   wire FE_OFN63_n54;
   wire FE_OFN62_n54;
   wire FE_OFN61_n54;
   wire FE_OFN60_n53;
   wire FE_OFN59_n53;
   wire FE_OFN58_n53;
   wire FE_OFN57_n53;
   wire FE_OFN56_n55;
   wire FE_OFN51_n174;
   wire FE_OFN50_n174;
   wire FE_OFN49_n190;
   wire FE_OFN48_n214;
   wire FE_OFN47_n232;
   wire FE_OFN46_n250;
   wire FE_OFN45_n56;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N14;
   wire N15;
   wire \fiforeg[0][7] ;
   wire \fiforeg[0][6] ;
   wire \fiforeg[0][5] ;
   wire \fiforeg[0][4] ;
   wire \fiforeg[0][3] ;
   wire \fiforeg[0][2] ;
   wire \fiforeg[0][1] ;
   wire \fiforeg[0][0] ;
   wire \fiforeg[1][7] ;
   wire \fiforeg[1][6] ;
   wire \fiforeg[1][5] ;
   wire \fiforeg[1][4] ;
   wire \fiforeg[1][3] ;
   wire \fiforeg[1][2] ;
   wire \fiforeg[1][1] ;
   wire \fiforeg[1][0] ;
   wire \fiforeg[2][7] ;
   wire \fiforeg[2][6] ;
   wire \fiforeg[2][5] ;
   wire \fiforeg[2][4] ;
   wire \fiforeg[2][3] ;
   wire \fiforeg[2][2] ;
   wire \fiforeg[2][1] ;
   wire \fiforeg[2][0] ;
   wire \fiforeg[3][7] ;
   wire \fiforeg[3][6] ;
   wire \fiforeg[3][5] ;
   wire \fiforeg[3][4] ;
   wire \fiforeg[3][3] ;
   wire \fiforeg[3][2] ;
   wire \fiforeg[3][1] ;
   wire \fiforeg[3][0] ;
   wire \fiforeg[4][7] ;
   wire \fiforeg[4][6] ;
   wire \fiforeg[4][5] ;
   wire \fiforeg[4][4] ;
   wire \fiforeg[4][3] ;
   wire \fiforeg[4][2] ;
   wire \fiforeg[4][1] ;
   wire \fiforeg[4][0] ;
   wire \fiforeg[5][7] ;
   wire \fiforeg[5][6] ;
   wire \fiforeg[5][5] ;
   wire \fiforeg[5][4] ;
   wire \fiforeg[5][3] ;
   wire \fiforeg[5][2] ;
   wire \fiforeg[5][1] ;
   wire \fiforeg[5][0] ;
   wire \fiforeg[6][7] ;
   wire \fiforeg[6][6] ;
   wire \fiforeg[6][5] ;
   wire \fiforeg[6][4] ;
   wire \fiforeg[6][3] ;
   wire \fiforeg[6][2] ;
   wire \fiforeg[6][1] ;
   wire \fiforeg[6][0] ;
   wire \fiforeg[7][7] ;
   wire \fiforeg[7][6] ;
   wire \fiforeg[7][5] ;
   wire \fiforeg[7][4] ;
   wire \fiforeg[7][3] ;
   wire \fiforeg[7][2] ;
   wire \fiforeg[7][1] ;
   wire \fiforeg[7][0] ;
   wire N18;
   wire N20;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n69;
   wire n70;
   wire n71;
   wire n75;
   wire n76;
   wire n77;
   wire n81;
   wire n82;
   wire n83;
   wire n87;
   wire n88;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n163;
   wire n164;
   wire n165;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n179;
   wire n180;
   wire n181;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n188;
   wire n190;
   wire n191;
   wire n192;
   wire n193;
   wire n195;
   wire n196;
   wire n197;
   wire n203;
   wire n206;
   wire n208;
   wire n210;
   wire n211;
   wire n212;
   wire n214;
   wire n216;
   wire n217;
   wire n222;
   wire n223;
   wire n226;
   wire n230;
   wire n231;
   wire n232;
   wire n234;
   wire n235;
   wire n241;
   wire n242;
   wire n243;
   wire n244;
   wire n245;
   wire n246;
   wire n248;
   wire n250;
   wire n253;
   wire n254;
   wire n259;
   wire n260;
   wire n261;
   wire n262;

   assign N10 = raddr[0] ;
   assign N11 = raddr[1] ;
   assign N12 = raddr[2] ;
   assign N13 = waddr[0] ;
   assign N14 = waddr[1] ;
   assign N15 = waddr[2] ;

   BUFX2 FE_PSC361_n138 (.Y(FE_PSN361_n138), 
	.A(n138));
   BUFX4 FE_OCP_RBC359_n173 (.Y(FE_OCP_RBN359_n173), 
	.A(n173));
   BUFX4 FE_OCP_RBC358_n173 (.Y(FE_OCP_RBN358_n173), 
	.A(n173));
   BUFX2 FE_OCP_RBC347_n172 (.Y(FE_OCP_RBN347_n172), 
	.A(FE_OCP_RBN345_n172));
   BUFX2 FE_OCP_RBC346_n172 (.Y(FE_OCP_RBN346_n172), 
	.A(FE_OCP_RBN344_n172));
   INVX4 FE_OCP_RBC345_n172 (.Y(FE_OCP_RBN345_n172), 
	.A(FE_OCP_RBN341_n172));
   INVX2 FE_OCP_RBC344_n172 (.Y(FE_OCP_RBN344_n172), 
	.A(FE_OCP_RBN341_n172));
   INVX4 FE_OCP_RBC343_n172 (.Y(FE_OCP_RBN343_n172), 
	.A(FE_OCP_RBN341_n172));
   INVX2 FE_OCP_RBC342_n172 (.Y(FE_OCP_RBN342_n172), 
	.A(FE_OCP_RBN341_n172));
   INVX4 FE_OCP_RBC341_n172 (.Y(FE_OCP_RBN341_n172), 
	.A(n172));
   NAND3X1 FE_RC_1690_0 (.Y(FE_RN_879_0), 
	.C(FE_RN_881_0), 
	.B(FE_RN_880_0), 
	.A(FE_RN_882_0));
   AOI22X1 FE_RC_1688_0 (.Y(FE_RN_873_0), 
	.D(FE_OFN51_n174), 
	.C(\fiforeg[3][1] ), 
	.B(\fiforeg[1][1] ), 
	.A(FE_OCPN125_FE_OFN44_n175));
   AOI22X1 FE_RC_1687_0 (.Y(FE_RN_343_0), 
	.D(FE_OCP_RBN345_n172), 
	.C(\fiforeg[7][2] ), 
	.B(FE_OCP_RBN358_n173), 
	.A(\fiforeg[5][2] ));
   BUFX4 FE_OCP_RBC330_n193 (.Y(FE_OCP_RBN330_n193), 
	.A(n193));
   BUFX4 FE_OCP_RBC328_n191 (.Y(FE_OCP_RBN328_n191), 
	.A(n191));
   BUFX4 FE_OCP_RBC326_n195 (.Y(FE_OCP_RBN326_n195), 
	.A(n195));
   BUFX2 FE_OCP_RBC322_FE_OFN51_n174 (.Y(FE_OCP_RBN322_FE_OFN51_n174), 
	.A(FE_OFN51_n174));
   BUFX2 FE_OCP_RBC321_FE_OFN51_n174 (.Y(FE_OCP_RBN321_FE_OFN51_n174), 
	.A(FE_OFN51_n174));
   BUFX2 FE_OCP_RBC320_FE_OFN51_n174 (.Y(FE_OCP_RBN320_FE_OFN51_n174), 
	.A(FE_OFN51_n174));
   BUFX2 FE_OCP_RBC319_FE_OFN51_n174 (.Y(FE_OCP_RBN319_FE_OFN51_n174), 
	.A(FE_OFN51_n174));
   BUFX2 FE_OCP_RBC316_FE_OFN51_n174 (.Y(FE_OCP_RBN316_FE_OFN51_n174), 
	.A(FE_OFN51_n174));
   BUFX2 FE_OCP_RBC315_FE_OFN51_n174 (.Y(FE_OCP_RBN315_FE_OFN51_n174), 
	.A(FE_OFN51_n174));
   BUFX2 FE_OCP_RBC314_FE_OFN51_n174 (.Y(FE_OCP_RBN314_FE_OFN51_n174), 
	.A(FE_OFN51_n174));
   BUFX2 FE_OCP_RBC313_FE_OFN51_n174 (.Y(FE_OCP_RBN313_FE_OFN51_n174), 
	.A(FE_OFN51_n174));
   BUFX2 FE_OCP_RBC290_n180 (.Y(FE_OCP_RBN290_n180), 
	.A(n180));
   BUFX2 FE_OCPC260_wenable_fifo (.Y(FE_OCPN260_wenable_fifo), 
	.A(wenable));
   BUFX2 FE_OCPC248_FE_OFN44_n175 (.Y(FE_OCPN248_FE_OFN44_n175), 
	.A(FE_OCPN90_FE_OFN44_n175));
   BUFX2 FE_OCPC243_n62 (.Y(FE_OCPN243_n62), 
	.A(n62));
   INVX2 FE_RC_1660_0 (.Y(FE_RN_1024_0), 
	.A(\fiforeg[0][5] ));
   MUX2X1 FE_RC_1659_0 (.Y(n150), 
	.S(FE_RN_286_0), 
	.B(FE_RN_1024_0), 
	.A(FE_OCP_RBN330_n193));
   INVX2 FE_RC_1658_0 (.Y(FE_RN_1023_0), 
	.A(\fiforeg[2][5] ));
   MUX2X1 FE_RC_1657_0 (.Y(n134), 
	.S(FE_RN_280_0), 
	.B(FE_RN_1023_0), 
	.A(FE_OCP_RBN330_n193));
   INVX2 FE_RC_1656_0 (.Y(FE_RN_1022_0), 
	.A(\fiforeg[7][5] ));
   MUX2X1 FE_RC_1655_0 (.Y(n94), 
	.S(FE_RN_456_0), 
	.B(FE_RN_1022_0), 
	.A(FE_OCP_RBN330_n193));
   INVX2 FE_RC_1636_0 (.Y(FE_RN_1009_0), 
	.A(\fiforeg[5][5] ));
   MUX2X1 FE_RC_1635_0 (.Y(n110), 
	.S(FE_RN_271_0), 
	.B(FE_RN_1009_0), 
	.A(FE_OCP_RBN330_n193));
   INVX2 FE_RC_1613_0 (.Y(FE_RN_994_0), 
	.A(\fiforeg[5][7] ));
   INVX4 FE_RC_1612_0 (.Y(FE_RN_993_0), 
	.A(FE_RN_369_0));
   AOI22X1 FE_RC_1611_0 (.Y(n112), 
	.D(FE_OCPN97_n188), 
	.C(FE_RN_369_0), 
	.B(FE_RN_993_0), 
	.A(FE_RN_994_0));
   INVX2 FE_RC_1610_0 (.Y(FE_RN_992_0), 
	.A(\fiforeg[1][7] ));
   INVX4 FE_RC_1609_0 (.Y(FE_RN_991_0), 
	.A(FE_RN_387_0));
   AOI22X1 FE_RC_1608_0 (.Y(n144), 
	.D(FE_OCPN97_n188), 
	.C(FE_RN_387_0), 
	.B(FE_RN_991_0), 
	.A(FE_RN_992_0));
   INVX2 FE_RC_1607_0 (.Y(FE_RN_990_0), 
	.A(\fiforeg[6][0] ));
   MUX2X1 FE_RC_1606_0 (.Y(n97), 
	.S(FE_RN_585_0), 
	.B(FE_RN_990_0), 
	.A(FE_OCPN212_FE_OFN72_n186));
   INVX2 FE_RC_1605_0 (.Y(FE_RN_989_0), 
	.A(\fiforeg[1][0] ));
   MUX2X1 FE_RC_1604_0 (.Y(n137), 
	.S(FE_RN_580_0), 
	.B(FE_RN_989_0), 
	.A(FE_OCPN212_FE_OFN72_n186));
   INVX2 FE_RC_1603_0 (.Y(FE_RN_988_0), 
	.A(\fiforeg[3][0] ));
   MUX2X1 FE_RC_1602_0 (.Y(n121), 
	.S(FE_RN_575_0), 
	.B(FE_RN_988_0), 
	.A(FE_OCPN212_FE_OFN72_n186));
   INVX2 FE_RC_1599_0 (.Y(FE_RN_986_0), 
	.A(\fiforeg[5][0] ));
   MUX2X1 FE_RC_1598_0 (.Y(n105), 
	.S(FE_RN_569_0), 
	.B(FE_RN_986_0), 
	.A(FE_OCPN212_FE_OFN72_n186));
   INVX2 FE_RC_1597_0 (.Y(FE_RN_985_0), 
	.A(\fiforeg[7][2] ));
   MUX2X1 FE_RC_1596_0 (.Y(n91), 
	.S(FE_RN_513_0), 
	.B(FE_RN_985_0), 
	.A(FE_OCPN111_n181));
   INVX2 FE_RC_1595_0 (.Y(FE_RN_984_0), 
	.A(\fiforeg[7][0] ));
   MUX2X1 FE_RC_1594_0 (.Y(n89), 
	.S(FE_RN_512_0), 
	.B(FE_RN_984_0), 
	.A(FE_OCPN212_FE_OFN72_n186));
   INVX2 FE_RC_1593_0 (.Y(FE_RN_983_0), 
	.A(\fiforeg[0][6] ));
   MUX2X1 FE_RC_1592_0 (.Y(n151), 
	.S(FE_RN_511_0), 
	.B(FE_RN_983_0), 
	.A(FE_OCP_RBN328_n191));
   INVX2 FE_RC_1591_0 (.Y(FE_RN_982_0), 
	.A(\fiforeg[1][6] ));
   MUX2X1 FE_RC_1590_0 (.Y(n143), 
	.S(FE_RN_508_0), 
	.B(FE_RN_982_0), 
	.A(FE_OCP_RBN328_n191));
   INVX2 FE_RC_1589_0 (.Y(FE_RN_981_0), 
	.A(\fiforeg[1][2] ));
   MUX2X1 FE_RC_1588_0 (.Y(n139), 
	.S(FE_RN_507_0), 
	.B(FE_RN_981_0), 
	.A(FE_OCPN111_n181));
   INVX2 FE_RC_1587_0 (.Y(FE_RN_980_0), 
	.A(\fiforeg[3][6] ));
   MUX2X1 FE_RC_1586_0 (.Y(n127), 
	.S(FE_RN_505_0), 
	.B(FE_RN_980_0), 
	.A(FE_OCP_RBN328_n191));
   INVX2 FE_RC_1585_0 (.Y(FE_RN_979_0), 
	.A(\fiforeg[3][2] ));
   MUX2X1 FE_RC_1584_0 (.Y(n123), 
	.S(FE_RN_504_0), 
	.B(FE_RN_979_0), 
	.A(FE_OCPN111_n181));
   INVX2 FE_RC_1583_0 (.Y(FE_RN_978_0), 
	.A(\fiforeg[5][6] ));
   MUX2X1 FE_RC_1582_0 (.Y(n111), 
	.S(FE_RN_500_0), 
	.B(FE_RN_978_0), 
	.A(FE_OCP_RBN328_n191));
   INVX2 FE_RC_1581_0 (.Y(FE_RN_977_0), 
	.A(\fiforeg[5][2] ));
   MUX2X1 FE_RC_1580_0 (.Y(n107), 
	.S(FE_RN_498_0), 
	.B(FE_RN_977_0), 
	.A(FE_OCPN111_n181));
   INVX2 FE_RC_1577_0 (.Y(FE_RN_975_0), 
	.A(\fiforeg[2][2] ));
   INVX2 FE_RC_1576_0 (.Y(FE_RN_974_0), 
	.A(FE_OFN68_n223));
   MUX2X1 FE_RC_1575_0 (.Y(n131), 
	.S(FE_RN_974_0), 
	.B(FE_RN_975_0), 
	.A(FE_OCPN111_n181));
   INVX2 FE_RC_1547_0 (.Y(FE_RN_955_0), 
	.A(\fiforeg[2][6] ));
   INVX4 FE_RC_1546_0 (.Y(FE_RN_954_0), 
	.A(FE_OFN68_n223));
   MUX2X1 FE_RC_1545_0 (.Y(n135), 
	.S(FE_RN_954_0), 
	.B(FE_RN_955_0), 
	.A(FE_OCP_RBN328_n191));
   INVX2 FE_RC_1523_0 (.Y(FE_RN_939_0), 
	.A(\fiforeg[7][1] ));
   MUX2X1 FE_RC_1522_0 (.Y(n90), 
	.S(FE_RN_259_0), 
	.B(FE_RN_939_0), 
	.A(FE_OCPN99_n184));
   INVX2 FE_RC_1521_0 (.Y(FE_RN_938_0), 
	.A(\fiforeg[0][1] ));
   MUX2X1 FE_RC_1520_0 (.Y(n146), 
	.S(FE_RN_257_0), 
	.B(FE_RN_938_0), 
	.A(FE_OCPN99_n184));
   INVX2 FE_RC_1519_0 (.Y(FE_RN_937_0), 
	.A(\fiforeg[1][1] ));
   MUX2X1 FE_RC_1518_0 (.Y(n138), 
	.S(FE_RN_254_0), 
	.B(FE_RN_937_0), 
	.A(FE_OCPN99_n184));
   INVX2 FE_RC_1517_0 (.Y(FE_RN_936_0), 
	.A(\fiforeg[2][1] ));
   MUX2X1 FE_RC_1516_0 (.Y(n130), 
	.S(FE_RN_251_0), 
	.B(FE_RN_936_0), 
	.A(FE_OCPN99_n184));
   INVX2 FE_RC_1515_0 (.Y(FE_RN_935_0), 
	.A(\fiforeg[3][1] ));
   MUX2X1 FE_RC_1514_0 (.Y(n122), 
	.S(FE_RN_248_0), 
	.B(FE_RN_935_0), 
	.A(FE_OCPN99_n184));
   INVX2 FE_RC_1505_0 (.Y(FE_RN_927_0), 
	.A(\fiforeg[4][1] ));
   MUX2X1 FE_RC_1504_0 (.Y(n114), 
	.S(FE_RN_371_0), 
	.B(FE_RN_927_0), 
	.A(FE_OCPN99_n184));
   INVX2 FE_RC_1503_0 (.Y(FE_RN_926_0), 
	.A(\fiforeg[5][1] ));
   MUX2X1 FE_RC_1502_0 (.Y(n106), 
	.S(FE_RN_365_0), 
	.B(FE_RN_926_0), 
	.A(FE_OCPN99_n184));
   INVX2 FE_RC_1490_0 (.Y(FE_RN_915_0), 
	.A(FE_OCPN140_wenable_fifo));
   INVX2 FE_RC_1489_0 (.Y(FE_RN_914_0), 
	.A(n87));
   AND2X2 FE_RC_1488_0 (.Y(FE_RN_913_0), 
	.B(\fiforeg[3][3] ), 
	.A(FE_OCP_RBN313_FE_OFN51_n174));
   NAND2X1 FE_RC_1487_0 (.Y(FE_RN_912_0), 
	.B(FE_OCPN125_FE_OFN44_n175), 
	.A(\fiforeg[1][3] ));
   AOI22X1 FE_RC_1486_0 (.Y(FE_RN_911_0), 
	.D(FE_OCP_RBN359_n173), 
	.C(\fiforeg[5][3] ), 
	.B(FE_OCP_RBN344_n172), 
	.A(\fiforeg[7][3] ));
   NAND2X1 FE_RC_1485_0 (.Y(FE_RN_910_0), 
	.B(FE_RN_912_0), 
	.A(FE_RN_911_0));
   INVX2 FE_RC_1484_0 (.Y(FE_RN_909_0), 
	.A(n212));
   OAI21X1 FE_RC_1483_0 (.Y(FE_RN_908_0), 
	.C(FE_RN_909_0), 
	.B(FE_RN_910_0), 
	.A(FE_RN_913_0));
   NAND2X1 FE_RC_1482_0 (.Y(FE_RN_907_0), 
	.B(FE_RN_908_0), 
	.A(FE_RN_914_0));
   AOI22X1 FE_RC_1481_0 (.Y(n197), 
	.D(FE_RN_907_0), 
	.C(FE_RN_915_0), 
	.B(FE_OCPN194_wenable_fifo), 
	.A(wdata[3]));
   NAND2X1 FE_RC_1480_0 (.Y(FE_RN_906_0), 
	.B(FE_OCPN140_wenable_fifo), 
	.A(wdata[7]));
   AOI22X1 FE_RC_1479_0 (.Y(FE_RN_905_0), 
	.D(FE_OCPN125_FE_OFN44_n175), 
	.C(\fiforeg[1][7] ), 
	.B(FE_OCP_RBN319_FE_OFN51_n174), 
	.A(\fiforeg[3][7] ));
   AOI22X1 FE_RC_1478_0 (.Y(FE_RN_904_0), 
	.D(FE_OCP_RBN343_n172), 
	.C(\fiforeg[7][7] ), 
	.B(FE_OCP_RBN359_n173), 
	.A(\fiforeg[5][7] ));
   AOI21X1 FE_RC_1477_0 (.Y(FE_RN_903_0), 
	.C(n212), 
	.B(FE_RN_904_0), 
	.A(FE_RN_905_0));
   INVX4 FE_RC_1476_0 (.Y(FE_RN_902_0), 
	.A(FE_OCPN140_wenable_fifo));
   OAI21X1 FE_RC_1475_0 (.Y(FE_RN_901_0), 
	.C(FE_RN_902_0), 
	.B(FE_RN_903_0), 
	.A(n179));
   AND2X2 FE_RC_1474_0 (.Y(n188), 
	.B(FE_RN_901_0), 
	.A(FE_RN_906_0));
   INVX2 FE_RC_1454_0 (.Y(FE_RN_884_0), 
	.A(FE_OCPN260_wenable_fifo));
   INVX2 FE_RC_1453_0 (.Y(FE_RN_883_0), 
	.A(n212));
   NAND2X1 FE_RC_1452_0 (.Y(FE_RN_882_0), 
	.B(FE_OCPN90_FE_OFN44_n175), 
	.A(\fiforeg[1][0] ));
   NAND2X1 FE_RC_1451_0 (.Y(FE_RN_881_0), 
	.B(FE_OCP_RBN316_FE_OFN51_n174), 
	.A(\fiforeg[3][0] ));
   AOI22X1 FE_RC_1450_0 (.Y(FE_RN_880_0), 
	.D(FE_OCP_RBN358_n173), 
	.C(\fiforeg[5][0] ), 
	.B(FE_OCP_RBN346_n172), 
	.A(\fiforeg[7][0] ));
   NAND2X1 FE_RC_1448_0 (.Y(FE_RN_878_0), 
	.B(FE_RN_879_0), 
	.A(FE_RN_883_0));
   INVX1 FE_RC_1447_0 (.Y(FE_RN_877_0), 
	.A(n69));
   NAND2X1 FE_RC_1446_0 (.Y(FE_RN_876_0), 
	.B(FE_RN_878_0), 
	.A(FE_RN_877_0));
   AOI22X1 FE_RC_1445_0 (.Y(FE_OFN72_n186), 
	.D(FE_RN_876_0), 
	.C(FE_RN_884_0), 
	.B(FE_OCPN260_wenable_fifo), 
	.A(wdata[0]));
   INVX4 FE_RC_1444_0 (.Y(FE_RN_875_0), 
	.A(FE_OCPN105_wenable_fifo));
   INVX4 FE_RC_1443_0 (.Y(FE_RN_874_0), 
	.A(n212));
   AOI22X1 FE_RC_1441_0 (.Y(FE_RN_872_0), 
	.D(FE_OCP_RBN343_n172), 
	.C(\fiforeg[7][1] ), 
	.B(FE_OCP_RBN359_n173), 
	.A(\fiforeg[5][1] ));
   NAND2X1 FE_RC_1440_0 (.Y(FE_RN_871_0), 
	.B(FE_RN_873_0), 
	.A(FE_RN_872_0));
   NAND2X1 FE_RC_1439_0 (.Y(FE_RN_870_0), 
	.B(FE_RN_871_0), 
	.A(FE_RN_874_0));
   INVX2 FE_RC_1438_0 (.Y(FE_RN_869_0), 
	.A(n75));
   NAND2X1 FE_RC_1437_0 (.Y(FE_RN_868_0), 
	.B(FE_RN_869_0), 
	.A(FE_RN_870_0));
   AOI22X1 FE_RC_1436_0 (.Y(n184), 
	.D(FE_RN_868_0), 
	.C(FE_RN_875_0), 
	.B(FE_OCPN105_wenable_fifo), 
	.A(wdata[1]));
   AOI22X1 FE_RC_1324_0 (.Y(n165), 
	.D(FE_OCP_RBN347_n172), 
	.C(\fiforeg[6][6] ), 
	.B(FE_OCP_RBN358_n173), 
	.A(\fiforeg[4][6] ));
   AND2X2 FE_RC_1323_0 (.Y(FE_RN_805_0), 
	.B(\fiforeg[6][2] ), 
	.A(FE_OCP_RBN345_n172));
   AOI21X1 FE_RC_1322_0 (.Y(n77), 
	.C(FE_RN_805_0), 
	.B(FE_OCP_RBN358_n173), 
	.A(\fiforeg[4][2] ));
   AOI22X1 FE_RC_1320_0 (.Y(n159), 
	.D(FE_OCP_RBN342_n172), 
	.C(\fiforeg[6][5] ), 
	.B(FE_OCP_RBN358_n173), 
	.A(\fiforeg[4][5] ));
   AND2X2 FE_RC_1319_0 (.Y(FE_RN_804_0), 
	.B(\fiforeg[6][0] ), 
	.A(FE_OCP_RBN344_n172));
   AOI21X1 FE_RC_1318_0 (.Y(n65), 
	.C(FE_RN_804_0), 
	.B(FE_OCP_RBN358_n173), 
	.A(\fiforeg[4][0] ));
   AOI22X1 FE_RC_1155_0 (.Y(FE_RN_683_0), 
	.D(\fiforeg[3][6] ), 
	.C(FE_OFN51_n174), 
	.B(\fiforeg[1][6] ), 
	.A(FE_OCPN90_FE_OFN44_n175));
   AOI22X1 FE_RC_1154_0 (.Y(FE_RN_682_0), 
	.D(FE_OCP_RBN358_n173), 
	.C(\fiforeg[5][6] ), 
	.B(\fiforeg[7][6] ), 
	.A(FE_OCP_RBN345_n172));
   AOI21X1 FE_RC_1153_0 (.Y(n168), 
	.C(n212), 
	.B(FE_RN_682_0), 
	.A(FE_RN_683_0));
   INVX4 FE_RC_960_0 (.Y(FE_RN_585_0), 
	.A(FE_OFN66_n183));
   INVX2 FE_RC_950_0 (.Y(FE_RN_580_0), 
	.A(FE_OFN48_n214));
   INVX4 FE_RC_940_0 (.Y(FE_RN_575_0), 
	.A(FE_OFN47_n232));
   INVX4 FE_RC_932_0 (.Y(FE_RN_571_0), 
	.A(FE_OFN67_n241));
   MUX2X1 FE_RC_931_0 (.Y(n113), 
	.S(FE_RN_571_0), 
	.B(n248), 
	.A(FE_OCPN212_FE_OFN72_n186));
   INVX2 FE_RC_928_0 (.Y(FE_RN_569_0), 
	.A(FE_OFN46_n250));
   INVX2 FE_RC_906_0 (.Y(FE_RN_556_0), 
	.A(FE_OFN48_n214));
   MUX2X1 FE_RC_905_0 (.Y(n141), 
	.S(FE_RN_556_0), 
	.B(n217), 
	.A(FE_OCP_RBN326_n195));
   INVX4 FE_RC_900_0 (.Y(FE_RN_553_0), 
	.A(FE_OFN66_n183));
   MUX2X1 FE_RC_899_0 (.Y(n101), 
	.S(FE_RN_553_0), 
	.B(n261), 
	.A(FE_OCP_RBN326_n195));
   AOI22X1 FE_RC_846_0 (.Y(n70), 
	.D(FE_OCPN125_FE_OFN44_n175), 
	.C(\fiforeg[0][1] ), 
	.B(FE_OFN51_n174), 
	.A(\fiforeg[2][1] ));
   BUFX2 FE_OCPC233_n175 (.Y(FE_OCPN233_n175), 
	.A(n175));
   INVX4 FE_RC_812_0 (.Y(FE_RN_513_0), 
	.A(FE_OFN49_n190));
   INVX4 FE_RC_810_0 (.Y(FE_RN_512_0), 
	.A(FE_OFN49_n190));
   INVX4 FE_RC_808_0 (.Y(FE_RN_511_0), 
	.A(FE_OFN69_n203));
   INVX2 FE_RC_802_0 (.Y(FE_RN_508_0), 
	.A(FE_OFN48_n214));
   INVX1 FE_RC_800_0 (.Y(FE_RN_507_0), 
	.A(FE_OFN48_n214));
   INVX4 FE_RC_796_0 (.Y(FE_RN_505_0), 
	.A(FE_OFN47_n232));
   INVX4 FE_RC_794_0 (.Y(FE_RN_504_0), 
	.A(FE_OFN47_n232));
   INVX2 FE_RC_786_0 (.Y(FE_RN_500_0), 
	.A(FE_OFN46_n250));
   INVX4 FE_RC_782_0 (.Y(FE_RN_498_0), 
	.A(FE_OFN46_n250));
   OR2X1 FE_RC_767_0 (.Y(FE_RN_489_0), 
	.B(wdata[2]), 
	.A(FE_RN_348_0));
   NAND2X1 FE_RC_766_0 (.Y(n181), 
	.B(FE_RN_339_0), 
	.A(FE_RN_489_0));
   INVX4 FE_RC_765_0 (.Y(FE_RN_488_0), 
	.A(FE_OCPN141_wenable_fifo));
   AOI22X1 FE_RC_764_0 (.Y(n191), 
	.D(N18), 
	.C(FE_RN_488_0), 
	.B(FE_OCPN141_wenable_fifo), 
	.A(wdata[6]));
   NAND3X1 FE_RC_750_0 (.Y(FE_RN_342_0), 
	.C(FE_RN_345_0), 
	.B(FE_RN_344_0), 
	.A(FE_RN_343_0));
   AOI22X1 FE_RC_749_0 (.Y(n158), 
	.D(FE_OCP_RBN315_FE_OFN51_n174), 
	.C(\fiforeg[2][5] ), 
	.B(FE_OCPN91_FE_OFN44_n175), 
	.A(\fiforeg[0][5] ));
   BUFX4 FE_OCPC212_FE_OFN72_n186 (.Y(FE_OCPN212_FE_OFN72_n186), 
	.A(FE_OFN72_n186));
   BUFX2 FE_OCPC194_wenable_fifo (.Y(FE_OCPN194_wenable_fifo), 
	.A(FE_OCPN140_wenable_fifo));
   BUFX2 FE_OCPC181_wenable_fifo (.Y(FE_OCPN181_wenable_fifo), 
	.A(FE_OFN3_wenable_fifo));
   BUFX2 FE_OCPC165_FE_OFN44_n175 (.Y(FE_OCPN165_FE_OFN44_n175), 
	.A(FE_OCPN90_FE_OFN44_n175));
   BUFX2 FE_OCPC153_n175 (.Y(FE_OCPN153_n175), 
	.A(FE_OCPN233_n175));
   INVX4 FE_RC_699_0 (.Y(FE_RN_456_0), 
	.A(FE_OFN49_n190));
   INVX2 FE_RC_617_0 (.Y(FE_RN_396_0), 
	.A(\fiforeg[7][7] ));
   INVX4 FE_RC_616_0 (.Y(FE_RN_395_0), 
	.A(FE_OFN49_n190));
   MUX2X1 FE_RC_615_0 (.Y(n96), 
	.S(FE_RN_395_0), 
	.B(FE_RN_396_0), 
	.A(FE_OCPN97_n188));
   INVX2 FE_RC_614_0 (.Y(FE_RN_394_0), 
	.A(\fiforeg[7][3] ));
   INVX4 FE_RC_613_0 (.Y(FE_RN_393_0), 
	.A(FE_OFN49_n190));
   MUX2X1 FE_RC_612_0 (.Y(n92), 
	.S(FE_RN_393_0), 
	.B(FE_RN_394_0), 
	.A(FE_OCPN95_n197));
   INVX2 FE_RC_611_0 (.Y(FE_RN_392_0), 
	.A(\fiforeg[0][7] ));
   INVX4 FE_RC_610_0 (.Y(FE_RN_391_0), 
	.A(FE_OFN69_n203));
   MUX2X1 FE_RC_609_0 (.Y(n152), 
	.S(FE_RN_391_0), 
	.B(FE_RN_392_0), 
	.A(FE_OCPN96_n188));
   INVX2 FE_RC_608_0 (.Y(FE_RN_390_0), 
	.A(\fiforeg[0][3] ));
   INVX4 FE_RC_607_0 (.Y(FE_RN_389_0), 
	.A(FE_OFN69_n203));
   MUX2X1 FE_RC_606_0 (.Y(n148), 
	.S(FE_RN_389_0), 
	.B(FE_RN_390_0), 
	.A(FE_OCPN94_n197));
   INVX4 FE_RC_604_0 (.Y(FE_RN_387_0), 
	.A(FE_OFN48_n214));
   INVX2 FE_RC_602_0 (.Y(FE_RN_386_0), 
	.A(\fiforeg[1][3] ));
   INVX2 FE_RC_601_0 (.Y(FE_RN_385_0), 
	.A(FE_OFN48_n214));
   MUX2X1 FE_RC_600_0 (.Y(n140), 
	.S(FE_RN_385_0), 
	.B(FE_RN_386_0), 
	.A(FE_OCPN94_n197));
   INVX2 FE_RC_596_0 (.Y(FE_RN_382_0), 
	.A(\fiforeg[2][3] ));
   INVX4 FE_RC_595_0 (.Y(FE_RN_381_0), 
	.A(FE_OFN68_n223));
   MUX2X1 FE_RC_594_0 (.Y(n132), 
	.S(FE_RN_381_0), 
	.B(FE_RN_382_0), 
	.A(FE_OCPN95_n197));
   INVX2 FE_RC_590_0 (.Y(FE_RN_378_0), 
	.A(\fiforeg[3][3] ));
   INVX4 FE_RC_589_0 (.Y(FE_RN_377_0), 
	.A(FE_OFN47_n232));
   MUX2X1 FE_RC_588_0 (.Y(n124), 
	.S(FE_RN_377_0), 
	.B(FE_RN_378_0), 
	.A(FE_OCPN94_n197));
   INVX2 FE_RC_587_0 (.Y(FE_RN_376_0), 
	.A(\fiforeg[4][7] ));
   INVX4 FE_RC_586_0 (.Y(FE_RN_375_0), 
	.A(FE_OFN67_n241));
   MUX2X1 FE_RC_585_0 (.Y(n120), 
	.S(FE_RN_375_0), 
	.B(FE_RN_376_0), 
	.A(FE_OCPN96_n188));
   INVX4 FE_RC_580_0 (.Y(FE_RN_371_0), 
	.A(FE_OFN67_n241));
   INVX4 FE_RC_577_0 (.Y(FE_RN_369_0), 
	.A(FE_OFN46_n250));
   INVX2 FE_RC_571_0 (.Y(FE_RN_365_0), 
	.A(FE_OFN46_n250));
   INVX2 FE_RC_569_0 (.Y(FE_RN_364_0), 
	.A(\fiforeg[6][7] ));
   INVX4 FE_RC_568_0 (.Y(FE_RN_363_0), 
	.A(FE_OFN66_n183));
   MUX2X1 FE_RC_567_0 (.Y(n104), 
	.S(FE_RN_363_0), 
	.B(FE_RN_364_0), 
	.A(FE_OCPN96_n188));
   INVX1 FE_RC_563_0 (.Y(FE_RN_360_0), 
	.A(FE_OCPN140_wenable_fifo));
   INVX2 FE_RC_562_0 (.Y(FE_RN_359_0), 
	.A(n163));
   NAND2X1 FE_RC_561_0 (.Y(FE_RN_358_0), 
	.B(FE_OCP_RBN322_FE_OFN51_n174), 
	.A(\fiforeg[3][5] ));
   NAND2X1 FE_RC_560_0 (.Y(FE_RN_357_0), 
	.B(FE_OCPN165_FE_OFN44_n175), 
	.A(\fiforeg[1][5] ));
   NAND2X1 FE_RC_559_0 (.Y(FE_RN_356_0), 
	.B(FE_RN_357_0), 
	.A(FE_RN_358_0));
   NAND2X1 FE_RC_558_0 (.Y(FE_RN_355_0), 
	.B(FE_OCP_RBN342_n172), 
	.A(\fiforeg[7][5] ));
   NAND2X1 FE_RC_557_0 (.Y(FE_RN_354_0), 
	.B(FE_OCP_RBN358_n173), 
	.A(\fiforeg[5][5] ));
   NAND2X1 FE_RC_556_0 (.Y(FE_RN_353_0), 
	.B(FE_RN_354_0), 
	.A(FE_RN_355_0));
   INVX2 FE_RC_555_0 (.Y(FE_RN_352_0), 
	.A(n212));
   OAI21X1 FE_RC_554_0 (.Y(FE_RN_351_0), 
	.C(FE_RN_352_0), 
	.B(FE_RN_353_0), 
	.A(FE_RN_356_0));
   NAND2X1 FE_RC_553_0 (.Y(FE_RN_350_0), 
	.B(FE_RN_351_0), 
	.A(FE_RN_359_0));
   AND2X2 FE_RC_552_0 (.Y(FE_RN_349_0), 
	.B(wdata[5]), 
	.A(FE_OCPN140_wenable_fifo));
   AOI21X1 FE_RC_551_0 (.Y(n193), 
	.C(FE_RN_349_0), 
	.B(FE_RN_350_0), 
	.A(FE_RN_360_0));
   INVX1 FE_RC_550_0 (.Y(FE_RN_348_0), 
	.A(wenable));
   INVX2 FE_RC_549_0 (.Y(FE_RN_347_0), 
	.A(FE_OCPN143_wenable_fifo));
   INVX1 FE_RC_548_0 (.Y(FE_RN_346_0), 
	.A(n212));
   NAND2X1 FE_RC_547_0 (.Y(FE_RN_345_0), 
	.B(FE_OCP_RBN320_FE_OFN51_n174), 
	.A(\fiforeg[3][2] ));
   NAND2X1 FE_RC_546_0 (.Y(FE_RN_344_0), 
	.B(\fiforeg[1][2] ), 
	.A(FE_OCPN248_FE_OFN44_n175));
   NAND2X1 FE_RC_543_0 (.Y(FE_RN_341_0), 
	.B(FE_RN_342_0), 
	.A(FE_RN_346_0));
   INVX2 FE_RC_542_0 (.Y(FE_RN_340_0), 
	.A(n81));
   NAND3X1 FE_RC_541_0 (.Y(FE_RN_339_0), 
	.C(FE_RN_340_0), 
	.B(FE_RN_347_0), 
	.A(FE_RN_341_0));
   INVX4 FE_RC_470_0 (.Y(FE_RN_286_0), 
	.A(FE_OFN69_n203));
   INVX4 FE_RC_459_0 (.Y(FE_RN_280_0), 
	.A(FE_OFN68_n223));
   INVX4 FE_RC_442_0 (.Y(FE_RN_271_0), 
	.A(FE_OFN46_n250));
   INVX4 FE_RC_422_0 (.Y(FE_RN_259_0), 
	.A(FE_OFN49_n190));
   INVX4 FE_RC_418_0 (.Y(FE_RN_257_0), 
	.A(FE_OFN69_n203));
   INVX4 FE_RC_412_0 (.Y(FE_RN_254_0), 
	.A(FE_OFN48_n214));
   INVX4 FE_RC_406_0 (.Y(FE_RN_251_0), 
	.A(FE_OFN68_n223));
   INVX4 FE_RC_400_0 (.Y(FE_RN_248_0), 
	.A(FE_OFN47_n232));
   INVX2 FE_RC_369_0 (.Y(FE_RN_231_0), 
	.A(FE_OCPN106_wenable_fifo));
   AOI22X1 FE_RC_368_0 (.Y(n195), 
	.D(N20), 
	.C(FE_RN_231_0), 
	.B(FE_OCPN106_wenable_fifo), 
	.A(wdata[4]));
   AOI22X1 FE_RC_336_0 (.Y(n153), 
	.D(FE_OCP_RBN358_n173), 
	.C(\fiforeg[4][4] ), 
	.B(FE_OCP_RBN342_n172), 
	.A(\fiforeg[6][4] ));
   AOI22X1 FE_RC_334_0 (.Y(n171), 
	.D(FE_OCP_RBN359_n173), 
	.C(\fiforeg[4][7] ), 
	.B(FE_OCP_RBN343_n172), 
	.A(\fiforeg[6][7] ));
   AOI22X1 FE_RC_332_0 (.Y(n64), 
	.D(FE_OCPN90_FE_OFN44_n175), 
	.C(\fiforeg[0][0] ), 
	.B(FE_OFN51_n174), 
	.A(\fiforeg[2][0] ));
   AOI22X1 FE_RC_327_0 (.Y(n154), 
	.D(FE_OCPN90_FE_OFN44_n175), 
	.C(\fiforeg[1][4] ), 
	.B(FE_OFN51_n174), 
	.A(\fiforeg[3][4] ));
   BUFX2 FE_OCPC143_wenable_fifo (.Y(FE_OCPN143_wenable_fifo), 
	.A(FE_OCPN181_wenable_fifo));
   BUFX2 FE_OCPC142_wenable_fifo (.Y(FE_OCPN142_wenable_fifo), 
	.A(FE_OFN3_wenable_fifo));
   BUFX4 FE_OCPC141_wenable_fifo (.Y(FE_OCPN141_wenable_fifo), 
	.A(FE_OCPN181_wenable_fifo));
   BUFX4 FE_OCPC140_wenable_fifo (.Y(FE_OCPN140_wenable_fifo), 
	.A(FE_OFN3_wenable_fifo));
   BUFX2 FE_OCPC136_FE_OFN72_n186 (.Y(FE_OCPN136_FE_OFN72_n186), 
	.A(FE_OFN72_n186));
   BUFX4 FE_OCPC125_FE_OFN44_n175 (.Y(FE_OCPN125_FE_OFN44_n175), 
	.A(FE_OCPN233_n175));
   BUFX2 FE_OCPC116_n211 (.Y(FE_OCPN116_n211), 
	.A(n211));
   BUFX4 FE_OCPC111_n181 (.Y(FE_OCPN111_n181), 
	.A(n181));
   BUFX4 FE_OCPC106_wenable_fifo (.Y(FE_OCPN106_wenable_fifo), 
	.A(FE_OCPN142_wenable_fifo));
   BUFX4 FE_OCPC105_wenable_fifo (.Y(FE_OCPN105_wenable_fifo), 
	.A(wenable));
   BUFX4 FE_OCPC99_n184 (.Y(FE_OCPN99_n184), 
	.A(n184));
   BUFX2 FE_OCPC98_n184 (.Y(FE_OCPN98_n184), 
	.A(n184));
   BUFX4 FE_OCPC97_n188 (.Y(FE_OCPN97_n188), 
	.A(n188));
   BUFX4 FE_OCPC96_n188 (.Y(FE_OCPN96_n188), 
	.A(n188));
   BUFX4 FE_OCPC95_n197 (.Y(FE_OCPN95_n197), 
	.A(n197));
   BUFX4 FE_OCPC94_n197 (.Y(FE_OCPN94_n197), 
	.A(n197));
   BUFX2 FE_OCPC91_FE_OFN44_n175 (.Y(FE_OCPN91_FE_OFN44_n175), 
	.A(FE_OCPN90_FE_OFN44_n175));
   BUFX4 FE_OCPC90_FE_OFN44_n175 (.Y(FE_OCPN90_FE_OFN44_n175), 
	.A(n175));
   BUFX4 FE_OFC69_n203 (.Y(FE_OFN69_n203), 
	.A(n203));
   BUFX4 FE_OFC68_n223 (.Y(FE_OFN68_n223), 
	.A(n223));
   BUFX4 FE_OFC67_n241 (.Y(FE_OFN67_n241), 
	.A(n241));
   BUFX4 FE_OFC66_n183 (.Y(FE_OFN66_n183), 
	.A(n183));
   INVX2 FE_OFC64_n54 (.Y(FE_OFN64_n54), 
	.A(FE_OFN61_n54));
   INVX4 FE_OFC63_n54 (.Y(FE_OFN63_n54), 
	.A(FE_OFN61_n54));
   INVX2 FE_OFC62_n54 (.Y(FE_OFN62_n54), 
	.A(FE_OFN61_n54));
   INVX4 FE_OFC61_n54 (.Y(FE_OFN61_n54), 
	.A(n54));
   INVX2 FE_OFC60_n53 (.Y(FE_OFN60_n53), 
	.A(FE_OFN57_n53));
   INVX4 FE_OFC59_n53 (.Y(FE_OFN59_n53), 
	.A(FE_OFN57_n53));
   INVX2 FE_OFC58_n53 (.Y(FE_OFN58_n53), 
	.A(FE_OFN57_n53));
   INVX2 FE_OFC57_n53 (.Y(FE_OFN57_n53), 
	.A(n53));
   BUFX4 FE_OFC56_n55 (.Y(FE_OFN56_n55), 
	.A(n55));
   INVX8 FE_OFC51_n174 (.Y(FE_OFN51_n174), 
	.A(FE_OFN50_n174));
   INVX2 FE_OFC50_n174 (.Y(FE_OFN50_n174), 
	.A(n174));
   BUFX4 FE_OFC49_n190 (.Y(FE_OFN49_n190), 
	.A(n190));
   BUFX4 FE_OFC48_n214 (.Y(FE_OFN48_n214), 
	.A(n214));
   BUFX4 FE_OFC47_n232 (.Y(FE_OFN47_n232), 
	.A(n232));
   BUFX4 FE_OFC46_n250 (.Y(FE_OFN46_n250), 
	.A(n250));
   BUFX4 FE_OFC45_n56 (.Y(FE_OFN45_n56), 
	.A(n56));
   DFFPOSX1 \fiforeg_reg[0][7]  (.Q(\fiforeg[0][7] ), 
	.D(n152), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[0][6]  (.Q(\fiforeg[0][6] ), 
	.D(n151), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[0][5]  (.Q(\fiforeg[0][5] ), 
	.D(n150), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[0][4]  (.Q(\fiforeg[0][4] ), 
	.D(n149), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[0][3]  (.Q(\fiforeg[0][3] ), 
	.D(n148), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[0][2]  (.Q(\fiforeg[0][2] ), 
	.D(n147), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[0][1]  (.Q(\fiforeg[0][1] ), 
	.D(n146), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[0][0]  (.Q(\fiforeg[0][0] ), 
	.D(n145), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[1][7]  (.Q(\fiforeg[1][7] ), 
	.D(n144), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[1][6]  (.Q(\fiforeg[1][6] ), 
	.D(n143), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[1][5]  (.Q(\fiforeg[1][5] ), 
	.D(n142), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[1][4]  (.Q(\fiforeg[1][4] ), 
	.D(n141), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[1][3]  (.Q(\fiforeg[1][3] ), 
	.D(n140), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[1][2]  (.Q(\fiforeg[1][2] ), 
	.D(n139), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[1][1]  (.Q(\fiforeg[1][1] ), 
	.D(FE_PSN361_n138), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[1][0]  (.Q(\fiforeg[1][0] ), 
	.D(n137), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[2][7]  (.Q(\fiforeg[2][7] ), 
	.D(n136), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[2][6]  (.Q(\fiforeg[2][6] ), 
	.D(n135), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[2][5]  (.Q(\fiforeg[2][5] ), 
	.D(n134), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[2][4]  (.Q(\fiforeg[2][4] ), 
	.D(n133), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[2][3]  (.Q(\fiforeg[2][3] ), 
	.D(n132), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[2][2]  (.Q(\fiforeg[2][2] ), 
	.D(n131), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[2][1]  (.Q(\fiforeg[2][1] ), 
	.D(n130), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[2][0]  (.Q(\fiforeg[2][0] ), 
	.D(n129), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[3][7]  (.Q(\fiforeg[3][7] ), 
	.D(n128), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[3][6]  (.Q(\fiforeg[3][6] ), 
	.D(n127), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[3][5]  (.Q(\fiforeg[3][5] ), 
	.D(n126), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[3][4]  (.Q(\fiforeg[3][4] ), 
	.D(n125), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[3][3]  (.Q(\fiforeg[3][3] ), 
	.D(n124), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[3][2]  (.Q(\fiforeg[3][2] ), 
	.D(n123), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[3][1]  (.Q(\fiforeg[3][1] ), 
	.D(n122), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[3][0]  (.Q(\fiforeg[3][0] ), 
	.D(n121), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[4][7]  (.Q(\fiforeg[4][7] ), 
	.D(n120), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[4][6]  (.Q(\fiforeg[4][6] ), 
	.D(n119), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[4][5]  (.Q(\fiforeg[4][5] ), 
	.D(n118), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[4][4]  (.Q(\fiforeg[4][4] ), 
	.D(n117), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[4][3]  (.Q(\fiforeg[4][3] ), 
	.D(n116), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[4][2]  (.Q(\fiforeg[4][2] ), 
	.D(n115), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[4][1]  (.Q(\fiforeg[4][1] ), 
	.D(n114), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[4][0]  (.Q(\fiforeg[4][0] ), 
	.D(n113), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[5][7]  (.Q(\fiforeg[5][7] ), 
	.D(n112), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[5][6]  (.Q(\fiforeg[5][6] ), 
	.D(n111), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[5][5]  (.Q(\fiforeg[5][5] ), 
	.D(n110), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[5][4]  (.Q(\fiforeg[5][4] ), 
	.D(n109), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[5][3]  (.Q(\fiforeg[5][3] ), 
	.D(n108), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[5][2]  (.Q(\fiforeg[5][2] ), 
	.D(n107), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[5][1]  (.Q(\fiforeg[5][1] ), 
	.D(n106), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[5][0]  (.Q(\fiforeg[5][0] ), 
	.D(n105), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[6][7]  (.Q(\fiforeg[6][7] ), 
	.D(n104), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[6][6]  (.Q(\fiforeg[6][6] ), 
	.D(n103), 
	.CLK(nclk__L2_N5));
   DFFPOSX1 \fiforeg_reg[6][5]  (.Q(\fiforeg[6][5] ), 
	.D(n102), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[6][4]  (.Q(\fiforeg[6][4] ), 
	.D(n101), 
	.CLK(nclk__L2_N4));
   DFFPOSX1 \fiforeg_reg[6][3]  (.Q(\fiforeg[6][3] ), 
	.D(n100), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[6][2]  (.Q(\fiforeg[6][2] ), 
	.D(n99), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[6][1]  (.Q(\fiforeg[6][1] ), 
	.D(n98), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[6][0]  (.Q(\fiforeg[6][0] ), 
	.D(n97), 
	.CLK(wclk));
   DFFPOSX1 \fiforeg_reg[7][7]  (.Q(\fiforeg[7][7] ), 
	.D(n96), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[7][6]  (.Q(\fiforeg[7][6] ), 
	.D(n95), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[7][5]  (.Q(\fiforeg[7][5] ), 
	.D(n94), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[7][4]  (.Q(\fiforeg[7][4] ), 
	.D(n93), 
	.CLK(nclk__L2_N6));
   DFFPOSX1 \fiforeg_reg[7][3]  (.Q(\fiforeg[7][3] ), 
	.D(n92), 
	.CLK(nclk__L2_N3));
   DFFPOSX1 \fiforeg_reg[7][2]  (.Q(\fiforeg[7][2] ), 
	.D(n91), 
	.CLK(nclk__L2_N7));
   DFFPOSX1 \fiforeg_reg[7][1]  (.Q(\fiforeg[7][1] ), 
	.D(n90), 
	.CLK(nclk__L2_N2));
   DFFPOSX1 \fiforeg_reg[7][0]  (.Q(\fiforeg[7][0] ), 
	.D(n89), 
	.CLK(wclk));
   NOR2X1 U10 (.Y(n54), 
	.B(N11), 
	.A(n63));
   NOR2X1 U11 (.Y(n53), 
	.B(FE_OCPN243_n62), 
	.A(n63));
   AOI22X1 U12 (.Y(n10), 
	.D(FE_OFN58_n53), 
	.C(\fiforeg[6][0] ), 
	.B(FE_OFN62_n54), 
	.A(\fiforeg[4][0] ));
   NOR2X1 U13 (.Y(n56), 
	.B(N12), 
	.A(N11));
   NOR2X1 U14 (.Y(n55), 
	.B(n62), 
	.A(N12));
   AOI22X1 U15 (.Y(n9), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[2][0] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[0][0] ));
   AOI21X1 U16 (.Y(n14), 
	.C(N10), 
	.B(n9), 
	.A(n10));
   AOI22X1 U17 (.Y(n12), 
	.D(FE_OFN58_n53), 
	.C(\fiforeg[7][0] ), 
	.B(FE_OFN62_n54), 
	.A(\fiforeg[5][0] ));
   AOI22X1 U18 (.Y(n11), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[3][0] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[1][0] ));
   AOI21X1 U19 (.Y(n13), 
	.C(n61), 
	.B(n11), 
	.A(n12));
   OR2X2 U20 (.Y(rdata[0]), 
	.B(n13), 
	.A(n14));
   AOI22X1 U21 (.Y(n16), 
	.D(FE_OFN58_n53), 
	.C(\fiforeg[6][1] ), 
	.B(FE_OFN62_n54), 
	.A(\fiforeg[4][1] ));
   AOI22X1 U22 (.Y(n15), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[2][1] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[0][1] ));
   AOI21X1 U23 (.Y(n20), 
	.C(N10), 
	.B(n16), 
	.A(n15));
   AOI22X1 U24 (.Y(n18), 
	.D(FE_OFN58_n53), 
	.C(\fiforeg[7][1] ), 
	.B(FE_OFN62_n54), 
	.A(\fiforeg[5][1] ));
   AOI22X1 U25 (.Y(n17), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[3][1] ), 
	.B(\fiforeg[1][1] ), 
	.A(FE_OFN45_n56));
   AOI21X1 U26 (.Y(n19), 
	.C(n61), 
	.B(n18), 
	.A(n17));
   OR2X2 U27 (.Y(rdata[1]), 
	.B(n19), 
	.A(n20));
   AOI22X1 U28 (.Y(n22), 
	.D(FE_OFN60_n53), 
	.C(\fiforeg[6][2] ), 
	.B(FE_OFN64_n54), 
	.A(\fiforeg[4][2] ));
   AOI22X1 U29 (.Y(n21), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[2][2] ), 
	.B(\fiforeg[0][2] ), 
	.A(FE_OFN45_n56));
   AOI21X1 U30 (.Y(n26), 
	.C(N10), 
	.B(n22), 
	.A(n21));
   AOI22X1 U31 (.Y(n24), 
	.D(FE_OFN60_n53), 
	.C(\fiforeg[7][2] ), 
	.B(FE_OFN64_n54), 
	.A(\fiforeg[5][2] ));
   AOI22X1 U32 (.Y(n23), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[3][2] ), 
	.B(\fiforeg[1][2] ), 
	.A(FE_OFN45_n56));
   AOI21X1 U33 (.Y(n25), 
	.C(n61), 
	.B(n24), 
	.A(n23));
   OR2X2 U34 (.Y(rdata[2]), 
	.B(n25), 
	.A(n26));
   AOI22X1 U35 (.Y(n28), 
	.D(FE_OFN59_n53), 
	.C(\fiforeg[6][3] ), 
	.B(FE_OFN63_n54), 
	.A(\fiforeg[4][3] ));
   AOI22X1 U36 (.Y(n27), 
	.D(n55), 
	.C(\fiforeg[2][3] ), 
	.B(n56), 
	.A(\fiforeg[0][3] ));
   AOI21X1 U37 (.Y(n32), 
	.C(N10), 
	.B(n27), 
	.A(n28));
   AOI22X1 U38 (.Y(n30), 
	.D(FE_OFN59_n53), 
	.C(\fiforeg[7][3] ), 
	.B(FE_OFN63_n54), 
	.A(\fiforeg[5][3] ));
   AOI22X1 U39 (.Y(n29), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[3][3] ), 
	.B(\fiforeg[1][3] ), 
	.A(FE_OFN45_n56));
   AOI21X1 U40 (.Y(n31), 
	.C(n61), 
	.B(n30), 
	.A(n29));
   OR2X2 U41 (.Y(rdata[3]), 
	.B(n31), 
	.A(n32));
   AOI22X1 U42 (.Y(n34), 
	.D(FE_OFN59_n53), 
	.C(\fiforeg[6][4] ), 
	.B(FE_OFN63_n54), 
	.A(\fiforeg[4][4] ));
   AOI22X1 U43 (.Y(n33), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[2][4] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[0][4] ));
   AOI21X1 U44 (.Y(n38), 
	.C(N10), 
	.B(n34), 
	.A(n33));
   AOI22X1 U45 (.Y(n36), 
	.D(FE_OFN59_n53), 
	.C(\fiforeg[7][4] ), 
	.B(FE_OFN63_n54), 
	.A(\fiforeg[5][4] ));
   AOI22X1 U46 (.Y(n35), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[3][4] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[1][4] ));
   AOI21X1 U47 (.Y(n37), 
	.C(n61), 
	.B(n36), 
	.A(n35));
   OR2X2 U48 (.Y(rdata[4]), 
	.B(n37), 
	.A(n38));
   AOI22X1 U49 (.Y(n40), 
	.D(FE_OFN59_n53), 
	.C(\fiforeg[6][5] ), 
	.B(FE_OFN63_n54), 
	.A(\fiforeg[4][5] ));
   AOI22X1 U50 (.Y(n39), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[2][5] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[0][5] ));
   AOI21X1 U51 (.Y(n44), 
	.C(N10), 
	.B(n40), 
	.A(n39));
   AOI22X1 U52 (.Y(n42), 
	.D(FE_OFN59_n53), 
	.C(\fiforeg[7][5] ), 
	.B(FE_OFN63_n54), 
	.A(\fiforeg[5][5] ));
   AOI22X1 U53 (.Y(n41), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[3][5] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[1][5] ));
   AOI21X1 U54 (.Y(n43), 
	.C(n61), 
	.B(n42), 
	.A(n41));
   OR2X2 U55 (.Y(rdata[5]), 
	.B(n43), 
	.A(n44));
   AOI22X1 U56 (.Y(n46), 
	.D(FE_OFN59_n53), 
	.C(\fiforeg[6][6] ), 
	.B(FE_OFN63_n54), 
	.A(\fiforeg[4][6] ));
   AOI22X1 U57 (.Y(n45), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[2][6] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[0][6] ));
   AOI21X1 U58 (.Y(n50), 
	.C(N10), 
	.B(n46), 
	.A(n45));
   AOI22X1 U59 (.Y(n48), 
	.D(FE_OFN59_n53), 
	.C(\fiforeg[7][6] ), 
	.B(FE_OFN63_n54), 
	.A(\fiforeg[5][6] ));
   AOI22X1 U60 (.Y(n47), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[3][6] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[1][6] ));
   AOI21X1 U61 (.Y(n49), 
	.C(n61), 
	.B(n48), 
	.A(n47));
   OR2X2 U62 (.Y(rdata[6]), 
	.B(n49), 
	.A(n50));
   AOI22X1 U63 (.Y(n52), 
	.D(FE_OFN60_n53), 
	.C(\fiforeg[6][7] ), 
	.B(FE_OFN64_n54), 
	.A(\fiforeg[4][7] ));
   AOI22X1 U64 (.Y(n51), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[2][7] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[0][7] ));
   AOI21X1 U65 (.Y(n60), 
	.C(N10), 
	.B(n51), 
	.A(n52));
   AOI22X1 U66 (.Y(n58), 
	.D(FE_OFN60_n53), 
	.C(\fiforeg[7][7] ), 
	.B(FE_OFN64_n54), 
	.A(\fiforeg[5][7] ));
   AOI22X1 U67 (.Y(n57), 
	.D(FE_OFN56_n55), 
	.C(\fiforeg[3][7] ), 
	.B(FE_OFN45_n56), 
	.A(\fiforeg[1][7] ));
   AOI21X1 U68 (.Y(n59), 
	.C(n61), 
	.B(n58), 
	.A(n57));
   OR2X2 U69 (.Y(rdata[7]), 
	.B(n59), 
	.A(n60));
   INVX8 U70 (.Y(n61), 
	.A(N10));
   INVX2 U71 (.Y(n62), 
	.A(N11));
   INVX2 U72 (.Y(n63), 
	.A(N12));
   NOR2X1 U73 (.Y(n173), 
	.B(n211), 
	.A(N14));
   NOR2X1 U74 (.Y(n172), 
	.B(n180), 
	.A(n211));
   NOR2X1 U76 (.Y(n175), 
	.B(N15), 
	.A(N14));
   NOR2X1 U77 (.Y(n174), 
	.B(n180), 
	.A(N15));
   AOI21X1 U79 (.Y(n69), 
	.C(N13), 
	.B(n65), 
	.A(n64));
   AOI22X1 U84 (.Y(n71), 
	.D(FE_OCP_RBN343_n172), 
	.C(\fiforeg[6][1] ), 
	.B(FE_OCP_RBN359_n173), 
	.A(\fiforeg[4][1] ));
   AOI21X1 U86 (.Y(n75), 
	.C(N13), 
	.B(n70), 
	.A(n71));
   AOI22X1 U92 (.Y(n76), 
	.D(FE_OFN51_n174), 
	.C(\fiforeg[2][2] ), 
	.B(FE_OCPN90_FE_OFN44_n175), 
	.A(\fiforeg[0][2] ));
   AOI21X1 U93 (.Y(n81), 
	.C(N13), 
	.B(n76), 
	.A(n77));
   AOI22X1 U98 (.Y(n83), 
	.D(FE_OCP_RBN344_n172), 
	.C(\fiforeg[6][3] ), 
	.B(FE_OCP_RBN359_n173), 
	.A(\fiforeg[4][3] ));
   AOI22X1 U99 (.Y(n82), 
	.D(FE_OCP_RBN314_FE_OFN51_n174), 
	.C(\fiforeg[2][3] ), 
	.B(FE_OCPN153_n175), 
	.A(\fiforeg[0][3] ));
   AOI21X1 U100 (.Y(n87), 
	.C(N13), 
	.B(n82), 
	.A(n83));
   AOI22X1 U106 (.Y(n88), 
	.D(FE_OFN51_n174), 
	.C(\fiforeg[2][4] ), 
	.B(FE_OCPN90_FE_OFN44_n175), 
	.A(\fiforeg[0][4] ));
   AOI21X1 U107 (.Y(n157), 
	.C(N13), 
	.B(n88), 
	.A(n153));
   AOI22X1 U108 (.Y(n155), 
	.D(FE_OCP_RBN342_n172), 
	.C(\fiforeg[7][4] ), 
	.B(FE_OCP_RBN358_n173), 
	.A(\fiforeg[5][4] ));
   AOI21X1 U110 (.Y(n156), 
	.C(n212), 
	.B(n154), 
	.A(n155));
   OR2X2 U111 (.Y(N20), 
	.B(n156), 
	.A(n157));
   AOI21X1 U114 (.Y(n163), 
	.C(N13), 
	.B(n158), 
	.A(n159));
   AOI22X1 U120 (.Y(n164), 
	.D(FE_OFN51_n174), 
	.C(\fiforeg[2][6] ), 
	.B(FE_OCPN90_FE_OFN44_n175), 
	.A(\fiforeg[0][6] ));
   AOI21X1 U121 (.Y(n169), 
	.C(N13), 
	.B(n164), 
	.A(n165));
   OR2X2 U125 (.Y(N18), 
	.B(n168), 
	.A(n169));
   AOI22X1 U127 (.Y(n170), 
	.D(FE_OCP_RBN321_FE_OFN51_n174), 
	.C(\fiforeg[2][7] ), 
	.B(FE_OCPN125_FE_OFN44_n175), 
	.A(\fiforeg[0][7] ));
   AOI21X1 U128 (.Y(n179), 
	.C(N13), 
	.B(n170), 
	.A(n171));
   INVX4 U133 (.Y(n180), 
	.A(N14));
   MUX2X1 U134 (.Y(n99), 
	.S(FE_OFN66_n183), 
	.B(FE_OCPN111_n181), 
	.A(n182));
   INVX1 U135 (.Y(n182), 
	.A(\fiforeg[6][2] ));
   MUX2X1 U136 (.Y(n98), 
	.S(FE_OFN66_n183), 
	.B(FE_OCPN98_n184), 
	.A(n185));
   INVX1 U137 (.Y(n185), 
	.A(\fiforeg[6][1] ));
   MUX2X1 U142 (.Y(n95), 
	.S(FE_OFN49_n190), 
	.B(FE_OCP_RBN328_n191), 
	.A(n192));
   INVX1 U143 (.Y(n192), 
	.A(\fiforeg[7][6] ));
   MUX2X1 U146 (.Y(n93), 
	.S(FE_OFN49_n190), 
	.B(FE_OCP_RBN326_n195), 
	.A(n196));
   INVX1 U147 (.Y(n196), 
	.A(\fiforeg[7][4] ));
   NAND3X1 U155 (.Y(n190), 
	.C(N13), 
	.B(N14), 
	.A(N15));
   MUX2X1 U163 (.Y(n149), 
	.S(FE_OFN69_n203), 
	.B(FE_OCP_RBN326_n195), 
	.A(n206));
   INVX1 U164 (.Y(n206), 
	.A(\fiforeg[0][4] ));
   MUX2X1 U167 (.Y(n147), 
	.S(FE_OFN69_n203), 
	.B(FE_OCPN111_n181), 
	.A(n208));
   INVX1 U168 (.Y(n208), 
	.A(\fiforeg[0][2] ));
   MUX2X1 U171 (.Y(n145), 
	.S(FE_OFN69_n203), 
	.B(FE_OCPN136_FE_OFN72_n186), 
	.A(n210));
   NAND3X1 U172 (.Y(n203), 
	.C(n212), 
	.B(FE_OCPN116_n211), 
	.A(FE_OCP_RBN290_n180));
   INVX1 U173 (.Y(n210), 
	.A(\fiforeg[0][0] ));
   MUX2X1 U178 (.Y(n142), 
	.S(FE_OFN48_n214), 
	.B(FE_OCP_RBN330_n193), 
	.A(n216));
   INVX1 U179 (.Y(n216), 
	.A(\fiforeg[1][5] ));
   INVX1 U181 (.Y(n217), 
	.A(\fiforeg[1][4] ));
   NAND3X1 U189 (.Y(n214), 
	.C(N13), 
	.B(FE_OCPN116_n211), 
	.A(FE_OCP_RBN290_n180));
   MUX2X1 U191 (.Y(n136), 
	.S(FE_OFN68_n223), 
	.B(FE_OCPN96_n188), 
	.A(n222));
   INVX1 U192 (.Y(n222), 
	.A(\fiforeg[2][7] ));
   MUX2X1 U197 (.Y(n133), 
	.S(FE_OFN68_n223), 
	.B(FE_OCP_RBN326_n195), 
	.A(n226));
   INVX1 U198 (.Y(n226), 
	.A(\fiforeg[2][4] ));
   MUX2X1 U205 (.Y(n129), 
	.S(FE_OFN68_n223), 
	.B(FE_OCPN136_FE_OFN72_n186), 
	.A(n230));
   NAND3X1 U206 (.Y(n223), 
	.C(N14), 
	.B(FE_OCPN116_n211), 
	.A(n212));
   INVX1 U207 (.Y(n230), 
	.A(\fiforeg[2][0] ));
   MUX2X1 U208 (.Y(n128), 
	.S(FE_OFN47_n232), 
	.B(FE_OCPN97_n188), 
	.A(n231));
   INVX1 U209 (.Y(n231), 
	.A(\fiforeg[3][7] ));
   MUX2X1 U212 (.Y(n126), 
	.S(FE_OFN47_n232), 
	.B(FE_OCP_RBN330_n193), 
	.A(n234));
   INVX1 U213 (.Y(n234), 
	.A(\fiforeg[3][5] ));
   MUX2X1 U214 (.Y(n125), 
	.S(FE_OFN47_n232), 
	.B(FE_OCP_RBN326_n195), 
	.A(n235));
   INVX1 U215 (.Y(n235), 
	.A(\fiforeg[3][4] ));
   NAND3X1 U223 (.Y(n232), 
	.C(N13), 
	.B(FE_OCPN116_n211), 
	.A(N14));
   INVX2 U224 (.Y(n211), 
	.A(N15));
   MUX2X1 U228 (.Y(n119), 
	.S(FE_OFN67_n241), 
	.B(FE_OCP_RBN328_n191), 
	.A(n242));
   INVX1 U229 (.Y(n242), 
	.A(\fiforeg[4][6] ));
   MUX2X1 U230 (.Y(n118), 
	.S(FE_OFN67_n241), 
	.B(FE_OCP_RBN330_n193), 
	.A(n243));
   INVX1 U231 (.Y(n243), 
	.A(\fiforeg[4][5] ));
   MUX2X1 U232 (.Y(n117), 
	.S(FE_OFN67_n241), 
	.B(FE_OCP_RBN326_n195), 
	.A(n244));
   INVX4 U233 (.Y(n244), 
	.A(\fiforeg[4][4] ));
   MUX2X1 U234 (.Y(n116), 
	.S(FE_OFN67_n241), 
	.B(FE_OCPN95_n197), 
	.A(n245));
   INVX1 U235 (.Y(n245), 
	.A(\fiforeg[4][3] ));
   MUX2X1 U236 (.Y(n115), 
	.S(FE_OFN67_n241), 
	.B(FE_OCPN111_n181), 
	.A(n246));
   INVX1 U237 (.Y(n246), 
	.A(\fiforeg[4][2] ));
   NAND3X1 U241 (.Y(n241), 
	.C(N15), 
	.B(FE_OCP_RBN290_n180), 
	.A(n212));
   INVX1 U242 (.Y(n248), 
	.A(\fiforeg[4][0] ));
   MUX2X1 U249 (.Y(n109), 
	.S(FE_OFN46_n250), 
	.B(FE_OCP_RBN326_n195), 
	.A(n253));
   INVX1 U250 (.Y(n253), 
	.A(\fiforeg[5][4] ));
   MUX2X1 U251 (.Y(n108), 
	.S(FE_OFN46_n250), 
	.B(FE_OCPN95_n197), 
	.A(n254));
   INVX1 U252 (.Y(n254), 
	.A(\fiforeg[5][3] ));
   NAND3X1 U260 (.Y(n250), 
	.C(N13), 
	.B(FE_OCP_RBN290_n180), 
	.A(N15));
   MUX2X1 U266 (.Y(n103), 
	.S(FE_OFN66_n183), 
	.B(FE_OCP_RBN328_n191), 
	.A(n259));
   INVX1 U267 (.Y(n259), 
	.A(\fiforeg[6][6] ));
   MUX2X1 U269 (.Y(n102), 
	.S(FE_OFN66_n183), 
	.B(FE_OCP_RBN330_n193), 
	.A(n260));
   INVX1 U270 (.Y(n260), 
	.A(\fiforeg[6][5] ));
   INVX1 U273 (.Y(n261), 
	.A(\fiforeg[6][4] ));
   MUX2X1 U275 (.Y(n100), 
	.S(FE_OFN66_n183), 
	.B(FE_OCPN94_n197), 
	.A(n262));
   NAND3X1 U276 (.Y(n183), 
	.C(N15), 
	.B(n212), 
	.A(N14));
   INVX8 U277 (.Y(n212), 
	.A(N13));
   INVX1 U278 (.Y(n262), 
	.A(\fiforeg[6][3] ));
endmodule

module write_ptr (
	wclk, 
	rst_n, 
	wenable, 
	wptr, 
	wptr_nxt, 
	FE_OFN42_nn_rst, 
	FE_OFN37_nn_rst, 
	FE_PT1_FE_OFN42_nn_rst, 
	FE_OFN40_nn_rst, 
	FE_PT2_FE_OFN42_nn_rst, 
	FE_PT3_FE_OFN42_nn_rst, 
	FE_OCPN103_wenable_fifo, 
	FE_OCPN203_wptr_nxt_0_, 
	FE_OCPN204_wptr_nxt_1_, 
	nclk__L2_N3, 
	nclk__L2_N4);
   input wclk;
   input rst_n;
   input wenable;
   output [3:0] wptr;
   output [3:0] wptr_nxt;
   input FE_OFN42_nn_rst;
   input FE_OFN37_nn_rst;
   input FE_PT1_FE_OFN42_nn_rst;
   input FE_OFN40_nn_rst;
   input FE_PT2_FE_OFN42_nn_rst;
   input FE_PT3_FE_OFN42_nn_rst;
   input FE_OCPN103_wenable_fifo;
   input FE_OCPN203_wptr_nxt_0_;
   input FE_OCPN204_wptr_nxt_1_;
   input nclk__L2_N3;
   input nclk__L2_N4;

   // Internal wires
   wire FE_OCPN241_binary_nxt_2_;
   wire FE_RN_476_0;
   wire FE_OCPN201_binary_nxt_1_;
   wire FE_OCPN200_binary_nxt_0_;
   wire FE_RN_215_0;
   wire FE_OCPN139_wenable_fifo;
   wire FE_OCPN132_wptr_nxt_3_;
   wire FE_OCPN107_wenable_fifo;
   wire n9;
   wire n10;
   wire n12;
   wire [2:0] binary_nxt;
   wire [3:0] binary_r;

   XOR2X1 FE_RC_1455_0 (.Y(wptr_nxt[2]), 
	.B(wptr_nxt[3]), 
	.A(binary_nxt[2]));
   BUFX2 FE_OCPC241_binary_nxt_2_ (.Y(FE_OCPN241_binary_nxt_2_), 
	.A(binary_nxt[2]));
   AND2X2 FE_RC_735_0 (.Y(n10), 
	.B(FE_RN_215_0), 
	.A(FE_OCPN139_wenable_fifo));
   AND2X2 FE_RC_734_0 (.Y(FE_RN_476_0), 
	.B(binary_r[2]), 
	.A(FE_RN_215_0));
   NAND2X1 FE_RC_733_0 (.Y(n9), 
	.B(FE_OCPN139_wenable_fifo), 
	.A(FE_RN_476_0));
   BUFX2 FE_OCPC201_binary_nxt_1_ (.Y(FE_OCPN201_binary_nxt_1_), 
	.A(binary_nxt[1]));
   BUFX2 FE_OCPC200_binary_nxt_0_ (.Y(FE_OCPN200_binary_nxt_0_), 
	.A(binary_nxt[0]));
   XOR2X1 FE_RC_726_0 (.Y(wptr_nxt[1]), 
	.B(binary_nxt[1]), 
	.A(FE_OCPN241_binary_nxt_2_));
   AND2X2 FE_RC_315_0 (.Y(FE_RN_215_0), 
	.B(binary_r[1]), 
	.A(binary_r[0]));
   BUFX2 FE_OCPC139_wenable_fifo (.Y(FE_OCPN139_wenable_fifo), 
	.A(wenable));
   BUFX2 FE_OCPC132_wptr_nxt_3_ (.Y(FE_OCPN132_wptr_nxt_3_), 
	.A(wptr_nxt[3]));
   BUFX2 FE_OCPC107_wenable_fifo (.Y(FE_OCPN107_wenable_fifo), 
	.A(FE_OCPN103_wenable_fifo));
   DFFSR \binary_r_reg[0]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN42_nn_rst), 
	.Q(binary_r[0]), 
	.D(FE_OCPN200_binary_nxt_0_), 
	.CLK(nclk__L2_N4));
   DFFSR \binary_r_reg[1]  (.S(1'b1), 
	.R(FE_OFN42_nn_rst), 
	.Q(binary_r[1]), 
	.D(FE_OCPN201_binary_nxt_1_), 
	.CLK(nclk__L2_N4));
   DFFSR \binary_r_reg[2]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN42_nn_rst), 
	.Q(binary_r[2]), 
	.D(binary_nxt[2]), 
	.CLK(nclk__L2_N4));
   DFFSR \binary_r_reg[3]  (.S(1'b1), 
	.R(FE_PT2_FE_OFN42_nn_rst), 
	.Q(binary_r[3]), 
	.D(FE_OCPN132_wptr_nxt_3_), 
	.CLK(nclk__L2_N4));
   DFFSR \gray_r_reg[3]  (.S(1'b1), 
	.R(rst_n), 
	.Q(wptr[3]), 
	.D(FE_OCPN132_wptr_nxt_3_), 
	.CLK(wclk));
   DFFSR \gray_r_reg[2]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(wptr[2]), 
	.D(wptr_nxt[2]), 
	.CLK(wclk));
   DFFSR \gray_r_reg[1]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN42_nn_rst), 
	.Q(wptr[1]), 
	.D(FE_OCPN204_wptr_nxt_1_), 
	.CLK(nclk__L2_N3));
   DFFSR \gray_r_reg[0]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(wptr[0]), 
	.D(FE_OCPN203_wptr_nxt_0_), 
	.CLK(nclk__L2_N4));
   XNOR2X1 U12 (.Y(wptr_nxt[3]), 
	.B(binary_r[3]), 
	.A(n9));
   XOR2X1 U15 (.Y(wptr_nxt[0]), 
	.B(binary_nxt[0]), 
	.A(binary_nxt[1]));
   XOR2X1 U16 (.Y(binary_nxt[2]), 
	.B(binary_r[2]), 
	.A(n10));
   XNOR2X1 U19 (.Y(binary_nxt[1]), 
	.B(binary_r[1]), 
	.A(n12));
   NAND2X1 U20 (.Y(n12), 
	.B(FE_OCPN103_wenable_fifo), 
	.A(binary_r[0]));
   XOR2X1 U21 (.Y(binary_nxt[0]), 
	.B(binary_r[0]), 
	.A(FE_OCPN107_wenable_fifo));
endmodule

module write_fifo_ctrl (
	wclk, 
	rst_n, 
	wenable, 
	rptr, 
	wenable_fifo, 
	wptr, 
	waddr, 
	full_flag, 
	FE_OFN3_wenable_fifo, 
	FE_OFN41_nn_rst, 
	FE_OFN42_nn_rst, 
	FE_PT1_FE_OFN41_nn_rst, 
	FE_OFN37_nn_rst, 
	FE_PT2_FE_OFN41_nn_rst, 
	FE_OFN40_nn_rst, 
	FE_PT3_FE_OFN41_nn_rst, 
	FE_PT1_FE_OFN37_nn_rst, 
	FE_PT1_FE_OFN42_nn_rst, 
	FE_PT1_FE_OFN40_nn_rst, 
	FE_PT2_FE_OFN42_nn_rst, 
	FE_PT3_FE_OFN42_nn_rst, 
	FE_OCPN103_wenable_fifo, 
	nclk__L2_N3, 
	nclk__L2_N4);
   input wclk;
   input rst_n;
   input wenable;
   input [3:0] rptr;
   output wenable_fifo;
   output [3:0] wptr;
   output [2:0] waddr;
   output full_flag;
   input FE_OFN3_wenable_fifo;
   input FE_OFN41_nn_rst;
   input FE_OFN42_nn_rst;
   input FE_PT1_FE_OFN41_nn_rst;
   input FE_OFN37_nn_rst;
   input FE_PT2_FE_OFN41_nn_rst;
   input FE_OFN40_nn_rst;
   input FE_PT3_FE_OFN41_nn_rst;
   input FE_PT1_FE_OFN37_nn_rst;
   input FE_PT1_FE_OFN42_nn_rst;
   input FE_PT1_FE_OFN40_nn_rst;
   input FE_PT2_FE_OFN42_nn_rst;
   input FE_PT3_FE_OFN42_nn_rst;
   input FE_OCPN103_wenable_fifo;
   input nclk__L2_N3;
   input nclk__L2_N4;

   // Internal wires
   wire FE_RN_856_0;
   wire FE_RN_548_0;
   wire FE_RN_547_0;
   wire FE_RN_546_0;
   wire FE_OCPN204_wptr_nxt_1_;
   wire FE_OCPN203_wptr_nxt_0_;
   wire FE_RN_423_0;
   wire FE_RN_422_0;
   wire FE_RN_421_0;
   wire FE_RN_420_0;
   wire FE_RN_419_0;
   wire FE_RN_418_0;
   wire FE_RN_417_0;
   wire FE_RN_416_0;
   wire FE_RN_415_0;
   wire FE_RN_414_0;
   wire FE_RN_413_0;
   wire FE_RN_412_0;
   wire FE_RN_411_0;
   wire FE_RN_410_0;
   wire FE_OCPN134_wptr_nxt_3_;
   wire FE_OCPN133_wptr_nxt_3_;
   wire FE_OCPN100_gray_wptr_2_;
   wire FE_OFN32_nfifo_full;
   wire FE_OFN26_waddr_0_;
   wire \gray_wptr[2] ;
   wire N5;
   wire n19;
   wire [3:0] wptr_nxt;
   wire [3:0] wrptr_r2;
   wire [3:0] wrptr_r1;

   INVX2 FE_RC_1420_0 (.Y(FE_RN_856_0), 
	.A(full_flag));
   AND2X2 FE_RC_1419_0 (.Y(wenable_fifo), 
	.B(FE_RN_856_0), 
	.A(wenable));
   INVX2 FE_RC_891_0 (.Y(FE_RN_548_0), 
	.A(wrptr_r2[0]));
   INVX2 FE_RC_890_0 (.Y(FE_RN_547_0), 
	.A(wptr_nxt[0]));
   NAND2X1 FE_RC_889_0 (.Y(FE_RN_546_0), 
	.B(FE_RN_547_0), 
	.A(FE_RN_548_0));
   NAND2X1 FE_RC_888_0 (.Y(FE_RN_418_0), 
	.B(FE_RN_546_0), 
	.A(FE_RN_419_0));
   BUFX2 FE_OCPC204_wptr_nxt_1_ (.Y(FE_OCPN204_wptr_nxt_1_), 
	.A(wptr_nxt[1]));
   BUFX2 FE_OCPC203_wptr_nxt_0_ (.Y(FE_OCPN203_wptr_nxt_0_), 
	.A(wptr_nxt[0]));
   INVX2 FE_RC_652_0 (.Y(FE_RN_423_0), 
	.A(wrptr_r2[3]));
   NOR2X1 FE_RC_651_0 (.Y(FE_RN_422_0), 
	.B(FE_OCPN134_wptr_nxt_3_), 
	.A(FE_RN_423_0));
   INVX2 FE_RC_650_0 (.Y(FE_RN_421_0), 
	.A(wrptr_r2[3]));
   AND2X2 FE_RC_649_0 (.Y(FE_RN_420_0), 
	.B(FE_RN_421_0), 
	.A(FE_OCPN134_wptr_nxt_3_));
   NAND2X1 FE_RC_648_0 (.Y(FE_RN_419_0), 
	.B(wptr_nxt[0]), 
	.A(wrptr_r2[0]));
   OAI21X1 FE_RC_646_0 (.Y(FE_RN_417_0), 
	.C(FE_RN_418_0), 
	.B(FE_RN_420_0), 
	.A(FE_RN_422_0));
   INVX2 FE_RC_645_0 (.Y(FE_RN_416_0), 
	.A(n19));
   NOR2X1 FE_RC_644_0 (.Y(FE_RN_415_0), 
	.B(\gray_wptr[2] ), 
	.A(FE_RN_416_0));
   INVX2 FE_RC_643_0 (.Y(FE_RN_414_0), 
	.A(n19));
   AND2X2 FE_RC_642_0 (.Y(FE_RN_413_0), 
	.B(FE_RN_414_0), 
	.A(\gray_wptr[2] ));
   NAND2X1 FE_RC_641_0 (.Y(FE_RN_412_0), 
	.B(wptr_nxt[1]), 
	.A(wrptr_r2[1]));
   OAI21X1 FE_RC_640_0 (.Y(FE_RN_411_0), 
	.C(FE_RN_412_0), 
	.B(wptr_nxt[1]), 
	.A(wrptr_r2[1]));
   OAI21X1 FE_RC_639_0 (.Y(FE_RN_410_0), 
	.C(FE_RN_411_0), 
	.B(FE_RN_413_0), 
	.A(FE_RN_415_0));
   NOR2X1 FE_RC_638_0 (.Y(N5), 
	.B(FE_RN_410_0), 
	.A(FE_RN_417_0));
   XOR2X1 FE_RC_365_0 (.Y(\gray_wptr[2] ), 
	.B(FE_OCPN133_wptr_nxt_3_), 
	.A(wptr_nxt[2]));
   BUFX2 FE_OCPC134_wptr_nxt_3_ (.Y(FE_OCPN134_wptr_nxt_3_), 
	.A(FE_OCPN133_wptr_nxt_3_));
   BUFX2 FE_OCPC133_wptr_nxt_3_ (.Y(FE_OCPN133_wptr_nxt_3_), 
	.A(wptr_nxt[3]));
   BUFX2 FE_OCPC100_gray_wptr_2_ (.Y(FE_OCPN100_gray_wptr_2_), 
	.A(\gray_wptr[2] ));
   BUFX4 FE_OFC32_nfifo_full (.Y(full_flag), 
	.A(FE_OFN32_nfifo_full));
   BUFX4 FE_OFC26_waddr_0_ (.Y(waddr[0]), 
	.A(FE_OFN26_waddr_0_));
   DFFSR \wrptr_r1_reg[3]  (.S(1'b1), 
	.R(FE_OFN41_nn_rst), 
	.Q(wrptr_r1[3]), 
	.D(rptr[3]), 
	.CLK(wclk));
   DFFSR \wrptr_r1_reg[2]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(wrptr_r1[2]), 
	.D(rptr[2]), 
	.CLK(wclk));
   DFFSR \wrptr_r1_reg[1]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN42_nn_rst), 
	.Q(wrptr_r1[1]), 
	.D(rptr[1]), 
	.CLK(nclk__L2_N3));
   DFFSR \wrptr_r1_reg[0]  (.S(1'b1), 
	.R(FE_PT2_FE_OFN41_nn_rst), 
	.Q(wrptr_r1[0]), 
	.D(rptr[0]), 
	.CLK(wclk));
   DFFSR \wrptr_r2_reg[3]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN41_nn_rst), 
	.Q(wrptr_r2[3]), 
	.D(wrptr_r1[3]), 
	.CLK(wclk));
   DFFSR \wrptr_r2_reg[2]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN41_nn_rst), 
	.Q(wrptr_r2[2]), 
	.D(wrptr_r1[2]), 
	.CLK(wclk));
   DFFSR \wrptr_r2_reg[1]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN42_nn_rst), 
	.Q(wrptr_r2[1]), 
	.D(wrptr_r1[1]), 
	.CLK(nclk__L2_N3));
   DFFSR \wrptr_r2_reg[0]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(wrptr_r2[0]), 
	.D(wrptr_r1[0]), 
	.CLK(wclk));
   DFFSR full_flag_r_reg (.S(1'b1), 
	.R(rst_n), 
	.Q(FE_OFN32_nfifo_full), 
	.D(N5), 
	.CLK(nclk__L2_N3));
   DFFSR \waddr_reg[2]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN42_nn_rst), 
	.Q(waddr[2]), 
	.D(FE_OCPN100_gray_wptr_2_), 
	.CLK(nclk__L2_N3));
   DFFSR \waddr_reg[1]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN42_nn_rst), 
	.Q(waddr[1]), 
	.D(FE_OCPN204_wptr_nxt_1_), 
	.CLK(nclk__L2_N3));
   DFFSR \waddr_reg[0]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN42_nn_rst), 
	.Q(FE_OFN26_waddr_0_), 
	.D(FE_OCPN203_wptr_nxt_0_), 
	.CLK(nclk__L2_N4));
   write_ptr WPU1 (.wclk(wclk), 
	.rst_n(FE_PT1_FE_OFN41_nn_rst), 
	.wenable(FE_OFN3_wenable_fifo), 
	.wptr(wptr), 
	.wptr_nxt(wptr_nxt), 
	.FE_OFN42_nn_rst(FE_OFN42_nn_rst), 
	.FE_OFN37_nn_rst(FE_PT1_FE_OFN37_nn_rst), 
	.FE_PT1_FE_OFN42_nn_rst(FE_PT1_FE_OFN42_nn_rst), 
	.FE_OFN40_nn_rst(FE_PT1_FE_OFN40_nn_rst), 
	.FE_PT2_FE_OFN42_nn_rst(FE_PT2_FE_OFN42_nn_rst), 
	.FE_PT3_FE_OFN42_nn_rst(FE_PT3_FE_OFN42_nn_rst), 
	.FE_OCPN103_wenable_fifo(FE_OCPN103_wenable_fifo), 
	.FE_OCPN203_wptr_nxt_0_(FE_OCPN203_wptr_nxt_0_), 
	.FE_OCPN204_wptr_nxt_1_(FE_OCPN204_wptr_nxt_1_), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4));
   XNOR2X1 U22 (.Y(n19), 
	.B(wrptr_r2[2]), 
	.A(wrptr_r2[3]));
endmodule

module read_ptr (
	rclk, 
	rst_n, 
	renable, 
	rptr, 
	rptr_nxt, 
	FE_OFN41_nn_rst, 
	FE_OFN42_nn_rst, 
	FE_PT1_FE_OFN41_nn_rst, 
	FE_OFN37_nn_rst, 
	FE_PT1_FE_OFN37_nn_rst, 
	FE_OFN43_nn_rst, 
	FE_OFN40_nn_rst, 
	FE_OCPN214_rptr_nxt_0_, 
	FE_OCPN215_rptr_nxt_1_, 
	FE_OCPN267_rptr_nxt_3_, 
	FE_OCP_RBN331_rptr_nxt_2_, 
	nclk__L2_N3);
   input rclk;
   input rst_n;
   input renable;
   output [3:0] rptr;
   output [3:0] rptr_nxt;
   input FE_OFN41_nn_rst;
   input FE_OFN42_nn_rst;
   input FE_PT1_FE_OFN41_nn_rst;
   input FE_OFN37_nn_rst;
   input FE_PT1_FE_OFN37_nn_rst;
   input FE_OFN43_nn_rst;
   input FE_OFN40_nn_rst;
   input FE_OCPN214_rptr_nxt_0_;
   input FE_OCPN215_rptr_nxt_1_;
   input FE_OCPN267_rptr_nxt_3_;
   input FE_OCP_RBN331_rptr_nxt_2_;
   input nclk__L2_N3;

   // Internal wires
   wire FE_OCP_RBN332_rptr_nxt_2_;
   wire FE_OCP_RBN325_binary_nxt_2_;
   wire FE_OCP_RBN324_binary_nxt_2_;
   wire FE_OCP_RBN323_FE_OCPN145_renable_p2;
   wire FE_RN_976_0;
   wire FE_RN_527_0;
   wire FE_OCPN216_rptr_nxt_3_;
   wire FE_OCPN211_binary_nxt_0_;
   wire FE_RN_402_0;
   wire FE_RN_401_0;
   wire FE_RN_400_0;
   wire FE_RN_399_0;
   wire FE_RN_398_0;
   wire FE_RN_397_0;
   wire FE_RN_216_0;
   wire FE_OCPN145_renable_p2;
   wire FE_RN_29_0;
   wire FE_RN_28_0;
   wire FE_RN_27_0;
   wire FE_RN_25_0;
   wire FE_RN_24_0;
   wire n10;
   wire n12;
   wire [2:0] binary_nxt;
   wire [3:0] binary_r;

   BUFX2 FE_OCP_RBC332_rptr_nxt_2_ (.Y(FE_OCP_RBN332_rptr_nxt_2_), 
	.A(rptr_nxt[2]));
   BUFX2 FE_OCP_RBC325_binary_nxt_2_ (.Y(FE_OCP_RBN325_binary_nxt_2_), 
	.A(binary_nxt[2]));
   BUFX2 FE_OCP_RBC324_binary_nxt_2_ (.Y(FE_OCP_RBN324_binary_nxt_2_), 
	.A(binary_nxt[2]));
   BUFX2 FE_OCP_RBC323_FE_OCPN145_renable_p2 (.Y(FE_OCP_RBN323_FE_OCPN145_renable_p2), 
	.A(FE_OCPN145_renable_p2));
   NAND2X1 FE_RC_1579_0 (.Y(FE_RN_976_0), 
	.B(binary_r[3]), 
	.A(FE_RN_27_0));
   OAI21X1 FE_RC_1578_0 (.Y(rptr_nxt[3]), 
	.C(FE_RN_976_0), 
	.B(FE_RN_27_0), 
	.A(binary_r[3]));
   AND2X2 FE_RC_840_0 (.Y(FE_RN_527_0), 
	.B(binary_r[2]), 
	.A(FE_RN_400_0));
   NAND2X1 FE_RC_839_0 (.Y(FE_RN_399_0), 
	.B(n10), 
	.A(FE_RN_527_0));
   BUFX2 FE_OCPC216_rptr_nxt_3_ (.Y(FE_OCPN216_rptr_nxt_3_), 
	.A(FE_OCPN267_rptr_nxt_3_));
   BUFX2 FE_OCPC211_binary_nxt_0_ (.Y(FE_OCPN211_binary_nxt_0_), 
	.A(binary_nxt[0]));
   INVX2 FE_RC_624_0 (.Y(FE_RN_402_0), 
	.A(binary_r[2]));
   NAND2X1 FE_RC_623_0 (.Y(FE_RN_401_0), 
	.B(FE_RN_402_0), 
	.A(FE_RN_28_0));
   INVX2 FE_RC_622_0 (.Y(FE_RN_400_0), 
	.A(FE_RN_29_0));
   INVX2 FE_RC_620_0 (.Y(FE_RN_398_0), 
	.A(n10));
   NAND2X1 FE_RC_619_0 (.Y(FE_RN_397_0), 
	.B(FE_RN_28_0), 
	.A(FE_RN_398_0));
   NAND3X1 FE_RC_618_0 (.Y(FE_RN_25_0), 
	.C(FE_RN_397_0), 
	.B(FE_RN_399_0), 
	.A(FE_RN_401_0));
   OAI21X1 FE_RC_482_0 (.Y(rptr_nxt[2]), 
	.C(FE_RN_24_0), 
	.B(binary_nxt[2]), 
	.A(FE_RN_25_0));
   AND2X2 FE_RC_317_0 (.Y(FE_RN_216_0), 
	.B(binary_r[1]), 
	.A(binary_r[0]));
   AND2X2 FE_RC_316_0 (.Y(n10), 
	.B(FE_RN_216_0), 
	.A(renable));
   BUFX2 FE_OCPC145_renable_p2 (.Y(FE_OCPN145_renable_p2), 
	.A(renable));
   NAND2X1 FE_RC_136_0 (.Y(FE_RN_27_0), 
	.B(n10), 
	.A(binary_r[2]));
   INVX2 FE_RC_46_0 (.Y(FE_RN_29_0), 
	.A(binary_r[3]));
   INVX2 FE_RC_45_0 (.Y(FE_RN_28_0), 
	.A(binary_r[3]));
   NAND2X1 FE_RC_41_0 (.Y(FE_RN_24_0), 
	.B(binary_nxt[2]), 
	.A(FE_RN_25_0));
   DFFSR \binary_r_reg[0]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(binary_r[0]), 
	.D(FE_OCPN211_binary_nxt_0_), 
	.CLK(rclk));
   DFFSR \binary_r_reg[1]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(binary_r[1]), 
	.D(binary_nxt[1]), 
	.CLK(rclk));
   DFFSR \binary_r_reg[2]  (.S(1'b1), 
	.R(FE_OFN43_nn_rst), 
	.Q(binary_r[2]), 
	.D(FE_OCP_RBN324_binary_nxt_2_), 
	.CLK(rclk));
   DFFSR \binary_r_reg[3]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN37_nn_rst), 
	.Q(binary_r[3]), 
	.D(FE_OCPN216_rptr_nxt_3_), 
	.CLK(rclk));
   DFFSR \gray_r_reg[3]  (.S(1'b1), 
	.R(FE_OFN41_nn_rst), 
	.Q(rptr[3]), 
	.D(FE_OCPN216_rptr_nxt_3_), 
	.CLK(rclk));
   DFFSR \gray_r_reg[2]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rptr[2]), 
	.D(FE_OCP_RBN332_rptr_nxt_2_), 
	.CLK(rclk));
   DFFSR \gray_r_reg[1]  (.S(1'b1), 
	.R(FE_OFN42_nn_rst), 
	.Q(rptr[1]), 
	.D(FE_OCPN215_rptr_nxt_1_), 
	.CLK(nclk__L2_N3));
   DFFSR \gray_r_reg[0]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN41_nn_rst), 
	.Q(rptr[0]), 
	.D(FE_OCPN214_rptr_nxt_0_), 
	.CLK(rclk));
   XOR2X1 U14 (.Y(rptr_nxt[1]), 
	.B(FE_OCP_RBN325_binary_nxt_2_), 
	.A(binary_nxt[1]));
   XOR2X1 U15 (.Y(rptr_nxt[0]), 
	.B(binary_nxt[0]), 
	.A(binary_nxt[1]));
   XOR2X1 U16 (.Y(binary_nxt[2]), 
	.B(binary_r[2]), 
	.A(n10));
   XNOR2X1 U19 (.Y(binary_nxt[1]), 
	.B(binary_r[1]), 
	.A(n12));
   NAND2X1 U20 (.Y(n12), 
	.B(FE_OCPN145_renable_p2), 
	.A(binary_r[0]));
   XOR2X1 U21 (.Y(binary_nxt[0]), 
	.B(binary_r[0]), 
	.A(FE_OCP_RBN323_FE_OCPN145_renable_p2));
endmodule

module read_fifo_ctrl (
	rclk, 
	rst_n, 
	renable, 
	wptr, 
	rptr, 
	raddr, 
	empty_flag, 
	FE_OFN43_nn_rst, 
	FE_OFN41_nn_rst, 
	FE_OFN42_nn_rst, 
	FE_OFN40_nn_rst, 
	FE_PT1_FE_OFN41_nn_rst, 
	FE_PT2_FE_OFN41_nn_rst, 
	FE_PT1_FE_OFN40_nn_rst, 
	FE_PT3_FE_OFN41_nn_rst, 
	FE_PT1_FE_OFN42_nn_rst, 
	FE_PT2_FE_OFN40_nn_rst, 
	FE_PT2_FE_OFN42_nn_rst, 
	FE_PT1_FE_OFN43_nn_rst, 
	FE_PT3_FE_OFN40_nn_rst, 
	FE_PT2_FE_OFN43_nn_rst, 
	nclk__L2_N3);
   input rclk;
   input rst_n;
   input renable;
   input [3:0] wptr;
   output [3:0] rptr;
   output [2:0] raddr;
   output empty_flag;
   input FE_OFN43_nn_rst;
   input FE_OFN41_nn_rst;
   input FE_OFN42_nn_rst;
   input FE_OFN40_nn_rst;
   input FE_PT1_FE_OFN41_nn_rst;
   input FE_PT2_FE_OFN41_nn_rst;
   input FE_PT1_FE_OFN40_nn_rst;
   input FE_PT3_FE_OFN41_nn_rst;
   input FE_PT1_FE_OFN42_nn_rst;
   input FE_PT2_FE_OFN40_nn_rst;
   input FE_PT2_FE_OFN42_nn_rst;
   input FE_PT1_FE_OFN43_nn_rst;
   input FE_PT3_FE_OFN40_nn_rst;
   input FE_PT2_FE_OFN43_nn_rst;
   input nclk__L2_N3;

   // Internal wires
   wire FE_OCPN267_rptr_nxt_3_;
   wire FE_OCPN218_gray_rptr_2_;
   wire FE_OCPN215_rptr_nxt_1_;
   wire FE_OCPN214_rptr_nxt_0_;
   wire FE_OFN31_nfifo_empty;
   wire FE_OFN25_raddr_0_;
   wire renable_p2;
   wire \gray_rptr[2] ;
   wire N3;
   wire n2;
   wire n3;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire [3:0] rptr_nxt;
   wire [3:0] rwptr_r2;
   wire [3:0] rwptr_r1;

   BUFX2 FE_OCPC267_rptr_nxt_3_ (.Y(FE_OCPN267_rptr_nxt_3_), 
	.A(rptr_nxt[3]));
   BUFX2 FE_OCPC218_gray_rptr_2_ (.Y(FE_OCPN218_gray_rptr_2_), 
	.A(\gray_rptr[2] ));
   BUFX2 FE_OCPC215_rptr_nxt_1_ (.Y(FE_OCPN215_rptr_nxt_1_), 
	.A(rptr_nxt[1]));
   BUFX2 FE_OCPC214_rptr_nxt_0_ (.Y(FE_OCPN214_rptr_nxt_0_), 
	.A(rptr_nxt[0]));
   XOR2X1 FE_RC_483_0 (.Y(\gray_rptr[2] ), 
	.B(rptr_nxt[3]), 
	.A(rptr_nxt[2]));
   BUFX4 FE_OFC31_nfifo_empty (.Y(empty_flag), 
	.A(FE_OFN31_nfifo_empty));
   BUFX4 FE_OFC25_raddr_0_ (.Y(raddr[0]), 
	.A(FE_OFN25_raddr_0_));
   DFFSR \rwptr_r1_reg[3]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN40_nn_rst), 
	.Q(rwptr_r1[3]), 
	.D(wptr[3]), 
	.CLK(rclk));
   DFFSR \rwptr_r1_reg[2]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN41_nn_rst), 
	.Q(rwptr_r1[2]), 
	.D(wptr[2]), 
	.CLK(rclk));
   DFFSR \rwptr_r1_reg[1]  (.S(1'b1), 
	.R(FE_PT2_FE_OFN42_nn_rst), 
	.Q(rwptr_r1[1]), 
	.D(wptr[1]), 
	.CLK(nclk__L2_N3));
   DFFSR \rwptr_r1_reg[0]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN42_nn_rst), 
	.Q(rwptr_r1[0]), 
	.D(wptr[0]), 
	.CLK(rclk));
   DFFSR \rwptr_r2_reg[3]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN41_nn_rst), 
	.Q(rwptr_r2[3]), 
	.D(rwptr_r1[3]), 
	.CLK(rclk));
   DFFSR \rwptr_r2_reg[2]  (.S(1'b1), 
	.R(FE_PT2_FE_OFN41_nn_rst), 
	.Q(rwptr_r2[2]), 
	.D(rwptr_r1[2]), 
	.CLK(rclk));
   DFFSR \rwptr_r2_reg[1]  (.S(1'b1), 
	.R(rst_n), 
	.Q(rwptr_r2[1]), 
	.D(rwptr_r1[1]), 
	.CLK(nclk__L2_N3));
   DFFSR \rwptr_r2_reg[0]  (.S(1'b1), 
	.R(FE_OFN42_nn_rst), 
	.Q(rwptr_r2[0]), 
	.D(rwptr_r1[0]), 
	.CLK(rclk));
   DFFSR empty_flag_r_reg (.S(FE_PT3_FE_OFN41_nn_rst), 
	.R(1'b1), 
	.Q(FE_OFN31_nfifo_empty), 
	.D(N3), 
	.CLK(rclk));
   DFFSR \raddr_reg[2]  (.S(1'b1), 
	.R(FE_OFN43_nn_rst), 
	.Q(raddr[2]), 
	.D(FE_OCPN218_gray_rptr_2_), 
	.CLK(rclk));
   DFFSR \raddr_reg[1]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(raddr[1]), 
	.D(FE_OCPN215_rptr_nxt_1_), 
	.CLK(nclk__L2_N3));
   DFFSR \raddr_reg[0]  (.S(1'b1), 
	.R(FE_PT3_FE_OFN41_nn_rst), 
	.Q(FE_OFN25_raddr_0_), 
	.D(FE_OCPN214_rptr_nxt_0_), 
	.CLK(rclk));
   read_ptr RPU1 (.rclk(rclk), 
	.rst_n(FE_PT1_FE_OFN43_nn_rst), 
	.renable(renable_p2), 
	.rptr(rptr), 
	.rptr_nxt(rptr_nxt), 
	.FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_OFN42_nn_rst(FE_PT2_FE_OFN40_nn_rst), 
	.FE_PT1_FE_OFN41_nn_rst(FE_PT3_FE_OFN41_nn_rst), 
	.FE_OFN37_nn_rst(FE_PT3_FE_OFN41_nn_rst), 
	.FE_PT1_FE_OFN37_nn_rst(FE_PT3_FE_OFN40_nn_rst), 
	.FE_OFN43_nn_rst(FE_PT2_FE_OFN43_nn_rst), 
	.FE_OFN40_nn_rst(FE_PT2_FE_OFN43_nn_rst), 
	.FE_OCPN214_rptr_nxt_0_(FE_OCPN214_rptr_nxt_0_), 
	.FE_OCPN215_rptr_nxt_1_(FE_OCPN215_rptr_nxt_1_), 
	.FE_OCPN267_rptr_nxt_3_(FE_OCPN267_rptr_nxt_3_), 
	.FE_OCP_RBN331_rptr_nxt_2_(rptr_nxt[2]), 
	.nclk__L2_N3(nclk__L2_N3));
   NOR2X1 U15 (.Y(renable_p2), 
	.B(renable), 
	.A(empty_flag));
   NOR2X1 U17 (.Y(N3), 
	.B(n3), 
	.A(n2));
   NAND2X1 U18 (.Y(n3), 
	.B(n17), 
	.A(n16));
   XOR2X1 U19 (.Y(n17), 
	.B(n18), 
	.A(\gray_rptr[2] ));
   XNOR2X1 U21 (.Y(n18), 
	.B(rwptr_r2[2]), 
	.A(rwptr_r2[3]));
   XNOR2X1 U22 (.Y(n16), 
	.B(rwptr_r2[1]), 
	.A(rptr_nxt[1]));
   NAND2X1 U23 (.Y(n2), 
	.B(n20), 
	.A(n19));
   XNOR2X1 U24 (.Y(n20), 
	.B(rwptr_r2[0]), 
	.A(rptr_nxt[0]));
   XNOR2X1 U25 (.Y(n19), 
	.B(rwptr_r2[3]), 
	.A(FE_OCPN267_rptr_nxt_3_));
endmodule

module fifo (
	r_clk, 
	w_clk, 
	n_rst, 
	r_enable, 
	w_enable, 
	w_data, 
	r_data, 
	empty, 
	full, 
	FE_OFN37_nn_rst, 
	FE_OFN43_nn_rst, 
	FE_OFN40_nn_rst, 
	FE_PT1_FE_OFN40_nn_rst, 
	FE_PT1_FE_OFN43_nn_rst, 
	FE_PT2_FE_OFN43_nn_rst, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input r_clk;
   input w_clk;
   input n_rst;
   input r_enable;
   input w_enable;
   input [7:0] w_data;
   output [7:0] r_data;
   output empty;
   output full;
   input FE_OFN37_nn_rst;
   input FE_OFN43_nn_rst;
   input FE_OFN40_nn_rst;
   input FE_PT1_FE_OFN40_nn_rst;
   input FE_PT1_FE_OFN43_nn_rst;
   input FE_PT2_FE_OFN43_nn_rst;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   // Internal wires
   wire FE_OCPN103_wenable_fifo;
   wire FE_OFN42_nn_rst;
   wire FE_OFN41_nn_rst;
   wire wenable_fifo;
   wire [2:0] waddr;
   wire [2:0] raddr;
   wire [3:0] rptr;
   wire [3:0] wptr;

   BUFX4 FE_OCPC103_wenable_fifo (.Y(FE_OCPN103_wenable_fifo), 
	.A(wenable_fifo));
   INVX8 FE_OFC42_nn_rst (.Y(FE_OFN42_nn_rst), 
	.A(n_rst));
   INVX8 FE_OFC41_nn_rst (.Y(FE_OFN41_nn_rst), 
	.A(n_rst));
   fiforam UFIFORAM (.wclk(nclk__L2_N1), 
	.wenable(FE_OCPN103_wenable_fifo), 
	.waddr(waddr), 
	.raddr(raddr), 
	.wdata(w_data), 
	.rdata(r_data), 
	.FE_OFN3_wenable_fifo(FE_OCPN103_wenable_fifo), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
   write_fifo_ctrl UWFC (.wclk(w_clk), 
	.rst_n(FE_OFN43_nn_rst), 
	.wenable(w_enable), 
	.rptr(rptr), 
	.wenable_fifo(wenable_fifo), 
	.wptr(wptr), 
	.waddr(waddr), 
	.full_flag(full), 
	.FE_OFN3_wenable_fifo(wenable_fifo), 
	.FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_OFN42_nn_rst(FE_OFN42_nn_rst), 
	.FE_PT1_FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_OFN37_nn_rst(FE_OFN41_nn_rst), 
	.FE_PT2_FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_OFN40_nn_rst(FE_OFN41_nn_rst), 
	.FE_PT3_FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_PT1_FE_OFN37_nn_rst(FE_OFN42_nn_rst), 
	.FE_PT1_FE_OFN42_nn_rst(FE_OFN42_nn_rst), 
	.FE_PT1_FE_OFN40_nn_rst(FE_OFN42_nn_rst), 
	.FE_PT2_FE_OFN42_nn_rst(FE_OFN42_nn_rst), 
	.FE_PT3_FE_OFN42_nn_rst(FE_OFN42_nn_rst), 
	.FE_OCPN103_wenable_fifo(FE_OCPN103_wenable_fifo), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4));
   read_fifo_ctrl URFC (.rclk(r_clk), 
	.rst_n(FE_OFN37_nn_rst), 
	.renable(r_enable), 
	.wptr(wptr), 
	.rptr(rptr), 
	.raddr(raddr), 
	.empty_flag(empty), 
	.FE_OFN43_nn_rst(FE_PT1_FE_OFN43_nn_rst), 
	.FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_OFN42_nn_rst(FE_OFN42_nn_rst), 
	.FE_OFN40_nn_rst(FE_OFN40_nn_rst), 
	.FE_PT1_FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_PT2_FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_PT1_FE_OFN40_nn_rst(FE_OFN41_nn_rst), 
	.FE_PT3_FE_OFN41_nn_rst(FE_OFN41_nn_rst), 
	.FE_PT1_FE_OFN42_nn_rst(FE_OFN42_nn_rst), 
	.FE_PT2_FE_OFN40_nn_rst(FE_OFN42_nn_rst), 
	.FE_PT2_FE_OFN42_nn_rst(FE_OFN42_nn_rst), 
	.FE_PT1_FE_OFN43_nn_rst(FE_PT1_FE_OFN40_nn_rst), 
	.FE_PT3_FE_OFN40_nn_rst(FE_PT2_FE_OFN43_nn_rst), 
	.FE_PT2_FE_OFN43_nn_rst(FE_PT2_FE_OFN43_nn_rst), 
	.nclk__L2_N3(nclk__L2_N3));
endmodule

module lab7_tx_fifo (
	clk, 
	n_rst, 
	read_done, 
	read_data, 
	fifo_empty, 
	fifo_full, 
	write_enable, 
	write_data, 
	FE_OFN37_nn_rst, 
	FE_OFN43_nn_rst, 
	FE_OFN40_nn_rst, 
	FE_PT1_FE_OFN40_nn_rst, 
	FE_PT1_FE_OFN43_nn_rst, 
	FE_PT2_FE_OFN43_nn_rst, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input clk;
   input n_rst;
   input read_done;
   output [7:0] read_data;
   output fifo_empty;
   output fifo_full;
   input write_enable;
   input [7:0] write_data;
   input FE_OFN37_nn_rst;
   input FE_OFN43_nn_rst;
   input FE_OFN40_nn_rst;
   input FE_PT1_FE_OFN40_nn_rst;
   input FE_PT1_FE_OFN43_nn_rst;
   input FE_PT2_FE_OFN43_nn_rst;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   fifo IP_FIFO (.r_clk(clk), 
	.w_clk(clk), 
	.n_rst(n_rst), 
	.r_enable(read_done), 
	.w_enable(write_enable), 
	.w_data(write_data), 
	.r_data(read_data), 
	.empty(fifo_empty), 
	.full(fifo_full), 
	.FE_OFN37_nn_rst(FE_OFN37_nn_rst), 
	.FE_OFN43_nn_rst(FE_OFN43_nn_rst), 
	.FE_OFN40_nn_rst(FE_OFN40_nn_rst), 
	.FE_PT1_FE_OFN40_nn_rst(FE_PT1_FE_OFN40_nn_rst), 
	.FE_PT1_FE_OFN43_nn_rst(FE_PT1_FE_OFN43_nn_rst), 
	.FE_PT2_FE_OFN43_nn_rst(FE_PT2_FE_OFN43_nn_rst), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
endmodule

module lab7_timer (
	clk, 
	n_rst, 
	start, 
	stop, 
	shift_enable, 
	bit_done, 
	FE_OFN37_nn_rst, 
	FE_OFN40_nn_rst);
   input clk;
   input n_rst;
   input start;
   input stop;
   output shift_enable;
   output bit_done;
   input FE_OFN37_nn_rst;
   input FE_OFN40_nn_rst;

   // Internal wires
   wire FE_OCPN151_clk_cnt_0_;
   wire FE_OCPN150_clk_cnt_0_;
   wire FE_OCPN149_clk_cnt_0_;
   wire FE_OCPN148_clk_cnt_1_;
   wire FE_OCPN147_clk_cnt_1_;
   wire N73;
   wire N82;
   wire n32;
   wire n33;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire [1:0] curr_state;
   wire [2:0] clk_cnt;
   wire [2:0] nxt_clk_cnt;

   assign shift_enable = N73 ;
   assign bit_done = N82 ;

   BUFX2 FE_OCPC151_clk_cnt_0_ (.Y(FE_OCPN151_clk_cnt_0_), 
	.A(FE_OCPN149_clk_cnt_0_));
   BUFX2 FE_OCPC150_clk_cnt_0_ (.Y(FE_OCPN150_clk_cnt_0_), 
	.A(clk_cnt[0]));
   BUFX2 FE_OCPC149_clk_cnt_0_ (.Y(FE_OCPN149_clk_cnt_0_), 
	.A(clk_cnt[0]));
   BUFX2 FE_OCPC148_clk_cnt_1_ (.Y(FE_OCPN148_clk_cnt_1_), 
	.A(clk_cnt[1]));
   BUFX2 FE_OCPC147_clk_cnt_1_ (.Y(FE_OCPN147_clk_cnt_1_), 
	.A(clk_cnt[1]));
   DFFSR \curr_state_reg[0]  (.S(1'b1), 
	.R(FE_OFN37_nn_rst), 
	.Q(curr_state[0]), 
	.D(n33), 
	.CLK(clk));
   DFFSR \curr_state_reg[1]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(curr_state[1]), 
	.D(n32), 
	.CLK(clk));
   DFFSR \clk_cnt_reg[0]  (.S(1'b1), 
	.R(n_rst), 
	.Q(clk_cnt[0]), 
	.D(nxt_clk_cnt[0]), 
	.CLK(clk));
   DFFSR \clk_cnt_reg[1]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(clk_cnt[1]), 
	.D(nxt_clk_cnt[1]), 
	.CLK(clk));
   DFFSR \clk_cnt_reg[2]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(clk_cnt[2]), 
	.D(nxt_clk_cnt[2]), 
	.CLK(clk));
   NOR2X1 U8 (.Y(nxt_clk_cnt[2]), 
	.B(n2), 
	.A(n1));
   MUX2X1 U9 (.Y(n2), 
	.S(n4), 
	.B(clk_cnt[2]), 
	.A(n3));
   MUX2X1 U10 (.Y(nxt_clk_cnt[1]), 
	.S(FE_OCPN147_clk_cnt_1_), 
	.B(n5), 
	.A(n6));
   INVX1 U11 (.Y(n6), 
	.A(nxt_clk_cnt[0]));
   NAND2X1 U12 (.Y(n5), 
	.B(n7), 
	.A(FE_OCPN151_clk_cnt_0_));
   NOR2X1 U13 (.Y(nxt_clk_cnt[0]), 
	.B(FE_OCPN149_clk_cnt_0_), 
	.A(n1));
   OAI21X1 U14 (.Y(n33), 
	.C(n14), 
	.B(n13), 
	.A(n7));
   AOI22X1 U15 (.Y(n14), 
	.D(n17), 
	.C(n16), 
	.B(n15), 
	.A(curr_state[1]));
   OAI22X1 U16 (.Y(n15), 
	.D(n20), 
	.C(n19), 
	.B(n18), 
	.A(n4));
   INVX2 U17 (.Y(n19), 
	.A(n21));
   INVX1 U18 (.Y(n13), 
	.A(start));
   INVX1 U19 (.Y(n7), 
	.A(n1));
   NOR2X1 U20 (.Y(n1), 
	.B(curr_state[1]), 
	.A(curr_state[0]));
   OAI21X1 U21 (.Y(n32), 
	.C(n23), 
	.B(n17), 
	.A(n22));
   OAI21X1 U22 (.Y(n23), 
	.C(curr_state[1]), 
	.B(n21), 
	.A(n20));
   NAND2X1 U23 (.Y(n21), 
	.B(n18), 
	.A(n4));
   INVX2 U24 (.Y(n18), 
	.A(n3));
   NOR2X1 U25 (.Y(n3), 
	.B(clk_cnt[2]), 
	.A(n24));
   XOR2X1 U26 (.Y(n24), 
	.B(FE_OCPN150_clk_cnt_0_), 
	.A(FE_OCPN148_clk_cnt_1_));
   INVX1 U27 (.Y(n17), 
	.A(stop));
   INVX1 U28 (.Y(N82), 
	.A(n25));
   NOR2X1 U29 (.Y(N73), 
	.B(n25), 
	.A(n22));
   NAND2X1 U30 (.Y(n25), 
	.B(n4), 
	.A(clk_cnt[2]));
   AND2X2 U31 (.Y(n4), 
	.B(clk_cnt[1]), 
	.A(clk_cnt[0]));
   INVX2 U32 (.Y(n22), 
	.A(n16));
   NOR2X1 U33 (.Y(n16), 
	.B(curr_state[1]), 
	.A(n20));
   INVX2 U34 (.Y(n20), 
	.A(curr_state[0]));
endmodule

module lab7_tcu (
	clk, 
	n_rst, 
	transmit, 
	bit_done, 
	bus_mode, 
	stop, 
	start, 
	sync, 
	read_done, 
	tx_sel, 
	tx_enable_0, 
	load_data_0, 
	tx_enable_1, 
	load_data_1, 
	FE_OFN40_nn_rst, 
	FE_PT1_FE_OFN40_nn_rst, 
	nclk__L2_N2);
   input clk;
   input n_rst;
   input transmit;
   input bit_done;
   output [1:0] bus_mode;
   output stop;
   output start;
   output sync;
   output read_done;
   output tx_sel;
   output tx_enable_0;
   output load_data_0;
   output tx_enable_1;
   output load_data_1;
   input FE_OFN40_nn_rst;
   input FE_PT1_FE_OFN40_nn_rst;
   input nclk__L2_N2;

   // Internal wires
   wire FE_OCP_RBN340_curr_state_2_;
   wire FE_OCP_RBN339_curr_state_2_;
   wire FE_OCP_RBN338_curr_state_2_;
   wire FE_OCP_RBN337_curr_state_2_;
   wire FE_OCP_RBN307_n2;
   wire FE_OCP_RBN306_n2;
   wire FE_OCP_RBN305_n2;
   wire FE_OCP_RBN304_n2;
   wire FE_OCP_RBN286_curr_state_0_;
   wire FE_OCP_RBN285_curr_state_0_;
   wire FE_OCP_RBN284_curr_state_0_;
   wire FE_OCP_RBN283_curr_state_0_;
   wire FE_OCP_RBN282_curr_state_0_;
   wire FE_OCP_RBN281_curr_state_0_;
   wire FE_OCPN269_FE_OCP_RBN226_FE_OCPN84_curr_state_0_;
   wire FE_OCPN266_n30;
   wire FE_OCPN265_n38;
   wire FE_OCPN262_n14;
   wire FE_OCPN259_n62;
   wire FE_OCPN258_FE_OCP_DRV_N78_curr_state_3_;
   wire FE_OCPN257_FE_OCP_DRV_N78_curr_state_3_;
   wire FE_OCPN252_n5;
   wire FE_OCPN250_n60;
   wire FE_OCPN249_FE_OFN30_curr_state_1_;
   wire FE_OCPN247_curr_state_2_;
   wire FE_OCPN245_FE_OFN30_curr_state_1_;
   wire FE_OCPN244_FE_OFN30_curr_state_1_;
   wire FE_RN_803_0;
   wire FE_RN_551_0;
   wire FE_RN_550_0;
   wire FE_RN_549_0;
   wire FE_RN_538_0;
   wire FE_RN_525_0;
   wire FE_OCPN236_curr_state_2_;
   wire FE_OCPN234_FE_OFN30_curr_state_1_;
   wire FE_OCP_RBN230_FE_OCPN84_curr_state_0_;
   wire FE_OCP_RBN229_FE_OCPN84_curr_state_0_;
   wire FE_OCP_RBN228_FE_OCPN84_curr_state_0_;
   wire FE_OCP_RBN227_FE_OCPN84_curr_state_0_;
   wire FE_OCP_RBN225_curr_state_3_;
   wire FE_OCP_RBN224_curr_state_3_;
   wire FE_OCPN213_n17;
   wire FE_OCPN205_n38;
   wire FE_OCPN202_n36;
   wire FE_OCPN198_n48;
   wire FE_OCPN197_stop_int;
   wire FE_OCPN196_n27;
   wire FE_OCPN193_n14;
   wire FE_OCPN192_n26;
   wire FE_OCPN190_n6;
   wire FE_OCPN188_n1;
   wire FE_OCPN187_n1;
   wire FE_OCPN186_n1;
   wire FE_OCPN184_n11;
   wire FE_OCPN183_n11;
   wire FE_OCPN182_n47;
   wire FE_OCPN177_n7;
   wire FE_OCPN176_n7;
   wire FE_OCPN175_n7;
   wire FE_OCPN174_n62;
   wire FE_OCPN173_n10;
   wire FE_OCPN172_n5;
   wire FE_OCPN169_FE_OCP_DRV_N78_curr_state_3_;
   wire FE_OCPN168_FE_OCP_DRV_N78_curr_state_3_;
   wire FE_OCPN167_n28;
   wire FE_OCPN164_curr_state_2_;
   wire FE_OCPN163_n16;
   wire FE_OCPN162_n16;
   wire FE_OCPN161_n16;
   wire FE_OCPN158_FE_OFN30_curr_state_1_;
   wire FE_OCPN157_FE_OFN30_curr_state_1_;
   wire FE_OCPN156_FE_OFN30_curr_state_1_;
   wire FE_OCPN155_FE_OFN30_curr_state_1_;
   wire FE_OCPN154_FE_OFN30_curr_state_1_;
   wire FE_RN_301_0;
   wire FE_RN_299_0;
   wire FE_RN_236_0;
   wire FE_RN_235_0;
   wire FE_RN_223_0;
   wire FE_RN_222_0;
   wire FE_RN_221_0;
   wire FE_RN_219_0;
   wire FE_RN_218_0;
   wire FE_RN_217_0;
   wire FE_OCPN126_n71;
   wire FE_OCPN119_load_data_1_int;
   wire FE_OCPN108_read_done_int;
   wire FE_OCPN101_curr_state_3_;
   wire FE_OCPN86_curr_state_0_;
   wire FE_OCPN85_curr_state_0_;
   wire FE_OCPN80_curr_state_2_;
   wire FE_RN_10_0;
   wire FE_RN_9_0;
   wire FE_RN_8_0;
   wire FE_RN_6_0;
   wire FE_OFN30_curr_state_1_;
   wire n86;
   wire n88;
   wire n90;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n13;
   wire n14;
   wire n15;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire [3:0] curr_state;
   wire [2:0] bit_cnt;

   assign tx_enable_1 = tx_sel ;

   BUFX2 FE_OCP_RBC340_curr_state_2_ (.Y(FE_OCP_RBN340_curr_state_2_), 
	.A(curr_state[2]));
   BUFX2 FE_OCP_RBC339_curr_state_2_ (.Y(FE_OCP_RBN339_curr_state_2_), 
	.A(FE_OCP_RBN340_curr_state_2_));
   BUFX4 FE_OCP_RBC338_curr_state_2_ (.Y(FE_OCP_RBN338_curr_state_2_), 
	.A(curr_state[2]));
   BUFX2 FE_OCP_RBC337_curr_state_2_ (.Y(FE_OCP_RBN337_curr_state_2_), 
	.A(FE_OCP_RBN338_curr_state_2_));
   NAND3X1 FE_RC_1685_0 (.Y(FE_RN_8_0), 
	.C(FE_RN_803_0), 
	.B(FE_OCP_RBN225_curr_state_3_), 
	.A(FE_OFN30_curr_state_1_));
   NAND3X1 FE_RC_1684_0 (.Y(n47), 
	.C(FE_RN_299_0), 
	.B(FE_OCP_RBN282_curr_state_0_), 
	.A(FE_RN_301_0));
   INVX2 FE_OCP_RBC307_n2 (.Y(FE_OCP_RBN307_n2), 
	.A(FE_OCP_RBN306_n2));
   INVX1 FE_OCP_RBC306_n2 (.Y(FE_OCP_RBN306_n2), 
	.A(FE_OCP_RBN304_n2));
   INVX1 FE_OCP_RBC305_n2 (.Y(FE_OCP_RBN305_n2), 
	.A(FE_OCP_RBN304_n2));
   INVX2 FE_OCP_RBC304_n2 (.Y(FE_OCP_RBN304_n2), 
	.A(n2));
   BUFX2 FE_OCP_RBC286_curr_state_0_ (.Y(FE_OCP_RBN286_curr_state_0_), 
	.A(curr_state[0]));
   INVX1 FE_OCP_RBC285_curr_state_0_ (.Y(FE_OCP_RBN285_curr_state_0_), 
	.A(FE_OCP_RBN286_curr_state_0_));
   INVX2 FE_OCP_RBC284_curr_state_0_ (.Y(FE_OCP_RBN284_curr_state_0_), 
	.A(FE_OCP_RBN286_curr_state_0_));
   BUFX4 FE_OCP_RBC283_curr_state_0_ (.Y(FE_OCP_RBN283_curr_state_0_), 
	.A(curr_state[0]));
   INVX2 FE_OCP_RBC282_curr_state_0_ (.Y(FE_OCP_RBN282_curr_state_0_), 
	.A(FE_OCP_RBN283_curr_state_0_));
   BUFX2 FE_OCP_RBC281_curr_state_0_ (.Y(FE_OCP_RBN281_curr_state_0_), 
	.A(FE_OCP_RBN283_curr_state_0_));
   BUFX2 FE_OCPC269_FE_OCP_RBN226_FE_OCPN84_curr_state_0_ (.Y(FE_OCPN269_FE_OCP_RBN226_FE_OCPN84_curr_state_0_), 
	.A(FE_OCP_RBN282_curr_state_0_));
   BUFX2 FE_OCPC266_n30 (.Y(FE_OCPN266_n30), 
	.A(n30));
   BUFX2 FE_OCPC265_n38 (.Y(FE_OCPN265_n38), 
	.A(n38));
   BUFX2 FE_OCPC262_n14 (.Y(FE_OCPN262_n14), 
	.A(n14));
   BUFX2 FE_OCPC259_n62 (.Y(FE_OCPN259_n62), 
	.A(n62));
   BUFX2 FE_OCPC258_FE_OCP_DRV_N78_curr_state_3_ (.Y(FE_OCPN258_FE_OCP_DRV_N78_curr_state_3_), 
	.A(FE_OCPN101_curr_state_3_));
   BUFX2 FE_OCPC257_FE_OCP_DRV_N78_curr_state_3_ (.Y(FE_OCPN257_FE_OCP_DRV_N78_curr_state_3_), 
	.A(FE_OCPN101_curr_state_3_));
   BUFX2 FE_OCPC252_n5 (.Y(FE_OCPN252_n5), 
	.A(n5));
   BUFX2 FE_OCPC250_n60 (.Y(FE_OCPN250_n60), 
	.A(n60));
   BUFX2 FE_OCPC249_FE_OFN30_curr_state_1_ (.Y(FE_OCPN249_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN156_FE_OFN30_curr_state_1_));
   BUFX2 FE_OCPC247_curr_state_2_ (.Y(FE_OCPN247_curr_state_2_), 
	.A(FE_OCP_RBN339_curr_state_2_));
   BUFX2 FE_OCPC245_FE_OFN30_curr_state_1_ (.Y(FE_OCPN245_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN244_FE_OFN30_curr_state_1_));
   BUFX2 FE_OCPC244_FE_OFN30_curr_state_1_ (.Y(FE_OCPN244_FE_OFN30_curr_state_1_), 
	.A(FE_OFN30_curr_state_1_));
   NOR2X1 FE_RC_1313_0 (.Y(FE_RN_803_0), 
	.B(FE_OCP_RBN340_curr_state_2_), 
	.A(FE_OCP_RBN283_curr_state_0_));
   INVX2 FE_RC_896_0 (.Y(FE_RN_551_0), 
	.A(n35));
   INVX2 FE_RC_895_0 (.Y(FE_RN_550_0), 
	.A(n36));
   NAND2X1 FE_RC_894_0 (.Y(FE_RN_549_0), 
	.B(FE_RN_550_0), 
	.A(FE_RN_551_0));
   NAND2X1 FE_RC_893_0 (.Y(n34), 
	.B(n37), 
	.A(FE_RN_549_0));
   OR2X1 FE_RC_875_0 (.Y(FE_RN_538_0), 
	.B(FE_OCP_RBN337_curr_state_2_), 
	.A(n8));
   NAND2X1 FE_RC_874_0 (.Y(tx_enable_0), 
	.B(FE_RN_538_0), 
	.A(n9));
   AND2X2 FE_RC_835_0 (.Y(FE_RN_525_0), 
	.B(FE_OFN30_curr_state_1_), 
	.A(FE_OCP_RBN283_curr_state_0_));
   NAND2X1 FE_RC_834_0 (.Y(n2), 
	.B(n71), 
	.A(FE_RN_525_0));
   BUFX2 FE_OCPC236_curr_state_2_ (.Y(FE_OCPN236_curr_state_2_), 
	.A(FE_OCP_RBN339_curr_state_2_));
   BUFX2 FE_OCPC234_FE_OFN30_curr_state_1_ (.Y(FE_OCPN234_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN244_FE_OFN30_curr_state_1_));
   NOR2X1 FE_RC_732_0 (.Y(n72), 
	.B(FE_OCP_RBN281_curr_state_0_), 
	.A(FE_OCPN236_curr_state_2_));
   BUFX2 FE_OCP_RBC230_FE_OCPN84_curr_state_0_ (.Y(FE_OCP_RBN230_FE_OCPN84_curr_state_0_), 
	.A(FE_OCP_RBN227_FE_OCPN84_curr_state_0_));
   BUFX2 FE_OCP_RBC229_FE_OCPN84_curr_state_0_ (.Y(FE_OCP_RBN229_FE_OCPN84_curr_state_0_), 
	.A(FE_OCP_RBN227_FE_OCPN84_curr_state_0_));
   BUFX2 FE_OCP_RBC228_FE_OCPN84_curr_state_0_ (.Y(FE_OCP_RBN228_FE_OCPN84_curr_state_0_), 
	.A(FE_OCP_RBN227_FE_OCPN84_curr_state_0_));
   INVX4 FE_OCP_RBC227_FE_OCPN84_curr_state_0_ (.Y(FE_OCP_RBN227_FE_OCPN84_curr_state_0_), 
	.A(FE_OCPN269_FE_OCP_RBN226_FE_OCPN84_curr_state_0_));
   INVX1 FE_OCP_RBC225_curr_state_3_ (.Y(FE_OCP_RBN225_curr_state_3_), 
	.A(FE_OCP_RBN224_curr_state_3_));
   INVX2 FE_OCP_RBC224_curr_state_3_ (.Y(FE_OCP_RBN224_curr_state_3_), 
	.A(curr_state[3]));
   BUFX2 FE_OCPC213_n17 (.Y(FE_OCPN213_n17), 
	.A(n17));
   BUFX2 FE_OCPC205_n38 (.Y(FE_OCPN205_n38), 
	.A(FE_OCPN265_n38));
   BUFX2 FE_OCPC202_n36 (.Y(FE_OCPN202_n36), 
	.A(n36));
   BUFX2 FE_OCPC198_n48 (.Y(FE_OCPN198_n48), 
	.A(n48));
   BUFX2 FE_OCPC197_stop_int (.Y(stop), 
	.A(FE_OCPN197_stop_int));
   BUFX2 FE_OCPC196_n27 (.Y(FE_OCPN196_n27), 
	.A(n27));
   BUFX2 FE_OCPC193_n14 (.Y(FE_OCPN193_n14), 
	.A(FE_OCPN262_n14));
   BUFX2 FE_OCPC192_n26 (.Y(FE_OCPN192_n26), 
	.A(n26));
   BUFX2 FE_OCPC190_n6 (.Y(FE_OCPN190_n6), 
	.A(n6));
   BUFX2 FE_OCPC188_n1 (.Y(FE_OCPN188_n1), 
	.A(FE_OCPN186_n1));
   BUFX2 FE_OCPC187_n1 (.Y(FE_OCPN187_n1), 
	.A(n1));
   BUFX2 FE_OCPC186_n1 (.Y(FE_OCPN186_n1), 
	.A(n1));
   BUFX2 FE_OCPC184_n11 (.Y(FE_OCPN184_n11), 
	.A(n11));
   BUFX2 FE_OCPC183_n11 (.Y(FE_OCPN183_n11), 
	.A(n11));
   BUFX2 FE_OCPC182_n47 (.Y(FE_OCPN182_n47), 
	.A(n47));
   BUFX2 FE_OCPC177_n7 (.Y(FE_OCPN177_n7), 
	.A(FE_OCPN175_n7));
   BUFX2 FE_OCPC176_n7 (.Y(FE_OCPN176_n7), 
	.A(FE_OCPN175_n7));
   BUFX2 FE_OCPC175_n7 (.Y(FE_OCPN175_n7), 
	.A(n7));
   BUFX2 FE_OCPC174_n62 (.Y(FE_OCPN174_n62), 
	.A(n62));
   BUFX2 FE_OCPC173_n10 (.Y(FE_OCPN173_n10), 
	.A(n10));
   BUFX2 FE_OCPC172_n5 (.Y(FE_OCPN172_n5), 
	.A(n5));
   BUFX2 FE_OCPC169_FE_OCP_DRV_N78_curr_state_3_ (.Y(FE_OCPN169_FE_OCP_DRV_N78_curr_state_3_), 
	.A(FE_OCPN101_curr_state_3_));
   BUFX2 FE_OCPC168_FE_OCP_DRV_N78_curr_state_3_ (.Y(FE_OCPN168_FE_OCP_DRV_N78_curr_state_3_), 
	.A(FE_OCPN258_FE_OCP_DRV_N78_curr_state_3_));
   BUFX2 FE_OCPC167_n28 (.Y(FE_OCPN167_n28), 
	.A(n28));
   BUFX2 FE_OCPC164_curr_state_2_ (.Y(FE_OCPN164_curr_state_2_), 
	.A(FE_OCP_RBN339_curr_state_2_));
   BUFX2 FE_OCPC163_n16 (.Y(FE_OCPN163_n16), 
	.A(FE_OCPN161_n16));
   BUFX2 FE_OCPC162_n16 (.Y(FE_OCPN162_n16), 
	.A(FE_OCPN161_n16));
   BUFX2 FE_OCPC161_n16 (.Y(FE_OCPN161_n16), 
	.A(FE_OCP_RBN285_curr_state_0_));
   BUFX2 FE_OCPC158_FE_OFN30_curr_state_1_ (.Y(FE_OCPN158_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN249_FE_OFN30_curr_state_1_));
   BUFX2 FE_OCPC157_FE_OFN30_curr_state_1_ (.Y(FE_OCPN157_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN249_FE_OFN30_curr_state_1_));
   BUFX2 FE_OCPC156_FE_OFN30_curr_state_1_ (.Y(FE_OCPN156_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN244_FE_OFN30_curr_state_1_));
   BUFX2 FE_OCPC155_FE_OFN30_curr_state_1_ (.Y(FE_OCPN155_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN244_FE_OFN30_curr_state_1_));
   BUFX2 FE_OCPC154_FE_OFN30_curr_state_1_ (.Y(FE_OCPN154_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN234_FE_OFN30_curr_state_1_));
   INVX1 FE_RC_496_0 (.Y(FE_RN_301_0), 
	.A(FE_OFN30_curr_state_1_));
   AND2X2 FE_RC_494_0 (.Y(FE_RN_299_0), 
	.B(FE_OCP_RBN224_curr_state_3_), 
	.A(FE_OCP_RBN338_curr_state_2_));
   AND2X2 FE_RC_491_0 (.Y(n71), 
	.B(FE_OCP_RBN224_curr_state_3_), 
	.A(FE_OCP_RBN338_curr_state_2_));
   OR2X1 FE_RC_378_0 (.Y(FE_RN_236_0), 
	.B(n55), 
	.A(n21));
   INVX4 FE_RC_377_0 (.Y(n17), 
	.A(FE_RN_235_0));
   AND2X2 FE_RC_376_0 (.Y(FE_RN_235_0), 
	.B(FE_RN_236_0), 
	.A(n56));
   OAI21X1 FE_RC_360_0 (.Y(n56), 
	.C(n58), 
	.B(n57), 
	.A(n38));
   INVX2 FE_RC_354_0 (.Y(FE_RN_223_0), 
	.A(FE_OCPN161_n16));
   INVX1 FE_RC_353_0 (.Y(FE_RN_222_0), 
	.A(n6));
   NAND2X1 FE_RC_352_0 (.Y(FE_RN_221_0), 
	.B(FE_RN_222_0), 
	.A(FE_RN_223_0));
   NAND2X1 FE_RC_351_0 (.Y(n38), 
	.B(FE_RN_221_0), 
	.A(n61));
   AOI21X1 FE_RC_343_0 (.Y(n61), 
	.C(FE_OCPN197_stop_int), 
	.B(FE_OCPN184_n11), 
	.A(FE_OCPN158_FE_OFN30_curr_state_1_));
   OR2X1 FE_RC_321_0 (.Y(FE_RN_219_0), 
	.B(FE_OCP_RBN307_n2), 
	.A(stop));
   NAND2X1 FE_RC_320_0 (.Y(FE_RN_218_0), 
	.B(FE_OCPN196_n27), 
	.A(FE_OCPN175_n7));
   NOR2X1 FE_RC_319_0 (.Y(FE_RN_217_0), 
	.B(FE_RN_218_0), 
	.A(FE_RN_219_0));
   NAND2X1 FE_RC_318_0 (.Y(n93), 
	.B(n52), 
	.A(FE_RN_217_0));
   BUFX2 FE_OCPC126_n71 (.Y(FE_OCPN126_n71), 
	.A(n71));
   BUFX2 FE_OCPC119_load_data_1_int (.Y(load_data_1), 
	.A(FE_OCPN119_load_data_1_int));
   BUFX2 FE_OCPC108_read_done_int (.Y(FE_OCPN108_read_done_int), 
	.A(read_done));
   BUFX2 FE_OCPC101_curr_state_3_ (.Y(FE_OCPN101_curr_state_3_), 
	.A(FE_OCP_RBN225_curr_state_3_));
   BUFX2 FE_OCPC86_curr_state_0_ (.Y(FE_OCPN86_curr_state_0_), 
	.A(FE_OCP_RBN229_FE_OCPN84_curr_state_0_));
   BUFX2 FE_OCPC85_curr_state_0_ (.Y(FE_OCPN85_curr_state_0_), 
	.A(FE_OCP_RBN228_FE_OCPN84_curr_state_0_));
   BUFX2 FE_OCPC80_curr_state_2_ (.Y(FE_OCPN80_curr_state_2_), 
	.A(FE_OCP_RBN339_curr_state_2_));
   INVX2 FE_RC_17_0 (.Y(FE_RN_10_0), 
	.A(FE_OCPN168_FE_OCP_DRV_N78_curr_state_3_));
   NAND2X1 FE_RC_16_0 (.Y(FE_RN_9_0), 
	.B(n72), 
	.A(FE_OCPN154_FE_OFN30_curr_state_1_));
   OR2X2 FE_RC_15_0 (.Y(n42), 
	.B(FE_RN_10_0), 
	.A(FE_RN_9_0));
   NAND2X1 FE_RC_13_0 (.Y(FE_OCPN119_load_data_1_int), 
	.B(FE_RN_8_0), 
	.A(n47));
   INVX2 FE_RC_11_0 (.Y(FE_RN_6_0), 
	.A(FE_OCPN245_FE_OFN30_curr_state_1_));
   AND2X2 FE_RC_10_0 (.Y(n28), 
	.B(FE_OCP_RBN284_curr_state_0_), 
	.A(FE_RN_6_0));
   INVX4 FE_RC_2_0 (.Y(n60), 
	.A(FE_OCP_RBN339_curr_state_2_));
   BUFX4 FE_OFC30_curr_state_1_ (.Y(FE_OFN30_curr_state_1_), 
	.A(curr_state[1]));
   DFFSR \bit_cnt_reg[0]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN40_nn_rst), 
	.Q(bit_cnt[0]), 
	.D(n90), 
	.CLK(nclk__L2_N2));
   DFFSR \bit_cnt_reg[1]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN40_nn_rst), 
	.Q(bit_cnt[1]), 
	.D(n88), 
	.CLK(nclk__L2_N2));
   DFFSR \bit_cnt_reg[2]  (.S(1'b1), 
	.R(FE_OFN40_nn_rst), 
	.Q(bit_cnt[2]), 
	.D(n86), 
	.CLK(nclk__L2_N2));
   DFFSR \curr_state_reg[0]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN40_nn_rst), 
	.Q(curr_state[0]), 
	.D(n96), 
	.CLK(nclk__L2_N2));
   DFFSR \curr_state_reg[2]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN40_nn_rst), 
	.Q(curr_state[2]), 
	.D(n94), 
	.CLK(nclk__L2_N2));
   DFFSR \curr_state_reg[1]  (.S(1'b1), 
	.R(FE_PT1_FE_OFN40_nn_rst), 
	.Q(curr_state[1]), 
	.D(n95), 
	.CLK(clk));
   DFFSR \curr_state_reg[3]  (.S(1'b1), 
	.R(n_rst), 
	.Q(curr_state[3]), 
	.D(n93), 
	.CLK(clk));
   NAND3X1 U3 (.Y(tx_sel), 
	.C(n3), 
	.B(FE_OCP_RBN305_n2), 
	.A(n1));
   INVX2 U4 (.Y(n3), 
	.A(n4));
   OAI21X1 U5 (.Y(n4), 
	.C(n7), 
	.B(n6), 
	.A(FE_OCPN172_n5));
   AOI21X1 U7 (.Y(n9), 
	.C(FE_OCPN183_n11), 
	.B(FE_OCPN173_n10), 
	.A(FE_OCPN172_n5));
   INVX2 U9 (.Y(bus_mode[1]), 
	.A(n13));
   INVX2 U10 (.Y(sync), 
	.A(FE_OCPN262_n14));
   MUX2X1 U11 (.Y(n96), 
	.S(n17), 
	.B(n15), 
	.A(FE_OCPN163_n16));
   NOR2X1 U12 (.Y(n15), 
	.B(n19), 
	.A(n18));
   OAI21X1 U13 (.Y(n19), 
	.C(n22), 
	.B(n21), 
	.A(n20));
   MUX2X1 U14 (.Y(n22), 
	.S(n25), 
	.B(n23), 
	.A(n24));
   NAND2X1 U15 (.Y(n24), 
	.B(FE_OCPN192_n26), 
	.A(n27));
   INVX1 U16 (.Y(n23), 
	.A(FE_OCPN188_n1));
   INVX1 U17 (.Y(n20), 
	.A(FE_OCPN167_n28));
   NAND3X1 U18 (.Y(n18), 
	.C(FE_OCPN177_n7), 
	.B(n30), 
	.A(n29));
   INVX1 U19 (.Y(n29), 
	.A(load_data_1));
   NAND2X1 U20 (.Y(n95), 
	.B(n31), 
	.A(FE_OCPN266_n30));
   INVX2 U21 (.Y(n30), 
	.A(start));
   NOR2X1 U22 (.Y(start), 
	.B(FE_OCPN85_curr_state_0_), 
	.A(n26));
   MUX2X1 U23 (.Y(n31), 
	.S(n17), 
	.B(n32), 
	.A(FE_OCPN154_FE_OFN30_curr_state_1_));
   OR2X2 U24 (.Y(n32), 
	.B(n33), 
	.A(n34));
   INVX2 U26 (.Y(n37), 
	.A(FE_OCPN265_n38));
   OAI21X1 U27 (.Y(n33), 
	.C(n41), 
	.B(n39), 
	.A(n40));
   AND2X2 U28 (.Y(n41), 
	.B(n42), 
	.A(FE_OCPN193_n14));
   INVX2 U29 (.Y(n39), 
	.A(n43));
   OAI21X1 U30 (.Y(n43), 
	.C(FE_OCPN188_n1), 
	.B(n27), 
	.A(n25));
   OAI21X1 U31 (.Y(n94), 
	.C(n45), 
	.B(FE_OCPN213_n17), 
	.A(n44));
   AND2X2 U32 (.Y(n45), 
	.B(FE_OCPN182_n47), 
	.A(n46));
   OAI21X1 U33 (.Y(n46), 
	.C(FE_OCPN164_curr_state_2_), 
	.B(n17), 
	.A(FE_OCPN198_n48));
   AOI21X1 U34 (.Y(n44), 
	.C(FE_OCPN205_n38), 
	.B(n49), 
	.A(n35));
   OAI21X1 U35 (.Y(n49), 
	.C(FE_OCPN202_n36), 
	.B(FE_OCPN196_n27), 
	.A(transmit));
   INVX2 U36 (.Y(n36), 
	.A(n48));
   OAI21X1 U37 (.Y(n48), 
	.C(FE_OCPN186_n1), 
	.B(FE_OCPN162_n16), 
	.A(n26));
   AOI21X1 U39 (.Y(n52), 
	.C(n53), 
	.B(n17), 
	.A(FE_OCPN169_FE_OCP_DRV_N78_curr_state_3_));
   OAI21X1 U40 (.Y(n53), 
	.C(n42), 
	.B(n54), 
	.A(FE_OCPN186_n1));
   NAND2X1 U41 (.Y(n54), 
	.B(n40), 
	.A(n35));
   INVX4 U42 (.Y(n35), 
	.A(n25));
   NAND3X1 U43 (.Y(n25), 
	.C(bit_cnt[2]), 
	.B(bit_cnt[0]), 
	.A(bit_cnt[1]));
   NAND2X1 U46 (.Y(n57), 
	.B(n13), 
	.A(FE_OCPN175_n7));
   NAND3X1 U47 (.Y(n13), 
	.C(n59), 
	.B(FE_OCPN157_FE_OFN30_curr_state_1_), 
	.A(FE_OCPN257_FE_OCP_DRV_N78_curr_state_3_));
   NOR2X1 U48 (.Y(n59), 
	.B(FE_OCPN250_n60), 
	.A(FE_OCP_RBN230_FE_OCPN84_curr_state_0_));
   NAND2X1 U51 (.Y(n55), 
	.B(n40), 
	.A(FE_OCPN167_n28));
   INVX8 U52 (.Y(n40), 
	.A(transmit));
   INVX4 U53 (.Y(n21), 
	.A(FE_OCPN174_n62));
   OAI21X1 U55 (.Y(FE_OCPN197_stop_int), 
	.C(n64), 
	.B(n6), 
	.A(FE_OCPN252_n5));
   NAND3X1 U56 (.Y(n64), 
	.C(FE_OCPN101_curr_state_3_), 
	.B(n28), 
	.A(FE_OCP_RBN339_curr_state_2_));
   NAND2X1 U58 (.Y(n27), 
	.B(n8), 
	.A(FE_OCPN183_n11));
   XNOR2X1 U59 (.Y(n90), 
	.B(bit_cnt[0]), 
	.A(n58));
   INVX2 U60 (.Y(n58), 
	.A(bit_done));
   XNOR2X1 U61 (.Y(n88), 
	.B(n65), 
	.A(bit_cnt[1]));
   XOR2X1 U62 (.Y(n86), 
	.B(n66), 
	.A(bit_cnt[2]));
   NOR2X1 U63 (.Y(n66), 
	.B(n65), 
	.A(n67));
   NAND2X1 U64 (.Y(n65), 
	.B(bit_cnt[0]), 
	.A(bit_done));
   INVX1 U65 (.Y(n67), 
	.A(bit_cnt[1]));
   NAND2X1 U66 (.Y(load_data_0), 
	.B(FE_OCP_RBN305_n2), 
	.A(n14));
   NAND3X1 U67 (.Y(n14), 
	.C(FE_OCPN86_curr_state_0_), 
	.B(n62), 
	.A(n8));
   INVX2 U68 (.Y(n8), 
	.A(FE_OCPN155_FE_OFN30_curr_state_1_));
   OR2X2 U69 (.Y(bus_mode[0]), 
	.B(n69), 
	.A(n68));
   NAND3X1 U70 (.Y(n69), 
	.C(FE_OCPN176_n7), 
	.B(FE_OCPN192_n26), 
	.A(FE_OCPN190_n6));
   NAND3X1 U71 (.Y(n7), 
	.C(FE_OCPN101_curr_state_3_), 
	.B(FE_OCPN250_n60), 
	.A(n28));
   NAND2X1 U72 (.Y(n26), 
	.B(FE_OCPN259_n62), 
	.A(FE_OCPN234_FE_OFN30_curr_state_1_));
   NOR2X1 U73 (.Y(n62), 
	.B(FE_OCPN247_curr_state_2_), 
	.A(FE_OCPN101_curr_state_3_));
   INVX4 U74 (.Y(n6), 
	.A(n10));
   NOR2X1 U75 (.Y(n10), 
	.B(FE_OCPN156_FE_OFN30_curr_state_1_), 
	.A(n60));
   NAND3X1 U76 (.Y(n68), 
	.C(FE_OCPN187_n1), 
	.B(FE_OCPN108_read_done_int), 
	.A(n70));
   NAND3X1 U77 (.Y(n1), 
	.C(FE_OCPN234_FE_OFN30_curr_state_1_), 
	.B(FE_OCP_RBN285_curr_state_0_), 
	.A(FE_OCPN126_n71));
   NOR2X1 U79 (.Y(read_done), 
	.B(FE_OCP_RBN304_n2), 
	.A(FE_OCPN119_load_data_1_int));
   INVX1 U89 (.Y(n70), 
	.A(FE_OCPN184_n11));
   NOR2X1 U90 (.Y(n11), 
	.B(n5), 
	.A(FE_OCPN80_curr_state_2_));
   NAND2X1 U91 (.Y(n5), 
	.B(FE_OCP_RBN227_FE_OCPN84_curr_state_0_), 
	.A(FE_OCPN101_curr_state_3_));
endmodule

module lab7_usb_transmitter (
	clk, 
	n_rst, 
	d_plus, 
	d_minus, 
	transmit, 
	write_enable, 
	write_data, 
	fifo_empty, 
	fifo_full, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input clk;
   input n_rst;
   output d_plus;
   output d_minus;
   input transmit;
   input write_enable;
   input [7:0] write_data;
   output fifo_empty;
   output fifo_full;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   // Internal wires
   wire FE_OCPN199_sync_int;
   wire FE_OFN43_nn_rst;
   wire FE_OFN40_nn_rst;
   wire FE_OFN38_nn_rst;
   wire FE_OFN37_nn_rst;
   wire FE_OFN36_nn_rst;
   wire FE_OFN35_nn_rst;
   wire tx_sel_int;
   wire tx_out_0_int;
   wire tx_out_1_int;
   wire sync_int;
   wire tx_value_int;
   wire shift_enable_int;
   wire tx_enable_0_int;
   wire load_data_0_int;
   wire tx_enable_1_int;
   wire load_data_1_int;
   wire read_done_int;
   wire start_int;
   wire stop_int;
   wire bit_done_int;
   wire n1;
   wire n2;
   wire n3;
   wire [7:0] tx_data_int;
   wire [7:0] read_data_int;
   wire [1:0] bus_mode_int;

   BUFX2 FE_OCPC199_sync_int (.Y(FE_OCPN199_sync_int), 
	.A(sync_int));
   INVX2 FE_OFC43_nn_rst (.Y(FE_OFN43_nn_rst), 
	.A(FE_OFN35_nn_rst));
   INVX8 FE_OFC40_nn_rst (.Y(FE_OFN40_nn_rst), 
	.A(FE_OFN35_nn_rst));
   INVX4 FE_OFC38_nn_rst (.Y(FE_OFN38_nn_rst), 
	.A(FE_OFN36_nn_rst));
   INVX8 FE_OFC37_nn_rst (.Y(FE_OFN37_nn_rst), 
	.A(FE_OFN35_nn_rst));
   INVX1 FE_OFC36_nn_rst (.Y(FE_OFN36_nn_rst), 
	.A(n_rst));
   INVX8 FE_OFC35_nn_rst (.Y(FE_OFN35_nn_rst), 
	.A(n_rst));
   lab7_out_ctrl OCTRL (.clk(clk), 
	.n_rst(FE_OFN36_nn_rst), 
	.d_plus(d_plus), 
	.d_minus(d_minus), 
	.bus_mode(bus_mode_int), 
	.tx_value(tx_value_int), 
	.FE_OFN38_nn_rst(FE_OFN38_nn_rst));
   lab7_encoder ENC (.clk(nclk__L2_N1), 
	.n_rst(FE_OFN38_nn_rst), 
	.tx_bit(n3), 
	.shift_enable(shift_enable_int), 
	.tx_value(tx_value_int));
   lab7_tx_sr_1 T_SR_0 (.clk(nclk__L2_N1), 
	.n_rst(FE_OFN37_nn_rst), 
	.shift_enable(shift_enable_int), 
	.tx_enable(tx_enable_0_int), 
	.tx_data(tx_data_int), 
	.load_data(load_data_0_int), 
	.tx_out(tx_out_0_int), 
	.FE_OFN40_nn_rst(FE_OFN40_nn_rst), 
	.FE_OFN37_nn_rst(FE_OFN37_nn_rst), 
	.nclk__L2_N3(nclk__L2_N3));
   lab7_tx_sr_0 T_SR_1 (.clk(clk), 
	.n_rst(FE_OFN37_nn_rst), 
	.shift_enable(shift_enable_int), 
	.tx_enable(tx_enable_1_int), 
	.tx_data(tx_data_int), 
	.load_data(load_data_1_int), 
	.tx_out(tx_out_1_int), 
	.FE_OFN38_nn_rst(FE_OFN38_nn_rst), 
	.FE_OFN43_nn_rst(FE_OFN43_nn_rst), 
	.FE_OFN40_nn_rst(FE_OFN37_nn_rst), 
	.FE_OFN37_nn_rst(FE_OFN37_nn_rst), 
	.nclk__L2_N1(nclk__L2_N1));
   lab7_tx_fifo T_FIFO (.clk(clk), 
	.n_rst(FE_OFN35_nn_rst), 
	.read_done(read_done_int), 
	.read_data(read_data_int), 
	.fifo_empty(fifo_empty), 
	.fifo_full(fifo_full), 
	.write_enable(write_enable), 
	.write_data(write_data), 
	.FE_OFN37_nn_rst(FE_OFN37_nn_rst), 
	.FE_OFN43_nn_rst(FE_OFN43_nn_rst), 
	.FE_OFN40_nn_rst(FE_OFN37_nn_rst), 
	.FE_PT1_FE_OFN40_nn_rst(FE_OFN43_nn_rst), 
	.FE_PT1_FE_OFN43_nn_rst(FE_OFN43_nn_rst), 
	.FE_PT2_FE_OFN43_nn_rst(FE_OFN43_nn_rst), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
   lab7_timer TIM (.clk(nclk__L2_N2), 
	.n_rst(FE_OFN40_nn_rst), 
	.start(start_int), 
	.stop(stop_int), 
	.shift_enable(shift_enable_int), 
	.bit_done(bit_done_int), 
	.FE_OFN37_nn_rst(FE_OFN40_nn_rst), 
	.FE_OFN40_nn_rst(FE_OFN40_nn_rst));
   lab7_tcu CTRL (.clk(nclk__L2_N1), 
	.n_rst(FE_OFN37_nn_rst), 
	.transmit(transmit), 
	.bit_done(bit_done_int), 
	.bus_mode(bus_mode_int), 
	.stop(stop_int), 
	.start(start_int), 
	.sync(sync_int), 
	.read_done(read_done_int), 
	.tx_sel(tx_sel_int), 
	.tx_enable_0(tx_enable_0_int), 
	.load_data_0(load_data_0_int), 
	.tx_enable_1(tx_enable_1_int), 
	.load_data_1(load_data_1_int), 
	.FE_OFN40_nn_rst(FE_OFN40_nn_rst), 
	.FE_PT1_FE_OFN40_nn_rst(FE_OFN40_nn_rst), 
	.nclk__L2_N2(nclk__L2_N2));
   OR2X2 U3 (.Y(tx_data_int[7]), 
	.B(FE_OCPN199_sync_int), 
	.A(read_data_int[7]));
   AND2X2 U4 (.Y(tx_data_int[6]), 
	.B(n1), 
	.A(read_data_int[6]));
   AND2X2 U5 (.Y(tx_data_int[5]), 
	.B(n1), 
	.A(read_data_int[5]));
   AND2X2 U6 (.Y(tx_data_int[4]), 
	.B(n1), 
	.A(read_data_int[4]));
   AND2X2 U7 (.Y(tx_data_int[3]), 
	.B(n1), 
	.A(read_data_int[3]));
   AND2X2 U8 (.Y(tx_data_int[2]), 
	.B(n1), 
	.A(read_data_int[2]));
   AND2X2 U9 (.Y(tx_data_int[1]), 
	.B(n1), 
	.A(read_data_int[1]));
   AND2X2 U10 (.Y(tx_data_int[0]), 
	.B(n1), 
	.A(read_data_int[0]));
   INVX4 U11 (.Y(n1), 
	.A(sync_int));
   INVX2 U12 (.Y(n3), 
	.A(n2));
   MUX2X1 U13 (.Y(n2), 
	.S(tx_sel_int), 
	.B(tx_out_0_int), 
	.A(tx_out_1_int));
endmodule

module lab7_layout_design_t (
	clk, 
	n_rst, 
	d_plus, 
	d_minus, 
	transmit, 
	write_enable, 
	write_data, 
	fifo_empty, 
	fifo_full, 
	nclk__L2_N1, 
	nclk__L2_N2, 
	nclk__L2_N3, 
	nclk__L2_N4, 
	nclk__L2_N5, 
	nclk__L2_N6, 
	nclk__L2_N7);
   input clk;
   input n_rst;
   output d_plus;
   output d_minus;
   input transmit;
   input write_enable;
   input [7:0] write_data;
   output fifo_empty;
   output fifo_full;
   input nclk__L2_N1;
   input nclk__L2_N2;
   input nclk__L2_N3;
   input nclk__L2_N4;
   input nclk__L2_N5;
   input nclk__L2_N6;
   input nclk__L2_N7;

   lab7_usb_transmitter LD (.clk(clk), 
	.n_rst(n_rst), 
	.d_plus(d_plus), 
	.d_minus(d_minus), 
	.transmit(transmit), 
	.write_enable(write_enable), 
	.write_data(write_data), 
	.fifo_empty(fifo_empty), 
	.fifo_full(fifo_full), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
endmodule

module lab7_layout_design (
	clk, 
	n_rst, 
	d_plus, 
	d_minus, 
	transmit, 
	write_enable, 
	write_data, 
	fifo_empty, 
	fifo_full);
   input clk;
   input n_rst;
   output d_plus;
   output d_minus;
   input transmit;
   input write_enable;
   input [7:0] write_data;
   output fifo_empty;
   output fifo_full;

   // Internal wires
   wire nclk__L2_N7;
   wire nclk__L2_N6;
   wire nclk__L2_N5;
   wire nclk__L2_N4;
   wire nclk__L2_N3;
   wire nclk__L2_N2;
   wire nclk__L2_N1;
   wire nclk__L2_N0;
   wire nclk__L1_N1;
   wire nclk__L1_N0;
   wire nclk;
   wire nn_rst;
   wire ntransmit;
   wire nwrite_enable;
   wire nd_plus;
   wire nd_minus;
   wire nfifo_empty;
   wire nfifo_full;
   wire [7:0] nwrite_data;

   INVX8 nclk__L2_I7 (.Y(nclk__L2_N7), 
	.A(nclk__L1_N1));
   INVX8 nclk__L2_I6 (.Y(nclk__L2_N6), 
	.A(nclk__L1_N1));
   INVX8 nclk__L2_I5 (.Y(nclk__L2_N5), 
	.A(nclk__L1_N1));
   INVX8 nclk__L2_I4 (.Y(nclk__L2_N4), 
	.A(nclk__L1_N1));
   INVX8 nclk__L2_I3 (.Y(nclk__L2_N3), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I2 (.Y(nclk__L2_N2), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I1 (.Y(nclk__L2_N1), 
	.A(nclk__L1_N0));
   INVX8 nclk__L2_I0 (.Y(nclk__L2_N0), 
	.A(nclk__L1_N0));
   INVX8 nclk__L1_I1 (.Y(nclk__L1_N1), 
	.A(nclk));
   INVX8 nclk__L1_I0 (.Y(nclk__L1_N0), 
	.A(nclk));
   lab7_layout_design_t I0 (.clk(nclk__L2_N0), 
	.n_rst(nn_rst), 
	.d_plus(nd_plus), 
	.d_minus(nd_minus), 
	.transmit(ntransmit), 
	.write_enable(nwrite_enable), 
	.write_data(nwrite_data), 
	.fifo_empty(nfifo_empty), 
	.fifo_full(nfifo_full), 
	.nclk__L2_N1(nclk__L2_N1), 
	.nclk__L2_N2(nclk__L2_N2), 
	.nclk__L2_N3(nclk__L2_N3), 
	.nclk__L2_N4(nclk__L2_N4), 
	.nclk__L2_N5(nclk__L2_N5), 
	.nclk__L2_N6(nclk__L2_N6), 
	.nclk__L2_N7(nclk__L2_N7));
   PADVDD U1 ();
   PADGND U2 ();
   PADOUT U3 (.YPAD(d_minus), 
	.DO(nd_minus));
   PADOUT U4 (.YPAD(d_plus), 
	.DO(nd_plus));
   PADOUT U5 (.YPAD(fifo_empty), 
	.DO(nfifo_empty));
   PADOUT U6 (.YPAD(fifo_full), 
	.DO(nfifo_full));
   PADINC U7 (.YPAD(clk), 
	.DI(nclk));
   PADINC U8 (.YPAD(n_rst), 
	.DI(nn_rst));
   PADINC U9 (.YPAD(transmit), 
	.DI(ntransmit));
   PADINC U10 (.YPAD(write_data[0]), 
	.DI(nwrite_data[0]));
   PADINC U11 (.YPAD(write_data[1]), 
	.DI(nwrite_data[1]));
   PADINC U12 (.YPAD(write_data[2]), 
	.DI(nwrite_data[2]));
   PADINC U13 (.YPAD(write_data[3]), 
	.DI(nwrite_data[3]));
   PADINC U14 (.YPAD(write_data[4]), 
	.DI(nwrite_data[4]));
   PADINC U15 (.YPAD(write_data[5]), 
	.DI(nwrite_data[5]));
   PADINC U16 (.YPAD(write_data[6]), 
	.DI(nwrite_data[6]));
   PADINC U17 (.YPAD(write_data[7]), 
	.DI(nwrite_data[7]));
   PADINC U18 (.YPAD(write_enable), 
	.DI(nwrite_enable));
endmodule

