package org.shinyul.mapper;

import org.shinyul.domain.GCMVO;
import org.springframework.stereotype.Repository;

@Repository
public interface GCMMapper {

	public void updateRegId(GCMVO vo) throws Exception;
	public String selectByRegId(GCMVO vo) throws Exception;
	
}
