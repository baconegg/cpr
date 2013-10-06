package org.shinyul.control;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.shinyul.domain.ProductVO;
import org.shinyul.service.MemberService;
import org.shinyul.service.ProductService;
import org.shinyul.util.FileIOUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = Logger
			.getLogger(ProductController.class);

	@Inject
	private ProductService pService;
	@Inject
	private MemberService mService;

	// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//  상세뷰 																									 //
	// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView viewCustomer(@RequestParam(value = "productIdx", required = true) String productIdx, HttpServletRequest req) {
		
		logger.info("ProductController - view : 들어왔음  " + productIdx);
		
		//test - head chek///////////////////////////////////////////////////
		Enumeration<String> keys = req.getHeaderNames();
		while(keys.hasMoreElements()){
			String key = keys.nextElement();
			logger.info("key : " + key + " ,value : " + req.getHeader(key));
		}
		/////////////////////////////////////////////////////////////////////
		
		ModelAndView model = new ModelAndView();
		
		//exception 처리해야되는되ㅠㅠ...
		ProductVO pVo = pService.view(Integer.valueOf(productIdx).intValue());

		logger.info("ProductController - vo : " + pVo.toString());
		
		model.addObject("pVo", pVo);

		if (pVo.getProductStatus() == 1) {	//혹시모를 예외처리..
			model.addObject("msVo", mService.viewSeller(pVo.getMemberIdx()));
			model.addObject("preList", pService.preList(pVo.getSelIdx()));
			model.setViewName("product/view");
		} else {
			model.setViewName("product/error");
		}

		return model;
	}

	// /판매자////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 판매자 상세뷰 //
	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	@RequestMapping(value = "/view/seller", method = RequestMethod.GET)
//	public ModelAndView viewSeller(@RequestParam(value = "productIdx", required = true) int productIdx, HttpSession session) {
//
//		logger.info("ProductController - viewSeller : 들어왔음 " + productIdx);
//
//		ModelAndView model = new ModelAndView();
//		ProductVO vo = pService.view(productIdx);
//		model.addObject("pVo", vo);
//
//		logger.info("ProductController - viewSeller : 들어왔음 " + vo.toString());
//		
//		if (vo.getProductStatus() == 1) {
//			model.addObject("msVo", mService.viewSeller(vo.getMemberIdx()));
//			model.addObject("preList", pService.preList(vo.getSelIdx()));
//			model.setViewName("product/view");
//		} else {
//			model.setViewName("product/viewError");
//		}
//
//		return model;
//	}

	// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 상품 등록 //
	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 등록 페이지 가기
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register(HttpSession session) {
		logger.info(".../register/...");
		return new ModelAndView("product/register");
	}

	@RequestMapping(value = "/registerAction", method = RequestMethod.POST)
	public @ResponseBody int registerAction(ProductVO vo, @RequestParam("files") MultipartFile fileData) {
		logger.info("registerAction~~~~~~~~~~~~~~~!!!");
		logger.info(vo.toString());
		System.out.println(vo.toString());
		System.out.println("---------------------------");
		System.out.println("---------------------------");
		System.out.println(vo);
		System.out.println(fileData);

		String name = "";
		String uuid = "";
		

		if (!fileData.isEmpty()) {
			uuid = FileIOUtil.gUuid();			
			name = fileData.getOriginalFilename();			
			vo.setProductImgUUID(uuid);
			vo.setProductImg(name);
			System.out.println(name);
			System.out.println("---------------------------");
		}
		System.out.println(vo);
		// check가 1이면 성공 2면 실패 입니다~!
		int check = pService.register(vo);
		if(check==1){
			FileIOUtil.control("product", fileData, uuid);
		}		
		return check;
	}

	// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 판매자 수정 //
	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(int productIdx, Model model, HttpSession session) {
		logger.info("ProductController - modify : 들어왔음.");

		ProductVO pVo = pService.view(productIdx);
		model.addAttribute("pVo", pVo);
		if (pVo.getProductStatus() == 1) {			
			model.addAttribute("msVo", mService.viewSeller(pVo.getSelIdx()));
			model.addAttribute("preList", pService.preList(pVo.getSelIdx()));
			model.addAttribute("tagList", pService.selectTag());
		} else {
			return "product/error";
		}

		return "product/modify";
	}

	// 수정 완료 <-- ajax..
	@RequestMapping(value = "/modifyAction", method = RequestMethod.POST)
	public @ResponseBody void modifyAction(ProductVO vo, @RequestParam("file") MultipartFile file) {

		logger.info("ProductController - modifyAction : 들어왔음.");
		logger.info(vo);

		String name = "";
		String uuid = "";

		if (!file.isEmpty()) {
			uuid = FileIOUtil.gUuid();	
			name = file.getOriginalFilename();			
			vo.setProductImg(name);
			vo.setProductImgUUID(uuid);
		} else {
			logger.info("file is empty...");
		}		
		if(pService.modify(vo) == 1){
			FileIOUtil.control("product", file, uuid);
		}		
	}

	// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 판매자 상품 삭제 //
	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@ResponseBody
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public void remove(int productIdx) {

		logger.info("ProductController - remove : 들어왔음.");

		pService.remove(productIdx);

	}

	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 리스트 - 손님 판매자 공용...메뉴만 세션에 따라 다름 //
	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/list/{selIdx}", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session, @PathVariable("selIdx") int selIdx) {
		logger.info(".../list/... " + selIdx);
		return new ModelAndView("product/list", "list", pService.list(selIdx));
	}	
	
}
