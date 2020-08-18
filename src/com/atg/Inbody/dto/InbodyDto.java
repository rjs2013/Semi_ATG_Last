package com.atg.Inbody.dto;

import java.util.Date;

public class InbodyDto {

	private int mb_no;
	private int weight;
	private int height;
	private double bmi;
	private Date ib_date;
	
	public InbodyDto() {
		
	}

	
	public InbodyDto(int mb_no, int weight, int height, Date ib_date) {
		super();
		this.mb_no = mb_no;
		this.weight = weight;
		this.height = height;
		this.bmi = (double)weight/(height*height/10000);
		this.ib_date = ib_date;
	}


	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public double getBmi() {
		return bmi;
	}

	public void setBmi() {
		this.bmi = weight/(height*height);
		
	}

	public Date getIb_date() {
		return ib_date;
	}

	public void setIb_date(Date ib_date) {
		this.ib_date = ib_date;
	}
	
	
	
}
