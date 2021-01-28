package com.kabookja.data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kabookja.data.dbconn.kabookjaDBConn;
import com.kabookja.data.vo.*;

@Repository
public class CartDAO {
   
   private Connection con;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   public CartDAO() throws ClassNotFoundException, SQLException{
      con = new kabookjaDBConn().getConnection();
   }
   //체크박스 상품명(bVO) 정가(bVO) 판매가(bVO+@) 수량(@) 합계(sum) 배송일 주문
   public ArrayList<CartVO> allCart(CartVO cartVO) throws ClassNotFoundException, SQLException{
      ArrayList<CartVO> cartlist = new ArrayList<CartVO>();
      String sql = "select c.cartId ,b.bookid ,c.memberid , b.bookname , b.bookprice , c.cartstock,b.bookimg"
    		  + "   from books b , cart c"
    		  + " where (b.bookid = c.bookid)"
    		  + " order by c.cartId asc";
      
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
         CartVO cart = new CartVO();
         cart.setCartID(rs.getString(1));
         cart.setBookID(rs.getString(2));      
         cart.setMemberID(rs.getString(3));   
         cart.setBookName(rs.getString(4));
         cart.setBookPrice(rs.getInt(5));
         cart.setBookStock(rs.getInt(6));
         cart.setBookimg(rs.getString(7));
         cartlist.add(cart);
      }
      return cartlist;
   }
   
   //주문한 경우 또는 올려놓은 상품을 삭제한 경우
   public void deleteCart(String[] cartID,String memberID) throws ClassNotFoundException, SQLException{   
	  String cartID_in="";
	  if(cartID!=null) {
		  for(int i=0;i<cartID.length;i++) {
			  if(i==cartID.length-1) {
				  cartID_in=cartID_in+"'"+cartID[i]+"'";
			  }else {
				  cartID_in=cartID_in+"'"+cartID[i]+"',";
			  }
		  }
		  cartID_in=" and cartID in("+cartID_in+")";
	  }
      String sql = "delete from cart where memberID = ?"+cartID_in;
      System.out.println(sql);
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1,memberID);
      pstmt.executeUpdate();
   }
   
   //주문내용을 수정하는 경우 => 상품갯수변경 , 배송지 변경   //배송지는 memberVO의 address 수정해야합니다. vo가 완성되면 작업하겠습니다. join이 안되서요
   public void updateCart(CartVO cartVO)throws ClassNotFoundException, SQLException{
      String sql = "update cart set cartstock = ? where memberID= ? and cartID = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, cartVO.getBookStock());
      pstmt.setString(2, cartVO.getMemberID());
      pstmt.setString(3, cartVO.getCartID());
      pstmt.executeUpdate();
   }   //상품 수량변경
   
   //담기
   public String insertCart(String bookID,String memberID,String amount) throws ClassNotFoundException, SQLException{
	   String sql ="insert into cart values(TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),?,?,?)";
	   pstmt = con.prepareStatement(sql);
	   pstmt.setString(1, memberID);
	   pstmt.setString(2, bookID);
	   pstmt.setInt(3, Integer.parseInt(amount));
		   
	   if(pstmt.executeUpdate()==0) {
		   return "NO";
	   }else {
		   return "OK";
	   }
   }
}//CartDAO