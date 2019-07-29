package com.team.zip.model.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class PhotoVO {
	public int photo_seq_no;
	public int member_no;
	public String photo_image;
	public String photo_content;
	public String[] photo_content_array;
	public String photo_hometype;
	public String photo_pyeong;
	public int photo_hits;
	public int photo_good;
	public Timestamp reg_date;
	public String hashtag;
	public MultipartFile photo;
	public int count;
	public int seqno;
	
	public int getPhoto_seq_no() {
		return photo_seq_no;
	}
	public void setPhoto_seq_no(int photo_seq_no) {
		this.photo_seq_no = photo_seq_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getPhoto_image() {
		return photo_image;
	}
	public void setPhoto_image(String photo_image) {
		this.photo_image = photo_image;
	}
	public String getPhoto_content() {
		return photo_content;
	}
	public void setPhoto_content(String photo_content) {
		this.photo_content = photo_content;
	}
	public String[] getPhoto_content_array() {
		return photo_content_array;
	}
	public void setPhoto_content_array(String[] photo_content_array) {
		this.photo_content_array = photo_content_array;
	}
	public String getPhoto_hometype() {
		return photo_hometype;
	}
	public void setPhoto_hometype(String photo_hometype) {
		this.photo_hometype = photo_hometype;
	}
	public String getPhoto_pyeong() {
		return photo_pyeong;
	}
	public void setPhoto_pyeong(String photo_pyeong) {
		this.photo_pyeong = photo_pyeong;
	}
	public int getPhoto_hits() {
		return photo_hits;
	}
	public void setPhoto_hits(int photo_hits) {
		this.photo_hits = photo_hits;
	}
	public int getPhoto_good() {
		return photo_good;
	}
	public void setPhoto_good(int photo_good) {
		this.photo_good = photo_good;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSeqno() {
		return seqno;
	}
	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}
	
}
