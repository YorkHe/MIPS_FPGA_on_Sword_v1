## This file is a general .xdc for the Sword Version 1
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict { PACKAGE_PIN AB16    IOSTANDARD LVCMOS18 } [get_ports { CLK100MHZ }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}];

set_property -dict { PACKAGE_PIN AF13    IOSTANDARD LVCMOS15 } [get_ports { CPU_RESETN }];

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets tck_in]



##switches
set_property -dict { PACKAGE_PIN AD11   IOSTANDARD LVCMOS15 } [get_ports { sw[0]  }];
set_property -dict { PACKAGE_PIN AE13   IOSTANDARD LVCMOS15 } [get_ports { sw[1]  }];
set_property -dict { PACKAGE_PIN AF8    IOSTANDARD LVCMOS15 } [get_ports { sw[2]  }];
set_property -dict { PACKAGE_PIN AE8    IOSTANDARD LVCMOS15 } [get_ports { sw[3]  }];
set_property -dict { PACKAGE_PIN AA13   IOSTANDARD LVCMOS15 } [get_ports { sw[4]  }];
set_property -dict { PACKAGE_PIN AA12   IOSTANDARD LVCMOS15 } [get_ports { sw[5]  }];
set_property -dict { PACKAGE_PIN Y13    IOSTANDARD LVCMOS15 } [get_ports { sw[6]  }];
set_property -dict { PACKAGE_PIN Y12    IOSTANDARD LVCMOS15 } [get_ports { sw[7]  }];
set_property -dict { PACKAGE_PIN AD10   IOSTANDARD LVCMOS15 } [get_ports { sw[8]  }];
set_property -dict { PACKAGE_PIN AE10   IOSTANDARD LVCMOS15 } [get_ports { sw[9]  }];
set_property -dict { PACKAGE_PIN AE12   IOSTANDARD LVCMOS15 } [get_ports { sw[10] }];
set_property -dict { PACKAGE_PIN AF12   IOSTANDARD LVCMOS15 } [get_ports { sw[11] }];
set_property -dict { PACKAGE_PIN AB10   IOSTANDARD LVCMOS15 } [get_ports { sw[12] }];
set_property -dict { PACKAGE_PIN AA10   IOSTANDARD LVCMOS15 } [get_ports { sw[13] }];
set_property -dict { PACKAGE_PIN AC11   IOSTANDARD LVCMOS15 } [get_ports { sw[14] }];
set_property -dict { PACKAGE_PIN AB11   IOSTANDARD LVCMOS15 } [get_ports { sw[15] }];

##Buttons
set_property -dict { PACKAGE_PIN AF17   IOSTANDARD LVCMOS18 } [get_ports { btn_x[0] }];
set_property -dict { PACKAGE_PIN AC17   IOSTANDARD LVCMOS18 } [get_ports { btn_x[1] }];
set_property -dict { PACKAGE_PIN AE15   IOSTANDARD LVCMOS18 } [get_ports { btn_x[2] }];
set_property -dict { PACKAGE_PIN AF15   IOSTANDARD LVCMOS18 } [get_ports { btn_x[3] }];
set_property -dict { PACKAGE_PIN AF14   IOSTANDARD LVCMOS18 } [get_ports { btn_x[4] }];
set_property -dict { PACKAGE_PIN AF20   IOSTANDARD LVCMOS18 } [get_ports { btn_y[0] }];
set_property -dict { PACKAGE_PIN AF19   IOSTANDARD LVCMOS18 } [get_ports { btn_y[1] }];
set_property -dict { PACKAGE_PIN AE18   IOSTANDARD LVCMOS18 } [get_ports { btn_y[2] }];
set_property -dict { PACKAGE_PIN AF18   IOSTANDARD LVCMOS18 } [get_ports { btn_y[3] }];
set_property -dict { PACKAGE_PIN AE17   IOSTANDARD LVCMOS18 } [get_ports { btn_y[4] }];


## Seg
set_property -dict { PACKAGE_PIN AD23   IOSTANDARD LVCMOS33 } [get_ports { seg_clk   }];
set_property -dict { PACKAGE_PIN AD21   IOSTANDARD LVCMOS33 } [get_ports { seg_do    }];
set_property -dict { PACKAGE_PIN AD5    IOSTANDARD LVCMOS15 } [get_ports { seg_pen   }];


## LEDs
set_property -dict { PACKAGE_PIN AB21   IOSTANDARD LVCMOS33 } [get_ports { led_clk 	}];
set_property -dict { PACKAGE_PIN AA23   IOSTANDARD LVCMOS33 } [get_ports { led_do 	}];
set_property -dict { PACKAGE_PIN W13    IOSTANDARD LVCMOS18 } [get_ports { led_pen 	}];

## LED_RGB
set_property -dict { PACKAGE_PIN AC23   IOSTANDARD LVCMOS33 } [get_ports { tri_led0_r }];
set_property -dict { PACKAGE_PIN AC24   IOSTANDARD LVCMOS33 } [get_ports { tri_led0_g }];
set_property -dict { PACKAGE_PIN AC21   IOSTANDARD LVCMOS33 } [get_ports { tri_led0_b }];
set_property -dict { PACKAGE_PIN AC22   IOSTANDARD LVCMOS33 } [get_ports { tri_led1_r }];
set_property -dict { PACKAGE_PIN AB22   IOSTANDARD LVCMOS33 } [get_ports { tri_led1_g }];
set_property -dict { PACKAGE_PIN AB24   IOSTANDARD LVCMOS33 } [get_ports { tri_led1_b }];


##VGA
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { vga_blue[0]  }];
set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports { vga_blue[1]  }];
set_property -dict { PACKAGE_PIN N19   IOSTANDARD LVCMOS33 } [get_ports { vga_blue[2]  }];
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { vga_blue[3]  }];
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { vga_green[0] }];
set_property -dict { PACKAGE_PIN M21   IOSTANDARD LVCMOS33 } [get_ports { vga_green[1] }];
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { vga_green[2] }];
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { vga_green[3] }];
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { vga_red[0]   }];
set_property -dict { PACKAGE_PIN K21   IOSTANDARD LVCMOS33 } [get_ports { vga_red[1]   }];
set_property -dict { PACKAGE_PIN K20   IOSTANDARD LVCMOS33 } [get_ports { vga_red[2]   }];
set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVCMOS33 } [get_ports { vga_red[3]   }];
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { vga_h_sync   }];
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { vga_v_sync   }];



##Pmod Headers
##Pmod Header JB
set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { JB[1] }]; 
set_property -dict { PACKAGE_PIN E11   IOSTANDARD LVCMOS33 } [get_ports { JB[2] }]; 
set_property -dict { PACKAGE_PIN D11   IOSTANDARD LVCMOS33 } [get_ports { JB[3] }]; 
set_property -dict { PACKAGE_PIN F12   IOSTANDARD LVCMOS33 } [get_ports { JB[4] }]; 
set_property -dict { PACKAGE_PIN E10   IOSTANDARD LVCMOS33 } [get_ports { JB[5] }]; 
set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { JB[6] }]; 
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { JB[7] }]; 
set_property PULLUP true [get_ports {JB[7]}]

set_property -dict { PACKAGE_PIN E12   IOSTANDARD LVCMOS33 } [get_ports { JB[8] }]; 
set_property PULLUP true [get_ports {JB[8]}]


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
