package org.shinyul.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.log4j.Logger;
import org.shinyul.domain.PriceVO;
import org.shinyul.domain.SpatialVO;
import org.shinyul.mapper.SpatialMapper;
import org.shinyul.util.Constant;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SpatialService {

	private Logger logger = Logger.getLogger(SpatialService.class);
	
	@Inject
	SpatialMapper mapper;	
	
	public List<SpatialVO> popMarket(SpatialVO vo){
		List<SpatialVO> list = null;
		try {
			logger.info("service popMarket vo check : " + vo);			
			list =mapper.popMarket(vo);
		} catch (Exception e) {
			logger.error("Service ------- popMarket Error~!!!!");
		}
		return list;
	}	
	
	public List<SpatialVO> shopInfo(int marIdx){
		List<SpatialVO> list = null;
		try {
			list = mapper.shopInfo(marIdx);
		} catch (Exception e) {
			logger.error("Service ------- shopInfo Error~!!!!");
		}
		return list;
	}
	
	public List<SpatialVO> distanceMap(SpatialVO vo){
		List<SpatialVO> list = null;
		try {
			list = mapper.distanceMap(vo);
		} catch (Exception e) {
			logger.error("Service ------- distanceMap Error~!!!!");
		}
		return list;
	}	
	
	public SpatialVO getMarketCoord(SpatialVO vo){
		SpatialVO svo = null;
		try {
			svo = mapper.getMarketCoord(vo);
		} catch (Exception e) {
			logger.error("Service ------- getMarketCoord Error~!!!!");
		}
		return svo;
	}
	
	@Transactional
	public Map<String, List<SpatialVO>> loadShopSlideData(SpatialVO vo){
		Map<String, List<SpatialVO>> map = new HashMap<String, List<SpatialVO>>();
		try {
			//list = mapper.loadShopSlideData(vo);
			List<SpatialVO> sellerData = mapper.loadSellerSlideData(vo);
			List<SpatialVO> productData = mapper.loadProductSlideData(sellerData.get(0).getSelIdx());
			map.put(Constant.Session.SELLER_DATA, sellerData);
			map.put(Constant.Session.PRODUCT_DATA, productData);			
		} catch (Exception e) {
			logger.error("Service ------- loadShopSlideData Error~!!!!");
		}
		return map;
	}
	
	public SpatialVO isNearShop(SpatialVO vo){
		SpatialVO svo = null;
		try {
			svo = mapper.isNearShop(vo);
		} catch (Exception e) {
			logger.error("Service ------- isNearShop Error~!!!!");
		}
		return svo;
	}
	
	public List<SpatialVO> nearestMarket(SpatialVO vo){
		List<SpatialVO> list = null;
		try {
			list = mapper.nearestMarket(vo);
		} catch (Exception e) {
			logger.error("Service ------- nearestMarket Error~!!!!");
		}
		return list;
	}
	
	public List<PriceVO> popSuperstore(PriceVO vo){
		try {
			return mapper.popSuperstore(vo);
		} catch (Exception e) {
			logger.error("Service ------- popSuperstore Error~!!!!");
		}
		return null;
	}
	public List<PriceVO> loadPriceData(PriceVO vo){
		try {
			return mapper.loadPriceData(vo);
		} catch (Exception e) {
			logger.error("Service ------- loadPriceData Error~!!!!");
		}
		return null;
	}
	
}
