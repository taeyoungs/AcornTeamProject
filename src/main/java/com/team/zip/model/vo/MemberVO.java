package com.team.zip.model.vo;

public class MemberVO {
	private int member_no;
	private String member_id;
	private String member_domain;
	private String member_pw;
	private String member_nickname;
	private String member_image;
	private String member_comment;
	
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