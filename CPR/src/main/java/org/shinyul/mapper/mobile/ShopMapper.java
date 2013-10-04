package org.shinyul.mapper.mobile;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.shinyul.domain.mobile.ShopListVO;

public interface ShopMapper {
	public List<ShopListVO> list(@Param("selIdx")int selIdx, @Param("page")int page)throws Exception;
}
