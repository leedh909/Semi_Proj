package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.CoolerDto;
import com.dto.FavPcDto;
import com.dto.GraphicDto;
import com.dto.GuideViewDto;

import common.JDBCTemplate;

public class PartsDao extends JDBCTemplate {
	
	public GuideViewDto selectlowspec(String guideName) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		GuideViewDto res = new GuideViewDto();
		
		String sql = "SELECT * FROM V_ALLPARTS WHERE GUIDE=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,guideName);
			System.out.println("03.query 준비: "+sql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");

			
			while(rs.next()) {
				res.setGuide(rs.getString(1));
				res.setCpu(rs.getString(2));
				res.setCpuPrice(rs.getInt(3));
				res.setCpuPic(rs.getString(4));
				res.setMainboard(rs.getString(5));
				res.setMainboardPrice(rs.getInt(6));
				res.setMainboardPic(rs.getString(7));
				res.setRam(rs.getString(8));
				res.setRamAmount(rs.getInt(9));
				res.setRamPrice(rs.getInt(10));
				res.setRamPic(rs.getString(11));
				res.setGpu(rs.getString(12));
				res.setGpuPrice(rs.getInt(13));
				res.setGpuPic(rs.getString(14));
				res.setSsd(rs.getString(15));
				res.setSsdPrice(rs.getInt(16));
				res.setSsdPic(rs.getString(17));
				res.setSsdAmount(rs.getInt(18));
				res.setCooler(rs.getString(19));
				res.setCoolerPrice(rs.getInt(20));
				res.setCoolerPic(rs.getString(21));
				res.setPower(rs.getString(22));
				res.setPowerPrice(rs.getInt(23));
				res.setPowerPic(rs.getString(24));
				res.setCaseN(rs.getString(25));
				res.setCaseNPrice(rs.getInt(26));
				res.setCaseNPic(rs.getString(27));
				res.setCatPic(rs.getString(28));
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(con);
			close(pstm);
			System.out.println("05.db종료");
		}
		return res;
	}
	public List<GuideViewDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GuideViewDto> res = new ArrayList<GuideViewDto>();
		
		String sql = "SELECT * FROM V_ALLPARTS";
		try {
			pstm= con.prepareStatement(sql);
			
			System.out.println("03. query 준비"+sql);
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while(rs.next()) {
				GuideViewDto dto = new GuideViewDto();
				dto.setGuide(rs.getString(1));
				dto.setCpu(rs.getString(2));
				dto.setCpuPrice(rs.getInt(3));
				dto.setCpuPic(rs.getString(4));
				dto.setMainboard(rs.getString(5));
				dto.setMainboardPrice(rs.getInt(6));
				dto.setMainboardPic(rs.getString(7));
				dto.setRam(rs.getString(8));
				dto.setRamAmount(rs.getInt(9));
				dto.setRamPrice(rs.getInt(10));
				dto.setRamPic(rs.getString(11));
				dto.setGpu(rs.getString(12));
				dto.setGpuPrice(rs.getInt(13));
				dto.setGpuPic(rs.getString(14));
				dto.setSsd(rs.getString(15));
				dto.setSsdPrice(rs.getInt(16));
				dto.setSsdPic(rs.getString(17));
				dto.setSsdAmount(rs.getInt(18));
				dto.setCooler(rs.getString(19));
				dto.setCoolerPrice(rs.getInt(20));
				dto.setCoolerPic(rs.getString(21));
				dto.setPower(rs.getString(22));
				dto.setPowerPrice(rs.getInt(23));
				dto.setPowerPic(rs.getString(24));
				dto.setCaseN(rs.getString(25));
				dto.setCaseNPrice(rs.getInt(26));
				dto.setCaseNPic(rs.getString(27));
				dto.setCatPic(rs.getString(28));
				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		return res;
	}
	public List<GraphicDto> selectGpu(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<GraphicDto> res = new ArrayList<GraphicDto>();
		String sql = "SELECT * FROM GRAPHIC_B";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("3.query 준비"+sql);
			rs= pstm.executeQuery();
			System.out.println("4. query 실행 및 리턴");
			while(rs.next()) {
				GraphicDto graphicDto =new GraphicDto();
				graphicDto.setGraphicNum(rs.getInt(1));
				graphicDto.setName(rs.getString(2));
				graphicDto.setPrice(rs.getInt(3));
				graphicDto.setPic(rs.getString(4));
				res.add(graphicDto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("5. db 종료\n");
		}
		
		return res;
	}
	
	public List<CoolerDto> selectCooler(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<CoolerDto> res = new ArrayList<CoolerDto>();
		String sql = "SELECT * FROM COOLER_B";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("3.query 준비"+sql);
			rs= pstm.executeQuery();
			System.out.println("4. query 실행 및 리턴");
			while(rs.next()) {
				CoolerDto coolerDto =new CoolerDto();
				coolerDto.setCoolNum(rs.getInt(1));
				coolerDto.setName(rs.getString(2));
				coolerDto.setPrice(rs.getInt(3));
				coolerDto.setPic(rs.getString(4));
				res.add(coolerDto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("5. db 종료\n");
		}
		
		return res;
	}
	public int favsave(FavPcDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		String sql = "INSERT INTO FAVPC_B VALUES(FAV_SQ.NEXTVAL ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,? ,?)";
		int res = 0;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1,dto.getId());
			pstm.setString(2, dto.getCpuName());
			pstm.setInt(3, dto.getCpuPrice());
			pstm.setString(4, dto.getMbName());
			pstm.setInt(5, dto.getMbPrice());
			pstm.setString(6, dto.getRamName());
			pstm.setInt(7, dto.getRamPrice());
			pstm.setInt(8, dto.getRamAmount());
			pstm.setString(9, dto.getGraphicName());
			pstm.setInt(10, dto.getGraphicPrice());
			pstm.setString(11, dto.getSsdName());
			pstm.setInt(12, dto.getSsdPrice());
			pstm.setInt(13, dto.getSsdAmount());
			pstm.setString(14, dto.getCoolName());
			pstm.setInt(15, dto.getCoolPrice());
			pstm.setString(16, dto.getPowerName());
			pstm.setInt(17, dto.getPowerPrice());
			pstm.setString(18, dto.getCaseName());
			pstm.setInt(19, dto.getCasePrice());
			pstm.setInt(20, dto.getTotalPrice());
			System.out.println("03. query준비: " +sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행및 리턴");
			
			if(res>0) {
				commit(con);
			}	
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");

			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료\n");
		}
		return res;
	}
	
	
	
	//찜한애 불러오기 
	public List<FavPcDto> selectAll2() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<FavPcDto> res = new ArrayList<FavPcDto>();
		String sql = " SELECT * FROM FAVPC_B ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				FavPcDto dto = new FavPcDto();
				dto.setFavNum(rs.getInt("favnum"));
				dto.setId(rs.getString("id"));
				dto.setCpuName(rs.getString("cpuName"));
				dto.setCpuPrice(rs.getInt("cpuPrice"));
				dto.setMbName(rs.getString("mbName"));
				dto.setMbPrice(rs.getInt("mbPrice"));
				dto.setRamName(rs.getString("ramName"));
				dto.setRamPrice(rs.getInt("ramPrice"));
				dto.setRamAmount(rs.getInt("ramAmount"));
				dto.setGraphicName(rs.getString("graphicName"));
				dto.setGraphicPrice(rs.getInt("graphicPrice"));
				dto.setSsdName(rs.getString("ssdName"));
				dto.setSsdPrice(rs.getInt("ssdPrice"));
				dto.setSsdAmount(rs.getInt("ssdAmount"));
				dto.setCoolName(rs.getString("coolName"));
				dto.setCoolPrice(rs.getInt("coolPrice"));
				dto.setPowerName(rs.getString("powerName"));
				dto.setPowerPrice(rs.getInt("powerPrice"));
				dto.setCaseName(rs.getString("caseName"));
				dto.setCasePrice(rs.getInt("casePrice"));
				dto.setTotalPrice(rs.getInt("totalPrice"));
				
				res.add(dto);
				
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

	
	//찜한 녀석 삭제 
	public int deletepc(int favnum) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " DELETE FROM FAVPC_B WHERE FAVNUM=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, favnum);
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

	
	
	


}
