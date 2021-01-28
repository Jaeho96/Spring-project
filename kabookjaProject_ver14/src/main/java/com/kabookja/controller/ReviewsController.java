package com.kabookja.controller;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kabookja.data.service.ReviewsService;
import com.kabookja.data.vo.BooksVO;
import com.kabookja.data.vo.MembersVO;
import com.kabookja.data.vo.ReviewsVO;

@Controller
public class ReviewsController {

	@Resource(name="ReviewService")
	private ReviewsService reviewsService;
	
	@RequestMapping(value = "/allReview.do")
	public String allReview(ReviewsVO reviewsVO,Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("reviewlist", reviewsService.allReview(reviewsVO));
		return "test/test";
	}
	@RequestMapping(value = "/myAllReview.do")
	public String myAllReview(ReviewsVO reviewsVO,MembersVO membersVO, Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("reviewlist", reviewsService.myAllReview(reviewsVO,membersVO));
		return "test/test";
	}
	@RequestMapping(value = "/booksAllReview.do")
	public String booksAllReview(BooksVO booksVO, Model model)throws ClassNotFoundException, SQLException{
		model.addAttribute("reviewlist", reviewsService.booksAllReview(booksVO));
		return "test/test";
	}
	@RequestMapping(value = "/deleteReview.do")
	public String deleteReview(ReviewsVO reviewsVO , Model model)throws ClassNotFoundException, SQLException{
		reviewsService.deleteReview(reviewsVO);
		return "redirect:allReview.do";
	}
	@RequestMapping(value = "/updateReview.do")
	public String updateReview(ReviewsVO reviewsVO, Model model)throws ClassNotFoundException, SQLException{
		reviewsService.updateReview(reviewsVO);
		System.out.println(reviewsVO.getReviewsContent());
		return "redirect:allReview.do";
	}
	@RequestMapping(value = "/insertReview.do")
	public String insertReview(ReviewsVO reviewsVO, Model model)throws ClassNotFoundException, SQLException{
		reviewsService.insertReview(reviewsVO);
		return "redirect:allReview.do";
	}
	
	
}
