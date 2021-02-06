<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
  </script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous">
	
</script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>ebook멤버쉽 가입</title>
<link rel="stylesheet" href="css/header.css">
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
			<jsp:include page="../layout/mysidebar.jsp" />
			<!-- sidebar-end -->
			<!-- membershipRegostration -->
			
				<div class="row" id=membermain>
					<div class="member">
						<div class="card">
							<div class="card-header">ebook 멤버십 월 회원권</div>
							<div class="card-body">
								<h5 class="card-title">5000원/월</h5>
								<button type="button" class="btn btn-outline-secondary"
									id="payment" onclick="requestPay(5000,1)">결제</button>
							</div>
						</div>
						<br> <br>
						<div class="card">
							<div class="card-header">ebook 멤버십 3개월 회원권</div>
							<div class="card-body">
								<h5 class="card-title">10000원/월</h5>
								<button type="button" class="btn btn-outline-secondary"
									id="payment" onclick="requestPay(10000,3)">결제</button>
							</div>
						</div>
						<br> <br>
						<div class="card">
							<div class="card-header">ebook 멤버십 연 회원권</div>
							<div class="card-body">
								<h5 class="card-title">40000원/월</h5>
								<button type="button" class="btn btn-outline-secondary"
									id="payment" onclick="requestPay(40000,12)">결제</button>
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
	<script> 
        //결제
        function requestPay(i,j) {
        	var login='<c:out value="${Smember.memberName}"/>';
        	var amount=$("#hopeamount"+i).val();
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
    		    name : '멤버쉽가입'+j+"개월",
    		    amount : i,
    		    buyer_email : '',
    		    buyer_name : '<c:out value="${Smember.memberName}"/>',
    		    buyer_tel : '<c:out value="${Smember.memberPhoneNumber}"/>',
    		    buyer_addr : '',
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
    				    url: "members_ebookMembershipJoin.do",
    				    data: {
    				    	"memberID": '<c:out value="${Smember.memberID}"/>',
    				       	"month": j
    				    },
    				    success: function (data) {
    				        if ($.trim(data) != "NO") {
    				        	alert("멤버쉽 "+j+"개월 가입이 완료되었습니다.")
    				        	var memberID='<c:out value="${Smember.memberID}"/>'
    				     		location.href="membershipRelogin.do?memberID="+memberID;
    				        }else{
    				        	alert('데이터등록실패!!');
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