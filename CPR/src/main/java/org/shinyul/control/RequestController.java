package org.shinyul.control;

import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
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
import org.shinyul.util.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(Constant.ControllerName.DEFALT + Constant.ControllerName.REQUEST)
public class RequestController {

	private Logger logger = Logger.getLogger(RequestController.class);

	@Inject
	RequestService service;
	
	@RequestMapping(value= Constant.ControllerForm.REGISTER, method=RequestMethod.GET)	
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
		

		
		model.addAttribute(Constant.Model.GUNAME, guname);
		model.addAttribute(Constant.Model.REQUEST_ITEMLIST, itemList);
		
		return new ModelAndView(Constant.ControllerName.REQUEST + Constant.ControllerForm.REGISTER, Constant.Model.MARKET_NAME, marketname);
	}
	
	@ResponseBody
	@RequestMapping(value= Constant.ControllerAction.REGISTER, method=RequestMethod.POST)	
	public int registerAction(RequestVO vo){
		logger.info("registerAction 들어옴");
				
		vo.setGunameMarid(vo.getGuName() + "," + vo.getMarketName());
	
		System.out.println(vo);
		
		int check = service.register(vo);
		
		logger.info(check);
		
		return check;
	
	}
	
	@RequestMapping(value= Constant.ControllerForm.VIEW, method=RequestMethod.GET)	
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
		
		model.addAttribute(Constant.Model.LIST, list);
		model.addAttribute(Constant.Model.REPLY_LIST, replyList);
		System.out.println(list);
		System.out.println(replyList.size());
		
		return new ModelAndView(Constant.ControllerName.REQUEST + Constant.ControllerForm.VIEW, Constant.Model.REQUEST_VO , reqestVO);
		
		
	}
	
	

	@ResponseBody
	@RequestMapping(value=Constant.ControllerForm.REMOVE, method=RequestMethod.POST)	
	public String remove(int idx){
		System.out.println(idx);
		System.out.println("remove 들어옴");
		
		String check = service.remove(idx);
		
		System.out.println(check);
		
		return check;
	
	}
	
	@RequestMapping(value=Constant.ControllerForm.MODIFY, method=RequestMethod.GET)	
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
		
		model.addAttribute(Constant.Model.LIST, list);
		
		System.out.println(list);
		
		model.addAttribute(Constant.Model.GUNAME, guname);
		model.addAttribute(Constant.Model.REQUEST_ITEMLIST, itemList);
		model.addAttribute(Constant.Model.MARKET_NAME, mList);
		
		return new ModelAndView(Constant.ControllerName.REQUEST + Constant.ControllerForm.MODIFY, Constant.Model.REQUEST_VO , vo);
	}
	
	@ResponseBody
	@RequestMapping(value=Constant.ControllerAction.MODIFY, method=RequestMethod.POST)	
	public String modifyAction(RequestVO vo){
		
		System.out.println("list 들어옴");
		System.out.println(vo);
		
		vo.setGunameMarid(vo.getGuName() + "," + vo.getMarketName());
		
		String  check = service.modify(vo);
		System.out.println(check);
		return check ;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value=Constant.ControllerAction.REPLY_REGISTER, method=RequestMethod.POST)	
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
	@RequestMapping(value=Constant.ControllerAction.REPLY_REMOVE, method=RequestMethod.POST)	
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
	@RequestMapping(value=Constant.ControllerAction.REPLY_MODIFY, method=RequestMethod.POST)	
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
	@RequestMapping(value=Constant.ControllerAction.REPLY_TENDER, method=RequestMethod.POST)	
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
	
	
	
	@RequestMapping(value=Constant.ControllerForm.LIST, method=RequestMethod.GET)	
	public String list(Integer page, String type, String keyword, Model model,HttpSession session){
		
		logger.info("request list 들어옴");
		logger.info("page : " + page);
		// 로그인시 세션에 상인정보 포함. -- 테스트용
//		session.setAttribute(Constant.Member.LEV, 1);
//		session.setAttribute(Constant.Session.MAR_IDX, 290);
				
//		///////////////////////////////////////////
//		if(session.getAttribute(Constant.Session.MAR_IDX) == null || ((String) session.getAttribute(Constant.Session.MAR_IDX)).trim().equals("") ){
//			return Constant.ControllerName.CPR;
//		}
//		///////////////////////////////////////////
		if(page == null){
			page = 1;
		}
		
		List<RequestVO> list = new ArrayList<RequestVO>();
		Criteria cri = new Criteria(page, type, keyword);
		
		int marIdx = (int)session.getAttribute(Constant.Session.MAR_IDX);
		logger.info("marIdx : " + marIdx);
		String gunameMarid = service.searchMarketName(marIdx);
		logger.info("gunameMarid : " + gunameMarid);
		cri.setGunameMarid(gunameMarid);
		
		
		
//		if(2 == (int)session.getAttribute(Constant.Member.LEV)){
//			logger.info("in session");
//		}
		
		// 로그인 안했을때...or 커스터머(소비자)일때 같은화면...
		logger.info("memberLev : " + session.getAttribute(Constant.Member.LEV));
		
		/*if("1".equals(session.getAttribute(Constant.Member.LEV))){		
			list = service.customerList(cri);
			logger.info("in session customer");
		}else if("2".equals(session.getAttribute(Constant.Member.LEV))) {
			list = service.sellerList(cri);
			logger.info("in session seller");
		}else {
			logger.info("/list ... 알수 없는 오류");
			list = null;
		}*/
		
		if(Constant.Member.CUSTOMER==(int)(session.getAttribute(Constant.Member.LEV))){		
			list = service.customerList(cri);
			logger.info("in session customer : " + list);
		}else if(2==(int)(session.getAttribute(Constant.Member.LEV))) {
			list = service.sellerList(cri);
			logger.info("in session seller : " + list);
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
		
		model.addAttribute(Constant.Model.LIST, list);	
		/*model.addAttribute(Constant.Model.CRITERIA, cri);	*/
		session.setAttribute(Constant.Session.CRITERIA, cri);
		
		return Constant.ControllerName.REQUEST + Constant.ControllerForm.LIST;
	
	}
	
	
	
	
}
