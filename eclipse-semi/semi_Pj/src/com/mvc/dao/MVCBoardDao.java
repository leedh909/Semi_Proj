package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mvc.dto.MVCBoardDto;

import static common.JDBCTemplate.*;

public class MVCBoardDao {

	
	//전체 선택
	public List<MVCBoardDto> selectAll(){
		
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		List<MVCBoardDto> res = new ArrayList<MVCBoardDto>();
		String sql = "SELECT * FROM MVCBOARD ORDER BY SEQ DESC";
		
		try {
			stmt=con.createStatement();
			System.out.println("03. query 준비: "+sql);
			
			rs= stmt.executeQuery(sql);
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				MVCBoardDto dto = new MVCBoardDto();
				dto.setSeq(rs.getInt(1));
				dto.setWriter(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRegdate(rs.getDate(5));
				
				res.add(dto);
			}
			
			
		} catch (SQLException e) {
			System.out.println("03/04 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
			close(con);
			System.out.println("05. db 종료 \n");
		}

		return res;
	}
	
	//글 하나 검색
	public MVCBoardDto selectone(int seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MVCBoardDto res = null;
		String sql ="SELECT * FROM MVCBOARD WHERE SEQ=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비: "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while(rs.next()) {
				res=new MVCBoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5));
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
	public int insert(MVCBoardDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "INSERT INTO MVCBOARD VALUES(MVCBOARDSEQ.NEXTVAL,?,?,?,SYSDATE)";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, dto.getWriter());
			pstm.setString(2, dto.getTitle());
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
	
	//글 수정
	public int update(MVCBoardDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "UPDATE MVCBOARD SET TITLE=?, CONTENT=? WHERE SEQ=?";
		
		try {
			pstm= con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getSeq());
			System.out.println("03. query 준비: "+sql);
			
			res=pstm.executeUpdate();
			System.out.println("04. query 실행 및 준비");
			
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
	
	//글 삭제
	public int delete(int seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql ="DELETE FROM MVCBOARD WHERE SEQ=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, seq);
			System.out.println("03. query 준비: "+sql);
			
			res=pstm.executeUpdate();
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
			System.out.println("05. db 종료\n");
		}

		return res;
	}
	
	//글 여러개 삭제
	public int muldel(String[] seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		int[] cnt = null;
		
		String sql = "DELETE FROM MVCBOARD WHERE SEQ=?";
		
		try {
			pstm=con.prepareStatement(sql);
			
			for(int i=0; i<seq.length;i++) {
				
				pstm.setString(1, seq[i]);
				
				pstm.addBatch();
				System.out.println("03. query 준비 : "+sql+"(삭제할 번호: "+seq[i]+")");
				
			}
			
			cnt=pstm.executeBatch();
			System.out.println("04. query 실행 및 리턴");
			
			for(int i=0; i<cnt.length;i++) {
				
				if(cnt[i]==-2) {
					res++;
				}
				
				if(seq.length==res) {
					commit(con);
				}
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
}












