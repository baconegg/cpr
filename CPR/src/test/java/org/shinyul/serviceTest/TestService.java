package org.shinyul.serviceTest;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.shinyul.domain.MemberCustomerVO;
import org.shinyul.domain.MemberSellerVO;
import org.shinyul.domain.PriceVO;
import org.shinyul.domain.SpatialVO;
import org.shinyul.service.MemberService;
import org.shinyul.service.ProductService;
import org.shinyul.service.SpatialService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/**/*.xml"})
public class TestService {

	private Logger logger = Logger.getLogger(TestService.class);
	
	@Inject
	private MemberService servTest;
	@Inject
	private ProductService service;
	@Inject
	private SpatialService test;
//	@Inject
//	private PriceService pService;
	
	@Test
	public void testRegistCustomer() throws Exception{
		
		logger.info("testMem start!! : " + servTest );
		
		//customer
		MemberCustomerVO vo = new MemberCustomerVO();
		vo.setMemberId("TEST3");
		vo.setMemberPw("발급1234");
		vo.setMemberTel("01011112222");
		vo.setMemberName("null입니다");
		//vo.setUserAddress("위도 경도로 찍어야 되는거긴 한데...");

		servTest.registCustomer(vo);
		
		logger.debug("testRegistCustomer end !! ");			
	
	}
	
	@Test
	public void testRegistSelller() throws Exception{
				
		//customer
		MemberSellerVO vo = new MemberSellerVO();
		//common
		//vo.setMarIdx(1);
		vo.setMemberId("ggggg2");
		vo.setMemberPw("1357");
		vo.setMemberTel("01011112222");
		vo.setMemberName("태구형");
		
	/*	vo.setMember_LAT("32.2342342");		//위도
		vo.setMember_LNG("122.2242342");	//경도
*/		//seller
		/*2 청과		3 수산		4 건어물		5 식품		6 정육		7 슈퍼		8 기타*/
		vo.setSelStore("근수근수상회");
		vo.setSelType(2);
		vo.setSelAddress("근수근수시 근수근수동 근수근수번지");
		vo.setSelStoreNo("B-58호");
		vo.setSelLike(70);
		vo.setSelInfo(" ");
		vo.setSelImgOri("Chrysanthemum.jpg");
		vo.setSelImgUUID("111d324e-ec0f-42fe-be49-70b570924b32");		
						
		servTest.registSeller(vo);			
	
	}
	
	@Test
	public void testProductService(){
		
		int productIDX = 142;
		
		service.view(productIDX);
		
	}
			
	@Test
	public void testMap(){
		
//		logger.debug("testMap start !! ");	
//		SpatialVO vo = new SpatialVO();
//		vo.setDistance("'DISTANCE=0.5 UNIT=KM'");
//		vo.setMemberIdx("18");
//		logger.debug("testMap end !! " +  test.calDistance(vo));
	}
	
	@Test
	public void testSeller(){
		int selIdx = 3;
		servTest.viewSeller(selIdx);
	}
	
	@Test
	public void testLoad(){
		PriceVO vo = new PriceVO();
		vo.setCurLng("126.8956691");
		vo.setCurLat("37.470470");
//		pService.loadPriceData(vo);
	}
	
}
