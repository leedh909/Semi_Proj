package jsp.board.model;

import java.sql.Date;

public class BoardBean 
{
	private int board_num;  		// �۹�ȣ
	private String board_id; 		// �� �ۼ���
	private String board_subject; 	// �� ����
	private String board_content; 	// �� ����
	private String board_file; 		// ÷������ �̸�
	private int board_re_ref; 		// �� �׷��ȣ
	private int board_re_lev; 		// �亯�� ����
	private int board_re_seq; 		// �亯�� ����
	private int board_count; 		// �� ��ȸ��
	private Date board_date; 		// �� �ۼ���
	private int board_parent; 		// �θ�� ��ȣ
	
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
