package org.shinyul.domain;

public class RequestReplyVO {
	
	int replyIdx;
	int requestIdx;
	int selIdx;
	String replys;
	String replyFlag;
	String repplyTime;
	String selImgUUID;
	String selInfo;
	String selLike;
	String selAddress;
	String selStore;
	String guNameMarId;
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	public int getRequestIdx() {
		return requestIdx;
	}
	public void setRequestIdx(int requestIdx) {
		this.requestIdx = requestIdx;
	}
	public int getSelIdx() {
		return selIdx;
	}
	public void setSelIdx(int selIdx) {
		this.selIdx = selIdx;
	}
	public String getReplys() {
		return replys;
	}
	public void setReplys(String replys) {
		this.replys = replys;
	}
	public String getReplyFlag() {
		return replyFlag;
	}
	public void setReplyFlag(String replyFlag) {
		this.replyFlag = replyFlag;
	}
	public String getRepplyTime() {
		return repplyTime;
	}
	public void setRepplyTime(String repplyTime) {
		this.repplyTime = repplyTime;
	}
	public String getSelImgUUID() {
		return selImgUUID;
	}
	public void setSelImgUUID(String selImgUUID) {
		this.selImgUUID = selImgUUID;
	}
	public String getSelInfo() {
		return selInfo;
	}
	public void setSelInfo(String selInfo) {
		this.selInfo = selInfo;
	}
	public String getSelLike() {
		return selLike;
	}
	public void setSelLike(String selLike) {
		this.selLike = selLike;
	}
	public String getSelAddress() {
		return selAddress;
	}
	public void setSelAddress(String selAddress) {
		this.selAddress = selAddress;
	}
	public String getSelStore() {
		return selStore;
	}
	public void setSelStore(String selStore) {
		this.selStore = selStore;
	}
	public String getGuNameMarId() {
		return guNameMarId;
	}
	public void setGuNameMarId(String guNameMarId) {
		this.guNameMarId = guNameMarId;
	}
	@Override
	public String toString() {
		return "RequestReplyVO [replyIdx=" + replyIdx + ", requestIdx="
				+ requestIdx + ", selIdx=" + selIdx + ", replys=" + replys
				+ ", replyFlag=" + replyFlag + ", repplyTime=" + repplyTime
				+ ", selImgUUID=" + selImgUUID + ", selInfo=" + selInfo
				+ ", selLike=" + selLike + ", selAddress=" + selAddress
				+ ", selStore=" + selStore + ", guNameMarId=" + guNameMarId
				+ "]";
	}
	
	
	
		
}