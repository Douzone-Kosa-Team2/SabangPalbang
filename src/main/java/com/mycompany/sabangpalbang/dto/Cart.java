package com.mycompany.sabangpalbang.dto;

public class Cart {

	private String sabang_imgoname;
	private String sabang_name;
	private int products_totalcount;
	private int product_totalprice;
	
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

}
