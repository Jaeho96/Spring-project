<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/sidebar.css">
<link rel="stylesheet" href="css/ebookbuylist.css">
</head>
<body>

	<!-- ebook -->
	<!-- 사용자가 구매한 ebook만 -->
	<div class="container-fluid">
		<!-- row.1 -->
		<div class="row">
			<!-- header -->
			<jsp:include page="../layout/header.jsp" />
			<!-- header-end -->
		</div>
		<!-- row.2 -->
		<div class="row">
			<!-- sidebar -->
			<jsp:include page="../layout/sidebar.jsp" />
			<!-- sidebar-end -->


			<div class="container mt-3">
				<h1>ebook 리스트</h1>
				<c:forEach var="ebookBuy" items="${ebookBuyList}">
				<div class="row" id="output">
					<div class="card shadow-sm col-lg-4 col-md-5 col-sm-6">
						<div class="d-flex justify-content-center">
							<img src="img/books/${ebookBuy.bookimg}" class="card-img-top searchimg" alt="..."
								height="200em">
						</div>
					</div>

					<div class="card shadow-sm col-lg-8 col-md-7 col-sm-10 d-flex">
						<div class="ml-2">
							<label class="w-100 font-weight-bold">
								<h3>
									<a href="viewer.do?bookID=${ebookBuy.bookID}">${ebookBuy.bookName}</a>
								</h3>
							</label> <label class="w-100">저자 : ${ebookBuy.bookWriter }</label> <label class="w-100">출판사 : ${ebookBuy.bookPublisher }</label>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- footer -->
			<jsp:include page="../layout/footer.jsp" />
			<!-- footer-end -->
		</div>
</body>
</html>