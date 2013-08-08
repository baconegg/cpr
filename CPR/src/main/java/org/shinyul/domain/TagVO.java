package org.shinyul.domain;

public class TagVO {

	private int tagIdx;
	private String tagName;
	
	public int getTagIdx() {
		return tagIdx;
	}
	public void setTagIdx(int tagIdx) {
		this.tagIdx = tagIdx;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	@Override
	public String toString() {
		return "TagVO [tagIdx=" + tagIdx + ", tagName=" + tagName + "]";
	}
	
	
}
