package jsp.guestbook.model;

import java.sql.Date;

public class GuestbookBean 
{
	private int guestbook_no;			// 방명록 글번호
	private String guestbook_id;		// 아이디
	private String guestbook_password;	// 비밀번호
	private String guestbook_content;	// 내용
	private int guestbook_group;		// 그룹번호
	private int guestbook_parent;		// 부모글 번호
	private Date guestbook_date;		// 작성일
	private int guestbook_level;		// 답변글 깊이
	
	public int getGuestbook_level() {
		return guestbook_level;
	}
	public void setGuestbook_level(int guestbook_level) {
		this.guestbook_level = guestbook_level;
	}
	public int getGuestbook_no() {
		return guestbook_no;
	}
	public void setGuestbook_no(int guestbook_no) {
		this.guestbook_no = guestbook_no;
	}
	public String getGuestbook_id() {
		return guestbook_id;
	}
	public void setGuestbook_id(String guestbook_id) {
		this.guestbook_id = guestbook_id;
	}
	public String getGuestbook_password() {
		return guestbook_password;
	}
	public void setGuestbook_password(String guestbook_password) {
		this.guestbook_password = guestbook_password;
	}
	public String getGuestbook_content() {
		return guestbook_content;
	}
	public void setGuestbook_content(String guestbook_content) {
		this.guestbook_content = guestbook_content;
	}
	public int getGuestbook_group() {
		return guestbook_group;
	}
	public void setGuestbook_group(int guestbook_group) {
		this.guestbook_group = guestbook_group;
	}
	public int getGuestbook_parent() {
		return guestbook_parent;
	}
	public void setGuestbook_parent(int guestbook_parent) {
		this.guestbook_parent = guestbook_parent;
	}
	public Date getGuestbook_date() {
		return guestbook_date;
	}
	public void setGuestbook_date(Date guestbook_date) {
		this.guestbook_date = guestbook_date;
	}
}
