package org.shinyul.mapper;

import java.util.List;

import org.shinyul.domain.Criteria;
import org.shinyul.domain.MarketVO;
import org.shinyul.domain.ProductVO;
import org.shinyul.domain.RequestItemVO;
import org.shinyul.domain.RequestReplyVO;
import org.shinyul.domain.RequestVO;

public interface RequestMapper {
	
	public List<MarketVO> marketList()throws Exception ;
	public List<MarketVO> guList()throws Exception ;
	public List<RequestItemVO> requestItem()throws Exception ;
	public List<ProductVO> productList(String gunamemarid)throws Exception ;
	
	public void create(RequestVO vo)throws Exception;
	public RequestVO read(int idx)throws Exception ;
	public void delete(int idx)throws Exception;
	public void update(RequestVO vo)throws Exception;
	
	public void replyCreate(RequestReplyVO vo)throws Exception;
	public void replyDelete(int idx)throws Exception;
	public void replyUpdate(RequestReplyVO vo )throws Exception;
	public void replyTenderUpdate(RequestReplyVO vo )throws Exception;
	public void reqestTenderUpdate(RequestReplyVO vo )throws Exception;
	
	
	public List<RequestReplyVO> replyRead(int idx)throws Exception ;
	public void ReplyCntUP(int idx)throws Exception;
	public void ReplyCntDOWN(int idx)throws Exception;
	

	public String searchMarketName(int marIdx)throws Exception;
	public List<RequestVO> customerList(Criteria cri)throws Exception;
	public List<RequestVO> sellerList(Criteria cri)throws Exception;

}
