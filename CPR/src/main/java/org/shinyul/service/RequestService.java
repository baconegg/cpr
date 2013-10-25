package org.shinyul.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.domain.Criteria;
import org.shinyul.domain.MarketVO;
import org.shinyul.domain.ProductVO;
import org.shinyul.domain.RequestItemVO;
import org.shinyul.domain.RequestReplyVO;
import org.shinyul.domain.RequestVO;
import org.shinyul.mapper.RequestMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RequestService {
	
	private Logger logger = Logger.getLogger(RequestService.class);

	@Inject
	private RequestMapper mapper;
	
	public List<MarketVO> marketList (){
		List<MarketVO> list = new ArrayList<MarketVO>();
		try {
			
			list = mapper.marketList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List<MarketVO> guList (){
		List<MarketVO> list = new ArrayList<MarketVO>();
		try {
			
			list = mapper.guList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<RequestItemVO> requestItemList (){
		List<RequestItemVO> list = new ArrayList<RequestItemVO>();
		try {
			
			list = mapper.requestItem();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return list;
		
	}
	
	
	public int register (RequestVO vo){
		int check = 0;
		try {
			mapper.create(vo);
			check = 1;
		} catch (Exception e) {
			e.printStackTrace();
			check = 0;
		}
		
		return check;
	}
	public RequestVO view (int idx){
		RequestVO vo = new RequestVO();
		try {
			vo = mapper.read(idx);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	public List<RequestReplyVO> replyView (int idx){
		List<RequestReplyVO> list = new ArrayList<RequestReplyVO>();
		try {
			list = mapper.replyRead(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List<ProductVO> productlist (String gunamemarid){
		List<ProductVO> list = new ArrayList<ProductVO>();
		try {
			list = mapper.productList(gunamemarid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public String remove (int idx){
		String check = "1";
		try {
			mapper.delete(idx);
		} catch (Exception e) {
			check ="2";
		}
		return check;
	}
		
	public String modify (RequestVO vo){
		String check="1";
		try {
			mapper.update(vo);
		} catch (Exception e) {
			check="2";
		}
		return check;
	}
	
	@Transactional
	public String replyRegister (RequestReplyVO vo){
		String check="1";
		
			System.out.println(vo.getRequestIdx());
			try {
				mapper.ReplyCntUP(vo.getRequestIdx());
				mapper.replyCreate(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				check="2";
			}


		
		return check;
	}
	
	@Transactional
	public String replyRemove (RequestReplyVO vo){
		String check="1";
		try {
			System.out.println("들어옴 replyRemove");
			System.out.println(vo.getReplyIdx());
			System.out.println(vo.getRequestIdx());
			mapper.replyDelete(vo.getReplyIdx());
			mapper.ReplyCntDOWN(vo.getRequestIdx());
			
		} catch (Exception e) {
			check="2";
		}
		return check;
	}

	public String replyModify (RequestReplyVO vo){
		String check="1";
		
			try {
				System.out.println("들어옴 replyModify");
				System.out.println(vo.toString());
				mapper.replyUpdate(vo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				check="2";
			}
		
		return check;
	}
	
	@Transactional
	public String replyTender (RequestReplyVO vo){
		String check="1";
		
		try {
			System.out.println("들어옴 replyTender");
			System.out.println(vo.toString());
			mapper.replyTenderUpdate(vo);
			mapper.reqestTenderUpdate(vo);
			
		} catch (Exception e) {
			e.printStackTrace();
			check="2";
		}
		
		return check;
	}
	
	public String searchMarketName(int marIdx){
		
		String str = "";
		
		try {
			str = mapper.searchMarketName(marIdx);
		} catch (Exception e) {
			logger.error("RequestService - searchMarketName Error~!!!");
			e.printStackTrace();
		}
		return str;
	}
	

	
	// 1. 소비자용 서치 리스트(로그인 안한 사람 포함...)
	public List<RequestVO> customerList(Criteria cri){
		List<RequestVO> list = null;
		
			try {
				list = mapper.customerList(cri);
			} catch (Exception e) {
				
				logger.error("RequestService - customerList Error~!!!");
				e.printStackTrace();
			}
		
		return list;
	}	
	// 2. 소비자용 서치 리스트
	public List<RequestVO> sellerList(Criteria cri){
		
		List<RequestVO> list = null;
	
		try {
		
			list = mapper.sellerList(cri);
		} catch (Exception e) {
			
			logger.error("RequestService - sellerList Error~!!!");
			e.printStackTrace();
		}
	
	return list;
	}
	
}
