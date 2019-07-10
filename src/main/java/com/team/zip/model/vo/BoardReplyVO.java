package com.team.zip.model.vo;

import java.sql.Timestamp;

public class BoardReplyVO {
	private int b_reply_seq_no;
	private int member_no;
	private String b_reply_content;
	private Timestamp reg_date;
	private int b_reply_no;
	
	public int getB_reply_seq_no() {
		return b_reply_seq_no;
	}
	public void setB_reply_seq_no(int b_reply_seq_no) {
		this.b_reply_seq_no = b_reply_seq_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getB_reply_content() {
		return b_reply_content;
	}
	public void setB_reply_content(String b_reply_content) {
		this.b_reply_content = b_reply_content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getB_reply_no() {
		return b_reply_no;
	}
	public void setB_reply_no(int b_reply_no) {
		this.b_reply_no = b_reply_no;
	}
	
}
