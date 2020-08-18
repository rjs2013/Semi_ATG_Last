package com.atg.Register.dto;

public class RegisterDto {
	
	private int mb_no;
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_gender;
	private String mb_email;
	private String mb_addr;
	private String mb_grade;
	private String mb_photo;
	
	@Override
	public String toString() {
		return "RegisterDto [mb_no=" + mb_no + ", mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name
				+ ", mb_gender=" + mb_gender + ", mb_email=" + mb_email + ", mb_addr=" + mb_addr + ", mb_grade="
				+ mb_grade + ", mb_photo=" + mb_photo + "]";
	}
	
	public RegisterDto() {
		
	}

	
	public RegisterDto (int mb_no, String mb_id, String mb_pw, String mb_name, String mb_gender, String mb_email, String mb_addr) {
		
		this.mb_no = mb_no;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_gender = mb_gender;
		this.mb_email = mb_email;
		this.mb_addr = mb_addr;
	}
	
	
	public RegisterDto(int mb_no, String mb_id, String mb_pw, String mb_name, String mb_gender, String mb_email,
			String mb_addr, String mb_grade, String mb_photo) {
		this.mb_no = mb_no;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
		this.mb_gender = mb_gender;
		this.mb_email = mb_email;
		this.mb_addr = mb_addr;
		this.mb_grade = mb_grade;
		this.mb_photo = mb_photo;
	}
	
	
	
	
	public int getMb_no() {
		return mb_no;
	}
	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_gender() {
		return mb_gender;
	}
	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_addr() {
		return mb_addr;
	}
	public void setMb_addr(String mb_addr) {
		this.mb_addr = mb_addr;
	}
	public String getMb_grade() {
		return mb_grade;
	}
	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}
	public String getMb_photo() {
		return mb_photo;
	}
	public void setMb_photo(String mb_photo) {
		this.mb_photo = mb_photo;
	}

}
