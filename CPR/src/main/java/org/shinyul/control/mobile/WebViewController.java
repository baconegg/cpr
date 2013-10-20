package org.shinyul.control.mobile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.shinyul.domain.MemberCommonVO;
import org.shinyul.service.MemberService;
import org.shinyul.service.ProductService;
import org.shinyul.util.Constant;
import org.shinyul.util.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(Constant.ControllerName.DEFALT + Constant.ControllerName.WEBVIEW)
public class WebViewController {
	
	private static final Logger logger = Logger.getLogger(WebViewController.class);
	
	@Inject
	private MemberService member;
	@Inject
	private ProductService pService;
	
	///////////////////////////////////////////////////////////////////////////////////
	//goto list after login																	//
	//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerAction.LOGIN + "/{" + Constant.Session.MEMBER_ID + "}/{" + Constant.Session.MEMBER_PW + "}/{" + Constant.Session.SEL_IDX + "}", method = RequestMethod.GET)
	public void login(@PathVariable(Constant.Session.MEMBER_ID) String memberId,@PathVariable(Constant.Session.MEMBER_PW) String memberPw, @PathVariable(Constant.Session.SEL_IDX) int selIdx, HttpServletResponse response, HttpSession session){
		logger.info("webview 로그인 하러 들어왓슴미다");
		
		SessionUtil sUtil = new SessionUtil();
		MemberCommonVO vo = null;
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
				session.setAttribute(Constant.Session.LOGIN_CHK, Constant.Session.PW_OK);				
				session.setAttribute(Constant.Session.MEMBER_IDX, vo.getMemberIdx());			
				session.setAttribute(Constant.Session.MEMBER_ID, vo.getMemberId());
				session.setAttribute(Constant.Session.MEMBER_NAME, vo.getMemberName());
				session.setAttribute(Constant.Member.LEV, vo.getMemberLev());								
				
				if(vo.getMemberLev() == Constant.Member.SELLER){
					//selIdx 등록해야됨...
					session.setAttribute(Constant.Session.SEL_IDX, member.getSelIdx(vo.getMemberIdx()));
					
					session.setAttribute(Constant.Session.MAR_IDX,  member.getMarIdx(vo.getMemberIdx()));
				}else{
					session.setAttribute(Constant.Session.CUSTOMER_IDX,  member.getCustomerIdx(vo.getMemberIdx()));
				}
			
				logger.info(session.getAttribute(Constant.Session.MEMBER_NAME));
				logger.info(session.getAttribute(Constant.Session.MEMBER_ID));
				logger.info(session.getAttribute(Constant.Member.LEV));
				
				logger.info("비번이 맞으므로 세션세팅 끝~~~~~~~~~~~~~~~~~~!!!!");
			}else if(chk == Constant.Session.PW_FAIL) {	//비번이 틀렸을 경우
				logger.info("if(chk==1)  비번이 틀렸을 경우..");
				session.setAttribute(Constant.Session.LOGIN_CHK, Constant.Session.PW_FAIL);
			}else {	//그외 알수없는 경우?
				logger.info("if(chk==???)  그외 경우??");
				session.setAttribute(Constant.Session.LOGIN_CHK, Constant.Session.PW_ETC);
			} //요까징 end inner if~ else			
		}//end if~ else		
		
		try {
			response.sendRedirect(Constant.ControllerName.CPR + Constant.ControllerName.DEFALT + Constant.ControllerName.PRODUCT + Constant.ControllerForm.LIST + "/" + selIdx);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
