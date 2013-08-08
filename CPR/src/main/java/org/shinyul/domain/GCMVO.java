package org.shinyul.domain;

public class GCMVO extends MemberSellerVO {
	
	private String regId;
	
//	public GCMVO() {
//		this("", "");
//	}
//	
//	public GCMVO(String regId, String memberTel) {
//		this.regId = regId;
//		this.memberTel = memberTel;
//	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}
	

	@Override
	public String toString() {
		return "GCMVO [regId=" + regId + ", memberIdx=" + memberIdx
				+ ", memberTel=" + memberTel + ", getSelIdx()=" + getSelIdx()
				+ "]";
	}	
}
