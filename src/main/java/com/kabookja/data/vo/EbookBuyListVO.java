package com.kabookja.data.vo;

public class EbookBuyListVO {
	private String memberID;
	private String bookID;
	private String bookimg;
	private String bookName;
	private String bookWriter;
	private String bookPublisher;
	
	public EbookBuyListVO() {}
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
	public String getBookimg() {
		return bookimg;
	}
	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
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
	public EbookBuyListVO(String memberID, String bookID, String bookimg, String bookName, String bookWriter,
			String bookPublisher) {
		this.memberID = memberID;
		this.bookID = bookID;
		this.bookimg = bookimg;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.bookPublisher = bookPublisher;
	}
}
