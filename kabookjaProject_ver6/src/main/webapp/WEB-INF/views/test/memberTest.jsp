<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>중복체크</h1>
<form action="members_idCheck.do" accept-charset="utf-8">
	아이디<input type="text" name="memberID" value="aaa1111"><br>
	<input type="submit" value="중복확인"><br>
</form>
<hr>
<h1>멤버쉽가입</h1>
<form action="members_ebookMembershipJoin.do" method="post" accept-charset="utf-8">
	아이디<input type="text" name="memberID" value="aaa1111">
	맴버쉽가입개월수<input type="text" name="month" value="맴버쉽가입개월수"><br>
	<input type="submit" value="가입"><br>
</form>
<hr>
<h1>마일리지 적립 및 사용</h1>
<form action="members_MileageUpdate.do" method="post" accept-charset="utf-8">
	aaa1111의 마일리지가 변동됨
	아이디<input type="text" name="memberID" value="aaa1111"><br>
	마일리지<input type="text" name="memberMileage" value="숫자 입력!!"><br>
	<input type="submit" value="마일리지go"><br>
</form>
<hr>
<h1>조회</h1>
<form action="members_All.do" accept-charset="utf-8">
	<input type="submit" value="조회"><br>
</form>
<hr>
<h1>가입</h1>
<form action="members_signUp.do" method="post" accept-charset="utf-8">
	아이디<input type="text" name="memberID" value="aaa1111"><br>
	비밀번호<input type="text" name="memberPW" value="1234"><br>
	닉네임<input type="text" name="nickname" value="닉네임"><br>
	이름<input type="text" name="memberName" value="An"><br>
	번호<input type="text" name="memberPhoneNumber" value="010-4821-0166"><br>
	주소<input type="text" name="memberAddress" value="경기도 평택시"><br>
	생일(YYYY-MM-DD)<input type="text" name="memberBirth" value="1993-09-09"><br>
	<input type="submit" value="가입"><br>
</form>
<hr>
<h1>수정</h1>
(비밀번호,닉네임,이름,휴대폰번호,주소,생일)
아이디 히든으로 들어오게 할것!
<form action="members_update.do" method="post" accept-charset="utf-8">
	아이디<input type="text" name="memberID" value="aaa1111"><br>
	비밀번호<input type="text" name="memberPW" value="1234"><br>
	닉네임<input type="text" name="nickname" value="닉네임"><br>
	이름<input type="text" name="memberName" value="An"><br>
	번호<input type="text" name="memberPhoneNumber" value="010-4821-0166"><br>
	주소<input type="text" name="memberAddress" value="경기도 평택시"><br>
	생일(YYYY-MM-DD)<input type="text" name="memberBirth" value="1993-09-09"><br>
	<input type="submit" value="수정"><br>
</form>
<hr>
<h1>삭제</h1>
<form action="members_delete.do" method="post" accept-charset="utf-8">
	아이디<input type="text" name="memberID" value="aaa1111"><br>
	<input type="submit" value="삭제"><br>
</form>

</body>
</html>