package com.mycompany.sabangpalbang.dto;

import java.util.List;

public class Cart {
	private int sabang_id;
	private String sabang_imgoname;
	private String sabang_name;
	private int products_totalcount;
	private int product_totalprice;
	private List<ProductCart> productCarts;
	
	
	public String getSabang_imgoname() {
		return sabang_imgoname;
	}
	public void setSabang_imgoname(String sabang_imgoname) {
		this.sabang_imgoname = sabang_imgoname;
	}
	public String getSabang_name() {
		return sabang_name;
	}
	public void setSabang_name(String sabang_name) {
		this.sabang_name = sabang_name;
	}
	public int getProducts_totalcount() {
		return products_totalcount;
	}
	public void setProducts_totalcount(int products_totalcount) {
		this.products_totalcount = products_totalcount;
	}
	public int getProduct_totalprice() {
		return product_totalprice;
	}
	public void setProduct_totalprice(int product_totalprice) {
		this.product_totalprice = product_totalprice;
	}
	public List<ProductCart> getProductCarts() {
		return productCarts;
	}
	public void setProductCarts(List<ProductCart> productCarts) {
		this.productCarts = productCarts;
	}
	public int getSabang_id() {
		return sabang_id;
	}
	public void setSabang_id(int sabang_id) {
		this.sabang_id = sabang_id;
	}
	
	
}
