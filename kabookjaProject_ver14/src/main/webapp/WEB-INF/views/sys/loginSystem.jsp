<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(request.getAttribute("member")!=null){
	session.setAttribute("Smember",request.getAttribute("member"));%>
	<script>
		location.href="main.do";
	</script>
<%}else{%>
	<script>
		alert("아이디가 없거나 비밀번호가 틀렸습니다.");
		location.href="signin.do";
	</script>
<%}%>
</body>
</html>