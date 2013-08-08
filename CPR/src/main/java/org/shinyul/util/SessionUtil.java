package org.shinyul.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.shinyul.control.MemberController;
import org.shinyul.domain.MemberCommonVO;

public class SessionUtil {
	
	private static final Logger logger = Logger.getLogger(SessionUtil.class);
	
	public String sessionChk(HttpServletRequest request,HttpServletResponse response, Object handler){		
		return null;
	}
	
	public int pwChk(String userPw,MemberCommonVO vo){		
		int chk;
		// 0:비번이 맞음, 1:틀림, 2:알수 없는 오류
		if(userPw.equals(vo.getMemberPw())){
			chk=0;
		}else if(userPw != vo.getMemberPw()){
			chk=1;
		}else{
			chk=2;
		}
		return chk;		
	}

}
