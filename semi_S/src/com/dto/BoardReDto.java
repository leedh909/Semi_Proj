package com.dto;

import java.util.Date;

public class BoardReDto {

	private int seq;
	private int boardnum;
	private String writeid;
	private String content;
	private Date regdate;
	
	public BoardReDto() {}

	public BoardReDto(int boardnum, String writeid, String content) {
		super();
		this.boardnum = boardnum;
		this.writeid = writeid;
		this.content = content;
	}

	public BoardReDto(int seq, int boardnum, String writeid, String content, Date regdate) {
		super();
		this.seq = seq;
		this.boardnum = boardnum;
		this.writeid = writeid;
		this.content = content;
		this.regdate = regdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getWriteid() {
		return writeid;
	}

	public void setWriteid(String writeid) {
		this.writeid = writeid;
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

	@Override
	public String toString() {
		return "BoardReDto [seq=" + seq + ", boardnum=" + boardnum + ", writeid=" + writeid + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}

	
	
	
}
