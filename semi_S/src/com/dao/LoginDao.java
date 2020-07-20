package com.dao;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.LoginDto;

public class LoginDao {
	
	//로그인 
	public LoginDto login(String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		LoginDto res = new LoginDto();
		String sql = " SELECT * FROM MEMBER_B WHERE ID=? AND PW=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setId(rs.getString("id"));
				res.setName(rs.getString("name"));
				res.setPw(rs.getString("pw"));
				res.setEmail(rs.getString("email"));
				res.setRole(rs.getString("role"));
			
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
	
	
	//회원가입 
	public int registUser(LoginDto ldto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO MEMBER_B VALUES(?,?,?,?,'N') ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, ldto.getId());
			pstm.setString(2, ldto.getName());
			pstm.setString(3, ldto.getPw());
			pstm.setString(4, ldto.getEmail());
			System.out.println("03. query 준비: " + sql);
			
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	
	
	//아이디 중복 체크 
	public String idchk(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		String sql = " SELECT * FROM MEMBER_B WHERE ID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res = rs.getString("id");
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
