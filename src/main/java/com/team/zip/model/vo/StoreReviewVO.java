package com.team.zip.model.vo;

import java.sql.Timestamp;

public class StoreReviewVO {
	private String rewNo;
	private String memberNo;
	private int prodNo;
	private String rewImg;
	private String rewTitle;
	private String rewContent;
	private String rewGrade;
	private Timestamp regDate;
	private String memberNickname;
	private String memberImage;
	private String startNo;
	private String endNo;
	private String currentPage;
	private String reviewCnt;
	
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
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
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
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
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
	public String getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(String reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
}
