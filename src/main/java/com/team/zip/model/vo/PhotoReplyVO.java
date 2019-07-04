package com.team.zip.model.vo;

import java.sql.Timestamp;

public class PhotoReplyVO {
	
	private int p_reply_seq_no;
	private int member_no;
	private String p_reply_content;
	private Timestamp reg_date;
	private int p_reply_no;
	
	public int getP_reply_seq_no() {
		return p_reply_seq_no;
	}
	public void setP_reply_seq_no(int p_reply_seq_no) {
		this.p_reply_seq_no = p_reply_seq_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getP_reply_content() {
		return p_reply_content;
	}
	public void setP_reply_content(String p_reply_content) {
		this.p_reply_content = p_reply_content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getP_reply_no() {
		return p_reply_no;
	}
	public void setP_reply_no(int p_reply_no) {
		this.p_reply_no = p_reply_no;
	}

	
}
