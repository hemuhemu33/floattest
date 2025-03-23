`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2025 08:11:28 PM
// Design Name: 
// Module Name: TB_BRAMTest
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_BRAMTest();
   reg clk = 0;
   reg rst = 0;

   reg [31:0] delaytime=4;
   
   // bram port #0 port
   reg ena = 0;
   reg wea = 0;
   wire [31:0] douta;
   reg  [31:0] dina;
   reg  [13:0] addra;
   

   // bram port #1 port
   reg enb = 0;
   reg web = 0;
   wire [31:0] doutb;
   reg  [31:0] dinb;
   reg  [13:0] addrb;

   always #1 clk = ~clk;

   BRAMTest_wrapper bt(
		       ////////////////////////////////////////////////////////
		       //                       port A                       //
		       ////////////////////////////////////////////////////////

		       //input
		       .BRAM_PORTA_addr(addra),
		       .BRAM_PORTA_clk(clk),
		       .BRAM_PORTA_din(dina),
		       .BRAM_PORTA_en(ena),
		       .BRAM_PORTA_we(wea),

		       // output
		       .BRAM_PORTA_dout(douta),

		       ////////////////////////////////////////////////////////
		       //                       port B                       //
		       ////////////////////////////////////////////////////////
		       // input
		       .BRAM_PORTB_addr(addrb),
		       .BRAM_PORTB_clk(clk),
		       .BRAM_PORTB_din(dinb),
		       .BRAM_PORTB_en(enb),
		       .BRAM_PORTB_we(web),
		       // output
		       .BRAM_PORTB_dout(doutb)
	       );
   
   initial begin
      // 初期化
      addra <= 14'h0;
      addrb <= 14'h0;
      ena   <= 0;
      enb   <= 0;
      wea   <= 0;
      web   <= 0;
      dina  <= 32'h0;
      dinb  <= 32'h0;

      /////////////////////////////////////////////////////////////////////////
      //                              write test                             //
      /////////////////////////////////////////////////////////////////////////
      addra <= 32'h0;
      dina  <= 32'hA5A5A5A5;
      wea   <= 1;
      ena   <= 1;
      #delaytime;

      addra <= 32'h1;
      dina  <= 32'h3F3F3F3F;
      wea   <= 1;
      ena   <= 1;
      #delaytime;

      addra <= 32'h2;
      dina  <= 32'h5A5A5A5A;
      wea   <= 1;
      ena   <= 1;
      #delaytime;

      /////////////////////////////////////////////////////////////////////////
      //                          read test(port a)                          //
      /////////////////////////////////////////////////////////////////////////
      $display("-- port a test -- ");
      addra  <= 32'h0;
      wea    <= 0;
      ena    <= 1;
      #delaytime;
      $display("ADDR(%h) = %h", addra, douta);

      addra  <= 32'h1;
      wea    <= 0;
      ena    <= 1;
      #delaytime;
      $display("ADDR(%h) = %h", addra, douta);

      addra  <= 32'h2;
      wea    <= 0;
      ena    <= 1;
      #delaytime;
      $display("ADDR(%h) = %h", addra, douta);


      /////////////////////////////////////////////////////////////////////////
      //                          write enable = 0 test                      //
      /////////////////////////////////////////////////////////////////////////
      $display("-- write enable a test -- ");
      // 書き込み失敗。wea=0なので。
      addra  <= 32'h3;
      dina  <= 32'h12121212;
      wea    <= 0;
      ena    <= 1;
      #delaytime;

      addra  <= 32'h3;
      wea    <= 0;
      ena    <= 1;
      #delaytime;
      $display("ADDR(%h) = %h", addra, douta);

      /////////////////////////////////////////////////////////////////////////
      //                             port B test                             //
      /////////////////////////////////////////////////////////////////////////
      $display("-- port b test -- ");
      
      for(addrb = 0; addrb < 4; addrb = addrb + 1) begin
	 web <=0;
	 enb <= 1;
	 #delaytime;
	 $display("ADDR(%h) = %h", addrb, doutb);
      end

      
      $finish;
      
   end

   
endmodule
