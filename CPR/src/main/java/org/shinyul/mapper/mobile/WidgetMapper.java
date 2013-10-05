package org.shinyul.mapper.mobile;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.shinyul.domain.Criteria;
import org.shinyul.domain.ReserveVO;

public interface WidgetMapper {
	public List<ReserveVO> widgetList(@Param("vo")ReserveVO vo, @Param("cri")Criteria cri)throws Exception;
}
