package org.shinyul.mapper.mobile;

import org.shinyul.domain.mobile.GCMVO;
import org.springframework.stereotype.Repository;

@Repository
public interface GCMMapper {

	public void updateRegId(GCMVO vo) throws Exception;
	public String selectByRegId(GCMVO vo) throws Exception;
	
}
