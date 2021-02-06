<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%session.setAttribute("Smember",request.getAttribute("member"));%>
	<script>
		location.href="myinfo.do";
	</script>
</body>
</html>