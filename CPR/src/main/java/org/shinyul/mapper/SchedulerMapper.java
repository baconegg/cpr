package org.shinyul.mapper;



import org.shinyul.domain.MarketVO;
import org.shinyul.domain.SuperstoreVO;
import org.springframework.stereotype.Repository;

@Repository
public interface SchedulerMapper {

	
	
	public void createAPIMarket(MarketVO vo)throws Exception;

	public void createAPISuperstore(SuperstoreVO vo)throws Exception;
	
	public void deleteAPIMarket()throws Exception;

	public void deleteAPISuperstore()throws Exception;

}
