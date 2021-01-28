package com.kabookja.data.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.kabookja.data.vo.BooksVO;
import com.kabookja.data.vo.EbooksVO;

public interface BooksService {
	//모든 책 가져오기 
	public ArrayList<BooksVO> books_All(BooksVO bookVO) throws ClassNotFoundException, SQLException; 
	//년간 베스트셀러
	public ArrayList<BooksVO> books_bestSellerOfTheYear(BooksVO bookVO,int index) throws ClassNotFoundException, SQLException;
	//월간 베스트셀러
	public ArrayList<BooksVO> books_bestSellerOfTheMonth(BooksVO bookVO,int index) throws ClassNotFoundException, SQLException;
	//책 한권 상세
	public BooksVO books_oneBook(BooksVO bookVO)throws ClassNotFoundException, SQLException;
	//책 등록하기
	public int books_bookInsert(BooksVO bookVO)throws ClassNotFoundException, SQLException;
	//책 수정하기
	public int books_bookUpdate(BooksVO bookVO)throws ClassNotFoundException, SQLException;
	//책 삭제하기
	public int books_bookDelete(BooksVO bookVO)throws ClassNotFoundException, SQLException;
	//ebook 전체 불러오기
	public ArrayList<EbooksVO> ebooks_All(BooksVO bookVO)throws SQLException;
	//ebook 한개 불러오기
	public EbooksVO ebooks_one(BooksVO bookVO)throws SQLException;
}
