module main(
	input sw2, input sw3, input sw4, input sw5, input sw6, input sw7,
	input[9:0] dipSwitch,
	input clk,

	output[6:0] dp0,
	output[6:0] dp1,
	output[6:0] dp2,
	output[6:0] dp3,
	output[6:0] dp4,
	output[6:0] dp5,

	output buzzer, 
	output[5:0] light
);



// 출력할 모든 값들을 입력받고, 그 중 어떤 값을 출력할지 state에 따라서 결정한다.
Buzzer_controller buzzer_c(state, , buzzer);
Light_controller Light_c(state, , light);
Display_controller display(state, , dp0, dp1, dp2, dp3, dp4, dp5);

endmodule

