// mipsfpga_ahb_gpio.v
//
// General-purpose I/O module for Altera's DE2-115 and 
// Digilent's (Xilinx) Nexys4-DDR board
//
// Altera's DE2-115 board:
// Outputs:
// 18 red LEDs (IO_LEDR), 9 green LEDs (IO_LEDG) 
// Inputs:
// 18 slide switches (IO_Switch), 4 pushbutton switches (IO_PB[3:0])
//
// Digilent's (Xilinx) Nexys4-DDR board:
// Outputs:
// 15 LEDs (IO_LEDR[14:0]) 
// Inputs:
// 15 slide switches (IO_Switch[14:0]), 
// 5 pushbutton switches (IO_PB)
//


`timescale 100ps/1ps

`include "mipsfpga_ahb_const.vh"


module mipsfpga_ahb_gpio(
    input               HCLK,
    input               HRESETn,
    input      [  3: 0] HADDR,
    input      [ 31: 0] HWDATA,
    input               HWRITE,
    input               HSEL,
    output reg [ 31: 0] HRDATA,

// memory-mapped I/O
    input      [ 15: 0] IO_Switch,
    output	   [ 4: 0] IO_PB_O,
    input      [ 3: 0] IO_PB_I,
    output reg [ 5: 0] IO_LED_RGB,
    
//Seg
    output seg_clk,
    output seg_pen,
    output seg_clr_n,
    output seg_do,
    
//LED
    output led_clk,
    output led_pen,
    output led_clr_n,
    output led_do
);

	 wire [19:0] reg_btn;
	 reg [15:0] led;

	
    always @(posedge HCLK or negedge HRESETn)
       if (~HRESETn) begin
         led <= IO_Switch;
         IO_LED_RGB <= IO_Switch[5:0];  //
       end else if (HWRITE & HSEL)
         case (HADDR)
           `H_LED_IONUM: { led , IO_LED_RGB } <= HWDATA[21:0];
         endcase
    
    always @(*)
      case (HADDR)
        `H_LEDA_IONUM: HRDATA = {16'b0, led};
        `H_SW_IONUM: HRDATA = {16'b0, IO_Switch};
        `H_PB_IONUM: HRDATA = {23'b0, reg_btn};
        default:     HRDATA = 32'h00000000;
      endcase

    

    btn_scan_sword btn_scan(
	.clk(HCLK),  // main clock
	.rst(~HRESETn),  // synchronous reset
	.btn_x(IO_PB_O),
	.btn_y(IO_PB_I),
	.result(reg_btn)
	);



	board_disp_sword #(
	   .CLK_FREQ(50)
	   ) BOARD_DISP_SWORD (
		.clk(HCLK),
		.rst(~HRESETn),
		.en(8'hff),
		.mode(1'h0),
		.data_text(HWDATA),
		.data_graphic(64'h0),
		.dot(8'b01010101),
		.led(led),
		.led_clk(led_clk),
		.led_en(led_pen),
		.led_clr_n(led_clr_n),
		.led_do(led_do), 
		.seg_clk(seg_clk),
		.seg_en(seg_pen),
		.seg_clr_n(seg_clr_n),
		.seg_do(seg_do)
		);



endmodule

