package jsp.board.model;

import java.sql.Date;

public class BoardBean 
{
	private int board_num;  		// 글번호
	private String board_id; 		// 글 작성자
	private String board_subject; 	// 글 제목
	private String board_content; 	// 글 내용
	private String board_file; 		// 첨부파일 이름
	private int board_re_ref; 		// 글 그룹번호
	private int board_re_lev; 		// 답변글 깊이
	private int board_re_seq; 		// 답변글 순서
	private int board_count; 		// 글 조회수
	private Date board_date; 		// 글 작성일
	private int board_parent; 		// 부모글 번호
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public int getBoard_re_ref() {
		return board_re_ref;
	}
	public void setBoard_re_ref(int board_re_ref) {
		this.board_re_ref = board_re_ref;
	}
	public int getBoard_re_lev() {
		return board_re_lev;
	}
	public void setBoard_re_lev(int board_re_lev) {
		this.board_re_lev = board_re_lev;
	}
	public int getBoard_re_seq() {
		return board_re_seq;
	}
	public void setBoard_re_seq(int board_re_seq) {
		this.board_re_seq = board_re_seq;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_parent() {
		return board_parent;
	}
	public void setBoard_parent(int board_parent) {
		this.board_parent = board_parent;
	}
}
