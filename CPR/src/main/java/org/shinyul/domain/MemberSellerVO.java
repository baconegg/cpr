package org.shinyul.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberSellerVO extends MemberCommonVO {
	
	private int selIdx;	//고유번호
	
	@NotNull(message="시장명을 선택하세요")
	@NotEmpty(message="시장명을 선택하세요")
	private String guNameMarId;   //시장 id
	
	@NotNull(message="업종번호를 선택하세요")
	@NotEmpty(message="업종번호를 선택하세요")
	private int selType;  //업종번호
	
	@NotNull(message="상점명을 입력하세요")
	@NotEmpty(message="상점명을 입력하세요")
	@Size(min=1, max=50, message="상점명은 1~50자 사이로 입력해 주세요")
	private String selStore; //상점명
	
	private String marIdx;
	
	@NotNull(message="상세주소를 입력하세요")
	@NotEmpty(message="상세주소를 입력하세요")
	@Size(min=3, max=200, message="상세주소는 3~200자 사이로 입력해 주세요")
	private String selAddress;  //상점 상세주소
	
	@NotNull(message="상점번호를 입력하세요")
	@NotEmpty(message="상점번호를 입력하세요")
	@Size(min=1, max=50, message="상점번호는 1~50자 사이로 입력해 주세요")
	private String selStoreNo;  //상점번호	
	
	@Size(min=0, max=200, message="소개는 200자 내로 입력해 주세요")
	private String selInfo; //상점소개
	
	private int selLike;  //평가
	
	private String workType;//업종
	
	//tbl_seller_img
	private String selImgOri;	//이미지 원본명
	private String selImgUUID; //이미지 UUID
	
	//업데이트에 필요해서 만드는 mar_id,m_code!!!
	private String marId;
	private String mCode;
	
	//상세주소시 가게 위치를 위한 위도 경도
	private String selLat;
	private String selLng;
	
	
	public int getSelIdx() {
		return selIdx;
	}
	public void setSelIdx(int selIdx) {
		this.selIdx = selIdx;
	}
	public String getGuNameMarId() {
		return guNameMarId;
	}
	public void setGuNameMarId(String guNameMarId) {
		this.guNameMarId = guNameMarId;
	}
	public int getSelType() {
		return selType;
	}
	public void setSelType(int selType) {
		this.selType = selType;
	}
	public String getSelStore() {
		return selStore;
	}
	public void setSelStore(String selStore) {
		this.selStore = selStore;
	}
	public String getMarIdx() {
		return marIdx;
	}
	public void setMarIdx(String marIdx) {
		this.marIdx = marIdx;
	}
	public String getSelAddress() {
		return selAddress;
	}
	public void setSelAddress(String selAddress) {
		this.selAddress = selAddress;
	}
	public String getSelStoreNo() {
		return selStoreNo;
	}
	public void setSelStoreNo(String selStoreNo) {
		this.selStoreNo = selStoreNo;
	}
	public String getSelInfo() {
		return selInfo;
	}
	public void setSelInfo(String selInfo) {
		this.selInfo = selInfo;
	}
	public int getSelLike() {
		return selLike;
	}
	public void setSelLike(int selLike) {
		this.selLike = selLike;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getSelImgOri() {
		return selImgOri;
	}
	public void setSelImgOri(String selImgOri) {
		this.selImgOri = selImgOri;
	}
	public String getSelImgUUID() {
		return selImgUUID;
	}
	public void setSelImgUUID(String selImgUUID) {
		this.selImgUUID = selImgUUID;
	}
	public String getMarId() {
		return marId;
	}
	public void setMarId(String marId) {
		this.marId = marId;
	}
	public String getmCode() {
		return mCode;
	}
	public void setmCode(String mCode) {
		this.mCode = mCode;
	}
	public String getSelLat() {
		return selLat;
	}
	public void setSelLat(String selLat) {
		this.selLat = selLat;
	}
	public String getSelLng() {
		return selLng;
	}
	public void setSelLng(String selLng) {
		this.selLng = selLng;
	}
	
	@Override
	public String toString() {
		return "MemberSellerVO [selIdx=" + selIdx + ", guNameMarId="
				+ guNameMarId + ", selType=" + selType + ", selStore="
				+ selStore + ", marIdx=" + marIdx + ", selAddress="
				+ selAddress + ", selStoreNo=" + selStoreNo + ", selInfo="
				+ selInfo + ", selLike=" + selLike + ", workType=" + workType
				+ ", selImgOri=" + selImgOri + ", selImgUUID=" + selImgUUID
				+ ", marId=" + marId + ", mCode=" + mCode + ", selLat="
				+ selLat + ", selLng=" + selLng + ", memberIdx=" + memberIdx
				+ ", memberId=" + memberId + ", memberPw=" + memberPw
				+ ", memberTel=" + memberTel + ", memberLev=" + memberLev
				+ ", memberReg=" + memberReg + ", memberName=" + memberName
				+ ", memberLAT=" + memberLAT + ", memberLNG=" + memberLNG + "]";
	}	
}
