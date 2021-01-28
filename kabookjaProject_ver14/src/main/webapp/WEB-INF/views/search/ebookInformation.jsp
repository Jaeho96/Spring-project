<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>



</style>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>
<title>ebook도서 정보 화면</title>
 <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/sidebar.css">
  <link rel="stylesheet" href="css/bookinformation.css">
 
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
 <!-- 정보화면 -->
<div class="container mt-3" >
          <div class="row">
            <div class="card shadow-sm col-lg-4 col-md-4 col-sm-4"id="output">
              <div class="d-flex justify-content-center">
                <img src="img/books/${ebook.bookimg }" class="card-img-top searchimg" alt="..." height="300em">
              </div>
            </div>

            <div class="card shadow-sm col-lg-5 col-md-6 col-sm-8 d-flex"id="output">
              <div class="ml-2">
                <label class="w-100 font-weight-bold"><h2>${ebook.bookName}</h2></label>
                <hr>
                
                <label class="w-100">${ebook.ebookPrice}</label>
              </div>
            </div>

            <div class="card shadow-sm col-lg-3 col-md-2 col-sm-4"id="output">
              

              <div class="row d-flex justify-content-center mt-5 mb-2">
                <button type="button" class="btn btn-secondary">멤버쉽구독</button>
              </div>

              <div class="row d-flex justify-content-center mt-5 mb-2">
                <button type="button" class="btn btn-secondary">바로구매</button>
              </div>
            </div>
            
          </div>
          <ul class="nav nav-tabs mt-5">
 			 <li class="nav-item">
   				 <a class="nav-link active" data-toggle="tab" href="#bookinformation">ebook설명</a>
 			 </li>
 			<li class="nav-item">
   				 <a class="nav-link" data-toggle="tab" href="#review">리뷰/한줄평</a>
 			 </li>
		  </ul>
		 <div class="tab-content mt-3">
 			 <div class="tab-pane fade show active" id="bookinformation">
   				 <p>ebook설명</p>
  			 </div>
  			 <div class="tab-pane fade" id="review">
   				 <c:forEach var="reviewlist" items="${reviewlist}">
   				 	${reviewlist.reviewsNickname}님 : ${reviewlist.reviewsContent} 별점 : ${reviewlist.reviewsStarPoint} 작성일 : ${reviewlist.reviewsDate}<br>
   				 </c:forEach>
 		     </div>
		</div>
     </div>  
   <!-- 정보화면 end -->     
</div>
<!-- footer -->
    <jsp:include page="../layout/footer.jsp"/>
    <!-- footer-end -->
</div>
</body>
</html>