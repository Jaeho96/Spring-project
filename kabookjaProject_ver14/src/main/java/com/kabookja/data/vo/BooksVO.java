package com.kabookja.data.vo;

import java.util.Date;

public class BooksVO {
	private String bookID; //책 식별번호
	private String bookName; //책 이름
	private String bookWriter; //저자
	private String bookPublisher; //출판사
	private int	bookStock;		//책 재고량
	private int bookPrice;		//책 가격
	private String bookRegion; //국외 또는 국내인지 
	private String bookCategory; //책 분류
	private String bookDate;
	private String bookimg;
	public BooksVO() {}
	public BooksVO(String bookID, String bookName, String bookWriter, String bookPublisher, int bookStock,
			int bookPrice, String bookRegion, String bookCategory, String bookDate,String bookimg) {
		this.bookID = bookID;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.bookPublisher = bookPublisher;
		this.bookStock = bookStock;
		this.bookPrice = bookPrice;
		this.bookRegion = bookRegion;
		this.bookCategory = bookCategory;
		this.bookDate = bookDate;
		this.bookimg = bookimg;
	}
	public String getBookimg() {
		return bookimg;
	}
	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
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
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	public String getBookRegion() {
		return bookRegion;
	}
	public void setBookRegion(String bookRegion) {
		this.bookRegion = bookRegion;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public int getBookStock() {
		return bookStock;
	}
	public void setBookStock(int bookStock) {
		this.bookStock = bookStock;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String date) {
		this.bookDate = date;
	}
}
