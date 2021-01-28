<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous">
	
</script>


<title>ebook멤버쉽 가입</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sidebar.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/membershipRegistration.css">
</head>
<body>
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
			<!-- membershipRegostration -->
			
				<div class="row" id=membermain>
					<div class="member">
						<div class="card">
							<div class="card-header">ebook 멤버십 월 회원권</div>
							<div class="card-body">
								<h5 class="card-title">1000원/월</h5>
								<button type="button" class="btn btn-outline-secondary"
									id="payment" a href="#">결제</button>
							</div>
						</div>
						<br> <br>
						<div class="card">
							<div class="card-header">ebook 멤버십 3개월 회원권</div>
							<div class="card-body">
								<h5 class="card-title">3000원/월</h5>
								<button type="button" class="btn btn-outline-secondary"
									id="payment" a href="#">결제</button>
							</div>
						</div>
						<br> <br>
						<div class="card">
							<div class="card-header">ebook 멤버십 연 회원권</div>
							<div class="card-body">
								<h5 class="card-title">5000원/월</h5>
								<button type="button" class="btn btn-outline-secondary"
									id="payment" a href="#">결제</button>
							</div>
						</div>
					</div>
				</div>
			

			<!-- membershipRegostration-end -->
		</div>
		<!-- footer -->
		<jsp:include page="../layout/footer.jsp" />
		<!-- footer-end -->
	</div>
</body>
</html>