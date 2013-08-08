package org.shinyul.control;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.service.MemberService;
import org.shinyul.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/attach")
public class AttachController {

	private static final Logger logger = Logger.getLogger(AttachController.class);

	@Inject
	private ProductService pService;
	@Inject
	private MemberService mService;	
	
	@RequestMapping(value="/attach")
	public ModelAndView attach(){
		logger.info("attach/attach/...");		
		return new ModelAndView("attach/attach");
	}	

}
