package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.AnswerDto;

import common.JDBCTemplate;

public class AnswerDao extends JDBCTemplate {

	//전체 출력
	public List<AnswerDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<AnswerDto> res = new ArrayList<AnswerDto>();
		String sql = " SELECT * FROM QNA_B ORDER BY Q_GPNUM DESC, QNANUM ";
		
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			while(rs.next()) {
				AnswerDto dto = new AnswerDto();
				dto.setQnanum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setQ_gpnum(rs.getInt(3));
				dto.setQ_gpseq(rs.getInt(4));
				dto.setTabletab(rs.getInt(5));
				dto.setTitle(rs.getString(6));
				dto.setContent(rs.getString(7));
				dto.setRegdate(rs.getDate(8));
				dto.setVcount(rs.getInt(9));
				
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

	public int insert(AnswerDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO QNA_B "
				+" VALUES(QNA_BOARD_SQ.NEXTVAL, ?, GROUPNO_SQ.NEXTVAL, "
				+" 1, 0, ?, ?, SYSDATE, 0) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getId());
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
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
	public AnswerDto selectOne(int qnanum) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		AnswerDto res = new AnswerDto();
		String sql = " SELECT * FROM QNA_B WHERE QNANUM=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, qnanum);
			System.out.println("03.query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				res.setQnanum(rs.getInt(1));
				res.setId(rs.getString(2));
				res.setQ_gpnum(rs.getInt(3));
				res.setQ_gpseq(rs.getInt(4));
				res.setTabletab(rs.getInt(5));
				res.setTitle(rs.getString(6));
				res.setContent(rs.getString(7));
				res.setRegdate(rs.getDate(8));
				res.setVcount(rs.getInt(9));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
		close(rs);
		close(pstm);
		close(con);
		System.out.println("05.db 종료\n");
		}
		
		
		return res;
	}
	public int update(AnswerDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE QNA_B SET TITLE=?, CONTENT=? WHERE QNANUM=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getQnanum());
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료\n");
		}
		
		
		return res;
		
	}
	public int delete(int qnanum) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " DELETE FROM QNA_B WHERE QNANUM=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, qnanum);
			System.out.println("03.query 준비:"+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.실행 및 리턴");
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db종료\n");
		}
		
		
		return res;
	}
	//answer - update
		public int updateAnswer(int parentgroupno, int parentgroupsq) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			int res = 0;
			String sql = " UPDATE QNA_B SET Q_GPSEQ = Q_GPSEQ+1 "
					+ " WHERE Q_GPNUM=? AND Q_GPSEQ>? ";
		
			
			String sql2=" UPDATE QNA_B SET Q_GPSEQ = Q_GPSEQ+1 "
					+" WHERE Q_GPNUM = (SELECT Q_GPNUM FROM QNA_B WHERE QNANUM=? ) AND "
					+"       Q_GPSEQ < (SELECT Q_GPSEQ FROM QNA_B WHERE QNANUM=? )";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, parentgroupno);
				pstm.setInt(2, parentgroupsq);
				System.out.println("03.query 준비: " + sql);
				
				res = pstm.executeUpdate();
				System.out.println("04.query 실행 및 리턴");
				if(res>0) {
					commit(con);
				}
				
			} catch (SQLException e) {
				System.out.println("3/4 실행 오류");
				e.printStackTrace();
			}finally {
				close(pstm);
				close(con);
				System.out.println("05.db 종료\n");
			}
			
			return res;
		}
		
		//answer - insert
		public int insertAnswer(AnswerDto dto) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			int res = 0;
			String sql = " INSERT INTO QNA_B "
				+ " VALUES(QNA_BOARD_SQ.NEXTVAL, ?, ?, ?, ?, ?, ?, SYSDATE, ?) ";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, dto.getId());
				pstm.setInt(2, dto.getQ_gpnum());
				pstm.setInt(3, dto.getQ_gpseq()+1);
				pstm.setInt(4, dto.getTabletab()+1);
				pstm.setString(5, dto.getTitle());
				pstm.setString(6, dto.getContent());
				pstm.setInt(7, dto.getVcount());
				System.out.println("03.query 준비: " + sql);
				
				res=pstm.executeUpdate();
				System.out.println("04.query 실행 및 리턴");
				if(res>0){
				  commit(con);
				}
				
			} catch (SQLException e) {
				System.out.println("3/4단계 에러");
				e.printStackTrace();
			}finally {
				close(pstm);
				close(con);
				System.out.println("05.db 종료\n");
			}
			
			return res;
		}
      public int updatecount(int qnanum) {
    	  Connection con = getConnection();
    	  PreparedStatement pstm = null;
    	  int res = 0;
    	  String sql = " UPDATE QNA_B SET VCOUNT = VCOUNT+1 WHERE QNANUM=? ";
    	  
    	  try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, qnanum);
			System.out.println("03.query 준비: " + sql);
            
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
    	  
    	  return res;
      }
}