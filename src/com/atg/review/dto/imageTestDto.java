package com.atg.review.dto;

public class imageTestDto {
	private int num;
	private String subject;
	private String saveFileName;
	
	public imageTestDto() {
		
	}
	
	public imageTestDto(int num, String subject, String saveFileName) {
		this.num = num;
		this.subject = subject;
		this.saveFileName = saveFileName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
}


