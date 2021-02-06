package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kabookja.data.vo.CartVO;
import com.kabookja.data.vo.MembersVO;

public interface CartService {
	ArrayList<CartVO> allCart(CartVO cartVO) throws ClassNotFoundException, SQLException;
	void deleteCart(String[] cartID,String memberID) throws ClassNotFoundException, SQLException;
	void updateCart(CartVO cartVO) throws ClassNotFoundException, SQLException;
	String insertCart(String bookID,String memberID,String amount)throws ClassNotFoundException, SQLException;
	public void clearCart(String memberID) throws ClassNotFoundException, SQLException;
}
  