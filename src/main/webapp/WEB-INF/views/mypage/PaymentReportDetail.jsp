<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>
<title>결제상세페이지</title>
 <link rel="stylesheet" href="css/header.css">
 <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/sidebar.css">
  <link rel="stylesheet" href="css/bookinformation.css">
  <link rel="stylesheet" href="css/payresult.css">
 
</head>
 <body>
 <div class="container-fluid">
    <!-- row.1 -->
    <div class="row"> 
      <!-- header -->
      <jsp:include page="../layout/header.jsp"/>
      <!-- header-end -->
    </div>
    <!-- row.2 -->
    <div class="row">
      <!-- sidebar -->
      <jsp:include page="../layout/sidebar.jsp"/>
      <!-- sidebar-end -->
     <!-- 결제결과페이지 -->
	<div class="container mt-5">
		<c:set var="bookIDs" value="${fn:split(paymentReport.bookIDList,',')}"/>
		<c:set var="books" value="${fn:split(paymentReport.bookNameList,',')}"/>
		<c:set var="bookimg" value="${fn:split(paymentReport.bookimgList,',')}"/>
		<c:set var="stocks" value="${fn:split(paymentReport.bookStockList,',')}"/>
		<c:set var="prices" value="${fn:split(paymentReport.bookPriceList,',')}"/>
		
		<h2>상품정보</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th class="text-left">상품명</th>
					<th class="text-right pr-5">수량</th>
					<th class="text-right ">가격</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="bookID" items="${bookIDs}" varStatus="status">
				<tr>
					<td class="text-left">${books[status.index]}</td>
					<td class="text-right pr-5">${stocks[status.index]}</th>
					<td class="text-right ">${prices[status.index]}원</th>
				</tr>
				<c:set var="totalPrice" value="${totalPrice+(prices[status.index]*stocks[status.index])}"/>
			</c:forEach>
			</tbody>
			<tbody>
				<tr>
					<td class="text-left">합계</th>
					<td class="text-right pr-5"></th>
					<td class="text-right ">${totalPrice}원</th>
				</tr>
			</tbody>
		</table>
	
		<h2>결제정보</h2>
		<table class="table">
			<tr>
				<td id="left">결제수단</th>
				<td id="center">카드</th>
			</tr>
			<tr>
				<td id="left">배송지</th>
				<td id="center">${paymentReport.shoppingDestination}</th>
			</tr>
			<tr>
				<td id="left">주문 금액</th>
				<td id="center">${totalPrice}원</th>
			</tr>
			<tr>
				<td id="left">결제 금액</th>
				<td id="center">카드</th>
				<td class="text-left pr-5">${totalPrice}원</th>
				
			</tr>
			
		</table>
	</div>
	<!-- 결제결과페이지 end -->
<!-- footer -->
    <jsp:include page="../layout/footer.jsp"/>
    <!-- footer-end -->
</div>
</body>
</html>


