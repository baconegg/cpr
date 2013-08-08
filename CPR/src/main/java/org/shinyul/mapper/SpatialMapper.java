package org.shinyul.mapper;

import java.util.List;
import org.shinyul.domain.PriceVO;
import org.shinyul.domain.SpatialVO;
import org.springframework.stereotype.Repository;

@Repository
public interface SpatialMapper {
	public List<SpatialVO> popMarket(SpatialVO vo) throws Exception;
	public SpatialVO getMarketCoord(SpatialVO vo) throws Exception;
	public List<SpatialVO> loadShopSlideData(SpatialVO vo) throws Exception;
	public List<SpatialVO> loadSellerSlideData(SpatialVO vo) throws Exception;
	public List<SpatialVO> loadProductSlideData(int selIdx) throws Exception;
	public List<SpatialVO> shopInfo(int marIdx) throws Exception;
	public List<SpatialVO> distanceMap(SpatialVO vo) throws Exception;
	public SpatialVO isNearShop(SpatialVO vo) throws Exception;
	public List<SpatialVO> nearestMarket(SpatialVO vo) throws Exception;
	public List<PriceVO> popSuperstore(PriceVO vo)throws Exception;
	public List<PriceVO> loadPriceData(PriceVO vo)throws Exception;
}
