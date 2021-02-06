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
import com.kabookja.data.vo.MembersVO;

@Repository
public class MembersDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public MembersDAO()throws ClassNotFoundException, SQLException {
		con = new kabookjaDBConn().getConnection();
	}
	//아이디 중복체크
	public String members_idCheck(String memberID){
		String flag = "OK";
        String sql = "SELECT memberID FROM members where memberID=?";
        try{
           pstmt=con.prepareStatement(sql);
           pstmt.setString(1,memberID);
           rs = pstmt.executeQuery();
           if(rs.next()) flag = "NO";
        }catch(SQLException e){
           e.printStackTrace();
        }
        return flag;
	}
	//회원가입
	public int members_signUp(MembersVO membersVO)  {
		String sql = "INSERT into members values(?,?,?,?,?,?,?,'회원',0,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,membersVO.getMemberID());
			pstmt.setString(2,membersVO.getMemberPW());
			pstmt.setString(3,membersVO.getNickname());
			pstmt.setString(4,membersVO.getMemberName());
			pstmt.setString(5,membersVO.getMemberPhoneNumber());
			pstmt.setString(6,membersVO.getMemberAddress());
			pstmt.setDate(7,Date.valueOf(membersVO.getMemberBirth()));
			pstmt.setDate(8,Date.valueOf("2000-01-01"));
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return 0;
		}
	}
	//회원 수정하기(비밀번호,닉네임,이름,휴대폰번호,주소,생일)
	public int members_update(MembersVO membersVO){
		try {
			String sql ="update members set memberPW=?,nickname=?,memberName=?,memberPhoneNumber=?,memberAddress=?,memberBirth=? where memberID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, membersVO.getMemberPW());
			pstmt.setString(2, membersVO.getNickname());
			pstmt.setString(3, membersVO.getMemberName());
			pstmt.setString(4, membersVO.getMemberPhoneNumber());
			pstmt.setString(5, membersVO.getMemberAddress());
			pstmt.setDate(6,  Date.valueOf(membersVO.getMemberBirth()));
			pstmt.setString(7,  membersVO.getMemberID());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			return 0;
		}
	}
	//회원 탈퇴하기(조인 되있는거 차후 삭제 추가해야됨)
	public int members_delete(MembersVO membersVO){
		String sql = "DELETE members WHERE memberID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, membersVO.getMemberID());
			return pstmt.executeUpdate();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			return 0;
		}
		
	}
	//회원 전체 조회
	public ArrayList<MembersVO> members_All(MembersVO membersVO)throws SQLException{
		ArrayList<MembersVO> memberArray = new ArrayList<MembersVO>();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "SELECT * FROM members b where memberid is not null";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			MembersVO member = new MembersVO(rs.getString("memberID"),rs.getString("memberPW"),
					rs.getString("nickname"),rs.getString("memberName"),rs.getString("memberPhoneNumber"),
					rs.getString("memberAddress"),df.format(rs.getDate("memberBirth")),rs.getString("memberGrade"),
					rs.getInt("memberMileage"),rs.getString("ebookMembership"));
			memberArray.add(member);
		}
		return memberArray;
	}
	//회원한명조회
	public MembersVO members_one(MembersVO membersVO)throws SQLException{
		MembersVO member = null;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String sql = "SELECT * FROM members b where memberid is not null and memberid=? and memberPW=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,membersVO.getMemberID());
		pstmt.setString(2,membersVO.getMemberPW());
		rs = pstmt.executeQuery();
		while(rs.next()) {
			member = new MembersVO(rs.getString("memberID"),rs.getString("memberPW"),
					rs.getString("nickname"),rs.getString("memberName"),rs.getString("memberPhoneNumber"),
					rs.getString("memberAddress"),df.format(rs.getDate("memberBirth")),rs.getString("memberGrade"),
					rs.getInt("memberMileage"),rs.getString("ebookMembership"));
		}
		return member;
	}
	//멤버쉽가입
	public String members_ebookMembershipJoin(MembersVO membersVO) throws SQLException{
			String sql ="update members set ebookMembership=? where memberID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1,  Date.valueOf(membersVO.getEbookMembership()));
			pstmt.setString(2,  membersVO.getMemberID());

			if(pstmt.executeUpdate()==0) {
				   return "NO";
			}else {
				   return "OK";
			}
	}
	//마일리지 적립
	public int members_MileageUpdate(MembersVO membersVO){
		try {
			String sql ="update members set memberMileage=? where memberID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  membersVO.getMemberMileage());
			pstmt.setString(2,  membersVO.getMemberID());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			return 0;
		}
	}
}
