package com.team.zip.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int board_seq_no;
	private String board_title;
	private String board_content;
	private int member_no;
	private Timestamp reg_date;
	private int board_hits;
	private ArrayList<MultipartFile> imagename;
	private String board_image;
	private int b_reply_count;
	
	
	public int getb_reply_count() {
		return b_reply_count;
	}
	public void setb_reply_count(int b_reply_count) {
		this.b_reply_count = b_reply_count;
	}
	public int getBoard_seq_no() {
		return board_seq_no;
	}
	public void setBoard_seq_no(int board_seq_no) {
		this.board_seq_no = board_seq_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getBoard_hits() {
		return board_hits;
	}
	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}
	public ArrayList<MultipartFile> getImagename() {
		return imagename;
	}
	public void setImagename(ArrayList<MultipartFile> imagename) {
		this.imagename = imagename;
	}
	public String getBoard_image() {
		return board_image;
	}
	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}
	
}
