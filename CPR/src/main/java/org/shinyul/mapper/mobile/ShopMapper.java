package org.shinyul.mapper.mobile;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.shinyul.domain.mobile.ShopListVO;
import org.shinyul.util.Constant;

public interface ShopMapper {
	public List<ShopListVO> list(@Param(Constant.Session.SEL_IDX)int selIdx, @Param(Constant.Session.PAGE)int page)throws Exception;
}
