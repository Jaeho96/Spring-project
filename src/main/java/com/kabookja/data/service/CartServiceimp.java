package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kabookja.data.dao.CartDAO;
import com.kabookja.data.service.CartService;
import com.kabookja.data.vo.CartVO;
import com.kabookja.data.vo.MembersVO;

@Service("CartService")
public class CartServiceimp implements CartService{

	@Autowired
	private CartDAO cartDAO;

	@Override
	public void deleteCart(String[] cartID,String memberID) throws ClassNotFoundException, SQLException{
		cartDAO.deleteCart(cartID,memberID);
	}
	

	@Override
	public String insertCart(String bookID,String memberID,String amount) throws ClassNotFoundException, SQLException{
		return cartDAO.insertCart(bookID,memberID,amount);
	}

	@Override
	public ArrayList<CartVO> allCart(CartVO cartVO) throws ClassNotFoundException, SQLException {
		return cartDAO.allCart(cartVO);
	}


	@Override
	public void updateCart(CartVO cartVO) throws ClassNotFoundException, SQLException{
		cartDAO.updateCart(cartVO);
	}


	@Override
	public void clearCart(String memberID) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		cartDAO.clearCart(memberID);
	}

}
