module main(
	input sw2_, input sw3_, input sw4_, input sw5_, input sw6_, input sw7_,
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

// **** SETUP **** //
wire sw2, sw3, sw4, sw5, sw6, sw7;
ButtonDebouncer btn_db1(clk, sw2_, sw2); // FIXME: 모듈명 및 인자 전달 순서 바뀔 수 있음
ButtonDebouncer btn_db2(clk, sw2_, sw3);
ButtonDebouncer btn_db3(clk, sw2_, sw4);
ButtonDebouncer btn_db4(clk, sw2_, sw5);
ButtonDebouncer btn_db5(clk, sw2_, sw6);
ButtonDebouncer btn_db6(clk, sw2_, sw7);


// **** REGISTER **** //
reg[4:0] hour; // 0 to 24
reg[5:0] min, sec; // 0 to 60

Time_counter TimeCounter(clk, hour, min, sec);

// **** STATE MACHINE **** //




// **** CONTROLLER **** //
// 출력할 모든 값들을 입력받고, 그 중 어떤 값을 출력할지 state에 따라서 결정한다.

Buzzer_controller buzzer_c(state, , buzzer);
Light_controller Light_c(state, , light);
Display_controller display(state, , dp0, dp1, dp2, dp3, dp4, dp5);

endmodule

