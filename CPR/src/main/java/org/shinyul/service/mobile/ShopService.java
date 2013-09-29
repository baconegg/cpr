package org.shinyul.service.mobile;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.shinyul.domain.mobile.ShopListVO;
import org.shinyul.mapper.mobile.ShopMapper;
import org.springframework.stereotype.Service;

@Service
public class ShopService {

	private Logger logger = Logger.getLogger(ShopMapper.class);

	@Inject
	private ShopMapper mapper;

	////////////////////////////////////////////////////////////////////////
	// 뷰

	////////////////////////////////////////////////////////////////////////
	// list
	public List<ShopListVO> list(int shop) {
		try {
			return mapper.list(shop);
		} catch (Exception e) {
			logger.info("ShopService === List Error!!!");
		}
		return null;
	}
}
