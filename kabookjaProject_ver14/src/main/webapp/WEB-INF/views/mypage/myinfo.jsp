<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <script defer src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>


  <title>내정보 화면</title>
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/sidebar.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/myinfo.css">
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

      <!-- main -->
      <main role="main" class="col-9 px-4 mt-3 main m-auto">

        <img class="mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="로고 사진넣기" width="72" height="57">

        <div class="static row mb-2 mt-3">
          <label for="staticmemberID" class="col-sm-2 col-form-label bg-secondary text-center"><b>ID</b></label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="staticmemberID" value="${Smember.memberID }">
          </div>
        </div>

        <div class="static row mb-2">
          <label for="staticmemberName" class="col-sm-2 col-form-label bg-secondary text-center"><b>이름</b></label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="staticmemberName" value="${Smember.memberName }">
          </div>
        </div>

        <div class="static row mb-2">
          <label for="staticmembernickname" class="col-sm-2 col-form-label bg-secondary text-center"><b>닉네임</b></label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="staticmembernickname" value="${Smember.nickname }">
          </div>
        </div>

        <div class="static row mb-2">
          <label for="staticmemberPhoneNumber"
            class="col-sm-2 col-form-label bg-secondary text-center"><b>연락처</b></label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="staticmemberPhoneNumber" value="${Smember.memberPhoneNumber}">
          </div>
        </div>

        <div class="static row mb-2">
          <label for="staticmemberBirth" class="col-sm-2 col-form-label bg-secondary text-center"><b>생년월일</b></label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="staticmemberBirth" value="${Smember.memberBirth}">
          </div>
        </div>

        <div class="static row mb-2">
          <label for="staticmemberAddress" class="col-sm-2 col-form-label bg-secondary text-center"><b>주소</b></label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="staticmemberAddress" value="${Smember.memberAddress }">
          </div>
        </div>

        <div class="static row mb-2">
          <label for="staticMembership" class="col-sm-2 col-form-label bg-secondary text-center"><b>ebook회원</b></label>
          <div class="col-sm-10">
            <form action="" class="w-100 d-flex">
            	<jsp:useBean id="now" class="java.util.Date"/>
            	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate"/>
            	<fmt:parseDate var="edate" value="${Smember.ebookMembership}" pattern="yyyy-MM-dd"/>
            	<fmt:formatDate value="${edate}" pattern="yyyy-MM-dd" var="ebookDate"/>
            	<c:choose>
            	<c:when test="${nowDate<ebookDate}">
              		<input type="text" readonly class="form-control-plaintext" id="staticMembership" value="가입여부 : 가입">
              		<input type="text" readonly class="form-control-plaintext" id="staticMembershipday" value="만료날짜 : ${Smember.ebookMembership}">
              	</c:when>
              	<c:otherwise>
              		<input type="text" readonly class="form-control-plaintext" id="staticMembership" value="가입여부 : 미가입">
              	</c:otherwise>
              	</c:choose>
              <button type="button" class="btn btn-secondary btn-sm" onClick="location.href='membershipRegistration.do'">멤버십 가입</button>
            </form>
          </div>
        </div>

        <div class="static row mb-2">
          <label for="staticmemberAddress" class="col-sm-2 col-form-label bg-secondary text-center"><b>마일리지</b></label>
          <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" id="staticmemberAddress" value="${Smember.memberMileage }">
          </div>
        </div>

        <div class="row mb-2 d-flex justify-content-end">
          <button type="button" class="btn btn-secondary btn-sm mr-1 ml-1">회원탈퇴</button>
          <button type="button" class="btn btn-secondary btn-sm">수정</button>
        </div>

      </main>
      <!-- main-end -->
    </div>
    <!-- footer -->
        <jsp:include page="../layout/footer.jsp"/>
    <!-- footer-end -->
  </div>


</body>

</html>