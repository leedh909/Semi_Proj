package jsp.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;

import javax.naming.NamingException;

import jsp.common.util.DBConnection;


/**
 * JSP_MEMBER ���̺�� ������ DAO��
 * ȸ�� �����͸� ó���ϴ� Ŭ�����̴�.
 * <br><br>
 * Data Access Object - ���̺� �� �Ѱ��� DAO�� �ۼ��Ѵ�.
 */
public class MemberDAO 
{
	private static MemberDAO instance;
	
	// �̱��� ����
	private MemberDAO(){}
	public static MemberDAO getInstance(){
		if(instance==null)
			instance=new MemberDAO();
		return instance;
	}
	
	/**
	 * String -> java.sql.Date�� �����ϴ� �޼���
	 * <pre>
	 * ���ڿ��ε� ��������� Date�� �����ϱ� ���� �ʿ��ϴ�.
	 * java.util.DateŬ�����δ� ����Ŭ�� Date���İ� ������ �� ����.
	 * Oracle�� date���İ� �����Ǵ� java�� Date�� java.sql.Date Ŭ�����̴�. </pre>
	 * @param member ȸ�������� ����ִ� TO
	 * @return java.sql.Date
	 */
	public Date stringToDate(MemberBean member)
	{
		String year = member.getBirthyy();
		String month = member.getBirthmm();
		String day = member.getBirthdd();
		
		Date birthday  = null;
		
		if(year != null && month != null && day != null)
			birthday = Date.valueOf(year+"-"+month+"-"+day);
		
		return birthday;
		
	} // end stringToDate()
	
	
	/**
	 * ȸ�������� JSP_MEMBER ���̺� �����ϴ� �޼���
	 * @param member ������ ȸ�������� ����ִ� TO
	 * @throws SQLException
	 */
	public void insertMember(MemberBean member) throws SQLException
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			// Ŀ�ؼ��� �����´�.
			conn = DBConnection.getConnection();
			
			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);
			
			// ���� �����Ѵ�.
			// �������� ��� �ڵ����� ���õǰ� �ϱ� ���� sysdate�� ���
			StringBuffer sql = new StringBuffer();
			sql.append("insert into JSP_MEMBER values");
			sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");		
			stringToDate(member);
			/* 
			 * StringBuffer�� ��� ���� �������� toString()�޼��带
			 * �̿��ؾ� �Ѵ�.
			 */
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setDate(5, stringToDate(member));
			pstmt.setString(6, member.getMail1()+"@"+member.getMail2());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			
			// ���� ����
			pstmt.executeUpdate();
			// �Ϸ�� Ŀ��
			conn.commit(); 
			
		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			// ������ �ѹ�
			conn.rollback(); 
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement�� �ݴ´�.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end insertMember()
	
	
	/**
	 * ���̵� �̿��� ���� ȸ�������� �����´�.
	 * @param id ȸ�� ���̵�
	 * @return MemberBean
	 */
	public MemberBean getUserInfo(String id) 
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean member = null;

		try {
			// ����
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM JSP_MEMBER WHERE ID=?");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // ȸ�������� DTO�� ��´�.
			{
				// DB�� ����������� -> ��, ��, �Ϸ� ���ڿ� �ڸ���.
				String birthday = rs.getDate("birth").toString();
				String year = birthday.substring(0, 4);
				String month = birthday.substring(5, 7);
				String day = birthday.substring(8, 10);
				
				// �̸����� @ �������� �ڸ���.
				String mail = rs.getString("mail");
				int idx = mail.indexOf("@"); 
				String mail1 = mail.substring(0, idx);
				String mail2 = mail.substring(idx+1);
				
				// �ڹٺ� ������ ��´�.
				member = new MemberBean();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirthyy(year);
				member.setBirthmm(month);
				member.setBirthdd(day);
				member.setMail1(mail1);
				member.setMail2(mail2);
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setReg(rs.getTimestamp("reg"));
			}

			return member;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement�� �ݴ´�.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	}	// end getUserInfo
	
	
	/**
	 * ��� ȸ�������� �����´�.
	 * @return ArrayList<MemberBean> : ȸ�� List�� �����Ѵ�.
	 */
	public ArrayList<MemberBean> getMemberList()
	{
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberBean member = null;
		
		try {
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM JSP_MEMBER");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			
			while (rs.next()) 
			{
				member = new MemberBean();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirthyy(rs.getDate("birth").toString());
				member.setMail1(rs.getString("mail"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setReg(rs.getTimestamp("reg"));
				memberList.add(member);
			}
			
			return memberList;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement�� �ݴ´�.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end getMemberList
	
	
	/**
	 * ȸ�������� �����Ѵ�.
	 * @param member ������ ȸ�������� ����ִ� TO
	 * @throws SQLException
	 */
	public void updateMember(MemberBean member) throws SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			StringBuffer query = new StringBuffer();
			query.append("UPDATE JSP_MEMBER SET");
			query.append(" PASSWORD=?, MAIL=?, PHONE=?, ADDRESS=?");
			query.append(" WHERE ID=?");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());

			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);
			
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMail1()+"@"+member.getMail2());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getId());

			int flag = pstmt.executeUpdate();
			if(flag > 0){
				conn.commit(); // �Ϸ�� Ŀ��
			}
						
		} catch (Exception sqle) {
			conn.rollback(); // ������ �ѹ�
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end updateMember
	
	
	/**
	 * ȸ�������� �����Ѵ�.
	 * @param id ȸ������ ���� �� �ʿ��� ���̵�
	 * @param pw ȸ������ ���� �� �ʿ��� ��й�ȣ
	 * @return x : deleteMember() ���� �� �����
	 */
	@SuppressWarnings("resource")
	public int deleteMember(String id, String pw) 
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpw = ""; // DB���� ��й�ȣ�� ��Ƶ� ����
		int x = -1;

		try {
			// ��й�ȣ ��ȸ
			StringBuffer query1 = new StringBuffer();
			query1.append("SELECT PASSWORD FROM JSP_MEMBER WHERE ID=?");

			// ȸ�� ����
			StringBuffer query2 = new StringBuffer();
			query2.append("DELETE FROM JSP_MEMBER WHERE ID=?");

			conn = DBConnection.getConnection();

			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);
			
			// 1. ���̵� �ش��ϴ� ��й�ȣ�� ��ȸ�Ѵ�.
			pstmt = conn.prepareStatement(query1.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) 
			{
				dbpw = rs.getString("password");
				if (dbpw.equals(pw)) // �Էµ� ��й�ȣ�� DB��� ��
				{
					// ������� ȸ������ ����
					pstmt = conn.prepareStatement(query2.toString());
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					conn.commit(); 
					x = 1; // ���� ����
				} else {
					x = 0; // ��й�ȣ �񱳰�� - �ٸ�
				}
			}

			return x;

		} catch (Exception sqle) {
			try {
				conn.rollback(); // ������ �ѹ�
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end deleteMember
	

	/**
	 * �α��ν� ���̵�, ��й�ȣ üũ �޼���
	 * @param id �α����� ���̵�
	 * @param pw ��й�ȣ
	 * @return x : loginCheck() ���� �� ����� 
	 */
	public int loginCheck(String id, String pw) 
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
		int x = -1;

		try {
			// ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
			StringBuffer query = new StringBuffer();
			query.append("SELECT PASSWORD FROM JSP_MEMBER WHERE ID=?");

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
			{
				dbPW = rs.getString("password"); // ����� ������ �ִ´�.

				if (dbPW.equals(pw)) 
					x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
				else 				 
					x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������
				
			} else {
				x = -1; // �ش� ���̵� ���� ���
			}

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end loginCheck()	
	
	/**
	 * ���̵� �ߺ�üũ�� �Ѵ�.
	 * @param id ���̵�
	 * @return x : ���̵� �ߺ����� Ȯ�ΰ�
	 */
	public boolean duplicateIdCheck(String id)
	{
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean x= false;
		
		try {
			// ����
			StringBuffer query = new StringBuffer();
			query.append("SELECT ID FROM JSP_MEMBER WHERE ID=?");
						
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query.toString());
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			
			if(rs.next()) x= true; //�ش� ���̵� ����
			
			return x;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstm != null ){ pstm.close(); pstm=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end duplicateIdCheck()
	
}

