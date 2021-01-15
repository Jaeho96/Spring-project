package com.kabookja.controller;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kabookja.data.service.BooksService;
import com.kabookja.data.service.MembersService;
import com.kabookja.data.vo.BooksVO;
import com.kabookja.data.vo.MembersVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BooksController {
	
	private static final Logger logger = LoggerFactory.getLogger(BooksController.class);
	@Resource(name="BooksService")
	private BooksService booksService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/test/home";
	}
	@RequestMapping("/books_All.do")
	public String books_All(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("books",booksService.books_All(bookVO));
		return "/test/test";
	}
	@RequestMapping("/books_bestSellerOfTheYear.do")
	public String books_bestSellerOfTheYear(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("books",booksService.books_bestSellerOfTheYear(bookVO, 3));
		return "/test/test";
	}
	@RequestMapping("/books_bestSellerOfTheMonth.do")
	public String books_bestSellerOfTheMonth(BooksVO bookVO,Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("books",booksService.books_bestSellerOfTheMonth(bookVO, 3));
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
	}
	
	
}
