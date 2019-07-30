package com.team.zip.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int member_no;
	private String member_id;
	private String member_domain;
	private String member_pw;
	private String member_nickname;
	private String member_image;
	private String member_comment;
	private int member_sex;
	private String member_birth;
	private MultipartFile profile_image_uploader;
	private String member_birth_1i;
	private String member_birth_2i;
	private String member_birth_3i;
	private String review_like;
	private String zip_like;
	private String zip_reply_like;
	
	public String getReview_like() {
		return review_like;
	}
	public void setReview_like(String review_like) {
		this.review_like = review_like;
	}
	public String getZip_reply_like() {
		return zip_reply_like;
	}
	public void setZip_reply_like(String zip_reply_like) {
		this.zip_reply_like = zip_reply_like;
	}
	public String getZip_like() {
		return zip_like;
	}
	public void setZip_like(String zip_like) {
		this.zip_like = zip_like;
	}
	public String getMember_birth_1i() {
		return member_birth_1i;
	}
	public void setMember_birth_1i(String member_birth_1i) {
		this.member_birth_1i = member_birth_1i;
	}
	public String getMember_birth_2i() {
		return member_birth_2i;
	}
	public void setMember_birth_2i(String member_birth_2i) {
		this.member_birth_2i = member_birth_2i;
	}
	public String getMember_birth_3i() {
		return member_birth_3i;
	}
	public void setMember_birth_3i(String member_birth_3i) {
		this.member_birth_3i = member_birth_3i;
	}
	public MultipartFile getProfile_image_uploader() {
		return profile_image_uploader;
	}
	public void setProfile_image_uploader(MultipartFile profile_image_uploader) {
		this.profile_image_uploader = profile_image_uploader;
	}
	public int getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(int member_sex) {
		this.member_sex = member_sex;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public String getMember_comment() {
		return member_comment;
	}
	public void setMember_comment(String member_comment) {
		this.member_comment = member_comment;
	}
	public String getMember_domain() {
		return member_domain;
	}
	public void setMember_domain(String member_domain) {
		this.member_domain = member_domain;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
}