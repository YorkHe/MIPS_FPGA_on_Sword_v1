/**
 * Scan inputs from button matrix.
 * Author: Zhao, Hongyu  <power_zhy@foxmail.com>
 */
module btn_scan_sword (
	input wire clk,  // main clock
	input wire rst,  // synchronous reset
	output reg [4:0] btn_x,
	input wire [4:0] btn_y,
	output reg [24:0] result
	);
	
	`include "function.vh"
	
	parameter
		CLK_FREQ = 50;  // main clock frequency in MHz
	localparam
		SCAN_INTERVAL = 20,  // scan interval for matrix keyboard, must be larger then anti-jitter's max jitter time
		COUNT_SCAN = 1 + CLK_FREQ * SCAN_INTERVAL * 1000,
		COUNT_BITS = GET_WIDTH(COUNT_SCAN-1);
	
	reg [COUNT_BITS-1:0] clk_count = 0;
	
	always @(posedge clk) begin
		if (rst)
			clk_count <= 0;
		else if (clk_count[COUNT_BITS-1])
			clk_count <= 0;
		else
			clk_count <= clk_count + 1'h1;
	end
	
	always @(posedge clk) begin
		if (rst) begin
			btn_x <= 0;
			result <= 0;
		end
		else begin
			if (clk_count[COUNT_BITS-1]) case (btn_x)
				5'b11110: begin
					btn_x <= 5'b11101;
					result[24:20] <= ~btn_y;
				end
				5'b11101: begin
					btn_x <= 5'b11011;
					result[19:15] <= ~btn_y;
				end
				5'b11011: begin
					btn_x <= 5'b10111;
					result[14:10] <= ~btn_y;
				end
				5'b10111: begin
					btn_x <= 5'b01111;
					result[9:5] <= ~btn_y;
				end
				5'b01111: begin
					btn_x <= 5'b11110;
					result[4:0] <= ~btn_y;
				end
				default: begin
					btn_x <= 5'b11110;
				end
			endcase
		end
	end
	
endmodule
