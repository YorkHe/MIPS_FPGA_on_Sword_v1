// mipsfpga_ahb.v
// 
// 20 Oct 2014
//
// AHB-lite bus module with 3 slaves: RAM1, RAM2,and
// GPIO (memory-mapped I/O: switches and LEDs from the FPGA board).
// The module includes an address decoder and multiplexer (for 
// selecting which slave module produces HRDATA).

`timescale 100ps/1ps

`include "mipsfpga_ahb_const.vh"


module mipsfpga_ahb
(
    input               HCLK,
    input               HCLK_25,
    input               HRESETn,
    input      [ 31: 0] HADDR,
    input      [  2: 0] HBURST,
    input               HMASTLOCK,
    input      [  3: 0] HPROT,
    input      [  2: 0] HSIZE,
    input      [  1: 0] HTRANS,
    input      [ 31: 0] HWDATA,
    input               HWRITE,
    output     [ 31: 0] HRDATA,
    output              HREADY,
    output              HRESP,
    input               SI_Endian,

// memory-mapped I/O
    input      [ 15: 0] IO_Switch,
    output 		[ 4: 0] IO_PB_O,
    input      [ 3: 0] IO_PB_I,
    output     [ 5: 0] IO_LED_RGB,

//Seg
    output seg_clk,
    output seg_pen,
    output seg_clr_n,
    output seg_do,

// LED
    output led_clk,
    output led_pen,
    output led_clr_n,
    output led_do,
    
//VGA
    output vga_h_sync,
    output vga_v_sync,
    output [3:0] vga_red,
    output [3:0] vga_green,
    output [3:0] vga_blue,
//Keyboard
    output ps2_clk,
    output ps2_data
);


  wire [31:0] HRDATA2, HRDATA1, HRDATA0;
  wire [ 2:0] HSEL;
  wire [31:0] HADDR_d;   // HADDR delayed 1 cycle to align with HWDATA
  wire        HWRITE_d;  // HWRITE delayed 1 cycle to align with HWDATA


//Keyboard
  wire PS2toCpu_ready;
  wire [7:0] key_data;
  wire CputoPS2_ready,key_load;
  wire PS2_overflow;

  flop #(32)  adrreg(HCLK, HADDR, HADDR_d);
  flop #(1)   writereg(HCLK, HWRITE, HWRITE_d);

  assign HREADY = 1;
  assign HRESP = 0;




  // Module 0
  mipsfpga_ahb_ram_reset mipsfpga_ahb_ram_reset(HCLK, HRESETn, HADDR, HWDATA, HWRITE_d, HSEL[0], HRDATA0);
  // Module 1
  mipsfpga_ahb_ram mipsfpga_ahb_ram(HCLK, HRESETn, HADDR, HWDATA, HWRITE_d, HSEL[1], HRDATA1);
  // Module 2
  mipsfpga_ahb_gpio mipsfpga_ahb_gpio(HCLK, HRESETn, HADDR_d[5:2], HWDATA, HWRITE_d, HSEL[2], HRDATA2, IO_Switch, IO_PB_O, IO_PB_I, IO_LED_RGB, seg_clk, seg_pen, seg_clr_n, seg_do, led_clk, led_pen, led_clr_n, led_do);
  
  
  // VGA Control
  vga_control vga_control(
      .d_in(IO_Switch[11:0]),
      .vga_clk(HCLK_25),  // main clock
      .clrn(HRESETn),  // synchronous reset
      .row_addr(),
      .col_addr(),
      .r(vga_red),
      .g(vga_green),
      .b(vga_blue),
      .rdn(),
      .hs(vga_h_sync),
      .vs(vga_v_sync)
      
      );
      
      
      
      
  // Keyboard
  PS2KeyBoard PS2KeyBoard(
      .clk(~HCLK),			 // 50 MHz
      .clrn(HRESETn),     
      .ps2_clk(ps2_clk),      // ps2 clock
      .ps2_data(ps2_data),     // ps2 data
      .rdn(),          // read, active high
      .data(),         // 8-bit code
      .ready(),        // code ready
      .overflow()     // fifo overflow
  );

  ahb_decoder ahb_decoder(HADDR_d, HSEL);
  ahb_mux ahb_mux(HSEL, HRDATA2, HRDATA1, HRDATA0, HRDATA);

endmodule


module ahb_decoder
(
    input  [31:0] HADDR,
    output [ 2:0] HSEL
);

  // Decode based on most significant bits of the address
  assign HSEL[0] = (HADDR[28:22] == `H_RAM_RESET_ADDR_Match); // 128 KB RAM  at 0xbfc00000 (physical: 0x1fc00000)
  assign HSEL[1] = (HADDR[28]    == `H_RAM_ADDR_Match);         // 256 KB RAM at 0x80000000 (physical: 0x00000000)
  assign HSEL[2] = (HADDR[28:22] == `H_LEDR_ADDR_Match);      // GPIO at 0xbf800000 (physical: 0x1f800000)
endmodule


module ahb_mux
(
    input      [ 2:0] HSEL,
    input      [31:0] HRDATA2, HRDATA1, HRDATA0,
    output reg [31:0] HRDATA
);

    always @(*)
      casez (HSEL)
	      3'b??1:    HRDATA = HRDATA0;
	      3'b?10:    HRDATA = HRDATA1;
	      3'b100:    HRDATA = HRDATA2;
	      default:   HRDATA = HRDATA1;
      endcase
endmodule


module flop #(parameter WIDTH = 8)
              (input                  clk,
               input      [WIDTH-1:0] d, 
               output reg [WIDTH-1:0] q);

  always @(posedge clk)
    q <= d;
endmodule



