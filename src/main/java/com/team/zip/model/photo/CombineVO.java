package com.team.zip.model.photo;

import java.sql.Timestamp;

public class CombineVO {
	
	private String p_reply_content;
	private String member_nickname;
	private String member_image;
	private Timestamp reg_date;
	
	
	public String getP_reply_content() {
		return p_reply_content;
	}
	public void setP_reply_content(String p_reply_content) {
		this.p_reply_content = p_reply_content;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
