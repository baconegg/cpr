package org.shinyul.mapper;

import java.util.List;
import org.shinyul.domain.ProductListVO;
import org.shinyul.domain.ProductVO;
import org.shinyul.domain.TagVO;

public interface ProductMapper {

	public ProductVO read(int productIdx) throws Exception;
	
	public List<ProductListVO> list(int page)throws Exception;
	
	public void create(ProductVO vo)throws Exception;
	
	//상품 수정
	public void updateProduct(ProductVO vo)throws Exception;
	//상품 이미지 수정
	public void updateProductImg(ProductVO vo)throws Exception;
	// tag정보 읽어오기
	public List<TagVO> selectTag()throws Exception;
	
	// 상품 삭제 in tbl_product
	public void deleteProduct(int productIdx)throws Exception;	 
	// 대표상품 리스트
	public List<ProductVO> preList(int selIdx)throws Exception;	
}
