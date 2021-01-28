<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>도서 정보 화면</title>
 <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/sidebar.css">
  <link rel="stylesheet" href="css/bookInformation.css">
 
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
                <img src="img/books/${book.bookimg }" class="card-img-top searchimg" alt="..." height="300em">
              </div>
            </div>

            <div class="card shadow-sm col-lg-5 col-md-6 col-sm-8 d-flex"id="output">
              <div class="ml-2">
                <label class="w-100 font-weight-bold"><h2>${book.bookName }</h2></label>
                <hr>
                
                <label class="w-100">${book.bookPrice }</label>
              </div>
            </div>

            <div class="card shadow-sm col-lg-3 col-md-2 col-sm-4"id="output">
              <div class="row d-flex justify-content-center mt-5 mb-2 ">
                <input type="text" class="text-center" name="" id="hopeamount" placeholder="희망수량">
              </div>

              <div class="row d-flex justify-content-center mt-5 mb-2 ">
                <button type="button" class="btn btn-secondary">장바구니</button>
              </div>

              <div class="row d-flex justify-content-center mt-5 mb-2">
                <button type="button" class="btn btn-secondary">바로구매</button>
              </div>
            </div>
            
          </div>
          <ul class="nav nav-tabs mt-5">
 			 <li class="nav-item">
   				 <a class="nav-link active" data-toggle="tab" href="#bookinformation">도서정보</a>
 			 </li>
 			<li class="nav-item">
   				 <a class="nav-link" data-toggle="tab" href="#review">리뷰/한줄평</a>
 			 </li>
		  </ul>
		 <div class="tab-content mt-3">
 			 <div class="tab-pane fade show active" id="bookinformation">
   				 <p>도서정보</p>
  			 </div>
  			 <div class="tab-pane fade" id="review">
   				 <c:forEach var="reviewlist" items="${reviewlist}">
   				 	<div class="media text-muted pt-3"> <!--네모 없는 버전 -->
               <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray"> 
                <strong class="d-block">@username</strong>
                Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
              </p>
            </div>
            <div class="media text-muted pt-3"> <!--네모 있는 버전 -->
              <div class="mt-3">  여기별점 </div> <!-- 여기 별점 어때유-->
              <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <strong class="d-block text-gray-dark">@username</strong> <!-- 요기 안에 닉네임 하단에 리뷰 코멘트-->
                Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
              </p>
            </div>
            <div class="media text-muted pt-3"><!--네모 있는 버전 -->
              <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#6f42c1"/><text x="50%" y="50%" fill="#6f42c1" dy=".3em">32x32</text></svg>
              <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <strong class="d-block text-gray-dark">@username</strong>
                Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.
              </p>
            </div>
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