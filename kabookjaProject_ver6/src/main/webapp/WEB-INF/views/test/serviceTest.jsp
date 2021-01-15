<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>조회</h1>
<form action="Service_All.do" accept-charset="utf-8">
	<input type="submit" value="조회"><br>
</form>
<hr>
<h1>게시글작성</h1>
<form action="Service_insert.do" method="post" accept-charset="utf-8">
	<input type="hidden" name="memberID" value="aaa1111"><br>
	제목<input type="text" name="helpTitle" value="제목"><br>
	내용<input type="text" name="helpContent" value="내용"><br>
	<input type="submit" value="글작성"><br>
</form>
<h1>댓글작성</h1>
<form action="Service_reviewInsert.do" method="post" accept-charset="utf-8">
	<input type="hidden" name="helpID" value="aaa111120210109214857"><br>
	<input type="hidden" name="memberID" value="운영자">
	<input type="hidden" name="helpTitle" value="제목">
	내용<input type="text" name="helpContent" value="내용"><br>
	<input type="submit" value="글작성"><br>
</form>
<hr>
</body>
</html>