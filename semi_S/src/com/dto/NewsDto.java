package com.dto;

public class NewsDto {
  private int newsSeq;
  private String title;
  private String img;
  private String url;
public NewsDto() {
	super();
}
public NewsDto(int news_seq, String title, String img, String url) {
	super();
	this.newsSeq = news_seq;
	this.title = title;
	this.img = img;
	this.url = url;
}

public int getNewsSeq() {
	return newsSeq;
}
public void setnewsSeq(int newsSeq) {
	this.newsSeq = newsSeq;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
   
  
}
