package com.kabookja.controller;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kabookja.data.service.BooksService;
import com.kabookja.data.service.ReviewsService;
import com.kabookja.data.vo.BooksVO;

@Controller
public class BooksController {
	
	@Resource(name="BooksService")
	private BooksService booksService;
	@Resource(name="ReviewService")
	private ReviewsService reviewsService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(BooksVO booksVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("bestYear",booksService.books_bestSellerOfTheYear(booksVO, 3));
		model.addAttribute("bestMonth",booksService.books_bestSellerOfTheMonth(booksVO, 3));
		return "/main/main";	
	}
	@RequestMapping("/main.do")
	public String tmain(BooksVO booksVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("bestYear",booksService.books_bestSellerOfTheYear(booksVO, 3));
		model.addAttribute("bestMonth",booksService.books_bestSellerOfTheMonth(booksVO, 3));
		return "/main/main";	
	}
	@RequestMapping("/search.do")
	public String search(String job,BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		int returnSW=0;
		switch (job) {
		case "all":model.addAttribute("books",booksService.books_All(bookVO));
			break;
		case "domestic":bookVO.setBookRegion("국내");
			model.addAttribute("books",booksService.books_All(bookVO));
			break;
		case "overseas":bookVO.setBookRegion("해외");
			model.addAttribute("books",booksService.books_All(bookVO));
			break;
		default:
			model.addAttribute("ebooks",booksService.ebooks_All(bookVO));
			returnSW=1;
			break;
		}
		model.addAttribute("searchWord",bookVO.getBookName());
		if(returnSW==0) {
			return "/search/search";
		}else {
			return "/search/ebooksearch";
		}
	}
	@RequestMapping("/sidebarMenu.do")
	public String sideSelect(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("books",booksService.books_All(bookVO));
		model.addAttribute("RC",bookVO);
		return "/search/search";
	}
	@RequestMapping("/sidebarEbookMenu.do")
	public String sideESelect(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("ebooks",booksService.ebooks_All(bookVO));
		model.addAttribute("RC",bookVO);
		return "/search/ebooksearch";
	}
	@RequestMapping("bookInformation.do")
	public String bookInformation(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("book",booksService.books_oneBook(bookVO));
		model.addAttribute("reviewlist", reviewsService.booksAllReview(bookVO));
		return "/search/bookInformation";
	}
	@RequestMapping("ebookInformation.do")
	public String ebookInformation(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("ebook",booksService.ebooks_one(bookVO));
		model.addAttribute("reviewlist", reviewsService.booksAllReview(bookVO));
		return "/search/ebookInformation";
	}
	/*@RequestMapping("/books_All.do")
	public String books_All(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("books",booksService.books_All(bookVO));
		return "/test/test";
	}
	@RequestMapping("/books_bookInsert.do")
	public String books_bookInsert(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		booksService.books_bookInsert(bookVO);
		return "redirect:test.do";
	}
	@RequestMapping("/books_bookUpdate.do")
	public String books_bookUpdate(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		booksService.books_bookUpdate(bookVO);
		return "redirect:test.do";
	}
	@RequestMapping("/books_bookDelete.do")
	public String books_bookDelete(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		booksService.books_bookDelete(bookVO);
		return "redirect:test.do";
	}*/
	
}
