package org.shinyul.mapper.mobile;

import org.shinyul.domain.MemberCommonVO;

public interface LogInMapper {
	//LOGINCHK 임시이므로 네이밍 맞춰줄것...
	public MemberCommonVO loginchk(String memberId) throws Exception;
	public int getSelIdx(int memberIdx) throws Exception;
	public int getCustomerIdx(int memberIdx) throws Exception;
}
