package org.shinyul.domain;

public class MemberCustomerVO extends MemberCommonVO {
	
	private int customerIdx;
    private String customerAddress;
    
    
	public int getCustomerIdx() {
		return customerIdx;
	}
	public void setCustomerIdx(int customerIdx) {
		this.customerIdx = customerIdx;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	@Override
	public String toString() {
		return "MemberCustomerVO [customerIdx=" + customerIdx
				+ ", customerAddress=" + customerAddress + ", getMemberIdx()="
				+ getMemberIdx() + ", getMemberId()=" + getMemberId()
				+ ", getMemberPw()=" + getMemberPw() + ", getMemberTel()="
				+ getMemberTel() + ", getMemberLev()=" + getMemberLev()
				+ ", getMemberReg()=" + getMemberReg() + ", getMemberName()="
				+ getMemberName() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}
}
