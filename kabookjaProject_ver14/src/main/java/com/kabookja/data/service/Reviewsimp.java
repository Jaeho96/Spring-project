package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kabookja.data.dao.ReviewsDAO;
import com.kabookja.data.vo.BooksVO;
import com.kabookja.data.vo.MembersVO;
import com.kabookja.data.vo.ReviewsVO;

@Service("ReviewService")
public class Reviewsimp implements ReviewsService{
	
	@Autowired
	private ReviewsDAO reviewsDAO;

	@Override
	public ArrayList<ReviewsVO> allReview(ReviewsVO reviewVO)
			throws ClassNotFoundException, SQLException {
		return reviewsDAO.allReview(reviewVO);
	}

	@Override
	public ArrayList<ReviewsVO> myAllReview(ReviewsVO reviewVO, MembersVO membersVO)
			throws ClassNotFoundException, SQLException {
		return reviewsDAO.myAllReview(reviewVO, membersVO);
	}

	@Override
	public ArrayList<ReviewsVO> booksAllReview(BooksVO booksVO)
			throws ClassNotFoundException, SQLException {
		return reviewsDAO.booksAllReview(booksVO);
	}

	@Override
	public void deleteReview(ReviewsVO reviewsVO) throws ClassNotFoundException, SQLException {
		reviewsDAO.deleteReview(reviewsVO);
	}

	@Override
	public void updateReview(ReviewsVO reviewsVO) throws ClassNotFoundException, SQLException {
		reviewsDAO.updateReview(reviewsVO);
	}

	@Override
	public void insertReview(ReviewsVO reviewsVO) throws ClassNotFoundException, SQLException {
		reviewsDAO.insertReview(reviewsVO);
	}
	
	
}
