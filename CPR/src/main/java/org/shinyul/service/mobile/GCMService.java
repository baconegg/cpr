package org.shinyul.service.mobile;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.domain.mobile.GCMVO;
import org.shinyul.mapper.mobile.GCMMapper;
import org.springframework.stereotype.Service;

@Service
public class GCMService {

	private Logger logger = Logger.getLogger(GCMService.class);
	
	@Inject
	private GCMMapper gcmService;
	
	public String control(String cmd, GCMVO vo){
		String check = null;
		switch(cmd){
		case "addRegId":
			check = updateRegId(vo);
			break;
		case "alertReserve":
			check = selectByRegId(vo);
			break;
		}
		
		return check;
	}
	
	
	private String updateRegId(GCMVO vo){
		String check = null;
		try {
			gcmService.updateRegId(vo);
			check = "200";
		} catch (Exception e) {
			logger.error("updateRegId error~~~!!");
			check = "100";
		}
		return check;
	}	
	
	private String selectByRegId(GCMVO vo){
		String check = null;
		try {
			check = gcmService.selectByRegId(vo);
		} catch (Exception e) {
			logger.error("updateRegId error~~~!!");
			check = "100";
		}
		return check;
	}	
}
