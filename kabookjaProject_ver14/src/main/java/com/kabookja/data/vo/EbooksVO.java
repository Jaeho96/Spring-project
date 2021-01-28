package com.kabookja.data.vo;

public class EbooksVO {
	private String bookID; //책 ID
	private int ebookPrice; //ebook가격
	private String ebookContent; //책 내용
	private String bookName; //책 이름
	private String bookWriter; //저자
	private String bookPublisher; //출판사
	private String bookRegion; //국외 또는 국내인지 
	private String bookCategory; //책 분류
	private String bookDate;
	private String bookimg;
	public EbooksVO(String bookID, int ebookPrice, String ebookContent, String bookName, String bookWriter,
			String bookPublisher, String bookRegion, String bookCategory, String bookDate,String bookimg) {
		this.bookID = bookID;
		this.ebookPrice = ebookPrice;
		this.ebookContent = ebookContent;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.bookPublisher = bookPublisher;
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
	public int getEbookPrice() {
		return ebookPrice;
	}
	public void setEbookPrice(int ebookPrice) {
		this.ebookPrice = ebookPrice;
	}
	public String getEbookContent() {
		return ebookContent;
	}
	public void setEbookContent(String ebookContent) {
		this.ebookContent = ebookContent;
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
	public String getBookDate() {
		return bookDate;
	}
	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}
	
}
