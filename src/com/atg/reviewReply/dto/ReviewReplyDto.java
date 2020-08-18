package com.atg.reviewReply.dto;

import java.sql.Date;

public class ReviewReplyDto {
	
	private int rr_no; 
							// RR_NO NUMBER
	private int rv_no;	
								//RV_NO
	private int rr_groupseq;	//RR_GROUPSEQ
	private int rr_tab;			//RR_TAB
	private String mb_id;			//MB_ID
	private String rr_content;	//RR_CONTENT
	private Date rr_date;		//RR_DATE
	
	public ReviewReplyDto (){
		
	}
	
	
	/* 글작성  부분 
	 public ReviewReplyDto (int rr_no ,String mb_id, String rr_content) {
		this.rv_no=rv_no;
		this.mb_id = mb_id; 
		this.rr_content = rr_content;
	}
	 */

		
	 /*  글수정부분  */
	 public ReviewReplyDto(int rr_no,String mb_id, String rr_content) {
		 this.rr_no=rr_no;
		 this.mb_id=mb_id;
		 this.rr_content = rr_content;
		 
	 }
	 

	 
	 
		/*
		 * //update 부분 public ReviewReplyDto(int rr_no, String mb_id, String rr_content)
		 * { super(); this.rr_no = rr_no; this.mb_id = mb_id; this.rr_content =
		 * rr_content; }
		 */

	
	
	
	@Override
	public String toString() {
		return "댓글번호" + rr_no + ",해당리뷰번호" + rv_no + ", 그룹번호" + rr_groupseq + ",공백"
				+ rr_tab + ", 아이디값" + mb_id + ", 내용" + rr_content + "날짜" + rr_date;
	}
	
	
	public ReviewReplyDto (int rr_no, int rv_no, int rr_groupseq, int rr_tab, String mb_id, String rr_content,
			Date rr_date) {
		this.rr_no = rr_no;
		this.rv_no = rv_no;
		this.rr_groupseq = rr_groupseq;
		this.rr_tab = rr_tab;
		this.mb_id = mb_id;
		this.rr_content = rr_content;
		this.rr_date = rr_date;
	}
	
	
	public int getRr_no() {
		return rr_no;
	}
	public void setRr_no(int rr_no) {
		this.rr_no = rr_no;
	}
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public int getRr_groupseq() {
		return rr_groupseq;
	}
	public void setRr_groupseq(int rr_groupseq) {
		this.rr_groupseq = rr_groupseq;
	}
	public int getRr_tab() {
		return rr_tab;
	}
	public void setRr_tab(int rr_tab) {
		this.rr_tab = rr_tab;
	}
	public String getMb_Id() {
		return mb_id;
	}
	public void setMb_Id(String id) {
		this.mb_id = id;
	}
	public String getRr_content() {
		return rr_content;
	}
	public void setRr_content(String rr_content) {
		this.rr_content = rr_content;
	}
	public Date getRr_date() {
		return rr_date;
	}
	public void setRr_date(Date rr_date) {
		this.rr_date = rr_date;
	}

	
	
	
	

}
