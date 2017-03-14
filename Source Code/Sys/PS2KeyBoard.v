module PS2KeyBoard (
	input        clk,		   // 50 MHz
	input        clrn,
    input        ps2_clk,      // ps2 clock
    input        ps2_data,     // ps2 data
    input        rdn,          // read, active high
    output [7:0] data,         // 8-bit code
    output       ready,        // code ready
    output reg   overflow      // fifo overflow
	);


    reg    [9:0] buffer;       // ps2_data bits
    reg    [7:0] fifo[7:0];    // circuilar fifo for storing byte codes
    reg    [3:0] count;        // count the ps2_data bits
    reg    [1:0] ps2_clk_sync; // for detecting falling edge of ps2_clk
	 reg    [2:0] w_ptr,r_ptr;
    always @ (posedge clk)
        ps2_clk_sync <= {ps2_clk_sync[0],ps2_clk};      // shift register
    wire sampling = ps2_clk_sync[1] & ~ps2_clk_sync[0]; // falling edge
    always @ (posedge clk) begin
        if (clrn) begin       // on reset
            count    <= 0;     // clear count
            w_ptr    <= 0;     // clear w_ptr
            r_ptr    <= 0;     // clear r_ptr
            overflow <= 0;     // clear overflow
        end else if (sampling) begin            // if sampling
            if (count == 4'd10) begin           // if got one frame
                if ((buffer[0] == 0) &&         // start bit
                    (ps2_data)       &&         // stop bit
                    (^buffer[9:1])) begin       // odd prity
                    fifo[w_ptr] <= buffer[8:1]; // keyboard scan code
                    w_ptr <= w_ptr + 3'b1;      // w_ptr++
                    overflow <= overflow | (r_ptr == (w_ptr + 3'b1));
                end
                count <= 0;                     // for next frame
            end else begin                      // else
                buffer[count] <= ps2_data;      // store ps2_data
                count <= count + 4'b1;          // count++
            end
        end
        if (rdn && ready) begin                // on cpu read
            r_ptr <= r_ptr + 3'b1;              // r_ptr++
            overflow <= 0;                      // clear overflow
        end
    end
    assign ready = (w_ptr != r_ptr);            // fifo is not empty
    assign data  = fifo[r_ptr];                 // code byte
endmodule

