package com.atg.Cal.dto;

import java.sql.Date;

public class CalDto {
	
	private int ca_no;
	private String ca_title;
	private String ca_content;
	private String ca_mdate;
	private Date ca_regdate;
	private String mb_id;
	
	public CalDto() {}
	
	public CalDto(int ca_no, String ca_title, String ca_content, String ca_mdate, Date ca_regdate, String mb_id) {
		this.ca_no = ca_no;
		this.ca_title = ca_title;
		this.ca_content = ca_content;
		this.ca_mdate = ca_mdate;
		this.ca_regdate = ca_regdate;
		this.mb_id = mb_id;
	}
	
	public CalDto(int ca_no, String ca_title, String ca_content) {
		this.ca_no = ca_no;
		this.ca_title = ca_title;
		this.ca_content = ca_content;
	}

	public int getCa_no() {
		return ca_no;
	}

	public void setCa_no(int ca_no) {
		this.ca_no = ca_no;
	}

	public String getCa_title() {
		return ca_title;
	}

	public void setCa_title(String ca_title) {
		this.ca_title = ca_title;
	}

	public String getCa_content() {
		return ca_content;
	}

	public void setCa_content(String ca_content) {
		this.ca_content = ca_content;
	}

	public String getCa_mdate() {
		return ca_mdate;
	}

	public void setCa_mdate(String ca_mdate) {
		this.ca_mdate = ca_mdate;
	}

	public Date getCa_regdate() {
		return ca_regdate;
	}

	public void setCa_regdate(Date ca_regdate) {
		this.ca_regdate = ca_regdate;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
}
