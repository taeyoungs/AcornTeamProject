package com.team.zip.model.vo;

import java.sql.Timestamp;

public class ZipdleReplyVO {
	
	private int z_reply_seq_no;
	private int member_no;
	private String z_reply_content;
	private Timestamp reg_date;
	private int z_reply_no;
	private int z_reply_good;
	
	public int getZ_reply_good() {
		return z_reply_good;
	}
	public void setZ_reply_good(int z_reply_good) {
		this.z_reply_good = z_reply_good;
	}
	public int getZ_reply_seq_no() {
		return z_reply_seq_no;
	}
	public void setZ_reply_seq_no(int z_reply_seq_no) {
		this.z_reply_seq_no = z_reply_seq_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getZ_reply_content() {
		return z_reply_content;
	}
	public void setZ_reply_content(String z_reply_content) {
		this.z_reply_content = z_reply_content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getZ_reply_no() {
		return z_reply_no;
	}
	public void setZ_reply_no(int z_reply_no) {
		this.z_reply_no = z_reply_no;
	}
}
