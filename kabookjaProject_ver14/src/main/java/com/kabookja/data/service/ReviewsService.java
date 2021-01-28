package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kabookja.data.vo.BooksVO;
import com.kabookja.data.vo.MembersVO;
import com.kabookja.data.vo.ReviewsVO;

public interface ReviewsService {
	public ArrayList<ReviewsVO> allReview(ReviewsVO reviewVO) throws ClassNotFoundException, SQLException;
	public ArrayList<ReviewsVO> myAllReview(ReviewsVO reviewVO , MembersVO membersVO) throws ClassNotFoundException, SQLException;
	public ArrayList<ReviewsVO> booksAllReview(BooksVO booksVO) throws ClassNotFoundException, SQLException;
	public void deleteReview(ReviewsVO reviewsVO) throws ClassNotFoundException, SQLException;
	public void updateReview(ReviewsVO reviewsVO) throws  ClassNotFoundException, SQLException;
	public void insertReview(ReviewsVO reviewsVO) throws ClassNotFoundException, SQLException;
}
