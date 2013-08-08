package org.shinyul.service;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.domain.MarketVO;
import org.shinyul.domain.SuperstoreVO;
import org.shinyul.mapper.SchedulerMapper;
import org.springframework.stereotype.Service;

@Service
public class SchedulerSevice {

	private Logger logger = Logger.getLogger(SchedulerSevice.class);
	
	@Inject
	private SchedulerMapper mapper;
	
	//////////////////////////////////////////// 지우기 //////////////////////////////////////////////////////////////////////////////
	
	
	public String deleteAPIMarket(){
		logger.info("=============지우기 들어옴 ===============");
		String check = "성공";		
		try {			
			mapper.deleteAPIMarket();				
		} catch (Exception e) {
			check = "실패";		
		}		
		return check;	
	}	
	
	public String deleteAPISuperstore(){
		String check = "성공";			
		try {				
			mapper.deleteAPISuperstore();				
		} catch (Exception e) {
			check = "실패";			
		}		
		return check;
	}
	
	
	//////////////////////////////////////////// 쓰기 //////////////////////////////////////////////////////////////////////////////
	public String registerAPIMarket(MarketVO vo){		
		String check = "성공";
		try {		
			mapper.createAPIMarket(vo);			
		} catch (Exception e) {
			check = "실패";		
		}		
		return check;		
	}
	
	public String registerAPISuperstore(SuperstoreVO vo){
		String check = "성공";			
		try {			
			mapper.createAPISuperstore(vo);			
		} catch (Exception e) {
			check = "실패";			
		}		
		return check;
	}
}
