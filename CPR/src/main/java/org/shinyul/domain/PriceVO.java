package org.shinyul.domain;

public class PriceVO {
	
	//일단 토탈 카운트랑 쿼리는 쓸지 안쓸지 잘 모르겠지만 만들어 둘께...
	protected int totalCount;	
	protected int mSeq;
	protected String mName;	
	protected String aName;
	protected String aUnit;
	protected String aPrice;	
	protected String addCol;
	protected String pDate;
	/////////////////////////////////////////////////////////////////
	protected String targetLat;
	protected String targetLng;
	protected String curLat;
	protected String curLng;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getaUnit() {
		return aUnit;
	}
	public void setaUnit(String aUnit) {
		this.aUnit = aUnit;
	}
	public String getaPrice() {
		return aPrice;
	}
	public void setaPrice(String aPrice) {
		this.aPrice = aPrice;
	}
	public String getAddCol() {
		return addCol;
	}
	public void setAddCol(String addCol) {
		this.addCol = addCol;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
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
	@Override
	public String toString() {
		return "PriceVO [totalCount=" + totalCount + ", mSeq=" + mSeq
				+ ", mName=" + mName + ", aName=" + aName + ", aUnit=" + aUnit
				+ ", aPrice=" + aPrice + ", addCol=" + addCol + ", pDate="
				+ pDate + ", targetLat=" + targetLat + ", targetLng="
				+ targetLng + ", curLat=" + curLat + ", curLng=" + curLng + "]";
	}
	
}
