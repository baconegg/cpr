package org.shinyul.domain;

public class RequestItemVO {

	int requestItemIdx;
	String requestItem;
	
	public int getRequestItemIdx() {
		return requestItemIdx;
	}
	public void setRequestItemIdx(int requestItemIdx) {
		this.requestItemIdx = requestItemIdx;
	}
	public String getRequestItem() {
		return requestItem;
	}
	public void setRequestItem(String requestItem) {
		this.requestItem = requestItem;
	}
	@Override
	public String toString() {
		return "RequestItem [requestItemIdx=" + requestItemIdx
				+ ", requestItem=" + requestItem + "]";
	}
	
	
	
}
