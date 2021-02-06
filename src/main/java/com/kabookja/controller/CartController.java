package com.kabookja.controller;

import java.sql.SQLException;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kabookja.data.service.CartService;
import com.kabookja.data.vo.*;

@Controller
public class CartController {
	
	@Resource(name = "CartService") 
	private CartService cartService;
	
	@RequestMapping(value = "cart.do")
	public String cart(CartVO cartVO,Model model) throws ClassNotFoundException ,SQLException{
		if(cartVO.getMemberID()==null || cartVO.getMemberID()=="") {
			return "sys/noLogin";
		}else {
			model.addAttribute("cartlist", cartService.allCart(cartVO));
			return "cart/cart";
		}
	}
	@RequestMapping(value = "deleteCart.do")
		public String deleteCart(String[] cartID,String memberID)throws ClassNotFoundException, SQLException{
		
		cartService.deleteCart(cartID,memberID);
		return "redirect:cart.do?memberID="+memberID;
	}
	@RequestMapping(value = "clearCart.do")
		public String clearCart(String memberID,String date)throws ClassNotFoundException, SQLException{
	
		cartService.clearCart(memberID);
		return "redirect:PaymentReportDetail.do?memberID="+memberID+"&BuyDate="+date;
	}
	@RequestMapping(value = "/cartInsert.do")
	@ResponseBody
	public String cartInsert(String bookID,String memberID,String amount)throws ClassNotFoundException, SQLException{
		return cartService.insertCart(bookID,memberID,amount);
	}

	
	/*@RequestMapping(value = "/allCart.do")
		public String cartAll(CartVO cartVO,MembersVO memberVO,Model model) throws ClassNotFoundException ,SQLException{
		model.addAttribute("cartlist", cartService.allCart(cartVO));
		return "test/test";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/updateCart.do")
	public String updateCart(CartVO cartVO,Model model)throws ClassNotFoundException, SQLException{
		cartService.updateCart(cartVO);
		return "redirect:allCart.do";
	}*/
}
