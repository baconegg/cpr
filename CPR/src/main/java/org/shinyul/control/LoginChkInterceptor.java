package org.shinyul.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginChkInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = Logger.getLogger(LoginChkInterceptor.class);
	
	int memberIdx; // tbl_member 에 member_idx
	String memberId;
	int memberLev; //등급 1:소비자 2:판매자
	String memberName;

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
		
		logger.info("로그인을 체크해야됭디... 후레쳌");		
		logger.info(handler.toString());		
		HttpSession session = request.getSession();
		String hpath =(String) session.getAttribute("hpath");				
			
		logger.info(session.getAttribute("memberId"));
		
		if(session.getAttribute("memberId") == null){
			logger.info("세션에 멤버 아이디가 없슴미다...");
			logger.info(session.getAttribute("memberId"));
			logger.info(hpath);
			/*postpath = "";*/	
			response.sendRedirect(hpath);
			return false;
		}else{
			logger.info("세션에 들어 있는 멤버 아이디는 : " + session.getAttribute("memberId"));
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		logger.info("로그인을 체크해야됭디... 포스트쳌");		
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object handler, Exception ex) throws Exception {
		logger.info("로그인을 체크해야됭디... 에푸터콤");
		super.afterCompletion(request, response, handler, ex);
	}
	
//	메소드 명	return 값	설명
//	preHandle	boolean		1. 클라이언트의 요청을 컨트롤러에 전달 하기 전에 호출
//									2. false 인 경우 intercepter  또는 controller 를 실행 시키지 않고 요청 종료	
//	postHandle	void			1. 컨트롤러 로직 실행 된 후 호출됨
//									2. 컨트롤러 실행 도중 error 발생의 경우 postHandle() 는 실행 되지 않음
//									3. request 로 넘어온 데이터 가공시 많이 쓰임	
//	afterCompletion	void	1. 컨트롤러 로직 실행 된 후 호출 됨
//									2. 컨트롤러 실행 도중이나 view 페이지 실행 도중 error 발생 해도 실행됨
//									3. 공통 Exception 처리 로직 작성시 많이 쓰임	
}
