package org.shinyul.control.mobile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.shinyul.domain.MemberCommonVO;
import org.shinyul.service.mobile.LogInService;
import org.shinyul.util.Constant;
import org.shinyul.util.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(Constant.ControllerName.DEFALT + Constant.ControllerName.LOGIN)
public class LogInController {
	
	private static final Logger logger = Logger.getLogger(LogInController.class);
	
	@Inject
	private LogInService member;
	
	///////////////////////////////////////////////////////////////////////////////////
	//Login																			          //
	//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerForm.DEFALT, method = RequestMethod.POST)
	public @ResponseBody List<Map<String, String>> login(HttpSession session, String memberId,String memberPw){
		logger.info("mobile 로그인 하러 들어왓슴미다 : " + memberId + " : " + memberPw);
		
		SessionUtil sUtil = new SessionUtil();
		MemberCommonVO vo = null;
		Map<String, String> toMobile = new HashMap<String, String>();
		
		int chk = 0;
		//아이디만 체크해서 값을 가져옴
		vo = member.loginchk(memberId);
		logger.info(vo);
		if(vo == null){
			//아이디 없음
			logger.info("이푸 vo가 널이라면!!! 아이디나 패스워드가 없는거임...혹은 암것도 안쓴거...");
			session.setAttribute(Constant.Session.ID_CHK, Constant.Session.ID_OK);
		}else{
			//요기부터
			//아이디가 있는 경우 비번 체크
			chk = sUtil.pwChk(memberPw, vo);
			if(chk == Constant.Session.PW_OK){	//비번이 맞을경우 세션을 한번 비우고 셋팅
				logger.info("if(chk==0)");
				toMobile.put(Constant.Session.CHK, String.valueOf(Constant.Session.PW_OK));
				toMobile.put(Constant.Session.MEMBER_IDX, String.valueOf(vo.getMemberIdx()));			
				toMobile.put(Constant.Session.MEMBER_ID, vo.getMemberId());
				toMobile.put(Constant.Session.MEMBER_NAME, vo.getMemberName());
				toMobile.put(Constant.Member.LEV, String.valueOf(vo.getMemberLev()));								
				
				session.setAttribute(Constant.Session.LOGIN_CHK, Constant.Session.PW_OK);				
				session.setAttribute(Constant.Session.MEMBER_IDX, vo.getMemberIdx());			
				session.setAttribute(Constant.Session.MEMBER_ID, vo.getMemberId());
				session.setAttribute(Constant.Session.MEMBER_NAME, vo.getMemberName());
				session.setAttribute(Constant.Member.LEV, vo.getMemberLev());
				
				
				if(vo.getMemberLev() == Constant.Member.SELLER){
					//selIdx 등록해야됨...
					toMobile.put(Constant.Session.SEL_IDX, String.valueOf(member.getSelIdx(vo.getMemberIdx())));
					session.setAttribute(Constant.Session.SEL_IDX, member.getSelIdx(vo.getMemberIdx()));
				}else{
					toMobile.put(Constant.Session.CUSTOMER_IDX, String.valueOf(member.getCustomerIdx(vo.getMemberIdx())));
					session.setAttribute(Constant.Session.CUSTOMER_IDX,  member.getCustomerIdx(vo.getMemberIdx()));
				}
				
				logger.info("비번이 맞으므로 세팅 끝~~~~~~~~~~~~~~~~~~!!!!");
			}else if(chk == Constant.Session.PW_FAIL) {	//비번이 틀렸을 경우
				logger.info("if(chk==1)  비번이 틀렸을 경우..");
				toMobile.put(Constant.Session.CHK, String.valueOf(Constant.Session.PW_FAIL));
				session.setAttribute(Constant.Session.LOGIN_CHK, Constant.Session.PW_FAIL);
			}else {	//그외 알수없는 경우?
				logger.info("if(chk==???)  그외 경우??");
				toMobile.put(Constant.Session.CHK, String.valueOf(Constant.Session.PW_ETC));
				session.setAttribute(Constant.Session.LOGIN_CHK, Constant.Session.PW_ETC);
			} //요까징 end inner if~ else			
		}//end if~ else		
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		list.add(toMobile);
		return list;
	}
}
