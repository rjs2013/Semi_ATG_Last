package com.atg.Item.dto;

public class ItemDto {
	private int item_no;
	private int item_groupno;
	private String item_name;
	private int item_price;
	private int item_stock;
	private int item_salcount;
	private String item_url;
	
	public ItemDto() {
		
	}
	public ItemDto(int item_no, int item_groupno, String item_name, int item_price, int item_stock, int item_salcount, String item_url) {
		this.item_no = item_no;
		this.item_groupno = item_groupno;
		this.item_name = item_name;
		this.item_price = item_price;
		this.item_stock = item_stock;
		this.item_salcount = item_salcount;
		this.item_url = item_url;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getItem_groupno() {
		return item_groupno;
	}
	public void setItem_groupno(int item_groupno) {
		this.item_groupno = item_groupno;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_stock() {
		return item_stock;
	}
	public void setItem_stock(int item_stock) {
		this.item_stock = item_stock;
	}
	public int getItem_salcount() {
		return item_salcount;
	}
	public void setItem_salcount(int item_salcount) {
		this.item_salcount = item_salcount;
	}
	public String getItem_url() {
		return item_url;
	}
	public void setItem_url(String item_url) {
		this.item_url = item_url;
	}
	
}
