<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>




<form action="memberTest.do" accept-charset="utf-8">
	<input type="submit" value="member관련메소드">
</form>
<hr>
<form action="bookTest.do" accept-charset="utf-8">
	<input type="submit" value="book관련메소드">
</form>
<hr>
<form action="serviceTest.do" accept-charset="utf-8">
	<input type="submit" value="service관련메소드">
</form>
<hr>
<form action="cslist.do" accept-charset="utf-8">
<input type="submit" value="게시판가보기">
</form>
<hr>
</body>
</html>
