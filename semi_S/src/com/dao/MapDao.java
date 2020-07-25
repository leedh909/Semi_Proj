package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.MapDto;

import common.JDBCTemplate;

public class MapDao extends JDBCTemplate {
	
	public MapDto getmap(int compNum) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		MapDto res = new MapDto();
		
		String sql = "SELECT * FROM MAP_B WHERE COMPNUM=?";
		System.out.println("03.query 준비: "+sql);
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1,compNum);

			rs = pstm.executeQuery();
			
			while(rs.next()) {
				res.setCompNum(rs.getInt(1));
				res.setName(rs.getString(2));
				res.setWebPage(rs.getString(3));
				res.setAddr(rs.getString(4));
				res.setMapAddr(rs.getString(5));
			}
			System.out.println("04.query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");

			e.printStackTrace();
		}finally {
			close(rs);
			close(con);
			close(pstm);
			System.out.println("05.db종료");
		}
		
		return res; 
	}

}
