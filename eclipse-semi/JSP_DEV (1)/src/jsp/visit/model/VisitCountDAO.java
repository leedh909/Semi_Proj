package jsp.visit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import jsp.common.util.DBConnection;

/**
 * Visit 테이블의 DAO<br>
 * 방문자 관련 처리를 한다.
 */
public class VisitCountDAO 
{
	private static VisitCountDAO instance;
	
	// 싱글톤 패턴
	private VisitCountDAO(){}
	public static VisitCountDAO getInstance(){
		if(instance==null)
			instance=new VisitCountDAO();
		return instance;
	}
	
	/**
	 * 총방문자수를 증가시킨다.
	 */
	public void setTotalCount() throws SQLException
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			// 쿼리생성
			// 총 방문자수를 증가시키기 위해 테이블에 현재 날짜 값을 추가시킨다.
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO VISIT (V_DATE) VALUES (sysdate)");
			
			// 커넥션을 가져온다.
			conn = DBConnection.getConnection();
						
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql.toString());
			// 쿼리 실행
			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit(); 
			
		} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			// 오류시 롤백
			conn.rollback(); 
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end setTotalCount()
	
	/**
	 * 총 방문자수를 가져온다.
	 * @return totalCount : 총 방문자 수
	 */
	public int getTotalCount()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalCount = 0;
		
		try {
			
			// 테이블의 테이터 수를 가져온다.
			// 데이터 수 = 총 방문자 수
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) AS TotalCnt FROM VISIT");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// 방문자 수를 변수에 담는다.
			if (rs.next()) 
				totalCount = rs.getInt("TotalCnt");
			
			return totalCount;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end getTotalCount()
	
	/**
	 * 오늘 방문자 수를 가져온다.
	 * @return todayCount : 오늘 방문자
	 */
	public int getTodayCount()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int todayCount = 0;
		
		try {
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) AS TodayCnt FROM VISIT");
			sql.append(" WHERE TO_DATE(V_DATE, 'YYYY-MM-DD') = TO_DATE(sysdate, 'YYYY-MM-DD')");
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// 방문자 수를 변수에 담는다.
			if (rs.next()) 
				todayCount = rs.getInt("TodayCnt");
			
			return todayCount;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	}// end getTodayCount()
}
