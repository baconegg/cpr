package org.shinyul.domain.mobile;

import org.shinyul.domain.MemberSellerVO;

public class GCMVO extends MemberSellerVO {
	
	private String regId;

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	@Override
	public String toString() {
		return "GCMVO [regId=" + regId + ", memberIdx=" + memberIdx
				+ ", memberTel=" + memberTel + ", getMemberIdx()=" + getMemberIdx()
				+ "]";
	}	
}
