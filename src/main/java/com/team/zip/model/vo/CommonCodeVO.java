package com.team.zip.model.vo;

import java.io.Serializable;

public class CommonCodeVO implements Serializable{
	private int codeSeqNo;
	private String codeVal;
	private String codeNm;
	private String minPrice;
	private String maxPrice;
	private String sorting;
	private String startNo;
	private String endNo;
	private String currentPage;
	
	public int getCodeSeqNo() {
		return codeSeqNo;
	}
	public void setCodeSeqNo(int codeSeqNo) {
		this.codeSeqNo = codeSeqNo;
	}
	public String getCodeVal() {
		return codeVal;
	}
	public void setCodeVal(String codeVal) {
		this.codeVal = codeVal;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}
	public String getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}
	public String getSorting() {
		return sorting;
	}
	public void setSorting(String sorting) {
		this.sorting = sorting;
	}
	public String getStartNo() {
		return startNo;
	}
	public void setStartNo(String startNo) {
		this.startNo = startNo;
	}
	public String getEndNo() {
		return endNo;
	}
	public void setEndNo(String endNo) {
		this.endNo = endNo;
	}
	public String getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
}
