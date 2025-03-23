`timescale 1ns / 1ps

module TB_floatDesing();

  // Clock and reset
  reg aclk_0 = 0;
  reg aresetn = 0;
  
  // AXI Stream inputs
  reg [31:0] s_axis_a_tdata;
  reg s_axis_a_tvalid;
  wire s_axis_a_tready;

  reg [31:0] s_axis_b_tdata;
  reg s_axis_b_tvalid;
  wire s_axis_b_tready;

  // AXI Stream output
  wire [31:0] m_axis_result_tdata;
  wire m_axis_result_tvalid;
  reg m_axis_result_tready;

  // Clock generation (100 MHz)
  always #5 aclk_0 = ~aclk_0;

  // Instantiate the Floating Point IP
  floatDesign uut (
    .aclk_0(aclk_0),
    .s_axis_a_tdata_0(s_axis_a_tdata),
    .s_axis_a_tvalid_0(s_axis_a_tvalid),
    .s_axis_b_tdata_0(s_axis_b_tdata),
    .s_axis_a_tready_0(s_axis_a_tready),
    .s_axis_b_tready_0(s_axis_b_tready),
    .s_axis_b_tvalid_0(s_axis_b_tready),
    .m_axis_result_tdata_0(m_axis_result_tdata),
    .m_axis_result_tvalid_0(m_axis_result_tvalid)
  );

  // Test sequence
  initial begin
    // 初期化
    aresetn = 0;
    s_axis_a_tvalid = 0;
    s_axis_b_tvalid = 0;
    m_axis_result_tready = 1;

    // リセット解除
    #20;
    aresetn = 1;

    // 入力データ送信 (例: A = 3.5, B = 1.5)
    #20;
    s_axis_a_tdata = 32'h40600000; // 3.5 (IEEE 754)
    s_axis_b_tdata = 32'h3fc00000; // 1.5 (IEEE 754)
    s_axis_a_tvalid = 1;
    s_axis_b_tvalid = 1;

    // ハンドシェイク完了待ち
    wait (s_axis_a_tready && s_axis_b_tready);
    #10;
    s_axis_a_tvalid = 0;
    s_axis_b_tvalid = 0;

    // 出力結果の受け取り
    wait (m_axis_result_tvalid);
    $display("Result = %h", m_axis_result_tdata);

    // シミュレーション終了
    #100;
    $finish;
  end

endmodule