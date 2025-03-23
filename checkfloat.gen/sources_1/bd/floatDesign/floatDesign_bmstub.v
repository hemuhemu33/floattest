// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module floatDesign (
  s_axis_a_tdata_0,
  s_axis_b_tdata_0,
  s_axis_b_tvalid_0,
  s_axis_a_tvalid_0,
  aclk_0,
  m_axis_result_tdata_0,
  m_axis_result_tvalid_0,
  s_axis_b_tready_0,
  s_axis_a_tready_0
);

  (* X_INTERFACE_IGNORE = "true" *)
  input [31:0]s_axis_a_tdata_0;
  (* X_INTERFACE_IGNORE = "true" *)
  input [31:0]s_axis_b_tdata_0;
  (* X_INTERFACE_IGNORE = "true" *)
  input s_axis_b_tvalid_0;
  (* X_INTERFACE_IGNORE = "true" *)
  input s_axis_a_tvalid_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.ACLK_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_0, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN floatDesign_aclk_0, INSERT_VIP 0" *)
  input aclk_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output [31:0]m_axis_result_tdata_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output m_axis_result_tvalid_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output s_axis_b_tready_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output s_axis_a_tready_0;

  // stub module has no contents

endmodule
