// testbench.v
// 31 May 2014
//
// Drive the mipsfpga_sys module for simulation testing

`timescale 100ps/1ps

module testbench;

    reg  SI_Reset_N, SI_ClkIn;
    wire [31:0] HADDR, HRDATA, HWDATA;
    wire        HWRITE;
    reg         EJ_TRST_N_probe, EJ_TDI; 
    wire        EJ_TDO;
    reg         SI_ColdReset_N;
    reg         EJ_TMS, EJ_TCK, EJ_DINT;
    
    reg  [15:0] IO_Switch;
    wire [4:0] IO_PB_O;
    reg  [3:0] IO_PB_I;
    wire [5:0] IO_LED_RGB;
    
    //Seg
    wire seg_clk;
    wire seg_pen;
    wire seg_clr_n;
    wire seg_do;
                            
    //led
    wire led_clk;
    wire led_pen;
    wire led_clr_n;
    wire led_do;


    mipsfpga_sys sys(SI_Reset_N,
                 SI_ClkIn,
                 HADDR, HRDATA, HWDATA, HWRITE, 
                 EJ_TRST_N_probe, EJ_TDI, EJ_TDO, EJ_TMS, 
                 EJ_TCK, 
                 SI_ColdReset_N, 
                 EJ_DINT,
                 IO_Switch, IO_PB_O, IO_PB_I, IO_LED_RGB,
                 seg_clk, seg_pen, seg_clr_n, seg_do,
                 led_clk, led_pen, led_clr_n, led_do);

    initial
    begin
        SI_ClkIn = 0;
        EJ_TRST_N_probe = 0; EJ_TDI = 0; EJ_TMS = 0; EJ_TCK = 0; EJ_DINT = 0;
        SI_ColdReset_N = 1;
        IO_Switch = {13'h0 , 3'b110};
        IO_PB_I = 4'b0001;
        forever
            #50 SI_ClkIn = ~ SI_ClkIn;
    end

    initial
    begin
        SI_Reset_N  <= 0;
        repeat (100)  @(posedge SI_ClkIn);
        SI_Reset_N  <= 1;
        repeat (1000) @(posedge SI_ClkIn);
        $stop;
    end

    initial
    begin
        $dumpvars;
        $timeformat (-9, 1, "ns", 10);
    end
    
endmodule


