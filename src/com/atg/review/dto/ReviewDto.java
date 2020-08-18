package com.atg.review.dto;

import java.sql.Date;

public class ReviewDto {
	
	private int rv_no;
	private String rv_title;
	private String rv_content;
	private Date rv_date;
	private int rv_rate;
	private String mb_id;

	public ReviewDto() {
		
	}
	
	public ReviewDto(int rv_no, String rv_title, String rv_content,
			Date rv_date, int rv_rate, String mb_id) {
		
		this.rv_no = rv_no;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
		this.rv_date = rv_date;
		this.rv_rate = rv_rate;
		this.mb_id = mb_id;
		
	}
	
	public int getRv_no() {
		return rv_no;
	}

	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}

	public int getRv_rate() {
		return rv_rate;
	}

	public void setRv_rate(int rv_rate) {
		this.rv_rate = rv_rate;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
}
