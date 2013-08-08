package org.shinyul.domain;

public class MarketVO {
	
	private int marIdx;
	private int mCode;
	private String guname;
	private String marId;
	private String mAddr;
	private String mTel;
	private String lat;
	private String lng;
	private String guNameMarId;
	
	public int getMarIdx() {
		return marIdx;
	}
	public void setMarIdx(int marIdx) {
		this.marIdx = marIdx;
	}
	public int getmCode() {
		return mCode;
	}
	public void setmCode(int mCode) {
		this.mCode = mCode;
	}
	public String getGuname() {
		return guname;
	}
	public void setGuname(String guname) {
		this.guname = guname;
	}
	public String getMarId() {
		return marId;
	}
	public void setMarId(String marId) {
		this.marId = marId;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getGuNameMarId() {
		return guNameMarId;
	}
	public void setGuNameMarId(String guNameMarId) {
		this.guNameMarId = guNameMarId;
	}
	@Override
	public String toString() {
		return "MarketVO [marIdx=" + marIdx + ", mCode=" + mCode + ", guname="
				+ guname + ", marId=" + marId + ", mAddr=" + mAddr + ", mTel="
				+ mTel + ", lat=" + lat + ", lng=" + lng + ", guNameMarId="
				+ guNameMarId + "]";
	}		
}
