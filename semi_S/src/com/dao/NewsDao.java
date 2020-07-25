package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.NewsDto;

import common.JDBCTemplate;

public class NewsDao extends JDBCTemplate {
    
	public List<NewsDto> selectAll(){
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<NewsDto> res = new ArrayList<NewsDto>();
		String sql = " SELECT * FROM NEWS ORDER BY NEWS_SEQ ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			while(rs.next()) {
				NewsDto dto = new NewsDto();
				dto.setnewsSeq(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setImg(rs.getString(3));
				dto.setUrl(rs.getString(4));
				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		return res;
	}
	
	public int insertNews(NewsDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql =  " INSERT INTO NEWS "
				    + " VALUES(NEWS_SQ.NEXTVAL, ?, ?, ?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getImg());
			pstm.setString(3, dto.getUrl());
			
			System.out.println("03. query 준비: "+ sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		return res;
		
	}
	
	public int deleteNews() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql =  " DELETE NEWS ";
		
		try {
			pstm = con.prepareStatement(sql);
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		return res;
		
	}

}
