package org.shinyul.control.mobile;

import java.util.List;
import javax.inject.Inject;
import org.apache.log4j.Logger;
import org.shinyul.domain.Criteria;
import org.shinyul.domain.ReserveVO;
import org.shinyul.service.mobile.WidgetService;
import org.shinyul.util.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(Constant.ControllerName.DEFALT + Constant.ControllerName.WIDGET)
public class WidgetController {
	
	private static final Logger logger = Logger.getLogger(WidgetController.class);
	
	@Inject
	WidgetService wService;
	
	// ==================widget용======================================================
	@RequestMapping(value=Constant.ControllerForm.LIST, method=RequestMethod.POST)
	public @ResponseBody List<ReserveVO> widgetlist(Criteria cri, int selIdx){
		
		logger.info("widgetlist 들어옴");
		logger.info("getPage : "+cri.getPage());
		logger.info("selIdx : "+selIdx);
		
		ReserveVO vo = new ReserveVO();
		
		vo.setMemberLev(Constant.Member.SELLER);
		vo.setSelIdx(selIdx);
		
//		logger.info(wService.widgetList(vo, cri).size());
//		logger.info(wService.widgetList(vo, cri));
		
		return wService.widgetList(vo, cri);
	}
	// =====================================================================================

}
