//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Thu Mar 20 17:33:33 2025
//Host        : taka-B760M running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target floatDesign.bd
//Design      : floatDesign
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "floatDesign,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=floatDesign,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=4,da_clkrst_cnt=3,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "floatDesign.hwdef" *) 
module floatDesign
   (aclk_0,
    m_axis_result_tdata_0,
    m_axis_result_tvalid_0,
    s_axis_a_tdata_0,
    s_axis_a_tready_0,
    s_axis_a_tvalid_0,
    s_axis_b_tdata_0,
    s_axis_b_tready_0,
    s_axis_b_tvalid_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_0, CLK_DOMAIN floatDesign_aclk_0, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input aclk_0;
  output [31:0]m_axis_result_tdata_0;
  output m_axis_result_tvalid_0;
  input [31:0]s_axis_a_tdata_0;
  output s_axis_a_tready_0;
  input s_axis_a_tvalid_0;
  input [31:0]s_axis_b_tdata_0;
  output s_axis_b_tready_0;
  input s_axis_b_tvalid_0;

  wire aclk_0;
  wire [31:0]m_axis_result_tdata_0;
  wire m_axis_result_tvalid_0;
  wire [31:0]s_axis_a_tdata_0;
  wire s_axis_a_tready_0;
  wire s_axis_a_tvalid_0;
  wire [31:0]s_axis_b_tdata_0;
  wire s_axis_b_tready_0;
  wire s_axis_b_tvalid_0;

  floatDesign_floating_point_0_0 floating_point_0
       (.aclk(aclk_0),
        .m_axis_result_tdata(m_axis_result_tdata_0),
        .m_axis_result_tready(1'b1),
        .m_axis_result_tvalid(m_axis_result_tvalid_0),
        .s_axis_a_tdata(s_axis_a_tdata_0),
        .s_axis_a_tready(s_axis_a_tready_0),
        .s_axis_a_tvalid(s_axis_a_tvalid_0),
        .s_axis_b_tdata(s_axis_b_tdata_0),
        .s_axis_b_tready(s_axis_b_tready_0),
        .s_axis_b_tvalid(s_axis_b_tvalid_0));
endmodule
