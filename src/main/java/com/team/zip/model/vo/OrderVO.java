package com.team.zip.model.vo;

import java.sql.Timestamp;

public class OrderVO {
	
	private int order_no;
	private int member_no;
	private Timestamp reg_date;
	private int status_cd;
	private String order_address;
	private String order_customer;
	private String order_contact;
	private String order_comment;
	private String prod_no;
	private int counts;
	private int order_price;
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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
	public int getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(int status_cd) {
		this.status_cd = status_cd;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_customer() {
		return order_customer;
	}
	public void setOrder_customer(String order_customer) {
		this.order_customer = order_customer;
	}
	public String getOrder_contact() {
		return order_contact;
	}
	public void setOrder_contact(String order_contact) {
		this.order_contact = order_contact;
	}
	public String getOrder_comment() {
		return order_comment;
	}
	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}
	public String getProd_no() {
		return prod_no;
	}
	public void setProd_no(String prod_no) {
		this.prod_no = prod_no;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
}
