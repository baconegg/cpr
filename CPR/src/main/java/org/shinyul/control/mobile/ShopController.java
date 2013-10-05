package org.shinyul.control.mobile;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.domain.mobile.ShopListVO;
import org.shinyul.service.mobile.ShopService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/Shop")
public class ShopController {
	
	private static final Logger logger = Logger.getLogger(LogInController.class);
	
	@Inject
	private ShopService shop;
	
	///////////////////////////////////////////////////////////////////////////////////
	//shop																			          //
	//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody List<ShopListVO> shop(int selIdx, int page){
		logger.info("mobile shop~ selIdx: " + selIdx + " page : " + page);
		
		String folderPath = "http://14.63.226.20/cpr/resources/view.jsp?file=D:/images/product/thumb/";
		List<ShopListVO> list = shop.list(selIdx, page);
		
		logger.info("mobile shop~ list size : " + list.size());
		
		for(int i = 0; i < list.size(); i++){
			list.get(i).setMobileImage(folderPath + list.get(i).getProductImgUUID());
		}

		logger.info("mobile shop~ list toString : " + list.toString());
		
		return list;		
	}
}
