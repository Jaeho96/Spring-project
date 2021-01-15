<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>월간 베스트셀러</h1>
<form action="books_bestSellerOfTheMonth.do" accept-charset="utf-8">
	빈값으로 둬도된다<br>
	국내 or 해외<input type="text" name="bookRegion"><br>
	카테고리(소설,SF,에세이,자기계발,전문서적)<input type="text" name="bookCategory"><br>
	<input type="submit" value="다음">
</form>
<hr>
<h1>연간 베스트셀러</h1>
<form action="books_bestSellerOfTheYear.do" accept-charset="utf-8">
	빈값으로 둬도된다<br>
	국내 or 해외<input type="text" name="bookRegion"><br>
	카테고리(소설,SF,에세이,자기계발,전문서적)<input type="text" name="bookCategory"><br>
	<input type="submit" value="다음">
</form>
<hr>
<h1>책전체 조회하기</h1>
<form action="books_All.do" accept-charset="utf-8">
	빈값으로 둬도된다<br>
	검색<input type="text" name="bookName" value=""><br>
	국내 or 해외<input type="text" name="bookRegion"><br>
	카테고리(소설,SF,에세이,자기계발,전문서적)<input type="text" name="bookCategory"><br>
	<input type="submit" value="다음">
</form>
<hr>
<h1>책 추가하기</h1>
<form action="books_bookInsert.do" accept-charset="utf-8">
	책이름<input type="text" name="bookName" value="name"><br>
	저자<input type="text" name="bookWriter" value="writer"><br>
	출판사<input type="text" name="bookPublisher" value="publisher"><br>
	책 재고량(숫자)<input type="text" name="bookStock" value="stock"><br>
	가격(숫자)<input type="text" name="bookPrice" value="price"><br>
	국내 or 해외<input type="text" name="bookRegion" value="region"><br>
	카테고리(소설,SF,에세이,자기계발,전문서적)<input type="text" name="bookCategory" value="category"><br>
	발간일<input type="text" name="bookDate" value="date"><br>
	<input type="submit" value="다음">
</form>
<hr>
<h1>책 내용수정</h1>
<form action="books_bookUpdate.do" accept-charset="utf-8">
	책아이디 히든 처리되있음
	<input type="hidden" name="bookID" value="OV20200708ES20210107">
	<input type="text" name="bookName" value="고고고">
	<input type="text" name="bookWriter" value="글쓴이">
	<input type="text" name="bookPublisher" value="글적는집">
	<input type="text" name="bookStock" value="5">
	<input type="text" name="bookPrice" value="17000">
	<input type="text" name="bookRegion" value="국내">
	<input type="text" name="bookCategory" value="소설">
	<input type="text" name="bookDate" value="2020-10-10">
	<input type="submit" value="다음">
</form>
<hr>
<h1>책내용삭제</h1>
<form action="books_bookDelete.do" accept-charset="utf-8">
	<input type="text" name="bookID" value="aaa7777">
	<input type="submit" value="다음">
</form>
</body>
</html>