package org.shinyul.service;

import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import org.apache.log4j.Logger;
import org.shinyul.domain.ProductListVO;
import org.shinyul.domain.ProductVO;
import org.shinyul.domain.TagVO;
import org.shinyul.mapper.ProductMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductService {

	private Logger logger = Logger.getLogger(ProductService.class);

	@Inject
	private ProductMapper mapper;

	////////////////////////////////////////////////////////////////////////
	// 뷰
	public ProductVO view(int productIDX) {

		logger.info("ProductService - view : " + productIDX);

		ProductVO vo = null;

		try {
			vo = mapper.read(productIDX);
		} catch (Exception e) {
			logger.error("ProductService - view Error~!!!");
		}
		return vo;
	}

	////////////////////////////////////////////////////////////////////////
	// list
	public List<ProductListVO> list(int shop) {
		try {
			return mapper.list(shop);
		} catch (Exception e) {
			logger.info("ProductService === List Error!!!");
		}
		return null;
	}
	 
	///////////////////////////////////////////////////
	// 상품등록
	public int register(ProductVO vo) {
		int check = 1;
		try {
			mapper.create(vo);
		} catch (Exception e) {			
			logger.info("ProductService === register Error!!!");
			check = 2;
		}
		return check;
	}
	
	///////////////////////////////////////////////////
	// 상품수정  트랜잭션 처리
	@Transactional
	public int modify(ProductVO vo) {
		int check = 1;
		try {		
			mapper.updateProduct(vo);
			mapper.updateProductImg(vo);		
		} catch (Exception e) {			
			logger.info("ProductService === modify Error!!!");
			check = 2;
		}
		return check;	
	}
	
	///////////////////////////////////////////////////
	// tag정보 읽어오기	
	public List<TagVO> selectTag() {
	
		List<TagVO> list =  new ArrayList<TagVO>();
		
		try {
			list = mapper.selectTag();
			logger.info(list);
		} catch (Exception e) {
			logger.info("ProductService === selectTag Error!!!");
		}
	
		return list;
	}
	
	///////////////////////////////////////////////////
	//상품 삭제 
	public void remove(int productIdx){
	
		try {
			mapper.deleteProduct(productIdx);		
		} catch (Exception e) {
			logger.info("ProductService === remove Error!!!");
		}
	
	}

	///////////////////////////////////////////////////
	//대표상품 미리보기
	public List<ProductVO> preList(int selIdx){
	
		List<ProductVO> preList = null;
		
		try {
			preList = mapper.preList(selIdx);
		} catch (Exception e) {
			logger.info("ProductService === preList Error!!!");
		}
		
		return preList;
	}
}
