package com.kabookja.data.vo;

public class PaymentReportVO {
	private String MemberID;
	private String BookIDList;
	private String BookNameList;
	private String BookimgList;
	private String BookStockList;
	private String BookPriceList;
	private String shoppingDestination;
	private String buyDate;
	
	public PaymentReportVO(String memberID, String bookIDList,String bookNameList,String bookimgList,String bookStockList, String bookPriceList,
			String shoppingDestination, String buyDate) {
		this.MemberID = memberID;
		this.BookIDList = bookIDList;
		this.BookNameList = bookNameList;
		this.BookimgList = bookimgList;
		this.BookStockList = bookStockList;
		this.BookPriceList = bookPriceList;
		this.shoppingDestination = shoppingDestination;
		this.buyDate = buyDate;
	}

	public String getBookimgList() {
		return BookimgList;
	}

	public void setBookimgList(String bookimgList) {
		BookimgList = bookimgList;
	}

	public String getBookNameList() {
		return BookNameList;
	}

	public void setBookNameList(String bookNameList) {
		BookNameList = bookNameList;
	}

	public String getMemberID() {
		return MemberID;
	}

	public void setMemberID(String memberID) {
		MemberID = memberID;
	}

	public String getBookIDList() {
		return BookIDList;
	}

	public void setBookIDList(String bookIDList) {
		BookIDList = bookIDList;
	}

	public String getBookStockList() {
		return BookStockList;
	}

	public void setBookStockList(String bookStockList) {
		BookStockList = bookStockList;
	}

	public String getBookPriceList() {
		return BookPriceList;
	}

	public void setBookPriceList(String bookPriceList) {
		BookPriceList = bookPriceList;
	}

	public String getShoppingDestination() {
		return shoppingDestination;
	}

	public void setShoppingDestination(String shoppingDestination) {
		this.shoppingDestination = shoppingDestination;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public PaymentReportVO() {}
	/*
	public PaymentReportVO(String buyReportMemberID,String buyReportBookID,int buyReportBookStock, String shoppingDestination,String deliveryDate
			,int paymentAmount) {
		this.buyReportBookID = buyReportBookID;
		this.buyReportMemberID = buyReportMemberID;
		this.buyReportBookStock = buyReportBookStock;
		this.deliveryDate = deliveryDate;
		this.paymentAmount = paymentAmount;
	}
	
	public String getBuyReportMemberID() {
		return buyReportMemberID;
	}
	public void setBuyReportMemberID(String buyReportMemberID) {
		this.buyReportMemberID = buyReportMemberID;
	}
	public String getBuyReportBookID() {
		return buyReportBookID;
	}
	public void setBuyReportBookID(String buyReportBookID) {
		this.buyReportBookID = buyReportBookID;
	}
	public int getBuyReportBookStock() {
		return buyReportBookStock;
	}
	public void setBuyReportBookStock(int buyReportBookStock) {
		this.buyReportBookStock = buyReportBookStock;
	}
	public String getShoppingDestination() {
		return shoppingDestination;
	}
	public void setShoppingDestination(String shoppingDestination) {
		this.shoppingDestination = shoppingDestination;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}*/
}
