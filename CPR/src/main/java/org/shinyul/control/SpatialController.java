package org.shinyul.control;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.shinyul.domain.PriceVO;
import org.shinyul.domain.SpatialVO;
import org.shinyul.service.SpatialService;
import org.shinyul.util.GetAddressUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 * @param <MultipartServletRequest>
 */
@Controller
@RequestMapping("/")
public class SpatialController {
	
	private static final Logger logger = Logger.getLogger(SpatialController.class);
		
	@Inject
	private SpatialService service;	
		
	///////////////////////////////////////////////////////////////////////////////////
	// GET *******************************
	//////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {		
		logger.info("index popMap!!! ");				
		return new ModelAndView("spatial/index");
	}
	
//	// index -> shopInfo 이동
//	@RequestMapping(value = "/shopInfo", method = RequestMethod.GET)
//	public ModelAndView moveToShopInfo(SpatialVO vo) {		
//		logger.info("shopInfo popMap!!! ");
//		logger.info(vo);
//		ModelAndView model = new ModelAndView("spatial/shopInfo"); 
//		model.addObject("marketVO", vo);				
//		return model;
//	}	
	
	@RequestMapping(value = "/mapByDistance", method = RequestMethod.GET)
	public ModelAndView mapByDistance(Model model) {		
		logger.info("mapByDistance popMap!!! ");
		return new ModelAndView("spatial/mapByDistance");	
	}
	
	@RequestMapping(value = "/price", method = RequestMethod.GET)
	public ModelAndView price() {		
		logger.info("price!!! ");		
		return new ModelAndView("spatial/price");
	}
		
	///////////////////////////////////////////////////////////////////////////////////
	// AJAX *****************************************
	//////////////////////////////////////////////////////////////////////////////////		
	
	// 시장 마커 띄우기
	@RequestMapping(value="/popMarket", method = RequestMethod.POST)
	public @ResponseBody List<SpatialVO> popMarket(SpatialVO vo){		
		logger.info("popMarket!!! " + vo);
						
		List<SpatialVO> list = service.popMarket(vo);		
		logger.info("testVO!!! " + list);				
		return list; 
	}
	
	// 상점 마커 띄우기
//	@RequestMapping(value="/popShop", method = RequestMethod.POST)
//	public @ResponseBody List<SpatialVO> popShop(SpatialVO vo){		
//		logger.info("popShop!!! " + vo);
//		
//		String dist = vo.getDistance();		
//		vo.setDistance("'DISTANCE=" + dist + " UNIT=KM'");		
//		
//		List<SpatialVO> list = service.calDistance(vo);		
//		logger.info("testVO!!! " + list);				
//		
//		return list; 
//	}
	
//	@RequestMapping(value="/popShopPrice", method = RequestMethod.POST)
//	public @ResponseBody List<SpatialVO> popShopPrice(SpatialVO vo){		
//		logger.info("popShopPrice!!! " + vo);		
//		List<SpatialVO> list = service.price(vo);			
//		logger.info("testVO!!! " + list);				
//		return list; 
//	}	
		
	// index에서 시장 클릭 -> 상점들의 marIdx 및 위치를 받아옴...
	@RequestMapping(value="/getMarketCoord", method = RequestMethod.POST)
	public @ResponseBody SpatialVO getMarketCoord(SpatialVO vo){
		logger.info("getMarketCoord...");
		logger.info(vo);
		logger.info(service.getMarketCoord(vo));	
		
		return service.getMarketCoord(vo);
	}
	
	// 상점 데이터 보기 페이지
	@RequestMapping(value = "/shopInfo", method = RequestMethod.POST)
	public @ResponseBody List<SpatialVO> shopInfo(int marIdx, HttpSession session) {		
		logger.info("shopInfo!!! " + marIdx);	
		
		//역경매를 위한 세션값 넣기
		session.setAttribute("marIdx", marIdx);
		logger.info("spatial marIdx : " +  marIdx);		
		
		return service.shopInfo(marIdx);	
	}	
		
	@RequestMapping(value = "/distanceMap", method = RequestMethod.POST)
	public @ResponseBody List<SpatialVO> distanceMap(SpatialVO vo, HttpSession session) {		
		logger.info("shopInfo!!! " + vo);	
		
		//역경매를 위한 세션값 넣기도 해야되나??

		logger.info("spatial marIdx : " +  vo);		
		
		return service.distanceMap(vo);	
	}	
		
	// 상점 데이터 로드 (+ 상인 이미지, 상품 이미지)
	@RequestMapping(value="/loadShopSlideData", method = RequestMethod.POST)
	public @ResponseBody List<SpatialVO> loadShopSlideData(SpatialVO vo){
		logger.info("loading...ShopSlideData...");
		logger.info(vo);
		//List<SpatialVO> list = service.loadShopSlideData(vo);
		Map<String, List<SpatialVO>>  map = service.loadShopSlideData(vo);
		
		List<SpatialVO> sellerData = map.get("sellerData");
		List<SpatialVO> productData = map.get("productData");
		
		for(int i = 0; i < productData.size(); i++){
			sellerData.add(productData.get(i));
		}
//		for(int i = 0; i < sellerData.size(); i++){
//			logger.info(sellerData.get(i));
//		}
		//logger.info("loaded...ShopSlideData..." + list.get(0).getSelIdx() + ", " + list.get(0).getSelStore());
		return sellerData;
	}

	//////////////////////////////////////////////////////////////////////////////////
	//위도 경도로 상세주소 얻어오는 부분											//
	//////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping(value="/getAddress", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public @ResponseBody  ResponseEntity<String> getAddress(String LNG, String LAT){
		logger.info("getAddress!!!");
		String address = GetAddressUtil.mapXmlParser(LNG, LAT);
		logger.info(address);
		
		HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
        return new ResponseEntity<String>(address, responseHeaders, HttpStatus.CREATED);	
	}
	
	
	// map by distance
	///////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/isNearShop", method = RequestMethod.POST)
	public @ResponseBody SpatialVO isNearestShop(SpatialVO vo){
		logger.info("loadIsNearShop...");
		logger.info("currentLocation...confirming : " + vo);
		SpatialVO svo = service.isNearShop(vo);
//		logger.info("loaded...nearestShopIdx : " + svo.getSelStore());
		
		logger.info("svo : " + svo);
		
		return svo;
	}
	
	@RequestMapping(value="/nearestMarket", method = RequestMethod.POST)
	public @ResponseBody List<SpatialVO> nearestMarket(SpatialVO vo){
		logger.info("loadNearestMarket...");
		logger.info("currentLocation...confirming : " + vo);
		List<SpatialVO> list = service.nearestMarket(vo);
//		logger.info("nearestMarket : " + list);
		return list;
	}
	
	/////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/popSuperstore", method = RequestMethod.POST)
	public @ResponseBody List<PriceVO> popSuperstore(PriceVO vo) {	
		logger.info("popSuperstore!!! ");		
		return service.popSuperstore(vo);
	}	
	
	@RequestMapping(value="/loadPriceData")
	public @ResponseBody List<PriceVO> loadPriceData(PriceVO vo){		
		logger.info("loadPriceData!!!");
		return service.loadPriceData(vo);
	}
}
