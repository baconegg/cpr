package org.shinyul.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class ChkInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = Logger.getLogger(ChkInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {
				
		logger.info("촤촤촤가로챗응 후레핸들...");	
		
		return true;		
	}

	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		logger.info("촤촤촤가로챗응 포스트핸들...");
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
}
