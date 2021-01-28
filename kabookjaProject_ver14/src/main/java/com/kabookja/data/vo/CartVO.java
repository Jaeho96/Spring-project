package com.kabookja.data.vo;

public class CartVO {
	private String cartID;
	private String memberID;
	private String bookID;
	//////////////////////////////////////////////////////////////////
	//아래부터 gui에 각 장바구니 항복에 맞는 내용입니다
	private String bookName;	//상품명
	private int bookPrice;		//정가
	private int bookStock;			//수량
	private String bookimg;
	
	public String getBookimg() {
		return bookimg;
	}

	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
	}

	public CartVO() {}

	public CartVO(String cartID, String memberID, String bookID, String bookName, int bookPrice, int bookStock,String bookimg) {
		this.cartID = cartID;
		this.memberID = memberID;
		this.bookID = bookID;
		this.bookName = bookName;
		this.bookPrice = bookPrice;
		this.bookStock = bookStock;
		this.bookimg=bookimg;
	}

	public String getCartID() {
		return cartID;
	}

	public void setCartID(String cartID) {
		this.cartID = cartID;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getBookID() {
		return bookID;
	}

	public void setBookID(String bookID) {
		this.bookID = bookID;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public int getBookStock() {
		return bookStock;
	}

	public void setBookStock(int bookStock) {
		this.bookStock = bookStock;
	}
	
}
