package org.shinyul.control;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.shinyul.domain.Criteria;
import org.shinyul.domain.MarketVO;
import org.shinyul.domain.ProductVO;
import org.shinyul.domain.RequestItemVO;
import org.shinyul.domain.RequestReplyVO;
import org.shinyul.domain.RequestVO;
import org.shinyul.service.RequestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/request")
public class RequestController {

	private Logger logger = Logger.getLogger(RequestController.class);

	@Inject
	RequestService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)	
	public ModelAndView register(Model model){
	
		System.out.println("register들어옴");
		List<MarketVO> mList = new ArrayList<MarketVO>();
		List<MarketVO> gList = new ArrayList<MarketVO>();
		List<RequestItemVO> requestItemList = new ArrayList<RequestItemVO>();
		mList = service.marketList();
		gList = service.guList();
		requestItemList = service.requestItemList();
		
		List<String> marketname = new ArrayList<String>();
		for (int i = 0; i < mList.size(); i++) {
			marketname.add(i,  mList.get(i).getMarId().trim());
			
		}	
		
		List<String> guname = new ArrayList<String>();
		for (int i = 0; i < gList.size(); i++) {
			guname.add(i,  gList.get(i).getGuname().trim());
		}	
		
		
		List<String> itemList = new ArrayList<String>();
		for (int i = 0; i < requestItemList.size(); i++) {
			itemList.add(i,  requestItemList.get(i).getRequestItem());
		}	
		

		
		model.addAttribute("guname", guname);
		model.addAttribute("requestItemList", itemList);
		
		return new ModelAndView("request/regist", "marketname", marketname);
	}
	
	@ResponseBody
	@RequestMapping(value="/registerAction", method=RequestMethod.POST)	
	public String registerAction(RequestVO vo){
		System.out.println("registerAction 들어옴");
		System.out.println(vo);
	
		String check = service.register(vo);
		
		System.out.println(check);
		
		return check;
	
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)	
	public ModelAndView view(int idx,String gunamemarid,Model model){
		RequestVO reqestVO = new RequestVO();
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		List<RequestReplyVO> replyList = new ArrayList<RequestReplyVO>();
		
		reqestVO = service.view(idx);
		
		replyList = service.replyView(idx);
		
		
		
		/*============ 임의로 시장 정보 넣었음 고객 아이디 엑스도  ======================================*/
		/*gunamemarid = "관악구,신원시장(신림1동)";*/
//		reqestVO.setCustomerIdx(5);
		/*===============================================================================================================*/
		try {
			gunamemarid = new String(gunamemarid.getBytes("iso-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(gunamemarid);
		
		list = service.productlist(gunamemarid);
		
		model.addAttribute("list", list);
		model.addAttribute("replyList", replyList);
		System.out.println(list);
		System.out.println(replyList.size());
		
		return new ModelAndView("request/view", "RequestVO" , reqestVO);
		
		
	}
	
	

	@ResponseBody
	@RequestMapping(value="/remove", method=RequestMethod.POST)	
	public String remove(int idx){
		System.out.println(idx);
		System.out.println("remove 들어옴");
		
		String check = service.remove(idx);
		
		System.out.println(check);
		
		return check;
	
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)	
	public ModelAndView modify (int idx,String gunamemarid,Model model){
		
		System.out.println("modify 들어옴");
		
		List<MarketVO> mList = new ArrayList<MarketVO>();
		List<MarketVO> gList = new ArrayList<MarketVO>();
		List<RequestItemVO> requestItemList = new ArrayList<RequestItemVO>();
		mList = service.marketList();
		gList = service.guList();
		requestItemList = service.requestItemList();
		
		List<String> marketname = new ArrayList<String>();
		for (int i = 0; i < mList.size(); i++) {
			marketname.add(i,  mList.get(i).getMarId().trim());
		}	
		
		List<String> guname = new ArrayList<String>();
		for (int i = 0; i < gList.size(); i++) {
			guname.add(i,  gList.get(i).getGuname().trim());
		}	
		
		
		List<String> itemList = new ArrayList<String>();
		for (int i = 0; i < requestItemList.size(); i++) {
			itemList.add(i,  requestItemList.get(i).getRequestItem());
		}	
		

		
		
		RequestVO vo = new RequestVO();
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		vo = service.view(idx);
		
		/*============ 임의로 시장 정보 넣었음 고객 아이디 엑스도  ======================================*/
//		gunamemarid = "관악구,신원시장(신림1동)";
//		vo.setCustomerIdx(5);
		/*===============================================================================================================*/
		System.out.println(gunamemarid);
		
		list = service.productlist(gunamemarid);
		
		model.addAttribute("list", list);
		
		System.out.println(list);
		
		model.addAttribute("guname", guname);
		model.addAttribute("requestItemList", itemList);
		model.addAttribute("marketname", mList);
		
		return new ModelAndView("request/modify", "RequestVO" , vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyAction", method=RequestMethod.POST)	
	public String modifyAction(RequestVO vo){
		
		System.out.println("list 들어옴");
		System.out.println(vo);
		
		
		String  check = service.modify(vo);
		System.out.println(check);
		return check ;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/replyRegisterAction", method=RequestMethod.POST)	
	public List<RequestReplyVO> replyRegisterAction(RequestReplyVO vo){
	
		System.out.println("replyRegisterAction 들어옴");
		System.out.println(vo);
		List<RequestReplyVO> replyList = new ArrayList<RequestReplyVO>();
		
		String check = service.replyRegister(vo);
		System.out.println(check);
		
		replyList = service.replyView(vo.getRequestIdx());
		
		
		return replyList;
	
	}

	@ResponseBody
	@RequestMapping(value="/replyRemove", method=RequestMethod.POST)	
	public List<RequestReplyVO> replyRemove (RequestReplyVO vo){
		System.out.println("replyRemove 들어옴");
		System.out.println(vo.getReplyIdx());
		System.out.println(vo.getRequestIdx());
		
		List<RequestReplyVO> replyList = new ArrayList<RequestReplyVO>();
		
		String check = service.replyRemove(vo);
		
		System.out.println(check);
		
		replyList = service.replyView(vo.getRequestIdx());
		
		return replyList;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/replyModify", method=RequestMethod.POST)	
	public List<RequestReplyVO> replyModify (RequestReplyVO vo){
		
		
		System.out.println("replyModify 들어옴");
		System.out.println(vo.getReplyIdx());
		System.out.println(vo.getRequestIdx());
		System.out.println(vo.getReplys());
		String aaa = vo.getReplys();
		System.out.println(aaa);
		
		String check = service.replyModify(vo);


		List<RequestReplyVO> replyList = new ArrayList<RequestReplyVO>();
		
		
		System.out.println("check");
		System.out.println(check);
		
		replyList = service.replyView(vo.getRequestIdx());
		System.out.println(replyList);
		
		return replyList;
	
	}


	
	
	@ResponseBody
	@RequestMapping(value="/replyTender", method=RequestMethod.POST)	
	public List<RequestReplyVO> replyTender (RequestReplyVO vo){
		System.out.println("replyTender 들어옴");
		System.out.println(vo.getReplyIdx());
		System.out.println(vo.getRequestIdx());
		
		List<RequestReplyVO> replyList = new ArrayList<RequestReplyVO>();
		
		String check = service.replyTender(vo);
		
		System.out.println(check);
		
		replyList = service.replyView(vo.getRequestIdx());
		
		return replyList;
		
	}
	
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)	
	public String list(Integer page, String type, String keyword, Model model,HttpSession session){
		
		System.out.println("list 들어옴");
		// 로그인시 세션에 상인정보 포함. -- 테스트용
//		session.setAttribute("memberLev", 1);
//		session.setAttribute("marIdx", 290);
		
		List<RequestVO> list = new ArrayList<RequestVO>();
		Criteria cri = new Criteria(page, type, keyword);
		
		int marIdx = (int)session.getAttribute("marIdx");
		String gunameMarid = service.searchMarketName(marIdx);
	
		cri.setGunameMarid(gunameMarid);
		
		
		
//		if(2 == (int)session.getAttribute("memberLev")){
//			logger.info("in session");
//		}
		
		// 로그인 안했을때...or 커스터머(소비자)일때 같은화면...
		logger.info("memberLev : " + session.getAttribute("memberLev"));
		
		/*if("1".equals(session.getAttribute("memberLev"))){		
			list = service.customerList(cri);
			logger.info("in session customer");
		}else if("2".equals(session.getAttribute("memberLev"))) {
			list = service.sellerList(cri);
			logger.info("in session seller");
		}else {
			logger.info("/list ... 알수 없는 오류");
			list = null;
		}*/
		
		if(1==(int)(session.getAttribute("memberLev"))){		
			list = service.customerList(cri);
			logger.info("in session customer");
		}else if(2==(int)(session.getAttribute("memberLev"))) {
			list = service.sellerList(cri);
			logger.info("in session seller");
		}else {
			logger.info("/list ... 알수 없는 오류");
			list = null;
		}
		
		
		
		if(list == null || list.size() == 0 ){
			
		}else if(list.size() >= 12){
			list.remove(list.size() - 12);
			list.remove(list.size() - 1);
		}else if(list.size() == 11){
			list.remove(list.size() - 1);
		}else if(list.size() >0 && list.size() < 11 && page > 1){			
			list.remove(list.size() - list.size());
		}
		
		model.addAttribute("list", list);	
		/*model.addAttribute("cri", cri);	*/
		session.setAttribute("cri", cri);
		
		return "request/list";
	
	}
	
	
	
	
}
