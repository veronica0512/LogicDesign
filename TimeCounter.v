module TimeCounter(
    input clk,
    input hour_in = 0,
    input min_in = 0,
    input sec_in = 0,
    output hour_out,
    output min_out,
    output sec_out
);
// hour/min/sec_in이 들어오면 그 시각에서부터 시간을 계산함
wire minrci, hrci;

	
SecCounter sec(clk, sec_in, minrci, sec_out);
MinCounter min(clk, minrci, min_in, hrci, min_out);
HCounter hour(clk, hrci, hour_in, ,hour_out);


endmodule
