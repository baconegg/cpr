package org.shinyul.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class MemberCommonVO{
	
	protected int memberIdx;	//회원 idx
	
	/*@NotNull(message="아이디를 입력하세요")
	@Size(min=6, max=12, message="아이디는 6~12자 사이로 입력해 주세요")*/
	protected String memberId;	//회원 id
	
	@NotNull(message="패스워드를 입력하세요")
	@Size(min=6, max=12, message="패스워드는 6~12자 사이로 입력해 주세요")
	protected String memberPw;	//회원 비밀번호	
	
	/*@MaskFormat("(###) ###-####")*/
	@NotNull(message="연락처를 입력하세요")
	@Size(min=11, max=11, message="자릿수가 틀렸습니다.")	
	protected String memberTel;	//회원 연락처	
	protected int memberLev; //회원등급 <- 왜 스트링이지???
	protected String memberReg; //가입일
	protected String memberName;
	
	protected String memberLAT;
	protected String memberLNG;
	
	
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public int getMemberLev() {
		return memberLev;
	}
	public void setMemberLev(int memberLev) {
		this.memberLev = memberLev;
	}
	public String getMemberReg() {
		return memberReg;
	}
	public void setMemberReg(String memberReg) {
		this.memberReg = memberReg;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}	
	public String getMemberLAT() {
		return memberLAT;
	}
	public void setMemberLAT(String memberLAT) {
		this.memberLAT = memberLAT;
	}
	public String getMemberLNG() {
		return memberLNG;
	}
	public void setMemberLNG(String memberLNG) {
		this.memberLNG = memberLNG;
	}
	@Override
	public String toString() {
		return "MemberCommonVO [memberIdx=" + memberIdx + ", memberId="
				+ memberId + ", memberPw=" + memberPw + ", memberTel="
				+ memberTel + ", memberLev=" + memberLev + ", memberReg="
				+ memberReg + ", memberName=" + memberName + ", memberLAT="
				+ memberLAT + ", memberLNG=" + memberLNG + "]";
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////
	
}
