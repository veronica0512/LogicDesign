module TimeDisplayMode(
	input clk,
	input sw,
	input [5:0] hour_in,
	input [5:0] min_in,
	input [5:0] sec_in,
	output am,
	output pm,
	output [5:0] hour_out,
	output [5:0] min_out,
	output [5:0] sec_out,
	output ts
    );

wire enable;
TimeDisplayModeSelector tdms(clk, sw, enable);
TSmode tsmode(enable, ts, hour_in, min_in, sec_in, am, pm, hour_out, min_out, sec_out);


endmodule
