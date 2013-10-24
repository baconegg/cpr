package org.shinyul.control;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.shinyul.domain.Criteria;
import org.shinyul.domain.ReserveVO;
import org.shinyul.service.ReserveService;
import org.shinyul.util.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(Constant.ControllerName.DEFALT + Constant.ControllerName.RESERVE)
public class ReserveController {

	private static final Logger logger = Logger.getLogger(ReserveController.class);
	
	@Inject
	ReserveService rService;
	
	@RequestMapping(value=Constant.ControllerForm.REGISTER, method=RequestMethod.POST)
	public @ResponseBody int register(ReserveVO vo, HttpSession session){		
		logger.info("ResreveController - register : 들어옴");
		logger.info("register : " + vo);
		
//		System.out.println(vo);
		
		// 인서트가 제대로 됫는지 말앗는지 파악해서 리턴한다!!!
		// chk (0이 실패 1이 성공 2는 빈값... 로그인 하세용)		
		return rService.register(vo);
	}
	
	@RequestMapping(value=Constant.ControllerForm.VIEW, method=RequestMethod.GET)
	public ModelAndView view(int reserveIdx){		
		ReserveVO vo = new ReserveVO();
		logger.info("ResreveController - view : 들어옴");
		logger.info(reserveIdx);
		
		vo = rService.view(reserveIdx);
		
		return new ModelAndView(Constant.ControllerName.RESERVE + Constant.ControllerForm.VIEW, Constant.Model.RESERVE_VO, vo);
	}

	@RequestMapping(value=Constant.ControllerForm.MODIFY, method=RequestMethod.GET)
	public ModelAndView modify(int reserveIdx){		
		ReserveVO vo = new ReserveVO();
		logger.info("ResreveController - modify : 들어옴");
		logger.info(reserveIdx);
		
		vo = rService.view(reserveIdx);
		
		return new ModelAndView(Constant.ControllerName.RESERVE + Constant.ControllerForm.MODIFY, Constant.Model.RESERVE_VO, vo);
	}
	
	@ResponseBody
	@RequestMapping(value= Constant.ControllerAction.RESERVE_CONFIRM, method=RequestMethod.POST)
	public int reserveConfirm(int reserveIdx){		
		
		logger.info("ResreveController - reserveConfirm : 들어옴");
		
		logger.info(reserveIdx);
		
		int check = rService.confirm(reserveIdx);
		
		return check ;
	}
	
	@ResponseBody
	@RequestMapping(value= Constant.ControllerAction.RESERVE_CANCEL, method=RequestMethod.POST)
	public int reserveCancel(int reserveIdx){		
		
		logger.info("ResreveController - reserveConfirm : 들어옴");
		
		logger.info(reserveIdx);
		
		int check = rService.cancel(reserveIdx);
		
		return check ;
	}
	
	@RequestMapping(value= Constant.ControllerForm.LIST, method=RequestMethod.GET)
	public ModelAndView list(Criteria cri, HttpSession session){
		
		logger.info("reserve list!!! ");
		logger.info("cri : " + cri);
		
		ReserveVO vo = new ReserveVO();
		
		vo.setMemberLev((int)session.getAttribute(Constant.Member.LEV));

		if((int)session.getAttribute(Constant.Member.LEV) == Constant.Member.CUSTOMER){
			vo.setCustomerIdx((int)session.getAttribute(Constant.Session.CUSTOMER_IDX));
		} else{
			vo.setSelIdx((int)session.getAttribute(Constant.Session.SEL_IDX));
		}
		
		logger.info(cri.toString());
		session.setAttribute(Constant.Session.CRITERIA, cri);
		
		List<ReserveVO> list = rService.list(vo, cri);
		logger.info("list" + list);
		return new ModelAndView(Constant.ControllerName.RESERVE + Constant.ControllerForm.LIST, Constant.Model.LIST, list);
	}
}
