package com.kabookja.data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kabookja.data.dbconn.kabookjaDBConn;
import com.kabookja.data.vo.EbookBuyListVO;

@Repository
public class EbookBuyListDAO {
	
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	   
	public EbookBuyListDAO() throws ClassNotFoundException, SQLException{
	   con = new kabookjaDBConn().getConnection();
	}
	public ArrayList<EbookBuyListVO> all_buyList(EbookBuyListVO ebookBuyListVO) throws ClassNotFoundException, SQLException{
	      ArrayList<EbookBuyListVO> ebookbuylist = new ArrayList<EbookBuyListVO>();
	      String sql = "select b.bookid,b.bookimg,b.bookname,b.bookwriter,b.bookpublisher "+
	    		  "from books b,ebookbuylist el "+
	    		  "where el.bookid=b.bookid and el.memberid=?";
	      
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, ebookBuyListVO.getMemberID());
	      rs = pstmt.executeQuery();
	      while(rs.next()) {
	    	 EbookBuyListVO ebookbuy = new EbookBuyListVO();
	         ebookbuy.setBookID(rs.getString(1));
	         ebookbuy.setBookimg(rs.getString(2));     
	         ebookbuy.setBookName(rs.getString(3));  
	         ebookbuy.setBookWriter(rs.getString(4));
	         ebookbuy.setBookPublisher(rs.getString(5));
	         ebookbuylist.add(ebookbuy);
	      }
	      return ebookbuylist;
	   }
	public String insert_buyList(String bookID,String memberID)throws ClassNotFoundException, SQLException{
		String sql ="insert into ebookbuylist VALUES(?,?)";
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, memberID);
		   pstmt.setString(2, bookID);
			   
		   if(pstmt.executeUpdate()==0) {
			   return "NO";
		   }else {
			   return "OK";
		   }
	}
}
