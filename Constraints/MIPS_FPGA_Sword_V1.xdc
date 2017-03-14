## This file is a general .xdc for the Sword Version 1
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict { PACKAGE_PIN AC18    IOSTANDARD LVCMOS18 } [get_ports { CLK100MHZ }]; Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}];

set_property -dict { PACKAGE_PIN W13    IOSTANDARD LVCMOS18 } [get_ports { CPU_RESETN }];

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets tck_in]


##Buzzer
set_property -dict { PACKAGE_PIN AF24   IOSTANDARD LVCMOS33 } [get_ports { buzzer }];

##switches
set_property -dict { PACKAGE_PIN AA10   IOSTANDARD LVCMOS15 } [get_ports { sw[0]  }];
set_property -dict { PACKAGE_PIN AB10   IOSTANDARD LVCMOS15 } [get_ports { sw[1]  }];
set_property -dict { PACKAGE_PIN AA13   IOSTANDARD LVCMOS15 } [get_ports { sw[2]  }];
set_property -dict { PACKAGE_PIN AA12   IOSTANDARD LVCMOS15 } [get_ports { sw[3]  }];
set_property -dict { PACKAGE_PIN Y13    IOSTANDARD LVCMOS15 } [get_ports { sw[4]  }];
set_property -dict { PACKAGE_PIN Y12    IOSTANDARD LVCMOS15 } [get_ports { sw[5]  }];
set_property -dict { PACKAGE_PIN AD11   IOSTANDARD LVCMOS15 } [get_ports { sw[6]  }];
set_property -dict { PACKAGE_PIN AD10   IOSTANDARD LVCMOS15 } [get_ports { sw[7]  }];
set_property -dict { PACKAGE_PIN AE10   IOSTANDARD LVCMOS15 } [get_ports { sw[8]  }];
set_property -dict { PACKAGE_PIN AE12   IOSTANDARD LVCMOS15 } [get_ports { sw[9]  }];
set_property -dict { PACKAGE_PIN AF12   IOSTANDARD LVCMOS15 } [get_ports { sw[10] }];
set_property -dict { PACKAGE_PIN AE8    IOSTANDARD LVCMOS15 } [get_ports { sw[11] }];
set_property -dict { PACKAGE_PIN AF8    IOSTANDARD LVCMOS15 } [get_ports { sw[12] }];
set_property -dict { PACKAGE_PIN AE13   IOSTANDARD LVCMOS15 } [get_ports { sw[13] }];
set_property -dict { PACKAGE_PIN AF13   IOSTANDARD LVCMOS15 } [get_ports { sw[14] }];
set_property -dict { PACKAGE_PIN AF10   IOSTANDARD LVCMOS15 } [get_ports { sw[15] }];

##Buttons
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS18 } [get_ports { btn_x[0] }];
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS18 } [get_ports { btn_x[1] }];
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS18 } [get_ports { btn_x[2] }];
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS18 } [get_ports { btn_x[3] }];
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS18 } [get_ports { btn_x[4] }];
set_property -dict { PACKAGE_PIN V18   IOSTANDARD LVCMOS18 } [get_ports { btn_y[0] }];
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS18 } [get_ports { btn_y[1] }];
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS18 } [get_ports { btn_y[2] }];
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS18 } [get_ports { btn_y[3] }];



## Seg
set_property -dict { PACKAGE_PIN M24   IOSTANDARD LVCMOS33 } [get_ports { seg_clk   }];
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { seg_clr_n }];
set_property -dict { PACKAGE_PIN L24   IOSTANDARD LVCMOS33 } [get_ports { seg_do    }];
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { seg_pen   }];


## LEDs
set_property -dict { PACKAGE_PIN N26   IOSTANDARD LVCMOS33 } [get_ports { led_clk 	}];
set_property -dict { PACKAGE_PIN N24   IOSTANDARD LVCMOS33 } [get_ports { led_clr_n }];
set_property -dict { PACKAGE_PIN M26   IOSTANDARD LVCMOS33 } [get_ports { led_do 	}];
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { led_pen 	}];

## LED_RGB
set_property -dict { PACKAGE_PIN U21   IOSTANDARD LVCMOS33 } [get_ports { tri_led0_r_n }];
set_property -dict { PACKAGE_PIN U22   IOSTANDARD LVCMOS33 } [get_ports { tri_led0_g_n }];
set_property -dict { PACKAGE_PIN V22   IOSTANDARD LVCMOS33 } [get_ports { tri_led0_b_n }];
set_property -dict { PACKAGE_PIN U24   IOSTANDARD LVCMOS33 } [get_ports { tri_led1_r_n }];
set_property -dict { PACKAGE_PIN U25   IOSTANDARD LVCMOS33 } [get_ports { tri_led1_g_n }];
set_property -dict { PACKAGE_PIN V23   IOSTANDARD LVCMOS33 } [get_ports { tri_led1_b_n }];

## Arduino LED_RGB
set_property -dict { PACKAGE_PIN AB26  IOSTANDARD LVCMOS33 } [get_ports { led[0] }];
set_property -dict { PACKAGE_PIN W24   IOSTANDARD LVCMOS33 } [get_ports { led[1] }];
set_property -dict { PACKAGE_PIN W23   IOSTANDARD LVCMOS33 } [get_ports { led[2] }];
set_property -dict { PACKAGE_PIN AB25  IOSTANDARD LVCMOS33 } [get_ports { led[3] }];
set_property -dict { PACKAGE_PIN AA25  IOSTANDARD LVCMOS33 } [get_ports { led[4] }];
set_property -dict { PACKAGE_PIN W21   IOSTANDARD LVCMOS33 } [get_ports { led[5] }];
set_property -dict { PACKAGE_PIN V21   IOSTANDARD LVCMOS33 } [get_ports { led[6] }];
set_property -dict { PACKAGE_PIN W26   IOSTANDARD LVCMOS33 } [get_ports { led[7] }];


##VGA
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { vga_blue[0]  }];
set_property -dict { PACKAGE_PIN R20   IOSTANDARD LVCMOS33 } [get_ports { vga_blue[1]  }];
set_property -dict { PACKAGE_PIN T22   IOSTANDARD LVCMOS33 } [get_ports { vga_blue[2]  }];
set_property -dict { PACKAGE_PIN T23   IOSTANDARD LVCMOS33 } [get_ports { vga_blue[3]  }];
set_property -dict { PACKAGE_PIN R22   IOSTANDARD LVCMOS33 } [get_ports { vga_green[0] }];
set_property -dict { PACKAGE_PIN R23   IOSTANDARD LVCMOS33 } [get_ports { vga_green[1] }];
set_property -dict { PACKAGE_PIN T24   IOSTANDARD LVCMOS33 } [get_ports { vga_green[2] }];
set_property -dict { PACKAGE_PIN T25   IOSTANDARD LVCMOS33 } [get_ports { vga_green[3] }];
set_property -dict { PACKAGE_PIN N21   IOSTANDARD LVCMOS33 } [get_ports { vga_red[0]   }];
set_property -dict { PACKAGE_PIN N22   IOSTANDARD LVCMOS33 } [get_ports { vga_red[1]   }];
set_property -dict { PACKAGE_PIN R21   IOSTANDARD LVCMOS33 } [get_ports { vga_red[2]   }];
set_property -dict { PACKAGE_PIN P21   IOSTANDARD LVCMOS33 } [get_ports { vga_red[3]   }];
set_property -dict { PACKAGE_PIN M22   IOSTANDARD LVCMOS33 } [get_ports { vga_h_sync   }];
set_property -dict { PACKAGE_PIN M21   IOSTANDARD LVCMOS33 } [get_ports { vga_v_sync   }];


##Keyboard
set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports { ps2_clk }];
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { ps2_data }];


##Pmod Headers


##Pmod Header JA

#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { JA[1] }]; 
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { JA[2] }]; 
#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { JA[3] }]; 
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { JA[4] }]; 
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { JA[7] }]; 
#set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { JA[8] }]; 
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { JA[9] }]; 
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { JA[10] }];


##Pmod Header JB

set_property -dict { PACKAGE_PIN AC26   IOSTANDARD LVCMOS33 } [get_ports { JB[1] }]; 
set_property -dict { PACKAGE_PIN Y25    IOSTANDARD LVCMOS33 } [get_ports { JB[2] }]; 
set_property -dict { PACKAGE_PIN Y26    IOSTANDARD LVCMOS33 } [get_ports { JB[3] }]; 
set_property -dict { PACKAGE_PIN AA23   IOSTANDARD LVCMOS33 } [get_ports { JB[4] }]; 
set_property -dict { PACKAGE_PIN AB24   IOSTANDARD LVCMOS33 } [get_ports { JB[5] }]; 
set_property -dict { PACKAGE_PIN Y23    IOSTANDARD LVCMOS33 } [get_ports { JB[6] }]; 
set_property -dict { PACKAGE_PIN AA24   IOSTANDARD LVCMOS33 } [get_ports { JB[7] }]; 
set_property PULLUP true [get_ports {JB[7]}]

set_property -dict { PACKAGE_PIN Y22   IOSTANDARD LVCMOS33 } [get_ports { JB[8] }]; 
set_property PULLUP true [get_ports {JB[8]}]

#set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { JB[9] }]; 
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { JB[10] }];


##Pmod Header JC

#set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { JC[1] }]; 
#set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { JC[2] }]; 
#set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { JC[3] }]; 
#set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { JC[4] }]; 
#set_property -dict { PACKAGE_PIN E7    IOSTANDARD LVCMOS33 } [get_ports { JC[7] }]; 
#set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { JC[8] }]; 
#set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { JC[9] }]; 
#set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { JC[10] }];


##Pmod Header JD

#set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { JD[1] }]; 
#set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { JD[2] }]; 
#set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { JD[3] }]; 
#set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { JD[4] }]; 
#set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { JD[7] }]; 
#set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { JD[8] }]; 
#set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { JD[9] }]; 
#set_property -dict { PACKAGE_PIN F3    IOSTANDARD LVCMOS33 } [get_ports { JD[10] }];


##Pmod Header JXADC

#set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVDS     } [get_ports { XA_N[1] }]; 
#set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVDS     } [get_ports { XA_P[1] }]; 
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVDS     } [get_ports { XA_N[2] }]; 
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVDS     } [get_ports { XA_P[2] }]; 
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVDS     } [get_ports { XA_N[3] }]; 
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVDS     } [get_ports { XA_P[3] }]; 
#set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVDS     } [get_ports { XA_N[4] }]; 
#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVDS     } [get_ports { XA_P[4] }]; 



set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE Yes [current_design]



# I/O virtual clock
create_clock -period 20.000 -name "clk_virt"


# EJTAG virtual clock
create_clock -name "tck" -period 20.0

# cut all paths to and from "clk_virt", "tck"
set_clock_groups -physically_exclusive -group "clk_virt"
set_clock_groups -physically_exclusive -group "tck"

# tsu/th constraints
set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports CPU_RESETN]
set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports CPU_RESETN]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNC]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNC]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTND]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTND]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNL]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNL]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNR]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNR]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNU]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNU]
set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[1]]
set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[1]]
set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[2]]
set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[2]]
set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[4]]
set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[4]]


set_output_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports {JB[3]}]
set_output_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports {JB[3]}]



