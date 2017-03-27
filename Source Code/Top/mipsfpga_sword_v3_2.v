// mipsfpga_sword_v3.2
// 14 March 2017
//
// Instantiate the mipsfpga system and rename signals to
// match GPIO, LEDs and switches on Digilent's (Xilinx)
// sword board

// Digilent's (Xilinx) sword board:

`include "define.vh"

module mipsfpga_sword_v3.2(
                        input CLK100MHZ,
                        input	CPU_RESETN,
                        //button
                        output [4:0] btn_x,
                        input  [4:0] btn_y,

                        //switch
                        input  [15:0] sw,

                        //Seg
                        output seg_clk,
                        output seg_pen,
                        output seg_do,

                        //led
                        output led_clk,
                        output led_pen,
                        output led_do,


                        //LED RGB
                        output tri_led0_r,
                        output tri_led0_g,
                        output tri_led0_b,
                        output tri_led1_r,
                        output tri_led1_g,
                        output tri_led1_b,

                        // VGA
                        output vga_h_sync,
                        output vga_v_sync,
                        output [3:0] vga_red,
                        output [3:0] vga_green,
                        output [3:0] vga_blue,



                        //Pmod
                        inout  [ 8:1] JB);

  // Press btnCpuReset to reset the processor.


  wire clk_out, clk_25;
  wire tck_in, tck;


  clk_wiz_0 clk_wiz_0(.clk_in1(CLK100MHZ), .clk_out1(clk_out), .clk_out2(clk_25));

  //clk_gen_sword clk_wiz_0(.clk_pad(CLK100MHZ), .clk_100m(), .clk_25m(), .clk_10m(), .locked(), .clk_50m(clk_out));

  IBUF IBUF1(.O(tck_in),.I(JB[4]));
  BUFG BUFG1(.O(tck), .I(tck_in));


  // anti-jitter
  wire [15:0] switch_buf;
  wire [4:0] btn_y_buf;
  localparam
		CLK_FREQ_SYS = 50,
		CLK_FREQ_BUS = 25,
		CLK_FREQ_CPU = 50,
		CLK_FREQ_MEM = 50,
		CLK_FREQ_DEV = 50;


  `ifndef SIMULATING
  anti_jitter #(.CLK_FREQ(CLK_FREQ_DEV), .JITTER_MAX(1000), .INIT_VALUE(0))
          AJ0 (.clk(clk_out), .rst(1'b0), .sig_i(sw[0]), .sig_o(switch_buf[0])),
          AJ1 (.clk(clk_out), .rst(1'b0), .sig_i(sw[1]), .sig_o(switch_buf[1])),
          AJ2 (.clk(clk_out), .rst(1'b0), .sig_i(sw[2]), .sig_o(switch_buf[2])),
          AJ3 (.clk(clk_out), .rst(1'b0), .sig_i(sw[3]), .sig_o(switch_buf[3])),
          AJ4 (.clk(clk_out), .rst(1'b0), .sig_i(sw[4]), .sig_o(switch_buf[4])),
          AJ5 (.clk(clk_out), .rst(1'b0), .sig_i(sw[5]), .sig_o(switch_buf[5])),
          AJ6 (.clk(clk_out), .rst(1'b0), .sig_i(sw[6]), .sig_o(switch_buf[6])),
          AJ7 (.clk(clk_out), .rst(1'b0), .sig_i(sw[7]), .sig_o(switch_buf[7])),
          AJ8 (.clk(clk_out), .rst(1'b0), .sig_i(sw[8]), .sig_o(switch_buf[8])),
          AJ9 (.clk(clk_out), .rst(1'b0), .sig_i(sw[9]), .sig_o(switch_buf[9])),
          AJ10 (.clk(clk_out), .rst(1'b0), .sig_i(sw[10]), .sig_o(switch_buf[10])),
          AJ11 (.clk(clk_out), .rst(1'b0), .sig_i(sw[11]), .sig_o(switch_buf[11])),
          AJ12 (.clk(clk_out), .rst(1'b0), .sig_i(sw[12]), .sig_o(switch_buf[12])),
          AJ13 (.clk(clk_out), .rst(1'b0), .sig_i(sw[13]), .sig_o(switch_buf[13])),
          AJ14 (.clk(clk_out), .rst(1'b0), .sig_i(sw[14]), .sig_o(switch_buf[14])),
          AJ15 (.clk(clk_out), .rst(1'b0), .sig_i(sw[15]), .sig_o(switch_buf[15])),
          AJY0 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[0]), .sig_o(btn_y_buf[0])),
          AJY1 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[1]), .sig_o(btn_y_buf[1])),
          AJY2 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[2]), .sig_o(btn_y_buf[2])),
          AJY3 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[3]), .sig_o(btn_y_buf[3])),
          AJY4 (.clk(clk_out), .rst(1'b0), .sig_i(btn_y[4]), .sig_o(btn_y_buf[4]));
    `else
     assign switch_buf = sw;
     assign btn_y_buf = btn_y;
     `endif




  mipsfpga_sys mipsfpga_sys(
					.SI_Reset_N(CPU_RESETN),
                    .SI_ClkIn(clk_out),
                    .SI_ClkIn_25(clk_25),
                    .HADDR(),
                    .HRDATA(),
                    .HWDATA(),
                    .HWRITE(),
                    .EJ_TRST_N_probe(JB[7]),
                    .EJ_TDI(JB[2]),
                    .EJ_TDO(JB[3]),
                    .EJ_TMS(JB[1]),
                    .EJ_TCK(tck),
                    .SI_ColdReset_N(JB[8]),
                    .EJ_DINT(1'b0),
                    .IO_Switch(switch_buf),
                    .IO_PB_O(btn_x),
                    .IO_PB_I(btn_y_buf),
                    .IO_LED_RGB({tri_led0_r, tri_led0_g, tri_led0_b, tri_led1_r, tri_led1_g, tri_led1_b}),
                    .seg_clk(seg_clk),
                    .seg_pen(seg_pen),
                    .seg_clr_n(),
                    .seg_do(seg_do),
                    .led_clk(led_clk),
                    .led_pen(led_pen),
                    .led_clr_n(),
                    .led_do(led_do),
                    .vga_h_sync(vga_h_sync),
                    .vga_v_sync(vga_v_sync),
                    .vga_red(vga_red),
                    .vga_green(vga_green),
                    .vga_blue(vga_blue),
                    .ps2_clk(),
                    .ps2_data()
                    );


endmodule
