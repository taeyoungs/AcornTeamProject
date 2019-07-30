package com.team.zip.model.vo;

import java.sql.Timestamp;

public class CartVO {
	
	private int cart_no;
	private int prod_no;
	private int counts;
	private Timestamp reg_date;
	
	private String prod_title;
	private int prod_price;
	private String prod_img;
	private String prod_seller;
	private int discount_rate;
	

	public String getProd_title() {
		return prod_title;
	}
	public void setProd_title(String prod_title) {
		this.prod_title = prod_title;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_img() {
		return prod_img;
	}
	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}
	public String getProd_seller() {
		return prod_seller;
	}
	public void setProd_seller(String prod_seller) {
		this.prod_seller = prod_seller;
	}
	public int getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getProd_no() {
		return prod_no;
	}
	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}
