<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


  <title>ebook검색화면</title>
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/sidebar.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/search.css">
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

      <!-- main 여기부터-->
      <main role="main" class="col-9 px-4">
        
        <div class="input-group mb-1 d-flex">
          <div class="input-group-prepend">
            <c:if test="${searchWord ne null}">
          		<label>'${searchWord} '로의 검색결과</label>
          	</c:if>
          	<c:if test="${!empty RC}">
            	<label>${RC.bookRegion}->${RC.bookCategory}</label>
            </c:if>
          </div>
        </div>
        
        <div class="input-group mb-3 d-flex">
          <div class="input-group-prepend">
            <input class="form-check-input" type="radio" name="exampleRadios" id="Radios1" value="highprice">
            <label>최저가순</label>
          </div>


          <div class="input-group-prepend">
            <input class="form-check-input" type="radio" name="exampleRadios" id="Radios2" value="lowprice">
            <label>최고가순</label>
          </div>


          <div class="input-group-prepend">
            <input class="form-check-input" type="radio" name="exampleRadios" id="Radios2" value="highsell">
            <label>판매량순</label>
          </div>
        </div>

        <!-- ebook-searchmain -->
         <c:forEach var="ebooks" items="${ebooks}">
        <div class="container mt-3" id="output">
       
          <div class="row" onclick="location.href='ebookInformation.do?bookID=${ebooks.bookID}'">
            <div class="card shadow-sm col-lg-2 col-md-4 col-sm-4">
              <div class="d-flex justify-content-center">
                <img src="img/books/${ebooks.bookimg }" class="card-img-top searchimg" alt="..." height="200em">
              </div>
            </div>

            <div class="card shadow-sm col-lg-7 col-md-6 col-sm-8 d-flex">
              <div class="ml-2">
                <label class="w-100 font-weight-bold">${ebooks.bookName}</label>
                <label class="w-100">${ebooks.bookWriter }</label>
                <label class="w-100">${ebooks.ebookPrice }</label>
              </div>
            </div>

            <div class="card shadow-sm col-lg-3 col-md-2 col-sm-4 justify-content-center">
              <div class="row d-flex justify-content-center mt-2 mb-2">
                <button type="button" class="btn btn-secondary p-1" onClick="location.href='membershipRegistration.do'">멤버쉽구독</button>
              </div>

              <div class="row d-flex justify-content-center mt-2 mb-2">
                <button type="button" class="btn btn-secondary py-1">바로구매</button>
              </div>
            </div>
          </div>
         
        </div>
         </c:forEach>
        <!-- ebook-searchmain-end -->
      </main>
      <!-- main-end 여기까지!!-->
    </div>
    <jsp:include page="../layout/footer.jsp"/>
  </div>


</body>

</html>