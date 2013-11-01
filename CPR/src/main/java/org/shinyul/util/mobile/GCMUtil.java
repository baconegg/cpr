package org.shinyul.util.mobile;

import org.springframework.stereotype.Component;

@Component
public class GCMUtil {
	/**
	 * 디바이스에 전송할 메시지의 구분자
	 */
	//서버에 no가 존재하는지 유무를 파악하여 정상 처리되었는지 구분하는것
	public static final String CONFIRM_RESERVE="Confim_Reserve";
//	public static final String SERVER_REGISTRATION="RegIdAdd";
//	public static final String SCHEDULE_UPDATE="SchedulePush";
//	public static final String SCHEDULE_ADD="ScheduleAdd";
//	public static final String SENSOR_CALL="SensorCall";
	
	/**
	 * 전체 사용하는 스트링 값
	 */
	public static final String GCM_PATH = ""; 
	//서버의 API KEY 값
	public static final String API_KEY = "AIzaSyDyIO7hdp9O2J3yIz93XjNORnT9AqY1Cx4";
}
