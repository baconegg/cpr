package org.shinyul.domain;

public class SpatialVO {	
	
	private String distance;
	private String targetLat;
	private String targetLng;
	private String curLat;
    private String curLng;
    ////index/////////////////////////////////////////
    private int marIdx;
	private String marId;
    /////price//////////////////////////////////////
	private int ssIdx;
	private int mSeq;
	private String mName;
	private String ssAddr;	
	////spatial/////////////////////////////////////
	private String memberIdx;	
	private String selStore;	
	////seller image///////////////////////////////////
	private int selIdx;
	private String selImgUuid;
	////product image//////////////////////////////////
	private int productIdx;
	private String productName;
	private String productImgUuid;
	
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getTargetLat() {
		return targetLat;
	}
	public void setTargetLat(String targetLat) {
		this.targetLat = targetLat;
	}
	public String getTargetLng() {
		return targetLng;
	}
	public void setTargetLng(String targetLng) {
		this.targetLng = targetLng;
	}
	public String getCurLat() {
		return curLat;
	}
	public void setCurLat(String curLat) {
		this.curLat = curLat;
	}
	public String getCurLng() {
		return curLng;
	}
	public void setCurLng(String curLng) {
		this.curLng = curLng;
	}
	public int getMarIdx() {
		return marIdx;
	}
	public void setMarIdx(int marIdx) {
		this.marIdx = marIdx;
	}
	public String getMarId() {
		return marId;
	}
	public void setMarId(String marId) {
		this.marId = marId;
	}
	public int getSsIdx() {
		return ssIdx;
	}
	public void setSsIdx(int ssIdx) {
		this.ssIdx = ssIdx;
	}
	public int getmSeq() {
		return mSeq;
	}
	public void setmSeq(int mSeq) {
		this.mSeq = mSeq;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getSsAddr() {
		return ssAddr;
	}
	public void setSsAddr(String ssAddr) {
		this.ssAddr = ssAddr;
	}
	public String getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(String memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getSelStore() {
		return selStore;
	}
	public void setSelStore(String selStore) {
		this.selStore = selStore;
	}
	public String getSelImgUuid() {
		return selImgUuid;
	}
	public void setSelImgUuid(String selImgUuid) {
		this.selImgUuid = selImgUuid;
	}
	public int getSelIdx() {
		return selIdx;
	}
	public void setSelIdx(int selIdx) {
		this.selIdx = selIdx;
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
	public String getProductImgUuid() {
		return productImgUuid;
	}
	public void setProductImgUuid(String productImgUuid) {
		this.productImgUuid = productImgUuid;
	}
	@Override
	public String toString() {
		return "SpatialVO [distance=" + distance + ", targetLat=" + targetLat
				+ ", targetLng=" + targetLng + ", curLat=" + curLat
				+ ", curLng=" + curLng + ", marIdx=" + marIdx + ", marId="
				+ marId + ", ssIdx=" + ssIdx + ", mSeq=" + mSeq + ", mName="
				+ mName + ", ssAddr=" + ssAddr + ", memberIdx=" + memberIdx
				+ ", selStore=" + selStore + ", selIdx=" + selIdx
				+ ", selImgUuid=" + selImgUuid + ", productIdx=" + productIdx
				+ ", productName=" + productName + ", productImgUuid="
				+ productImgUuid + "]";
	}
}
