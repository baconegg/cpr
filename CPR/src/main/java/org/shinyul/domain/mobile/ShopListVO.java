package org.shinyul.domain.mobile;

import org.shinyul.domain.ProductListVO;

public class ShopListVO extends ProductListVO {

	//mobile용 
	private String mobileImage;
	
	public String getMobileImage() {
		return mobileImage;
	}
	public void setMobileImage(String mobileImage) {
		this.mobileImage = mobileImage;
	}
	
	@Override
	public String toString() {
		return "MoblieListVO [mobileImage=" + mobileImage + "]";
	}
}
