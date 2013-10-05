package org.shinyul.mapper;

import java.util.List;

import org.shinyul.domain.MarketVO;
import org.shinyul.domain.MemberCommonVO;
import org.shinyul.domain.MemberCustomerVO;
import org.shinyul.domain.MemberSellerVO;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {

	public void createCustomer(MemberCustomerVO vo) throws Exception;	
	public void createSeller(MemberSellerVO vo) throws Exception;
	/*마켓정보 읽어오기...*/
	public List<MarketVO> readSuperstoreInfo(MarketVO vo) throws Exception;
	/*판매자 정보*/
	public MemberSellerVO readSeller(int memberIdx)throws Exception;	
	//소비자 정보
	public MemberCustomerVO readCustomer(int memberIdx)throws Exception;
	
	//update(delete)시 updateCustomer랑updateSeller 능 같은걸 써도 될꺼 가트다...
	//
	//update customer
	public void updateCustomer(MemberCustomerVO vo)throws Exception;
	public void updateCustomerTwo(MemberCustomerVO vo)throws Exception;
	
	//update seller
	public void updateSeller(MemberSellerVO vo)throws Exception;
	public void updateSellerTwo(MemberSellerVO vo)throws Exception;
	public void updateSellerThree(MemberSellerVO vo)throws Exception;
	
	//deleteCustomer
	public void deleteCustomer(MemberCustomerVO vo)throws Exception;
	public void deleteCustomerTwo(MemberCustomerVO vo)throws Exception;
	
	//deleteSeller
	public void deleteSeller(MemberSellerVO vo)throws Exception;
	public void deleteSellerTwo(MemberSellerVO vo)throws Exception;
	public void deleteSellerThree(MemberSellerVO vo)throws Exception;
	
	//LOGINCHK 임시이므로 네이밍 맞춰줄것...
	public MemberCommonVO loginchk(String memberId) throws Exception;
	public int getSelIdx(int memberIdx) throws Exception;
	public int getMarIdx(int memberIdx) throws Exception;
	public int getCustomerIdx(int memberIdx) throws Exception;
}
