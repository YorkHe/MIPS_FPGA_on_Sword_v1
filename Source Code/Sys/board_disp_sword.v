module board_disp_sword (
	input wire clk,  // main clock
	input wire rst,  // synchronous reset
	input wire [7:0] en,  // enable for each tube
	input wire mode,  // 0 for text mode, 1 for graphic mode
	input wire [31:0] data_text,  // text data to display
	input wire [63:0] data_graphic,  // graphic data to display
	input wire [7:0] dot,  // enable for each dot
	input wire [15:0] led,  // LED display
	// LED interfaces
	output wire led_clk,		// LED clk
	output wire led_en,			// LED enable signal
	output wire led_clr_n,		// LED clear active-low signal
	output wire led_do,			// LED data out
	// 7-segment tube interfaces
	output wire seg_clk,		// Seg clk
	output wire seg_en,			// Seg enable signal
	output wire seg_clr_n,		// Seg clear active-low signal
	output wire seg_do			// Seg data out
	);

	`include "function.vh"
	parameter
		CLK_FREQ = 100;  // main clock frequency in MHz
	localparam
		SEG_PULSE = 1'b0;
	localparam
		REFRESH_INTERVAL = 100,  // refresh interval for led and segment tubes, in ms
		COUNT_REFRESH = 1 + CLK_FREQ * REFRESH_INTERVAL * 1000,
		COUNT_BITS = GET_WIDTH(COUNT_REFRESH-1);

	function [6:0] digit2seg;		//digit convert to seg, point does not consider for initial to 0
		input [3:0] number;
		begin
			case (number)
				4'h0: digit2seg = 7'b0111111;		// seg is active-high
				4'h1: digit2seg = 7'b0000110;
				4'h2: digit2seg = 7'b1011011;
				4'h3: digit2seg = 7'b1001111;
				4'h4: digit2seg = 7'b1100110;
				4'h5: digit2seg = 7'b1101101;
				4'h6: digit2seg = 7'b1111101;
				4'h7: digit2seg = 7'b0000111;
				4'h8: digit2seg = 7'b1111111;
				4'h9: digit2seg = 7'b1101111;
				4'hA: digit2seg = 7'b1110111;
				4'hB: digit2seg = 7'b1111100;
				4'hC: digit2seg = 7'b0111001;
				4'hD: digit2seg = 7'b1011110;
				4'hE: digit2seg = 7'b1111001;
				4'hF: digit2seg = 7'b1110001;
			endcase
		end
	endfunction

	wire [63:0] segment, segment_text, segment_graphic;	//define 64bit data for text or graphic

	genvar i;
	generate for (i=0; i<8; i=i+1) begin: SEG_GEN		//generate loop for using text or graphic for every bit
		assign
			segment_text[8*i+7] = dot[i],
			segment_text[8*i+6-:7] = en[i] ? digit2seg(data_text[4*i+3-:4]) : 7'b0,
			segment_graphic[8*i+7-:8] = en[i] ? data_graphic[8*i+7-:8] : 8'b0;
	end
	endgenerate

	assign
		segment = mode ? segment_graphic : segment_text;		//this segment is parallel signal

	wire led_start, seg_start;
	wire led_clr, seg_clr;
	reg [COUNT_BITS-1:0] clk_count = 0;

	assign
		led_en = 1,
		led_clr_n = ~led_clr,
		seg_en = 1,
		seg_clr_n = ~seg_clr;



	//using parallel to serial module to convert parallel signal to serial
	parallel2serial #(		//this module is for LED
		.P_CLK_FREQ(CLK_FREQ),
		.S_CLK_FREQ(20),
		.DATA_BITS(16),
		.CODE_ENDIAN(1)
		) P2S_LED (
		.clk(clk),
		.rst(rst),
		.data(SEG_PULSE ? led : ~led),
		.start(led_start),
		.busy(),
		.finish(),
		.s_clk(led_clk),
		.s_clr(led_clr),
		.s_dat(led_do)		//this LED is serial signal
		);

	parallel2serial #(		//this module is for SEG
		.P_CLK_FREQ(CLK_FREQ),
		.S_CLK_FREQ(20),
		.DATA_BITS(64),
		.CODE_ENDIAN(1)
		) P2S_SEG (
		.clk(clk),
		.rst(rst),
		.data(SEG_PULSE ? segment : ~segment),	//this SEG is parallel signal
		.start(seg_start),
		.busy(),
		.finish(),
		.s_clk(seg_clk),
		.s_clr(seg_clr),
		.s_dat(seg_do)		//this SEG is serial signal
		);

	always @(posedge clk) begin
		if (rst)
			clk_count <= 0;
		else if (clk_count[COUNT_BITS-1])
			clk_count <= 0;
		else
			clk_count <= clk_count + 1'h1;
	end

	assign
		led_start = clk_count[COUNT_BITS-1],
		seg_start = clk_count[COUNT_BITS-1];

endmodule
