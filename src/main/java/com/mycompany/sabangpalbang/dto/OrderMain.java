package com.mycompany.sabangpalbang.dto;

import java.util.Date;

public class OrderMain {
	private int order_id;
	private String order_email;
	private String order_phone;
	private String order_zipcode;
	private String order_roadaddress;
	private String order_detailaddress;
	private int order_sabangid;
	private int order_price;
	private Date order_date;
	private String order_state;
	private String order_payment;
	private String order_bankcode;
	
	private String[] products;
	
	public String[] getProducts() {
		return products;
	}
	public void setProducts(String[] products) {
		this.products = products;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_email() {
		return order_email;
	}
	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_zipcode() {
		return order_zipcode;
	}
	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}
	public String getOrder_roadaddress() {
		return order_roadaddress;
	}
	public void setOrder_roadaddress(String order_roadaddress) {
		this.order_roadaddress = order_roadaddress;
	}
	public String getOrder_detailaddress() {
		return order_detailaddress;
	}
	public void setOrder_detailaddress(String order_detailaddress) {
		this.order_detailaddress = order_detailaddress;
	}
	public int getOrder_sabangid() {
		return order_sabangid;
	}
	public void setOrder_sabangid(int order_sabangid) {
		this.order_sabangid = order_sabangid;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}
	public String getOrder_bankcode() {
		return order_bankcode;
	}
	public void setOrder_bankcode(String order_bankcode) {
		this.order_bankcode = order_bankcode;
	}
	
}
