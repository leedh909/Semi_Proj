package jsp.guestbook.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import jsp.common.util.DBConnection;

public class GuestbookDAO 
{
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static GuestbookDAO instance;
	
	private GuestbookDAO(){}
	public static GuestbookDAO getInstance(){
		if(instance==null)
			instance=new GuestbookDAO();
		return instance;
	}
	
	// 시퀀스를 가져온다.
	public int getSeq() 
	{
		int result = 1;
		try {
			conn = DBConnection.getConnection();
			
			// 시퀀스 값을 가져온다. (DUAL : 시퀀스 값을 가져오기위한 임시 테이블)
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT guestbook_no_seq.NEXTVAL FROM DUAL");

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery(); // 쿼리 실행

			if (rs.next())	result = rs.getInt(1);

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

		close();
		return result;
	} // end getSeq
	
	
	// 병명록 등록
	public boolean guestbookInsert(GuestbookBean guestbook)
	{
		boolean result = false;
		
		try {
			conn = DBConnection.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO GUESTBOOK");
			sql.append(" (GUESTBOOK_NO, GUESTBOOK_ID, GUESTBOOK_PASSWORD, GUESTBOOK_CONTENT");
			sql.append(" , GUESTBOOK_GROUP, GUESTBOOK_PARENT, GUESTBOOK_DATE)");
			sql.append(" VALUES(?,?,?,?,?,?,sysdate)");
			
			int no = guestbook.getGuestbook_no();								// 글번호(시퀀스 값)
			int group = guestbook.getGuestbook_group(); 	// 그룹번호
			int parent = guestbook.getGuestbook_parent(); 	// 부모글번호
			
			// 부모글일 경우 그룹번호와 글번호 동일
			if(parent == 0) group = no;
	
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			pstmt.setString(2, guestbook.getGuestbook_id());
			pstmt.setString(3, guestbook.getGuestbook_password());
			pstmt.setString(4, guestbook.getGuestbook_content());
			pstmt.setInt(5, group);
			pstmt.setInt(6, parent);

			int flag = pstmt.executeUpdate();
			if(flag > 0){
				result = true;
				conn.commit(); // 완료시 커밋
			}
			
		} catch (Exception e) {
			try {
				conn.rollback(); // 오류시 롤백
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			} 
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return result;	
	} // end boardInsert();	
	
	
	// 방명록 목록 보기
	public ArrayList<GuestbookBean> getGuestbookList(int pageNum)
	{
		ArrayList<GuestbookBean> list = new ArrayList<GuestbookBean>();
		
		try {
			conn = DBConnection.getConnection();
			
			/*
			 * SELECT * FROM
			 *			(SELECT  ROWNUM AS rnum,
             *  				 data.*
        	 *			 FROM
             *   				(SELECT LEVEL,
             *             			 	guestbook_no,
             *             				guestbook_id,
             *            				guestbook_password,
             *             				guestbook_content,
             *             				guestbook_group,
             *             				guestbook_parent,
             *             				guestbook_date
             *   				 FROM GUESTBOOK
             *      			 START WITH guestbook_parent = 0
             *      			 CONNECT BY PRIOR guestbook_no = guestbook_parent
             *      			 ORDER SIBLINGS BY guestbook_group desc) 
             *			 data)
			 * 	WHERE rnum>=? and rnum<=? ;
			 */
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM");
			sql.append(" (SELECT  ROWNUM AS rnum, data.* FROM ");
			sql.append("	(SELECT LEVEL, guestbook_no, guestbook_id,");
			sql.append("			guestbook_password, guestbook_content,");
			sql.append("			guestbook_group, guestbook_parent, guestbook_date");
			sql.append("	FROM GUESTBOOK");
			sql.append("	START WITH guestbook_parent = 0");
			sql.append("	CONNECT BY PRIOR guestbook_no = guestbook_parent");
			sql.append("	ORDER SIBLINGS BY guestbook_group desc)");              
			sql.append(" data) ");
			sql.append("WHERE rnum>=? and rnum<=?");
			
			// 방명록 목록은 한 화면에 총 5개가 보이도록 한다.
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, pageNum);
			pstmt.setInt(2, pageNum+4);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				GuestbookBean guestbook = new GuestbookBean();
				guestbook.setGuestbook_level(rs.getInt("LEVEL"));
				guestbook.setGuestbook_no(rs.getInt("guestbook_no"));
				guestbook.setGuestbook_id(rs.getString("guestbook_id"));
				guestbook.setGuestbook_password(rs.getString("guestbook_password"));
				guestbook.setGuestbook_content(rs.getString("guestbook_content"));
				guestbook.setGuestbook_group(rs.getInt("guestbook_group"));
				guestbook.setGuestbook_parent(rs.getInt("guestbook_parent"));
				guestbook.setGuestbook_date(rs.getDate("guestbook_date"));
				list.add(guestbook);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return list;
	}
	
	// 방명록의 개수를 가져온다.
	public int getGuestbookCount()
	{
		int result = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) FROM GUESTBOOK");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next())	result = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return result;	
	}
	
	// 방명록 1개의 정보를 가져온다.
	public GuestbookBean getGuestbook(int g_num)
	{
		GuestbookBean guestbook = null;
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM GUESTBOOK where guestbook_no = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, g_num);
			
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				guestbook = new GuestbookBean();
				guestbook.setGuestbook_no(rs.getInt("guestbook_no"));
				guestbook.setGuestbook_id(rs.getString("guestbook_id"));
				guestbook.setGuestbook_password(rs.getString("guestbook_password"));
				guestbook.setGuestbook_content(rs.getString("guestbook_content"));
				guestbook.setGuestbook_group(rs.getInt("guestbook_group"));
				guestbook.setGuestbook_parent(rs.getInt("guestbook_parent"));
				guestbook.setGuestbook_date(rs.getDate("guestbook_date"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return guestbook; 
	} // end getGuestbook
	
	
	// 비밀번호를 가져온다.
	public String getPassword(int guestbook_no)
	{
		String password = null;
		
		try {
			conn = DBConnection.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT guestbook_password FROM GUESTBOOK where guestbook_no = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, guestbook_no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) password = rs.getString("guestbook_password");
			
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		
		close();
		return password;
	} // end getPassword
	
	
	// 방명록 삭제
	public boolean deleteGuestbook(int guestbook_no) 
	{
		boolean result = false;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); // 자동 커밋을 false로 한다.

			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM GUESTBOOK");
			sql.append(" WHERE guestbook_no IN");
			sql.append(" (SELECT guestbook_no");
			sql.append(" FROM GUESTBOOK");
			sql.append(" START WITH guestbook_no = ?");
			sql.append(" CONNECT BY PRIOR guestbook_no = guestbook_parent) ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, guestbook_no);
			
			int flag = pstmt.executeUpdate();
			if(flag > 0){
				result = true;
				conn.commit(); // 완료시 커밋
			}	
			
		} catch (Exception e) {
			try {
				conn.rollback(); // 오류시 롤백
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());
		}

		close();
		return result;
	} // end deleteGuestbook	
	
	
	// 방명록 수정
	public boolean updateGuestbook(GuestbookBean guestbook) 
	{
		boolean result = false;
		
		try{
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); // 자동 커밋을 false로 한다.
			
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE GUESTBOOK SET");
			sql.append(" guestbook_id=?");
			sql.append(" ,guestbook_content=?");
			sql.append(" ,guestbook_date=SYSDATE ");
			sql.append("WHERE guestbook_no=?");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, guestbook.getGuestbook_id());
			pstmt.setString(2, guestbook.getGuestbook_content());
			pstmt.setInt(3, guestbook.getGuestbook_no());
			
			int flag = pstmt.executeUpdate();
			if(flag > 0){
				result = true;
				conn.commit(); // 완료시 커밋
			}
			
		} catch (Exception e) {
			try {
				conn.rollback(); // 오류시 롤백
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
			throw new RuntimeException(e.getMessage());
		}
	
		close();
		return result;
	} // end updateGuestbook	
	
	// DB 자원해제
	private void close()
	{
		try {
			if ( pstmt != null ){ pstmt.close(); pstmt=null; }
			if ( conn != null ){ conn.close(); conn=null;	}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	} // end close()	
		
}
