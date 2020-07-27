package com.dto;

public class PagingDto {
	private int currentPage;
	private int listCount;
	private int limit;
	private int lastPage;
	private int startPage;
	private int endPage;
	

	
	public PagingDto() {
		super();
	}

	
	public PagingDto(int currentPage, int listCount, int limit, int lastPage, int startPage, int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.lastPage = lastPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setMaxPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}


