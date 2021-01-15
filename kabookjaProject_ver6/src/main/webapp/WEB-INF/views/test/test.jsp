<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- ${books.bookName} --%>
	
	<h1>성공</h1>
	<c:if test="${idCheck eq 1}">
		중복입니다.
	</c:if>
	<c:if test="${idCheck eq 0}">
		사용가능합니다.
	</c:if>
	<c:forEach var="books" items="${books}">
		${books.bookID}  ${books.bookName}  ${books.bookWriter}  ${books.bookPublisher}  ${books.bookStock}  ${books.bookPrice}  ${books.bookRegion}  ${books.bookCategory}  ${books.bookDate}<br>
	</c:forEach>
	<c:forEach var="members" items="${members}">
		${members.memberID}  ${members.memberPW}  ${members.nickname}  ${members.memberName}  ${members.memberPhoneNumber}  ${members.memberAddress}  ${members.memberBirth}  ${members.memberGrade}  ${members.memberMileage}  ${members.ebookMembership}<br>
	</c:forEach>
	<c:forEach var="Service" items="${Service}">
		${Service.helpID}  ${Service.memberID}  ${Service.helpTitle}  ${Service.helpWritedate}  ${Service.helpContent}  ${Service.helpSortation}<br>
	</c:forEach>
</body>
</html>