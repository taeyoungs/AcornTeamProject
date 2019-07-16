package com.team.zip.model.vo;

import java.sql.Timestamp;

public class StoreReviewVO {
	private String rewNo;
	private String memberNo;
	private String prodNo;
	private String rewImg;
	private String rewTitle;
	private String rewContent;
	private String rewGrade;
	private Timestamp regDate;
	
	
	public String getRewNo() {
		return rewNo;
	}
	public void setRewNo(String rewNo) {
		this.rewNo = rewNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	public String getRewImg() {
		return rewImg;
	}
	public void setRewImg(String rewImg) {
		this.rewImg = rewImg;
	}
	public String getRewTitle() {
		return rewTitle;
	}
	public void setRewTitle(String rewTitle) {
		this.rewTitle = rewTitle;
	}
	public String getRewContent() {
		return rewContent;
	}
	public void setRewContent(String rewContent) {
		this.rewContent = rewContent;
	}
	public String getRewGrade() {
		return rewGrade;
	}
	public void setRewGrade(String rewGrade) {
		this.rewGrade = rewGrade;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	
}
