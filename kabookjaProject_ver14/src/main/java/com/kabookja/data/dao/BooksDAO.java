package com.kabookja.data.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.stereotype.Repository;

import com.kabookja.data.dbconn.kabookjaDBConn;
import com.kabookja.data.vo.BooksVO;
import com.kabookja.data.vo.EbooksVO;

@Repository
public class BooksDAO {
	
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	public BooksDAO()throws ClassNotFoundException, SQLException {
		con = new kabookjaDBConn().getConnection();
	}
	//년간 베스트셀러 가져오기
	public ArrayList<BooksVO> books_bestSellerOfTheYear(BooksVO bookVO,int index)throws SQLException{
		ArrayList<BooksVO> bookArray = new ArrayList<BooksVO>();
		String region=booksifRegion(bookVO);
		String category=booksifCategory(bookVO);
		String sql = "select b.* from books b,(select bookid,sum(sales1+sales2+sales3+sales4+sales5+"+ 
				"sales6+sales7+sales8+sales9+sales10+sales11+sales12) as sale from salesperformance "+
				"group by bookid ORDER by sale desc) s WHERE s.bookid=b.bookid and ROWNUM <="+index+region+category;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			BooksVO book = new BooksVO(rs.getString("bookID"),rs.getString("bookName"),
					rs.getString("bookWriter"),rs.getString("bookPublisher"),
					rs.getInt("bookStock"),rs.getInt("bookPrice"),
					rs.getString("bookRegion"),rs.getString("bookCategory"),df.format(rs.getDate("bookDate")),rs.getString("bookimg"));
			bookArray.add(book);
		}
		return bookArray;
	}
	//월간 베스트셀러 가져오기
	public ArrayList<BooksVO> books_bestSellerOfTheMonth(BooksVO bookVO,int index)throws SQLException{
		ArrayList<BooksVO> bookArray = new ArrayList<BooksVO>();
		String region=booksifRegion(bookVO);
		String category=booksifCategory(bookVO);
		
		//--thisMonth : 해당 월과 그 전월의 컬럼이담긴 스트링을 얻는다
		Calendar cal = Calendar.getInstance();
		int month = cal.get ( cal.MONTH ) + 1 ;
		int lastMonth=0;
		if(month==1) {
			lastMonth=12;
		}else {
			lastMonth=month-1;
		}
		String thisMonth="sales"+lastMonth+"+sales"+month;
		//--thisMonth end
		
		String sql = "select b.* from books b,(select bookid,sum("+thisMonth+") as sale from salesperformance "+
				"group by bookid ORDER by sale desc) s WHERE s.bookid=b.bookid and ROWNUM <="+index+region+category;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			BooksVO book = new BooksVO(rs.getString("bookID"),rs.getString("bookName"),
					rs.getString("bookWriter"),rs.getString("bookPublisher"),
					rs.getInt("bookStock"),rs.getInt("bookPrice"),
					rs.getString("bookRegion"),rs.getString("bookCategory"),df.format(rs.getDate("bookDate")),rs.getString("bookimg"));
			bookArray.add(book);
		}
		return bookArray;
	}
	//책 전체 가져오기
	public ArrayList<BooksVO> books_All(BooksVO bookVO)throws SQLException{
		ArrayList<BooksVO> bookArray = new ArrayList<BooksVO>();
		String name=booksifName(bookVO);
		String region=booksifRegion(bookVO);
		String category=booksifCategory(bookVO);

		String sql = "SELECT * FROM BOOKS b where bookid is not null"+name+region+category;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			BooksVO book = new BooksVO(rs.getString("bookID"),rs.getString("bookName"),
					rs.getString("bookWriter"),rs.getString("bookPublisher"),
					rs.getInt("bookStock"),rs.getInt("bookPrice"),
					rs.getString("bookRegion"),rs.getString("bookCategory"),df.format(rs.getDate("bookDate")),rs.getString("bookimg"));
			bookArray.add(book);
		}
		return bookArray;
	}
	//책 하나 가져오기
	public BooksVO books_oneBook(BooksVO bookVO) throws SQLException {
		BooksVO book=null;
		String sql = "SELECT * FROM BOOKS b where bookid='"+bookVO.getBookID()+"'";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			book = new BooksVO(rs.getString("bookID"),rs.getString("bookName"),
					rs.getString("bookWriter"),rs.getString("bookPublisher"),
					rs.getInt("bookStock"),rs.getInt("bookPrice"),
					rs.getString("bookRegion"),rs.getString("bookCategory"),rs.getString("bookDate"),rs.getString("bookimg"));
		}
		return book;
	}
	//책정보 등록하기
	public int books_bookInsert(BooksVO bookVO)  throws SQLException {
		String sql1 = "INSERT into BOOKS values(?,?,?,?,?,?,?,?,?)";
	
		pstmt = con.prepareStatement(sql1);
		pstmt.setString(1,bookVO.getBookID());
		pstmt.setString(2,bookVO.getBookName());
		pstmt.setString(3,bookVO.getBookWriter());
		pstmt.setString(4,bookVO.getBookPublisher());
		pstmt.setInt(5,bookVO.getBookStock());
		pstmt.setInt(6,bookVO.getBookPrice());
		pstmt.setString(7,bookVO.getBookRegion());
		pstmt.setString(8,bookVO.getBookCategory());
		pstmt.setDate(9,Date.valueOf(bookVO.getBookDate()));
		
		int sw=pstmt.executeUpdate();
		if(!(sw==0)) {
			String sql2 = "INSERT into SalesPerformance values(?,0,0,0,0,0,0,0,0,0,0,0,0,0)";
			
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1,bookVO.getBookID());
			pstmt.executeUpdate();
		}
		return sw;	
	}	
	//책정보 수정하기
	public int books_bookUpdate(BooksVO bookVO) throws SQLException{
		String sql ="update books set bookName=?,bookWriter=?,bookPublisher=?,bookStock=?,bookPrice=?,bookRegion=?,bookCategory=?,bookDate=? where bookID=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bookVO.getBookName());
		pstmt.setString(2, bookVO.getBookWriter());
		pstmt.setString(3, bookVO.getBookPublisher());
		pstmt.setInt(4, bookVO.getBookStock());
		pstmt.setInt(5, bookVO.getBookPrice());
		pstmt.setString(6,  bookVO.getBookRegion());
		pstmt.setString(7,  bookVO.getBookCategory());
		pstmt.setString(8,  bookVO.getBookDate());
		pstmt.setString(9, bookVO.getBookID());

		return pstmt.executeUpdate();
	}
	//책정보 삭제하기
	public int books_bookDelete(BooksVO bookVO) throws SQLException {
		String sql1 = "DELETE SalesPerformance WHERE bookid = ?";
		pstmt = con.prepareStatement(sql1);
		pstmt.setString(1, bookVO.getBookID());
		pstmt.executeUpdate();
		
		String sql2 = "DELETE books WHERE bookid = ?";
		pstmt = con.prepareStatement(sql2);
		pstmt.setString(1, bookVO.getBookID());
		
		return pstmt.executeUpdate();
	}
	//검색 조건
	public String booksifName(BooksVO bookVO) {
		String name=null;
		if(bookVO.getBookName()==null || bookVO.getBookName().equals("")) {
			name="";
		}else {
			name=" and b.bookName Like "+"'%"+bookVO.getBookName()+"%'";
		}
		return name;
	}
	
	//해외 국내 조건
	public String booksifRegion(BooksVO bookVO) {
		String region=null;
		if(bookVO.getBookRegion()==null || bookVO.getBookRegion().equals("")) {
			region="";
		}else {
			region=" and b.bookregion="+"'"+bookVO.getBookRegion()+"'";
		}
		return region;
	}
	
	//카테고리 조건
	public String booksifCategory(BooksVO bookVO) {
		String category=null;
		if(bookVO.getBookCategory()==null || bookVO.getBookCategory().equals("")) {
			category="";
		}else {
			category=" and b.bookCategory="+"'"+bookVO.getBookCategory()+"'";
		}
		return category;
	}
	
	//ebook전체 조회
	public ArrayList<EbooksVO> ebooks_All(BooksVO bookVO)throws SQLException{
		ArrayList<EbooksVO> ebookArray = new ArrayList<EbooksVO>();
		String name=booksifName(bookVO);
		String category=booksifCategory(bookVO);
		String sql = "SELECT e.bookid,e.ebookPrice,e.ebookcontent,b.bookname,b.bookwriter,"+
				"b.bookpublisher,b.bookregion,b.bookCategory,b.bookDate,b.bookimg "+
				"from books b,ebooks e where b.bookid=e.bookid"+name+category;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			EbooksVO ebook = new EbooksVO(rs.getString("bookID"),rs.getInt("ebookPrice"),rs.getString("ebookContent"), 
					rs.getString("bookname"),rs.getString("bookWriter"),rs.getString("bookPublisher"),rs.getString("bookRegion"),
					rs.getString("bookCategory"),rs.getString("bookDate"),rs.getString("bookimg"));
			ebookArray.add(ebook);
		}
		return ebookArray;
	}
	//ebook 한개 조회
	public EbooksVO ebooks_one(BooksVO bookVO)throws SQLException{
		EbooksVO ebook = null;
		String sql = "SELECT e.bookid,e.ebookPrice,e.ebookcontent,b.bookname,b.bookwriter,"+
				"b.bookpublisher,b.bookregion,b.bookCategory,b.bookDate,b.bookimg "+
				"from books b,ebooks e where b.bookid=e.bookid and b.bookid=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,bookVO.getBookID());
		rs = pstmt.executeQuery();
		while(rs.next()) {
			ebook = new EbooksVO(rs.getString("bookID"),rs.getInt("ebookPrice"),rs.getString("ebookContent"), 
					rs.getString("bookname"),rs.getString("bookWriter"),rs.getString("bookPublisher"),rs.getString("bookRegion"),
					rs.getString("bookCategory"),rs.getString("bookDate"),rs.getString("bookimg"));
		}
		return ebook;
	}
}
