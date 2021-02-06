<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>
  
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>ebook도서 정보 화면</title>
 <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/footer.css">
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
              

              <jsp:useBean id="now" class="java.util.Date" />
              <fmt:parseDate value="${Smember.ebookMembership}" pattern="yyyy-MM-dd HH:mm:ss" var="ebookdate"/>
              <fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />
			<fmt:formatDate value="${ebookdate}" pattern="yyyyMMdd" var="ebookdatef" />
              <c:choose>
              <c:when test="${ebookdatef>nowDate}">
               <div class="row d-flex justify-content-center mt-2 mb-2">
                <button type="button" class="btn btn-secondary p-1" onclick="ebookInsert();">ebook구독</button>
              </div>
              </c:when>
              <c:otherwise>
			  <div class="row d-flex justify-content-center mt-2 mb-2">
                <button type="button" class="btn btn-secondary py-1" onClick="location.href='membershipRegistration.do'">멤버쉽가입</button>
              </div>
              <div class="row d-flex justify-content-center mt-2 mb-2">
              	
                <button type="button" class="btn btn-secondary py-1" onclick="requestPay();">바로구매</button>
              </div>
              </c:otherwise>
              </c:choose>
            
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
  			 </div>
  			 <div class="tab-pane fade" id="review">
   				 <c:forEach var="reviewlist" items="${reviewlist}">
   				 	
            <div class="media text-muted pt-3"> <!--네모 있는 버전 -->
              <div class="mt-3 d-block text-gray-dark">${reviewlist.reviewsStarPoint}</div> <!-- 여기 별점 어때유-->
              <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <strong class="d-block text-gray-dark">${reviewlist.reviewsNickname}</strong> <!-- 요기 안에 닉네임 하단에 리뷰 코멘트-->
                ${reviewlist.reviewsContent}
              </p>
            </div>
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
<script> 
        //구독
        function ebookInsert(){
        	$.ajax({
			    type: "POST",
			    url: "ebookBuyListInsert.do",
			    data: {
			    	"memberID": '<c:out value="${Smember.memberID}"/>',
			       	"bookID": '<c:out value="${ebook.bookID}"/>',
			    },
			    success: function (data) {
			        if ($.trim(data) != "NO") {
			        	alert("구독되었습니다.");
			        }else{
			        	alert("오류 : 구독실패");
			        }
			    },
			    error: function(error){
			    	alert("error");
			    }
			});
        }
      //결제
        function requestPay(i) {
        	var login='<c:out value="${Smember.memberName}"/>';
        	if(!login){
        		alert("로그인이 필요한 서비스입니다.");
        		location.href="signin.do";
        	}else{
        	var IMP = window.IMP; // 생략가능
    		IMP.init("imp81747761"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    		
    		IMP.request_pay({
    		    pg : 'html5_inicis', // version 1.1.0부터 지원.
    		    pay_method : 'card',
    		    merchant_uid : 'kabookja' + new Date().getTime(),
    		    name : '<c:out value="${ebook.bookName}"/>',
    		    amount : '<c:out value="${ebook.ebookPrice}"/>',
    		    buyer_email : '',
    		    buyer_name : '<c:out value="${Smember.memberName}"/>',
    		    buyer_tel : '<c:out value="${Smember.memberPhoneNumber}"/>',
    		    buyer_addr : '<c:out value="${Smember.memberAddress}"/>',
    		    buyer_postcode : '',
    		    m_redirect_url : ''	// 결제 완료 후 보낼 컨트롤러의 메소드명
    		}, function(rsp) {
    		    if ( rsp.success ) {
    		    	var msg = '결제가 완료되었습니다.';
    		        msg += '고유ID : ' + rsp.imp_uid;
    		        msg += '상점 거래ID : ' + rsp.merchant_uid;
    		        msg += '결제 금액 : ' + rsp.paid_amount;
    		        msg += '카드 승인번호 : ' + rsp.apply_num;
    		        $.ajax({
    				    type: "POST",
    				    url: "ebookBuyListInsert.do",
    				    data: {
    				    	"memberID": '<c:out value="${Smember.memberID}"/>',
    				       	"bookID": '<c:out value="${ebook.bookID}"/>',
    				    },
    				    success: function (data) {
    				        if ($.trim(data) != "NO") {
    				        	 msg += '등록완료'
    				        	var memberID ='<c:out value="${Smember.memberID}"/>'
    				     		location.href="ebookBuyList.do?memberID="+memberID;
    				        }else{
    				        	msg += '데이터등록실패!!';
    				        }
    				    },
    				    error: function(error){
    				    	alert("error");
    				    }
    				});
    		    } else {
    		        var msg = '결제에 실패하였습니다.';
    		        msg += '에러내용 : ' + rsp.error_msg;
    		    }
    		    
    		    alert(msg);
    		});	
        	
        	}
        }
        
    </script>


</body>
</html>