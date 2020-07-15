package com.dto;

public class WordDto {

	private String title;
	private String link;
	private String description;
	private String thumbnail;
	
	public WordDto() {}

	public WordDto(String title, String link, String description, String thumbnail) {
		super();
		this.title = title;
		this.link = link;
		this.description = description;
		this.thumbnail = thumbnail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Override
	public String toString() {
		return "WordDto [제목=" + title + ", 링크=" + link + ", 내용=" + description + ", 썸네일="
				+ thumbnail + "]";
	}
	
	
	
}
