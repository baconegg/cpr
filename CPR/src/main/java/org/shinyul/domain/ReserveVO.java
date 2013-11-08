package org.shinyul.domain;

public class ReserveVO {

	private int reserveIdx;
	private String reserveTime;
	private int productIdx;
	private String productName;
	private String productInfo;
	private int productPrice;
	private int reserveQty;
	private String reserveReceiveTime;
	private String reserveMemo;
	private int reserveFlag;
	private int customerIdx;
	private int memberIdx;
	private String memberId;
	private String memberName;
	private String memberTel;
	private int memberLev;
	private int selIdx;
	private int total;
	private int totalPrice;
	private String marId;
	private String selStore;
	private String productImgUuid;
	
		
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getReserveIdx() {
		return reserveIdx;
	}
	public void setReserveIdx(int reserveIdx) {
		this.reserveIdx = reserveIdx;
	}
	public String getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}
	public int getProductIdx() {
		return productIdx;
	}
	public void setProductIdx(int productIdx) {
		this.productIdx = productIdx;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getReserveQty() {
		return reserveQty;
	}
	public void setReserveQty(int reserveQty) {
		this.reserveQty = reserveQty;
	}
	public String getReserveReceiveTime() {
		return reserveReceiveTime;
	}
	public void setReserveReceiveTime(String reserveReceiveTime) {
		this.reserveReceiveTime = reserveReceiveTime;
	}
	public String getReserveMemo() {
		return reserveMemo;
	}
	public void setReserveMemo(String reserveMemo) {
		this.reserveMemo = reserveMemo;
	}
	public int getReserveFlag() {
		return reserveFlag;
	}
	public void setReserveFlag(int reserveFlag) {
		this.reserveFlag = reserveFlag;
	}
	public int getCustomerIdx() {
		return customerIdx;
	}
	public void setCustomerIdx(int customerIdx) {
		this.customerIdx = customerIdx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	public int getSelIdx() {
		return selIdx;
	}
	public void setSelIdx(int selIdx) {
		this.selIdx = selIdx;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getMarId() {
		return marId;
	}
	public void setMarId(String marId) {
		this.marId = marId;
	}
	public String getSelStore() {
		return selStore;
	}
	public void setSelStore(String selStore) {
		this.selStore = selStore;
	}
	public String getProductImgUuid() {
		return productImgUuid;
	}
	public void setProductImgUuid(String productImgUuid) {
		this.productImgUuid = productImgUuid;
	}
	
	@Override
	public String toString() {
		return "ReserveVO [reserveIdx=" + reserveIdx + ", reserveTime="
				+ reserveTime + ", productIdx=" + productIdx + ", productName="
				+ productName + ", productInfo=" + productInfo
				+ ", productPrice=" + productPrice + ", reserveQty="
				+ reserveQty + ", reserveReceiveTime=" + reserveReceiveTime
				+ ", reserveMemo=" + reserveMemo + ", reserveFlag="
				+ reserveFlag + ", customerIdx=" + customerIdx + ", memberIdx="
				+ memberIdx + ", memberId=" + memberId + ", memberName="
				+ memberName + ", memberTel=" + memberTel + ", memberLev="
				+ memberLev + ", selIdx=" + selIdx + ", total=" + total
				+ ", totalPrice=" + totalPrice + ", marId=" + marId
				+ ", selStore=" + selStore + ", productImgUuid="
				+ productImgUuid + "]";
	}
}
