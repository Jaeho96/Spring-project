package com.kabookja.data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Repository;

import com.kabookja.data.dbconn.kabookjaDBConn;
import com.kabookja.data.vo.MembersVO;
import com.kabookja.data.vo.PaymentReportVO;


@Repository
public class PaymentReportDAO {
	
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public PaymentReportDAO() throws ClassNotFoundException, SQLException{
		con = new kabookjaDBConn().getConnection();
	}
	//구매이력 조회
	public ArrayList<PaymentReportVO> allPaymentReport(PaymentReportVO paymentReportVO) throws ClassNotFoundException,SQLException{
		ArrayList<PaymentReportVO> paylist = new ArrayList<PaymentReportVO>();
		String sql = "select * from paymentReport where memberID =? ORDER by buydate DESC";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, paymentReportVO.getMemberID());
		rs = pstmt.executeQuery();
			while(rs.next()) {
				PaymentReportVO payment = new PaymentReportVO();
				payment.setMemberID(rs.getString(1));
				payment.setBookIDList(rs.getString(2));
				payment.setBookNameList(rs.getString(3));
				payment.setBookimgList(rs.getString(4));
				payment.setBookStockList(rs.getString(5));
				payment.setBookPriceList(rs.getString(6));
				payment.setShoppingDestination(rs.getString(7));
				payment.setBuyDate(rs.getString(8));
				
				
				paylist.add(payment);
			}
		return paylist;
	}
	public PaymentReportVO onePaymentReport(PaymentReportVO paymentReportVO) throws ClassNotFoundException,SQLException{
		PaymentReportVO payment = null;
		String sql = "select * from paymentReport where memberID =? and to_char(buyDate,'YYYY-MM-DD hh24:mi:ss') = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, paymentReportVO.getMemberID());
		pstmt.setString(2, paymentReportVO.getBuyDate());
		rs = pstmt.executeQuery();
			while(rs.next()) {
				payment = new PaymentReportVO();
				payment.setMemberID(rs.getString(1));
				payment.setBookIDList(rs.getString(2));
				payment.setBookNameList(rs.getString(3));
				payment.setBookimgList(rs.getString(4));
				payment.setBookStockList(rs.getString(5));
				payment.setBookPriceList(rs.getString(6));
				payment.setShoppingDestination(rs.getString(7));
				payment.setBuyDate(rs.getString(8));
			
			}
		return payment;
	}
	//상품 구매시
	public String insertPaymentReport(PaymentReportVO paymentReportVO)throws ClassNotFoundException , SQLException{
		DateFormat fom = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date= new Date();
		String nowdate=fom.format(date);
		String sql = "insert into paymentReport values(?,?,?,?,?,?,?,TO_DATE(? ,'YYYY-MM-DD hh24:mi:ss'))";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, paymentReportVO.getMemberID());
		pstmt.setString(2, paymentReportVO.getBookIDList());
		pstmt.setString(3, paymentReportVO.getBookNameList());
		pstmt.setString(4, paymentReportVO.getBookimgList());
		pstmt.setString(5, paymentReportVO.getBookStockList());
		pstmt.setString(6, paymentReportVO.getBookPriceList());
		pstmt.setString(7, paymentReportVO.getShoppingDestination());
		pstmt.setString(8, nowdate);
		
		if(pstmt.executeUpdate()==0) {
			   return "NO";
		   }else {
			   return nowdate;
		   }
	}
	//구매내역 삭제 
	public void deletePaymentReport(PaymentReportVO paymentReportVO)throws ClassNotFoundException, SQLException{
		String sql = "delete from paymentReport where memberID = ? and to_char(buyDate,'YYYY-MM-DD hh24:mi:ss') = ?";
			
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, paymentReportVO.getMemberID());
		pstmt.setString(2, paymentReportVO.getBuyDate());
	}
}
