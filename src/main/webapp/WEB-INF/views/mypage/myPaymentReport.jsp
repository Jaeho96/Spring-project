<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	label{
	text-align:right;
	}


</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/sidebar.css">
<link rel="stylesheet" href="css/footer.css">

<title>구매내역</title>
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

			<!-- sidebar -->
			<jsp:include page="../layout/mysidebar.jsp" />
			<!-- sidebar-end -->

			<!-- main contents -->
		
			
			<div class="container col-8 mt-3">
				<c:forEach var="paymentReports" items="${paymentReports}">
				<div class="row mb-3">
					
						<c:set var="books" value="${fn:split(paymentReports.bookNameList,',')}"/>
						<c:set var="stocks" value="${fn:split(paymentReports.bookStockList,',')}"/>
						<c:set var="prices" value="${fn:split(paymentReports.bookPriceList,',')}"/>
						<c:set var="paymentTitel" value="${books[0]} ${stocks[0]}권 외  ${fn:length(books)-1}종류의 책"/>
						<c:forEach var="price" items="${prices}" varStatus="status">
							<c:set var="totalPrice" value="${totalPrice+(price*stocks[status.index])}"/>
						</c:forEach>
					<div class="card col-12">
						<div class="ml-2">
							<label class="font-weight-bold">
								<a href="PaymentReportDetail.do?memberID=${paymentReports.memberID}&buyDate=${paymentReports.buyDate}">${paymentTitel}<!-- (cart실 구매주소) --></a>
							</label>
							<label class="w-100">배송주소 : ${paymentReports.shoppingDestination}</label>
							<label class="w-100">결제금액 : ${totalPrice}원 <!-- (상품총액) --></label>
							<label class="w-100">구매날짜 : ${paymentReports.buyDate } <!-- 구매날짜 --></label>
							<c:set var="totalPrice" value=""/>
						</div>
					</div>
					
					
					</div>
					</c:forEach>
				</div>
				
			</div>


		</div>
		<!-- row (sidebar +main) -->
	</div>
	<!-- container-fluid-->
	<div class="footer">
		<!-- <footer> -->
		<jsp:include page="../layout/footer.jsp" />
	</div>
</body>
</html>

