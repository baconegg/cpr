package org.shinyul.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.domain.Criteria;
import org.shinyul.domain.ReserveVO;
import org.shinyul.mapper.ReserveMapper;
import org.springframework.stereotype.Service;


@Service
public class ReserveService {
	
	private Logger logger = Logger.getLogger(ReserveService.class);

	@Inject
	private ReserveMapper reserve;
	
	public int register(ReserveVO vo){
		
		logger.info("ReserveService - register : " + vo);
		int data;
		
		try {
			reserve.create(vo);
			data = 1;
		} catch (Exception e) {
			logger.error("ReserveService - register Error~!!!!");
			data = 0;
			e.printStackTrace();
		}//end try~ catch		
		return data;
	}
	
	public ReserveVO view(int reserveIdx) {
		ReserveVO vo = new ReserveVO();
		logger.info("ReserveService - view : " + reserveIdx);
		try {
			vo = reserve.view(reserveIdx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	public int confirm(int reserveIdx) {
		int check = 1;
		logger.info("ReserveService - Confirm : " + reserveIdx);
		try {
			reserve.confirm(reserveIdx);
		} catch (Exception e) {
			check = 2;
			e.printStackTrace();
		}
		return check;
	}

	public int cancel(int reserveIdx) {
		int check = 1;
		logger.info("ReserveService - Cancel : " + reserveIdx);
		try {
			reserve.delete(reserveIdx);
		} catch (Exception e) {
			check = 2;
			e.printStackTrace();
		}
		return check;
	}
	
	public List<ReserveVO> list(ReserveVO vo, Criteria cri){
		
		List<ReserveVO> list = null;
		logger.info("ReserveService - list");
		System.out.println("Service listlistlistlistlistlistlistlistlistlistlistlistlist");
		System.out.println(cri.toString());
		
		try {
			list = reserve.list(vo, cri);
		} catch (Exception e) {
			logger.info("ReserveService - list : error");
			e.printStackTrace();
		}
		return list;
	}
	
	public List<ReserveVO> widgetList(ReserveVO vo, Criteria cri){
		
		List<ReserveVO> list = null;
		logger.info("ReserveService - widgetList");
		
		System.out.println(cri.toString());
		
		try {
			list = reserve.widgetList(vo, cri);
		} catch (Exception e) {
			logger.info("ReserveService - widgetList : error");
			e.printStackTrace();
		}
		return list;
	}
	
}
