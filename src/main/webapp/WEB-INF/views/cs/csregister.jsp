<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="kr">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<title>kabookja</title>

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/cs.css">
<link rel="stylesheet" href="css/sidebar.css">
<link rel="stylesheet" href="css/footer.css">

</head>

<body>

	<div class="container-fluid">
		<!-- row.1 -->
		<div class="row">
			<!-- header -->
			<jsp:include page="../layout/header.jsp" />
		</div>

		<!-- row2 -->
		<div class="row">
	<div class="container mt-4 mb-4">
		<h2>고객센터</h2>
		<div class="col-sm mt-5">
			<div class="common-block">
			
				<jsp:useBean id="now" class="java.util.Date"/>
               <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate"/>
				<c:choose>
					
					<c:when test="${Smember.memberGrade == '관리자'}">
						<form action="service_reviewInsert.do" accept-charset="utf-8" method="post">

							<div class="form-group row border-bottom pb-2">
								<label for="title" class="col-sm-1 col-form-label">제목</label> 
								<input id="title" type="text" name="helpTitle" class="col-sm-11 col-form-label" value="RE : ${service.helpTitle}" readonly/>
							</div>
							<div class="form-group row border-bottom pb-2">
								<label for="memberID" class="col-sm-1 col-form-label">작성자</label>
								<label id="memberID" class="col-sm-5 col-form-label">관리자</label>

								<label for="helpWritedate" class="col-sm-1 col-form-label">작성일</label>
								<label id="helpWritedate" class="col-sm-5 col-form-label">${nowDate}</label>
							</div>

							<div class="row">
								<div class="col-12 mb-4">
									<label>내용</label>
									<div class="form-group mb-1">
										<textarea name="helpContent" rows="10" class="form-control"></textarea>
									</div>
								</div>
							</div>
							<div class="text-right">
								<input type="hidden" name="helpID" value="${service.helpID}">
								<input type="hidden" name="memberID" value="관리자"> 
								<a href="cslist.do" class="btn btn-outline-secondary">이전으로</a>
								<button type="submit" class="btn btn-outline-secondary">작성완료</button>
							</div>
						</form>
					</c:when>

					
					<c:otherwise>		
						<form action="service_insert.do" accept-charset="utf-8" method="post">

							<div class="form-group row border-bottom pb-2">
								<label for="title" class="col-sm-1 col-form-label">제목</label> 
								<input type="text" id="title" name="helpTitle" class="col-sm-10 col-form-label" placeholder="제목을 입력하세요" />
							</div>
							<div class="form-group row border-bottom pb-2">
								<label for="memberID" class="col-sm-1 col-form-label">작성자</label>
								<label id="memberID" class="col-sm-5 col-form-label">${Smember.memberID}</label>

								<label for="helpWritedate" class="col-sm-1 col-form-label">작성일</label>
								<label id="helpWritedate" class="col-sm-5 col-form-label" value="return getTimeStamp()">${nowDate}</label>
							</div>

							<div class="row">
								<div class="col-12 mb-4">
									<label>내용</label>
									<div class="form-group mb-1">
										<textarea rows="10" class="form-control" name="helpContent"></textarea>
									</div>
								</div>
							</div>
							<div class="text-right">
								<input type="hidden" name="memberID" value="${Smember.memberID}">
								<a href="cslist.do" class="btn btn-outline-secondary">이전으로</a>
								<button type="submit" class="btn btn-outline-secondary">작성완료</button>
							</div>
						</form>

					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- content end -->
		</div>
	</div>

	<!-- <footer> -->
	<jsp:include page="../layout/footer.jsp" />


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>
</html>