package com.dto;

import java.util.Date;

public class AnswerDto {
	private int qnanum;
	private String id;
	private int q_gpnum;
	private int q_gpseq;
	private int tabletab;
	private String title;
	private String content;
	private Date regdate;
	private int vcount;
	public AnswerDto() {
		super();
	}

   

	public AnswerDto(int qnanum, String id, int q_gpnum, int q_gpseq, int tabletab, String title, String content,
			Date regdate) {
		super();
		this.qnanum = qnanum;
		this.id = id;
		this.q_gpnum = q_gpnum;
		this.q_gpseq = q_gpseq;
		this.tabletab = tabletab;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}



	public AnswerDto(int qnanum, String title, String content) {
		super();
		this.qnanum = qnanum;
		this.title = title;
		this.content = content;
	}

	public AnswerDto(int qnanum, String id, int q_gpnum, int q_gpseq, int tabletab, String title, String content,
			Date regdate, int vcount) {
		super();
		this.qnanum = qnanum;
		this.id = id;
		this.q_gpnum = q_gpnum;
		this.q_gpseq = q_gpseq;
		this.tabletab = tabletab;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.vcount = vcount;
	}
	public int getQnanum() {
		return qnanum;
	}
	public void setQnanum(int qnanum) {
		this.qnanum = qnanum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQ_gpnum() {
		return q_gpnum;
	}
	public void setQ_gpnum(int q_gpnum) {
		this.q_gpnum = q_gpnum;
	}
	public int getQ_gpseq() {
		return q_gpseq;
	}
	public void setQ_gpseq(int q_gpseq) {
		this.q_gpseq = q_gpseq;
	}
	public int getTabletab() {
		return tabletab;
	}
	public void setTabletab(int tabletab) {
		this.tabletab = tabletab;
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
	
	   
}
