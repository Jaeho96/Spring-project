<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="css/cslist.css">
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
			<div class="container-sm mt-4 mb-4">
				<h2>고객센터</h2>

				<div class="container mt-4">
					<div class="sm-margin-50px-bottom">
						<div class="resp-tabs-container hor_1 no-padding">
							<h4>FAQ</h4>
							<div id="accordion" class="accordion-style">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h5 class="mb-0">
											<button id="collapsedButton" class="btn btn-link collapsed" data-toggle="collapse" data-target="#balloonOne"
												aria-expanded="false" aria-controls="balloonOne">
												배송은며칠 걸리나요?</button>
										</h5>
									</div>
									<div id="balloonOne" class="collapse"
										aria-labelledby="headingOne" data-parent="#accordion" style="">
										<div class="card-body">
											보통 제주, 산간지역을 제외한 지역은 약 3-4일 소요되며,<br> 제주, 산간지역의 경우 약4-5일 소요됩니다.
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="headingTwo">
										<h5 class="mb-0">
											<button id="collapsedButton" class="btn btn-link collapsed"
												data-toggle="collapse" data-target="#balloonTwo"
												aria-expanded="false" aria-controls="balloonTwo">
												구매하고 싶은 책을 요청할 수 있나요?</button>
										</h5>
									</div>
									<div id="balloonTwo" class="collapse"
										aria-labelledby="headingTwo" data-parent="#accordion" style="">
										<div class="card-body">
											<br> 고객센터 게시판에 아래 양식에 맞춰 글을 작성해주시면 확인 후 안내 도와드리겠습니다. <br>
											<br> 제목 : <br> 글쓴이 : <br> 출판사 : <br> <br>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="table-responsive">
					<div class="container mt-5">
						<h4>Q&A</h4>
						<form action="service_update.do" accept-charset="utf-8">
						<table class="table mt-4 table-hover text-center">
							<thead class="thead-dark">
								<tr>
									<th class="" scope="col">글번호</th>
									<th class="" scope="col">제목</th>
									<th class="" scope="col">작성자</th>
									<th class="" scope="col">작성일</th>
								</tr>
							</thead>

							<tbody class="listbody">
								<!-- db연결 후 적용 -->
								<c:forEach var="services" items="${services}">
									<tr style="cursor: pointer;" onClick="location.href='csdetail.do?helpID=${services.helpID}&helpSortation=${services.helpSortation}'">
										<td>${services.helpNum}</td>
										<td>${services.helpTitle}</td>
										<td>${services.memberID}</td>
										<td>${services.helpWritedate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</form>
					</div>
				</div>
				<div class="container text-right">
					<c:if test="${Smember.memberGrade == '관리자'}">
						<a href="csregister.do" class="btn btn-outline-secondary disabled">글쓰기</a>
					</c:if>
					<c:if test="${Smember.memberGrade == '회원'}">
						<a href="csregister.do" class="btn btn-outline-secondary">글쓰기</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- <footer> -->
	<jsp:include page="../layout/footer.jsp" />


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous">
  </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous">
  </script>

	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>

</html>