package com.team.zip.model.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ZipdleVO {

	private int zip_seq_no;
	private String json;
	private int zip_hits;
	private int zip_good;
	private Timestamp reg_date;
	private int member_no;
	
	private String member_nickname;
	private String member_image;
	
	public String getMember_image() {
		return member_image;
	}
	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getZip_hits() {
		return zip_hits;
	}
	public void setZip_hits(int zip_hits) {
		this.zip_hits = zip_hits;
	}
	public int getZip_good() {
		return zip_good;
	}
	public void setZip_good(int zip_good) {
		this.zip_good = zip_good;
	}
	public int getZip_seq_no() {
		return zip_seq_no;
	}
	public void setZip_seq_no(int zip_seq_no) {
		this.zip_seq_no = zip_seq_no;
	}
	public String getJson() {
		return json;
	}
	public void setJson(String json) {
		this.json = json;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
}
