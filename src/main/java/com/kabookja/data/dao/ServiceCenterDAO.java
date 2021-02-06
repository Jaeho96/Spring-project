package com.kabookja.data.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kabookja.data.dbconn.kabookjaDBConn;
import com.kabookja.data.vo.ServiceCenterVO;

@Repository
public class ServiceCenterDAO {
	
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ServiceCenterDAO()throws ClassNotFoundException, SQLException {
		con = new kabookjaDBConn().getConnection();
	}
	//게시글 전체조회
	public ArrayList<ServiceCenterVO> service_All(ServiceCenterVO serviceVO) throws SQLException {
		ArrayList<ServiceCenterVO> serviceArray = new ArrayList<ServiceCenterVO>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "SELECT * FROM servicecenter where helpID is not null order by helpid DESC,helpsortation";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ServiceCenterVO service = new ServiceCenterVO(rs.getString("helpNum"),rs.getString("helpID"),rs.getString("memberID"),
					rs.getString("helpTitle"),df.format(rs.getDate("helpWritedate")),
					rs.getString("helpContent"),rs.getInt("helpSortation"));
			serviceArray.add(service);
		}
		return serviceArray;
	}
	//게시글 한개 조회
	public ServiceCenterVO service_one(ServiceCenterVO serviceVO) throws SQLException {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "SELECT * FROM servicecenter where helpID=? and helpsortation=?";
		pstmt = con.prepareStatement(sql);  
		pstmt.setString(1,serviceVO.getHelpID());
		pstmt.setInt(2,serviceVO.getHelpSortation());
		rs = pstmt.executeQuery();
		ServiceCenterVO service=null;
		while(rs.next()) {
			service = new ServiceCenterVO(rs.getString("helpNum"),rs.getString("helpID"),rs.getString("memberID"),
					rs.getString("helpTitle"),df.format(rs.getDate("helpWritedate")),
					rs.getString("helpContent"),rs.getInt("helpSortation"));
		}
		return service;
	}
	//게시글 작성
	public int service_insert(ServiceCenterVO serviceVO) {
		String sql = "INSERT into ServiceCenter values((select nvl(MAX(helpnum)+1,1) from ServiceCenter),?,?,?,?,?,0)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,serviceVO.getHelpID());
			pstmt.setString(2,serviceVO.getMemberID());
			pstmt.setString(3,serviceVO.getHelpTitle());
			pstmt.setDate(4,Date.valueOf(serviceVO.getHelpWritedate()));
			pstmt.setString(5,serviceVO.getHelpContent());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return 0;
		}
	}
	//리뷰작성
	public int service_reviewInsert(ServiceCenterVO serviceVO) {
		String sql = "INSERT into ServiceCenter values(null,?,?,?,?,?,1)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,serviceVO.getHelpID());
			pstmt.setString(2,serviceVO.getMemberID());
			pstmt.setString(3,serviceVO.getHelpTitle());
			pstmt.setDate(4,Date.valueOf(serviceVO.getHelpWritedate()));
			pstmt.setString(5,serviceVO.getHelpContent());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return 0;
		}
	}
	//게시글 댓글유무 확인 0수정가능 1수정불가
	public int service_reviewCheck(ServiceCenterVO serviceVO){
		int flag = 0;
        String sql = "SELECT helpID FROM serviceCenter where helpID=? and helpSortation=1";
        try{
           pstmt=con.prepareStatement(sql);
           pstmt.setString(1,serviceVO.getHelpID());
           rs = pstmt.executeQuery();
           if(rs.next()) flag = 1;
        }catch(SQLException e){
           e.printStackTrace();
        }
        return flag;
	}
	//게시글 or리뷰 수정
	public int service_update(ServiceCenterVO serviceVO) {
		try {
			String sql ="update servicecenter set helpTitle=?,helpContent=? where helpID=? and helpSortation=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, serviceVO.getHelpTitle());
			pstmt.setString(2, serviceVO.getHelpContent());
			pstmt.setString(3, serviceVO.getHelpID());
			pstmt.setInt(4,serviceVO.getHelpSortation());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			return 0;
		}
	}
	//게시글 삭제
	public int service_delete(ServiceCenterVO serviceVO) {
		try {
			String SortationSW="";
			if(serviceVO.getHelpSortation()==1) {
				SortationSW=" and helpSortation=1";
			}
			String sql ="delete servicecenter where helpID=?"+SortationSW;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, serviceVO.getHelpID());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			return 0;
		}
	}
}
