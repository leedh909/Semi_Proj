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
import com.dto.BoardReDto;

import common.JDBCTemplate;

public class BoardReDao extends JDBCTemplate{

	//전체 글 목록
	public List<BoardReDto> selectAll(int seq){
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<BoardReDto> res = new ArrayList<BoardReDto>();
		String sql = "SELECT * FROM BOARDREPLY_B WHERE BOARDNUM=? ORDER BY BR_NUM DESC";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, seq);
			
			System.out.println("03. query 준비: "+sql);
			
			rs=pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				BoardReDto dto = new BoardReDto();
				dto.setSeq(rs.getInt(1));
				dto.setBoardnum(rs.getInt(2));
				dto.setWriteid(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
				
				res.add(dto);
			}
			
			
		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}
	
	//글 추가
	public int insert(BoardReDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "INSERT INTO BOARDREPLY_B VALUES(BOARDREPLY_SQ.NEXTVAL,?,?,?,SYSDATE)";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, dto.getBoardnum());
			pstm.setString(2, dto.getWriteid());
			pstm.setString(3, dto.getContent());
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴 ");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}
	
	public int redelete(int seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql =" DELETE FROM BOARDREPLY_B WHERE BR_NUM=? ";
		
		try {
			pstm= con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			if(res>0) {
				commit(con);
			}
			
			
		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}
	
	//댓글 다 불러오기 
	public List<BoardReDto> selectMyre(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<BoardReDto> res = new ArrayList<BoardReDto>();
		String sql = " SELECT * FROM BOARDREPLY_B ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				BoardReDto rdto = new BoardReDto();
				rdto.setSeq(rs.getInt(1));
				rdto.setBoardnum(rs.getInt(2));
				rdto.setWriteid(rs.getString(3));
				rdto.setContent(rs.getString(4));
				rdto.setRegdate(rs.getDate(5));
				
				res.add(rdto);
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
}
