package org.shinyul.control;

import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.shinyul.domain.MarketVO;
import org.shinyul.domain.MemberCommonVO;
import org.shinyul.domain.MemberCustomerVO;
import org.shinyul.domain.MemberSellerVO;
import org.shinyul.service.MemberService;
import org.shinyul.util.Constant;
import org.shinyul.util.FileIOUtil;
import org.shinyul.util.GetAddressUtil;
import org.shinyul.util.SessionUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 * @param <MultipartServletRequest>
 */
@Controller
@RequestMapping(Constant.ControllerName.DEFALT + Constant.ControllerName.MEMBER)
public class MemberController {
	
	private static final Logger logger = Logger.getLogger(MemberController.class);
		
	@Inject
	private MemberService member;
	
	///////////////////////////////////////////////////////////////////////////////////
	//Login																			          //
	//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerAction.LOGIN, method = RequestMethod.POST)
	public void login(String hpath, @RequestParam(Constant.Session.MEMBER_ID) String memberId, @RequestParam(Constant.Session.MEMBER_PW) String memberPw, HttpSession session,HttpServletResponse response){
		logger.info("로그인 하러 들어왓슴미다");
		logger.info("hpath : " + hpath);
		//hpath ="redirect:"+hpath;
		
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
			
				logger.info("memberName : " + session.getAttribute(Constant.Session.MEMBER_NAME));
				logger.info("memberId : " + session.getAttribute(Constant.Session.MEMBER_ID));
				logger.info("memberLev : " + session.getAttribute(Constant.Member.LEV));
				
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
			response.sendRedirect(hpath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 로그 아웃...
	@RequestMapping(value = Constant.ControllerAction.LOGOUT, method = RequestMethod.POST)
	public void logout(String hpath,HttpSession session,HttpServletResponse response){
		logger.info("세션값 지우러 왔습니다...");
		logger.info(hpath);
		logger.info("if(chk==0)");
		
		session.removeAttribute(Constant.Session.SEL_IDX);
		session.removeAttribute(Constant.Session.CUSTOMER_IDX);
		session.removeAttribute(Constant.Session.ID_CHK);
		session.removeAttribute(Constant.Session.LOGIN_CHK);				
		session.removeAttribute(Constant.Session.MEMBER_IDX);			
		session.removeAttribute(Constant.Session.MEMBER_ID);
		session.removeAttribute(Constant.Session.MEMBER_NAME);
		session.removeAttribute(Constant.Member.LEV);	
		
		//hpath ="redirect:"+hpath;
		logger.info("세션값 지우기 완료...");
		try {
			response.sendRedirect(Constant.ControllerName.CPR);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		return new ModelAndView("spatial/index");
	}
	
	// 로그인 예외 처리... ㅠㅠ
	@RequestMapping(value= Constant.ControllerAction.CHECK, method = RequestMethod.POST)
	public @ResponseBody void check(HttpSession session){
		logger.info("로그인 상태 체크값 반환(세션 비우기...)중!!!");
		session.removeAttribute(Constant.Session.ID_CHK);
		session.removeAttribute(Constant.Session.LOGIN_CHK);
		logger.info("로그인 상태 체크값 반환(세션 비우기...) 끝!!!");
	}
	
	@RequestMapping(value=Constant.ControllerAction.SESSION_SET, method = RequestMethod.POST)
	public @ResponseBody void sessionSet(HttpSession session,String path){
		logger.info("path : " + path);
		session.removeAttribute(Constant.Session.HPATH);
		session.setAttribute(Constant.Session.HPATH, path);
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	//joinPage																		//
	//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerForm.JOIN, method = RequestMethod.GET)
    public ModelAndView join() {	
		logger.info("/join!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        return new ModelAndView(Constant.ControllerName.MEMBER + Constant.ControllerForm.JOIN);
    }	 
	
	///css display...예외처리 해줍시다.../////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////
	//join 판매자    																	//
	//////////////////////////////////////////////////////////////////////////////////		
	@RequestMapping(value=Constant.ControllerForm.JOIN + Constant.ControllerForm.SELLER, method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody void  joinSeller(MemberSellerVO mvo, @RequestParam(Constant.Session.SEL_IMG) MultipartFile file){
				
		logger.info("/joinSeller!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				
		String name ="";
		String uuid = "";
		
		if(!file.isEmpty()){
			 name = file.getOriginalFilename();		
			 uuid = FileIOUtil.gUuid();
			 mvo.setSelImgOri(name);
			 mvo.setSelImgUUID(uuid);						
			logger.info("joinSeller - file : " + mvo);	
		}else{			
			logger.info("file is empty OTL ...");
		}		
		
		if(member.registSeller(mvo) == 1){	
			FileIOUtil.control(Constant.File.SELLER, file, uuid);
		};
	}

	///////////////////////////////////////////////////////////////////////////////////
	//마켓 정보 읽어오기...	m_code로!!!												//
	//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value=Constant.ControllerForm.JOIN + Constant.ControllerForm.MARKET, method=RequestMethod.POST)	
	public @ResponseBody List<MarketVO> marketVO(MarketVO vo){		
		return member.viewSuperstoreInfo(vo);
	}	
	
	// /////////////////////////////////////////////////////////////////////////////////
	// 회원 상세 정보... 															 //
	// ////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerForm.VIEWINFO + "/{" + Constant.Session.MEMBER_IDX + "}", method = RequestMethod.GET)
	public ModelAndView viewInfo(HttpSession session, @PathVariable(Constant.Session.MEMBER_IDX) int memberIdx) {
		logger.info("/viewInfo!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! "+ memberIdx);
		
		ModelAndView model = null;
		MemberCommonVO vo = null;
		if(session.getAttribute(Constant.Session.SEL_IDX) == null){
			// userIdx -- 뷰쪽에서 소비자일 경우 memberIdx를... 판매자일 경우 selIdx를 넘겨 받아야 된다..
			logger.info("in viewInfo customer!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ");
			model = new ModelAndView(Constant.ControllerName.MEMBER + Constant.ControllerForm.VIEW_CUSTOMER);
			vo = member.viewCustomer(memberIdx);		
		}else{
			logger.info("in viewInfo seller!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ");
			// userIdx -- 뷰쪽에서 소비자일 경우 memberIdx를... 판매자일 경우 selIdx를 넘겨 받아야 된다..
			model = new ModelAndView(Constant.ControllerName.MEMBER + Constant.ControllerForm.VIEW_SELLER);
			vo = member.viewSeller(memberIdx);		
		}		
		
		model.addObject("vo", vo);
		
		return model;
	}
	
	// /////////////////////////////////////////////////////////////////////////////////
	// 회원 상세 정보... 수정(판매자) 쿼리까진 작동함미다...								   //
	// ////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerForm.MODIFY + Constant.ControllerForm.SELLER, method = RequestMethod.POST)
	public @ResponseBody void modifySeller(HttpSession session,  MemberSellerVO vo, @RequestParam(Constant.Session.FILE) MultipartFile file) {
		
		logger.info("/modify/seller/!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ");
		logger.info(vo);
		
		String uuid = "";
		
		if(!file.isEmpty()){
			vo.setSelImgOri(file.getOriginalFilename());
			uuid = FileIOUtil.gUuid();
			vo.setSelImgUUID(uuid);
		}		
		if(member.modifySeller(vo) == 1){
			FileIOUtil.control(Constant.File.SELLER, file, uuid);			
		}
		
	}
		
	//회원 상세 정보... 탈퇴(판매자)!!!
	@RequestMapping(value=Constant.ControllerForm.REMOVE + Constant.ControllerForm.SELLER, method = RequestMethod.POST)
	public @ResponseBody void removeSeller(HttpSession session, MemberSellerVO vo) {
		logger.info("/remove/seller/!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ");
		logger.info(vo);
		member.removeSeller(vo);		
	}
		
	///////////////////////////////////////////////////////////////////////////////////
	// 회원 상세 정보... 수정(소비자)														  //
	//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = Constant.ControllerForm.MODIFY + Constant.ControllerForm.CUSTOMER, method = RequestMethod.POST)
	public @ResponseBody void modifyCustomer(HttpSession session, MemberCustomerVO vo) {
		logger.info("/join/modify/customer/!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ");
		logger.info(vo);		
		member.modifyCustomer(vo);
	}
		
	//회원 상세 정보... 탈퇴(소비자)!!!
	@RequestMapping(value=Constant.ControllerForm.REMOVE + Constant.ControllerForm.CUSTOMER, method = RequestMethod.POST)
	public @ResponseBody void removeCustomer(HttpSession session, MemberCustomerVO vo) {
		logger.info("/remove/customer/!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ");
		logger.info(vo);			
		member.removeCustomer(vo);
	}

	/////소비자//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////////////////////////////////////////
	//join 소비자    																	//
	//////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping(value=Constant.ControllerForm.JOIN + Constant.ControllerForm.CUSTOMER, method=RequestMethod.POST)	
	public @ResponseBody  List<ObjectError>  joinCustomer(@Valid MemberCustomerVO mvo, BindingResult result){
			
		logger.info("joinCustomer");
		logger.info("mvo : " +  mvo);
		List<ObjectError> list = result.getAllErrors();		
		if(result.hasErrors()) {			
			for (ObjectError e : list) {
				logger.info("err msg =" + e);				
            }			
			logger.info("joinCustomer Controller Error~~!!");
		}else {			
			//위도경도를 통한 상세주소 설정...
			//mvo.setUser_Address(GetAddressUtil.mapXmlParser(mvo.getMember_LNG(), mvo.getMember_LAT()));			
			logger.info("complete mvo : " + mvo);
			
			member.registCustomer(mvo);
			list=null;			
		}
		return list;
	}
	
	////////ajax////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////
	//naver map popup 띄우기 														//
	//////////////////////////////////////////////////////////////////////////////////			
	@RequestMapping(Constant.ControllerAction.POP_MAP)
	public void popMap(){
		logger.info("popMap!!!");
	}
	
	///////////////////////////////////////////////////////////////////////////////////
	//위도 경도로 상세주소 얻어오는 부분 											//
	//////////////////////////////////////////////////////////////////////////////////			
	@RequestMapping(value=Constant.ControllerAction.GET_ADDRESS, method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody  ResponseEntity<String> getAddress(String LNG, String LAT){
		logger.info("getAddress!!!");
		String address = GetAddressUtil.mapXmlParser(LNG, LAT);
		logger.info(address);
		
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
        return new ResponseEntity<String>(address, responseHeaders, HttpStatus.CREATED);	
	}	
	
}
