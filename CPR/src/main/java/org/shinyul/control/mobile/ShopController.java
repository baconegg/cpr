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
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public @ResponseBody void shop(int selIdx){
		logger.info("mobile shop : ");
		
		String folderPath = "D:\\images\\product\\thumb\\";
		List<ShopListVO> list = shop.list(selIdx);
		
		for(int i = 0; i < list.size(); i++){
			list.get(i).setMobileImage(folderPath + list.get(i).getProductImgUUID());
		}
		
	}
}
