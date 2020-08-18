package com.atg.Notice.dto;

import java.sql.Date;

public class NoticeDto {

	private int nt_no;
	private String nt_title;
	private String nt_content;
	private Date nt_date;
	
	public NoticeDto() {}
	
	public NoticeDto(int nt_no, String nt_title, String nt_content, Date nt_date) {
		this.nt_no = nt_no;
		this.nt_title = nt_title;
		this.nt_content = nt_content;
		this.nt_date = nt_date;
	}
	
	public NoticeDto(int nt_no, String nt_title, String nt_content) {
		this.nt_no = nt_no;
		this.nt_title = nt_title;
		this.nt_content = nt_content;
	}

	public int getNt_no() {
		return nt_no;
	}

	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public Date getNt_date() {
		return nt_date;
	}

	public void setNt_date(Date nt_date) {
		this.nt_date = nt_date;
	}
	
}
