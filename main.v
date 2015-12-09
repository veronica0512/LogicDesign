module main(
	input[5:0]sw_,
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
wire [5:0]sw;
ButtonDebouncer btn_db1(clk, sw_[0], sw[0]); // FIXME: 모듈명 및 인자 전달 순서 바뀔 수 있음
ButtonDebouncer btn_db2(clk, sw_[1], sw[1]);
ButtonDebouncer btn_db3(clk, sw_[2], sw[2]);
ButtonDebouncer btn_db4(clk, sw_[3], sw[3]);
ButtonDebouncer btn_db5(clk, sw_[4], sw[4]);
ButtonDebouncer btn_db6(clk, sw_[5], sw[5]);


// **** REGISTER **** //
reg[4:0] hour = 0, alarm_hour = 0; // 0 to 24
reg[5:0] min = 0, sec = 0, 
	alarm_min = 0, alarm_sec = 0,
	stop_min = 0, stop_sec = 0; // 0 to 60
reg[6:0] stop_msec = 0; // 0 to 99

reg[??] state, nextState; // FIXME : 몇 개가 될 지 일단 보류
reg[??] sign; // 알람 울리기 등의 event sign; FIXME : 몇 개 울릴지 일단 보류 
// parameter[??] TIME24, TIME12, TIME_SETTING, ALARM_SETTING, STOPWATCH_SETTING;
// parameter[??] ALARMING, RESET; // FIXME : sign 종류 추가 필요 

Time_counter TimeCounter(clk, sw, hour, min, sec);

// **** STATE MACHINE **** //
TimeDisplayMode TD_mode(sw, state, hour, min, sec, nextState);
TimeSettingMode TS_mode(sw, state, hour, min, sec, new_hour, new_min, new_sec, nextState);
AlarmSettingMode AS_mode(sw, state, alarm_hour, alarm_min, nextState);
StopwatchSettingMode SS_mode(sw, state, stop_min, stop_sec, stop_msec, nextState);




// **** CONTROLLER **** //
// 출력할 모든 값들을 입력받고, 그 중 어떤 값을 출력할지 state에 따라서 결정한다.

Buzzer_controller buzzer_c(state, , buzzer);
Light_controller Light_c(state, , light);
Display_controller display(state, , dp0, dp1, dp2, dp3, dp4, dp5);

endmodule

