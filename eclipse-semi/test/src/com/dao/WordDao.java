package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.WordDto;

import common.JDBCTemplate;

public class WordDao extends JDBCTemplate{

	public List<WordDto> selectAll(){
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<WordDto> res = new ArrayList<WordDto>();
		String sql = "SELECT * FROM WORDBOARD ORDER BY WORDSEQ";
		
		
		
		
		return null;
	}
	
	public int insert(WordDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "INSERT INTO WORDBOARD VALUES(WORDSEQ.NEXTVAL,?,?,?,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getLink());
			pstm.setString(3, dto.getDescription());
			pstm.setString(4, dto.getThumbnail());
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			
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
	
	
	
}
