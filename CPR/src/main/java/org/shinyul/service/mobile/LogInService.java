package org.shinyul.service.mobile;

import javax.inject.Inject;
import org.apache.log4j.Logger;
import org.shinyul.domain.MemberCommonVO;
import org.shinyul.mapper.mobile.LogInMapper;
import org.springframework.stereotype.Service;


@Service
public class LogInService {
	
	private Logger logger = Logger.getLogger(LogInService.class);

	@Inject
	private LogInMapper logIn;
	
	//로그인 처리
	public MemberCommonVO loginchk(String memberId){
		MemberCommonVO mCVo = null;
		try {			
			mCVo = logIn.loginchk(memberId);			
		} catch (Exception e) {
			logger.error("MemberService - loginchk error~!@");
		}
		return mCVo;
	}
	public int getSelIdx(int memberIdx){
		try {			
		 return	logIn.getSelIdx(memberIdx);			
		} catch (Exception e) {
			logger.error("MemberService - getSelIdx error~!@");
		}
		return 0;
	}
	public int getCustomerIdx(int memberIdx){
		try {			
		 return	logIn.getCustomerIdx(memberIdx);			
		} catch (Exception e) {
			logger.error("MemberService - getCustomerIdx error~!@");
		}
		return 0;
	}
}
