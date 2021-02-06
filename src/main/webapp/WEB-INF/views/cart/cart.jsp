<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="kr">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/sidebar.css">
	<link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/cart.css">

    <title>kabookja</title>

</head>

<body>


    <div class="container-fluid">
        <!-- row.1 -->
        <div class="row">
            <!-- header -->
            <jsp:include page="../layout/header.jsp" />
            <!-- header-end -->
        </div>

        <!-- content -->
        <div class="common-block p-3">
            <div class="inner-title pb-5">
                <h2 class="no-margin-bottom">장바구니</h2>
            </div>

            <!-- Product Table -->
            <form method="POST">
                <div class="col-12">
                    <table class="table table-sm shop-cart-table text-center align-middle">
                        <colgroup>
                            <col width="1">
                            <col width="100">
                            <col >
                            <col width ="50">
                            <col width ="100">
                        </colgroup>

                        <thead class="thead-dark">
                            <tr>
                                <th class="checkCol">
                                    <div class="form-check">
                                        <input class="form-check-input position-static" type="checkbox" id="blankCheck" onclick="checkAll();">
                                    </div>
                                </th>
                                <th class="first"></th>
                                <th class="text-left">상품</th>
                                <th class="text-center">수량</th>
                                <th class="text-right pr-5">가격</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cartlist" items="${cartlist}">
                            <tr>
                                <td class="check text-center">
                                    <div class="form-check">
                                        <input class="form-check-input position-static" type="checkbox" name="cartID" id="blankCheckbox" value="${cartlist.cartID}">
                                    </div>
                                </td>
                                <td class="product-thumbnail text-left">
                                    <a href="#!"><img src="img/books/${cartlist.bookimg}" alt="이미지 오류" class="cartimg"></a>
                                </td>
                                <td class="text-left">${cartlist.bookName}</td>
                                <td class="text-center">
                                    <label class="text-center" id="cnt">${cartlist.bookStock}</label>
                                </td>
                                <td class="text-right pr-5">
                                    <span class="display-block" id="unitprice"> ${cartlist.bookPrice} 원</span>
                                </td>
                            </tr>
                            <c:set var="totalBookStock" value="${totalBookStock+cartlist.bookStock}"/>
                            <c:set var="totalBookPrice" value="${totalBookPrice+cartlist.bookPrice}"/>
                            <c:set var="bookIDList" value="${bookIDList}${cartlist.bookID},"/>
                      		<c:set var="bookNameList" value="${bookNameList}${cartlist.bookName},"/>
                      		<c:set var="bookimgList" value="${bookimgList}${cartlist.bookimg},"/>
                      		<c:set var="bookStockList" value="${bookStockList}${cartlist.bookStock},"/>
                      		<c:set var="bookPriceList" value="${bookPriceList}${cartlist.bookPrice},"/>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- End Product Table -->

                <!-- Start Button Set -->
                <div class="col-12 border-bottom border-top py-2">
                <input type="hidden" name="memberID" value="${Smember.memberID}">
                    <input type="submit" class="btn btn-outline-secondary" id="btnDelete" value="선택상품 삭제" formaction="deleteCart.do">
                    <button class="btn btn-outline-secondary float-right mx-1" onClick="location.href='main.do'">계속 쇼핑</button>
                </div>
            </form>
            <!-- End Button Set -->

            <!-- Start Total Block Set -->
            <div class="col-12 p-3">
                <div class="row mt-5">

                    <div class="col-sm-7 sm-margin-50px-bottom">
                        <!-- <form action=""> -->
                        <table class="table cart-sub-total">
                            <tbody>
                                <tr>
                                    <td class="text-left bold pl-5">배송지</td>
                                </tr>
                                <tr class="total">
                                    <td class="text-left pl-5 border-bottom nofocus">
                                        <input type="text" class="input" id="inputAddress" name="shoppingDestination" value="${Smember.memberAddress}">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- <button type="submit" class="btn btn-outline-secondary float-right">
                                배송지 변경</button>
                            </form> -->
                    </div>

                    <div class="col-sm-5">
                        <table class="table cart-sub-total">
                            <tbody>
                                <tr>
                                    <th class="text-right">총 수량</th>
                                    <td class="text-right">${totalBookStock}권</td>
                                </tr>
                                <tr class="total">
                                    <th class="text-right border-bottom">총 금액</th>
                                    <td class="text-right border-bottom">${totalBookPrice} 원</td>
                                </tr>
                            </tbody>
                        </table>
                        <button class="btn btn-outline-secondary float-right" onclick="requestPay();">결제</button>
                    </div>
                </div>
            </div>
            <!-- End Total Block Set -->

        </div>
    </div>

    <!-- <footer> -->
    <jsp:include page="../layout/footer.jsp" />


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
  </script>
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
    </script>
   

    <script>
        // th에 체크박스를 선택할 경우 모든 체크박스 선택 메소드
        function checkAll() {
            let isChecked = document.getElementById("blankCheck").checked;
            let chks = document.getElementsByName("cartID");
            for (let i = 0; i < chks.length; i++) {
                chks[i].checked = isChecked;
            }
        }
        
        
        //결제
        function requestPay() {
        	var IMP = window.IMP; // 생략가능
    		IMP.init("imp81747761"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    		
    		IMP.request_pay({
    		    pg : 'html5_inicis', // version 1.1.0부터 지원.
    		    pay_method : 'card',
    		    merchant_uid : 'kabookja' + new Date().getTime(),
    		    name : '결제테스트',
    		    amount : '<c:out value="${totalBookPrice}"/>',
    		    buyer_email : '',
    		    buyer_name : '<c:out value="${Smember.memberName}"/>',
    		    buyer_tel : '<c:out value="${Smember.memberPhoneNumber}"/>',
    		    buyer_addr : $('#inputAddress').val(),
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
    				    url: "PaymentReport_insert.do",
    				    data: {
    				    	"memberID": '<c:out value="${Smember.memberID}"/>',
    				       	"bookIDList": '<c:out value="${bookIDList}"/>',
    				        "bookNameList": '<c:out value="${bookNameList}"/>',
    				        "bookimgList": '<c:out value="${bookimgList}"/>',
    				        "bookStockList": '<c:out value="${bookStockList}"/>',
    				        "bookPriceList": '<c:out value="${bookPriceList}"/>',
    				        "ShoppingDestination": $('#inputAddress').val()
    				    },
    				    success: function (data) {
    				        if ($.trim(data) != "NO") {
    				        	var memberID ='<c:out value="${Smember.memberID}"/>'
    						    location.href="clearCart.do?memberID="+memberID+"&date="+data;
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
        
    </script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>

</html>