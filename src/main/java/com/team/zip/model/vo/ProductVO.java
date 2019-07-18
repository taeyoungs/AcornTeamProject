package com.team.zip.model.vo;

public class ProductVO {
	private String prodNo;
	private String prodTitle;
	private String prodPrice;
	private String prodImage;
	private String discountRate;
	private String categoryNo;
	private String prodSeller;
	private String categoryNm;
	private int prodHits;
	
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	public String getProdTitle() {
		return prodTitle;
	}
	public void setProdTitle(String prodTitle) {
		this.prodTitle = prodTitle;
	}
	public String getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(String prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getProdImage() {
		return prodImage;
	}
	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}
	public String getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(String discountRate) {
		this.discountRate = discountRate;
	}
	public String getProdSeller() {
		return prodSeller;
	}
	public void setProdSeller(String prodSeller) {
		this.prodSeller = prodSeller;
	}
	public String getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryNm() {
		return categoryNm;
	}
	public void setCategoryNm(String categoryNm) {
		this.categoryNm = categoryNm;
	}
	public int getProdHits() {
		return prodHits;
	}
	public void setProdHits(int prodHits) {
		this.prodHits = prodHits;
	}
	
}
