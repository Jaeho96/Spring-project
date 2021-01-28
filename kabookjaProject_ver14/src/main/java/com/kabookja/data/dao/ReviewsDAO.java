package com.kabookja.data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.kabookja.data.dbconn.kabookjaDBConn;
import com.kabookja.data.vo.*;

@Repository
public class ReviewsDAO {
	
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	
	public ReviewsDAO() throws ClassNotFoundException,SQLException{
		con = new kabookjaDBConn().getConnection();
	}
	//책아이디로 리뷰 불러오기
	public ArrayList<ReviewsVO> booksAllReview(BooksVO booksVO) throws ClassNotFoundException, SQLException{
		ArrayList<ReviewsVO> reviewList = new ArrayList<ReviewsVO>();
		String booksID = booksVO.getBookID();
		
		String sql = "select r.*,m.nickname from reviews r,members m where m.memberid=r.memberid and bookID =?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,booksID);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ReviewsVO review = new ReviewsVO();
			review.setReviewsMemberID(rs.getString("memberID"));
			review.setReviewsNickname(rs.getString("nickname"));
			review.setReviewsBookID(rs.getString("bookID"));
			review.setReviewsDate(rs.getString("reviewDate"));
			review.setReviewsContent(rs.getString("reviewContent"));
			review.setReviewsStarPoint(rs.getInt("reviewStarPoint"));
			reviewList.add(review);
		}
		return reviewList;
	}
	
	public ArrayList<ReviewsVO> allReview(ReviewsVO reviewVO) throws ClassNotFoundException, SQLException{
		ArrayList<ReviewsVO> reviewList = new ArrayList<ReviewsVO>();
		String sql = "select * from reviews ";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ReviewsVO review = new ReviewsVO();
			review.setReviewsMemberID(rs.getString(1));
			review.setReviewsBookID(rs.getString(2));
			review.setReviewsDate(rs.getString(3));
			review.setReviewsContent(rs.getString(4));
			review.setReviewsStarPoint(rs.getInt(5));
			
			reviewList.add(review);
		}
		return reviewList;
	}
	public ArrayList<ReviewsVO> myAllReview(ReviewsVO reviewVO , MembersVO membersVO) throws ClassNotFoundException, SQLException{
		ArrayList<ReviewsVO> reviewList = new ArrayList<ReviewsVO>();
		//내가쓴 모든 리뷰
		String membersID = membersVO.getMemberID();
		
		String sql = "select * from reviews where memberID = "+ membersID;
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ReviewsVO review = new ReviewsVO();
			review.setReviewsMemberID(rs.getString("memberID"));
			review.setReviewsBookID(rs.getString("bookID"));
			review.setReviewsDate(rs.getString("reviewDate"));
			review.setReviewsContent(rs.getString("reviewContent"));
			review.setReviewsStarPoint(rs.getInt("reviewStarPoint"));
			
			reviewList.add(review);
		}
		return reviewList;
	}
	
	
	public void deleteReview(ReviewsVO reviewsVO) throws ClassNotFoundException, SQLException{
		
		String sql = "delete from reviews where memberID = ? and bookID = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, reviewsVO.getReviewsMemberID());	//누구의 계정을
		pstmt.setString(2, reviewsVO.getReviewsBookID());	// 어느책에서
		pstmt.executeUpdate();
	}
	
	public void updateReview(ReviewsVO reviewsVO) throws  ClassNotFoundException, SQLException{
		//내용 수정 
		String sql = "update reviews set reviewContent = ? , reviewDate = sysdate , reviewStarPoint= ?  where bookID = ? and memberID = ? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, reviewsVO.getReviewsContent());	//수정할 내용
		pstmt.setInt(2, reviewsVO.getReviewsStarPoint());
		pstmt.setString(3, reviewsVO.getReviewsBookID());
		pstmt.setString(4, reviewsVO.getReviewsMemberID());
		pstmt.executeUpdate();
	}
	
	public void insertReview(ReviewsVO reviewsVO) throws ClassNotFoundException, SQLException{
		String sql = "insert into reviews VALUES(?,?,sysdate,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, reviewsVO.getReviewsMemberID());
		pstmt.setString(2, reviewsVO.getReviewsBookID());
		pstmt.setString(3, reviewsVO.getReviewsContent());
		pstmt.setInt(4, reviewsVO.getReviewsStarPoint());
		pstmt.executeUpdate();
	}
}
