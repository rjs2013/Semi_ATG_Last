package com.atg.paging.dto;

public class PagingDto {

	int countList;
	int startList;
	int lastList;
	int startPage;
	int lastPage;
	
	public PagingDto() {
		
	}

	public int getCountList() {
		return countList;
	}

	public void setCountList(int countList) {
		this.countList = countList;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int num) {
		startList = (num-1) * 10 + 1;
	}

	public int getLastList() {
		return lastList;
	}

	public void setLastList(int num) {
		lastList = num * 10;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage() {
		this.startPage = 1;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage() {
		lastPage = getCountList()/10+1;
	}
	
}
