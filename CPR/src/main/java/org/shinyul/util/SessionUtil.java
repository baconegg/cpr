package org.shinyul.util;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.shinyul.domain.MemberCommonVO;

public class SessionUtil {
	
	private static final Logger logger = Logger.getLogger(SessionUtil.class);
	
	public String sessionChk(HttpServletRequest request,HttpServletResponse response, Object handler){		
		return null;
	}
	
	public static int pwChk(String memberPw, MemberCommonVO vo){		
		int chk = 0;
		
		//pbkdf2////////////////////////////
		try {
			// 0:비번이 맞음, 1:틀림, 2:알수 없는 오류
			
			if(PBKDF2.authenticate(memberPw.toCharArray(), PBKDF2.changeByte(vo.getMemberPw()), PBKDF2.changeByte(vo.getMemberSalt()))){
				chk=0;
			}else if(memberPw != vo.getMemberPw()){
				chk=1;
			}else{
				chk=2;
			}
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		///////////////////////////////////
		
		// 0:비번이 맞음, 1:틀림, 2:알수 없는 오류
//		if(memberPw.equals(vo.getMemberPw())){
//			chk=0;
//		}else if(memberPw != vo.getMemberPw()){
//			chk=1;
//		}else{
//			chk=2;
//		}
		
		return chk;		
	}

}
