package com.kabookja.data.vo;

public class ReviewsVO {
	
	private String reviewsMemberID;
	private String reviewsNickname;
	private String reviewsBookID;
	private String reviewsDate;
	private String reviewsContent;
	private int reviewsStarPoint;
	
	public ReviewsVO() {}
	public ReviewsVO(String reviewsMemberID, String reviewsNickname,String reviewsBookID, String reviewsDate , String reviewsContent, int reviewsStarPoint) {
		this.reviewsMemberID = reviewsMemberID;
		this.reviewsNickname= reviewsNickname;
		this.reviewsBookID = reviewsBookID;
		this.reviewsDate = reviewsDate;
		this.reviewsContent = reviewsContent;
		this.reviewsStarPoint = reviewsStarPoint;
	}
	public String getReviewsNickname() {
		return reviewsNickname;
	}
	public void setReviewsNickname(String reviewsNickname) {
		this.reviewsNickname = reviewsNickname;
	}
	public String getReviewsMemberID() {
		return reviewsMemberID;
	}
	public void setReviewsMemberID(String reviewsMemberID) {
		this.reviewsMemberID = reviewsMemberID;
	}
	public String getReviewsBookID() {
		return reviewsBookID;
	}
	public void setReviewsBookID(String reviewsBookID) {
		this.reviewsBookID = reviewsBookID;
	}
	public String getReviewsDate() {
		return reviewsDate;
	}
	public void setReviewsDate(String reviewsDate) {
		this.reviewsDate = reviewsDate;
	}
	public String getReviewsContent() {
		return reviewsContent;
	}
	public void setReviewsContent(String reviewsContent) {
		this.reviewsContent = reviewsContent;
	}
	public int getReviewsStarPoint() {
		return reviewsStarPoint;
	}
	public void setReviewsStarPoint(int reviewsStarPoint) {
		this.reviewsStarPoint = reviewsStarPoint;
	}
}
