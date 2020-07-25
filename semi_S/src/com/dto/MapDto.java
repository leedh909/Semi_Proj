package com.dto;

public class MapDto {
	private int CompNum;
	private String name;
	private String webPage;
	private String addr;
	private String mapAddr;
	
	
	public MapDto() {
		super();
	}
	
	
	public MapDto(int compNum, String name, String webPage, String addr, String mapAddr) {
		super();
		CompNum = compNum;
		this.name = name;
		this.webPage = webPage;
		this.addr = addr;
		this.mapAddr = mapAddr;
	}
	
	
	public int getCompNum() {
		return CompNum;
	}
	public void setCompNum(int compNum) {
		CompNum = compNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWebPage() {
		return webPage;
	}
	public void setWebPage(String webPage) {
		this.webPage = webPage;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMapAddr() {
		return mapAddr;
	}
	public void setMapAddr(String mapAddr) {
		this.mapAddr = mapAddr;
	}

	

}
