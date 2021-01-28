<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>
  

  <title>메인화면</title>
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/sidebar.css">
  <link rel="stylesheet" href="css/footer.css">
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
      
      <!-- main -->
      <main role="main" class="col-9 px-4">
        <!-- slideshow -->
        <div class="container" id="slideshow">
          <div id="carouselExampleSlidesOnly" class="carousel slide " data-ride="carousel">
            <div class="carousel-inner ">
              <div class="carousel-item active">
                <img src="img/1.jpg" class="d-block w-100" alt="...">
              </div>

              <div class="carousel-item">
                <img src="img/2.jpg" class="d-block w-100" alt="...">
              </div>
            </div>
          </div>
        </div>
        <!-- slideshow-end -->
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
		<c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="M" /></c:set>  
        <!-- bestseller-year -->
        <div class="container mt-3" id="bestseller">
          <div class="row justify-content-center" id="bestseller-head">
            <h2>${sysYear}년 베스트셀러</h2>
          </div>
          <div class="row justify-content-between">
          	<c:forEach var="bestYear" items="${bestYear}">
          	<c:set var="i" value="${i+1 }"/>
            <div class="card mb-4 shadow-sm" id="cardbox">
              <div class="card-header text-center">
                <h5 class="my-0 font-weight-bold">${i}위</h5>
              </div>
              <div class="card-body" style="cursor: pointer;" onClick="location.href='bookInformation.do?bookID=${bestYear.bookID}'">
                <img src="img/books/${bestYear.bookimg }" class="card-img-top" alt="...">
                <h5 class="card-title pricing-card-title"><a href="#">${bestYear.bookName }</a> </h5>
                <p>${bestYear.bookWriter}</p>
              </div>
            </div>
			</c:forEach>
        <!-- bestseller-year-end-->
		
        <!-- bestseller-month -->
        <div class="container mt-3" id="bestseller">
          <div class="row justify-content-center" id="bestseller-head">
            <h2>${sysMonth}월 베스트셀러</h2>
          </div>

          <div class="row justify-content-between">
          <c:forEach var="bestMonth" items="${bestMonth}">
          	<c:set var="j" value="${j+1 }"/>
            <div class="card mb-4 shadow-sm" id="cardbox">
              <div class="card-header text-center">
                <h5 class="my-0 font-weight-bold">${j}위</h5>
              </div>
              <div class="card-body" style="cursor: pointer;" onClick="location.href='bookInformation.do?bookID=${bestMonth.bookID}'">
                <img src="img/books/${bestMonth.bookimg }" class="card-img-top" alt="...">
                <h5 class="card-title pricing-card-title">${bestMonth.bookName }</a> </h5>
                <p>${bestMonth.bookWriter }</p>
              </div>
            </div>
		</c:forEach>
        <!-- bestseller-month-end -->
      </main>
      <!-- main-end -->
    </div>
    <!-- footer -->
        <jsp:include page="../layout/footer.jsp"/>
    <!-- footer-end -->
  </div>


</body>

</html>