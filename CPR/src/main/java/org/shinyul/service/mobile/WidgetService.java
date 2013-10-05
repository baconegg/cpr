package org.shinyul.service.mobile;

import java.util.List;
import javax.inject.Inject;
import org.apache.log4j.Logger;
import org.shinyul.domain.Criteria;
import org.shinyul.domain.ReserveVO;
import org.shinyul.mapper.mobile.WidgetMapper;
import org.springframework.stereotype.Service;


@Service
public class WidgetService {
	
	private Logger logger = Logger.getLogger(WidgetService.class);

	@Inject
	private WidgetMapper widget;
	
	public List<ReserveVO> widgetList(ReserveVO vo, Criteria cri){
		
		List<ReserveVO> list = null;
		logger.info("ReserveService - widgetList");
		
		System.out.println(cri.toString());
		
		try {
			list = widget.widgetList(vo, cri);
		} catch (Exception e) {
			logger.info("ReserveService - widgetList : error");
			e.printStackTrace();
		}
		return list;
	}
	
}
