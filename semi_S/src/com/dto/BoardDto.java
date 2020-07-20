package com.dto;

import java.util.Date;

/**
 * @author User
 *
 */
public class BoardDto {

	private int seq;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	private int vcount;
	
	public BoardDto() {}

	public BoardDto(int seq, String writer, String title, String content, Date regdate, int vcount) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.vcount = vcount;
	}

	public BoardDto(String writer, String title, String content) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	public BoardDto(int seq, String title, String content) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getVcount() {
		return vcount;
	}

	public void setVcount(int vcount) {
		this.vcount = vcount;
	}

	@Override
	public String toString() {
		return "BoardDto [seq=" + seq + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", vcount=" + vcount + "]";
	}
	
	
}
