package org.shinyul.domain;



public class SuperstoreVO {

	private int priceIdx;
	private int pSeq;
	private int mSeq;
	private String mName;
	private int aSeq;
	private String aName;
	private String aUnit;
	private String aPrice;
	private String pYearMonth;
	private String addCol;
	private String pDate;
	private String mTypeCode;
	private String mTypeName;
	private int mGuCode;
	private String mGuName;
	
	
	public int getPriceIdx() {
		return priceIdx;
	}
	public void setPriceIdx(int priceIdx) {
		this.priceIdx = priceIdx;
	}
	public int getpSeq() {
		return pSeq;
	}
	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
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
	public int getaSeq() {
		return aSeq;
	}
	public void setaSeq(int aSeq) {
		this.aSeq = aSeq;
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
	public String getpYearMonth() {
		return pYearMonth;
	}
	public void setpYearMonth(String pYearMonth) {
		this.pYearMonth = pYearMonth;
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
	public String getmTypeCode() {
		return mTypeCode;
	}
	public void setmTypeCode(String mTypeCode) {
		this.mTypeCode = mTypeCode;
	}
	public String getmTypeName() {
		return mTypeName;
	}
	public void setmTypeName(String mTypeName) {
		this.mTypeName = mTypeName;
	}
	public int getmGuCode() {
		return mGuCode;
	}
	public void setmGuCode(int mGuCode) {
		this.mGuCode = mGuCode;
	}
	public String getmGuName() {
		return mGuName;
	}
	public void setmGuName(String mGuName) {
		this.mGuName = mGuName;
	}
	@Override
	public String toString() {
		return "SuperstoreVO [priceIdx=" + priceIdx + ", pSeq=" + pSeq
				+ ", mSeq=" + mSeq + ", mName=" + mName + ", aSeq=" + aSeq
				+ ", aName=" + aName + ", aUnit=" + aUnit + ", aPrice="
				+ aPrice + ", pYearMonth=" + pYearMonth + ", addCol=" + addCol
				+ ", pDate=" + pDate + ", mTypeCode=" + mTypeCode
				+ ", mTypeName=" + mTypeName + ", mGuCode=" + mGuCode
				+ ", mGuName=" + mGuName + "]";
	}
}
