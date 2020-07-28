package com.dao;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dto.BoardDto;

public class BoardDao {

	// 전체 글 목록
	public List<BoardDto> selectAll() {

		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;

		List<BoardDto> res = new ArrayList<BoardDto>();
		String sql = "SELECT * FROM BOARD ORDER BY BOARDNUM DESC";

		try {
			stmt = con.createStatement();
			System.out.println("03. query 준비: " + sql);

			rs = stmt.executeQuery(sql);
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setSeq(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
				dto.setVcount(rs.getInt(6));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}

	// 글 추가
	public int insert(BoardDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "INSERT INTO BOARD VALUES(BOARDNO_SQ.NEXTVAL,?,?,?,SYSDATE,0)";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getWriter());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			System.out.println("03. query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴 ");

			if (res > 0) {
				commit(con);
			}

		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}

	// 글 하나 검색
	public BoardDto selectone(int seq) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		BoardDto res = null;
		String sql = "SELECT * FROM BOARD WHERE BOARDNUM=?";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while (rs.next()) {
				res = new BoardDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
						rs.getInt(6));
			}

		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}

	public int update(BoardDto dto) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE BOARD SET TITLE=?,CONTENT=? WHERE BOARDNUM=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());

			System.out.println("03. query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			if (res > 0) {
				commit(con);
			}

		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}

	public int delete(int seq) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " DELETE FROM BOARD WHERE BOARDNUM=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			if (res > 0) {
				commit(con);
			}

		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}

	public int updatecount(int seq) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE BOARD SET VCOUNT = VCOUNT+1 WHERE BOARDNUM=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03.query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}

	public List<BoardDto> pagingSelectAll(int currentPage) {

		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<BoardDto> res = new ArrayList<BoardDto>();

		int limit = 5;
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		String sql = "SELECT  * FROM(SELECT B.* , ROWNUM R FROM BOARD B ORDER BY BOARDNUM DESC) WHERE ?<= R  AND  R <= ? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, startRow);
			pstm.setInt(2, endRow);
			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setSeq(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
				dto.setVcount(rs.getInt(6));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}

	public int listCount() {

		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "SELECT COUNT(*) FROM BOARD";

		try {
			stmt = con.createStatement();
			System.out.println("03. query 준비: " + sql);

			rs = stmt.executeQuery(sql);
			System.out.println("04. query 실행 및 리턴");

			if (rs.next()) {
				res = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");

			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}
}
