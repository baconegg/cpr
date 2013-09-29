package org.shinyul.mapper.mobile;

import java.util.List;

import org.shinyul.domain.mobile.ShopListVO;

public interface ShopMapper {
	public List<ShopListVO> list(int selIdx)throws Exception;
}
