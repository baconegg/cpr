package org.shinyul.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.shinyul.domain.Criteria;
import org.shinyul.domain.ReserveVO;

public interface ReserveMapper {
	public void create(ReserveVO vo)throws Exception;
	public ReserveVO view(int reserveIdx)throws Exception;
	public void confirm(int reserveIdx)throws Exception;
	public void delete(int reserveIdx)throws Exception;
	public List<ReserveVO> list(@Param("vo")ReserveVO vo, @Param("cri")Criteria cri)throws Exception;
}
