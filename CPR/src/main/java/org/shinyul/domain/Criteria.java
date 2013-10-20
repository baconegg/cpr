package org.shinyul.domain;

public class Criteria {

	private Integer page;
	private String type;
	private String keyword;	
	private String gunameMarid;
	
	public Criteria() {
		super();		
	}

	public Criteria(Integer page, String type, String keyword) {
		
		if(page == null){
			page = 1;
		}
		
		this.page = page;
		this.type = type;
		this.keyword = keyword;
		
	}
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getGunameMarid() {
		return gunameMarid;
	}

	public void setGunameMarid(String gunameMarid) {
		this.gunameMarid = gunameMarid;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", type=" + type + ", keyword="
				+ keyword + ", gunameMarid=" + gunameMarid + "]";
	}

	
}
