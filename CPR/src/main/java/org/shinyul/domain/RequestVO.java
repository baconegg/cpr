package org.shinyul.domain;

public class RequestVO {
	private int idx;
	private int customerIdx;
	private String title;
	private int marketIdx;
	private String items;
	private String memo;
	private String receiveTime;
	private String time;
	private int flag;
	private String guName;
	private String marketName;
	private String gunameMarid;
	private int deleteFlag;
	private int replyCnt;
	private int total;
	private String memberId;
	private String reserveReceiveTime;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCustomerIdx() {
		return customerIdx;
	}
	public void setCustomerIdx(int customerIdx) {
		this.customerIdx = customerIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMarketIdx() {
		return marketIdx;
	}
	public void setMarketIdx(int marketIdx) {
		this.marketIdx = marketIdx;
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getReceiveTime() {
		return receiveTime;
	}
	public void setReceiveTime(String receiveTime) {
		this.receiveTime = receiveTime;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getGuName() {
		return guName;
	}
	public void setGuName(String guName) {
		this.guName = guName;
	}
	public String getMarketName() {
		return marketName;
	}
	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}
	public String getGunameMarid() {
		return gunameMarid;
	}
	public void setGunameMarid(String gunameMarid) {
		this.gunameMarid = gunameMarid;
	}
	public int getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getReserveReceiveTime() {
		return reserveReceiveTime;
	}
	public void setReserveReceiveTime(String reserveReceiveTime) {
		this.reserveReceiveTime = reserveReceiveTime;
	}
	
	@Override
	public String toString() {
		return "RequestVO [idx=" + idx + ", customerIdx=" + customerIdx
				+ ", title=" + title + ", marketIdx=" + marketIdx + ", items="
				+ items + ", memo=" + memo + ", receiveTime=" + receiveTime
				+ ", time=" + time + ", flag=" + flag + ", guName=" + guName
				+ ", marketName=" + marketName + ", gunameMarid=" + gunameMarid
				+ ", deleteFlag=" + deleteFlag + ", replyCnt=" + replyCnt
				+ ", total=" + total + ", memberId=" + memberId
				+ ", reserveReceiveTime=" + reserveReceiveTime + ", getIdx()="
				+ getIdx() + ", getCustomerIdx()=" + getCustomerIdx()
				+ ", getTitle()=" + getTitle() + ", getMarketIdx()="
				+ getMarketIdx() + ", getItems()=" + getItems()
				+ ", getMemo()=" + getMemo() + ", getReceiveTime()="
				+ getReceiveTime() + ", getTime()=" + getTime()
				+ ", getFlag()=" + getFlag() + ", getGuName()=" + getGuName()
				+ ", getMarketName()=" + getMarketName()
				+ ", getGunameMarid()=" + getGunameMarid()
				+ ", getDeleteFlag()=" + getDeleteFlag() + ", getReplyCnt()="
				+ getReplyCnt() + ", getTotal()=" + getTotal()
				+ ", getMemberId()=" + getMemberId()
				+ ", getReserveReceiveTime()=" + getReserveReceiveTime() + "]";
	}
}