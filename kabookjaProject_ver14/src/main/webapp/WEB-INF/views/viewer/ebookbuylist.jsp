<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/ebookbuylist.css">
</head>
<body>

	<!-- ebook -->
	<!-- 사용자가 구매한 ebook만 -->
	<div class="container mt-3">
		<div class="row" id="output">

			<div class="card shadow-sm col-lg-4 col-md-5 col-sm-6">
				<div class="d-flex justify-content-center">
					<img src="/img/book.jpg" class="card-img-top searchimg" alt="..."
						height="200em">
				</div>
			</div>

			<div class="card shadow-sm col-lg-8 col-md-7 col-sm-10 d-flex">
				<div class="ml-2">
					<label class="w-100 font-weight-bold">
						<h3>
							<a href onclick="window.open('#')">책 제목</a>
						</h3>
					</label> <label class="w-100">저자</label> <label class="w-100">가격</label>
				</div>
			</div>
		</div>
	</div>
</body>
</html>