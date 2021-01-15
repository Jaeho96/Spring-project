<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/views/css/cslist.css">

  <title>kabookja</title>
</head>

<body>

  <!-- content -->
  <div class="container-sm mt-4">
    <h2>고객센터</h2>
    <div class="table-responsive">
      <table class="table mt-4 table-hover text-center">
        <thead class="thead-dark">
          <tr>
            <th class="" scope="col">글번호</th>
            <th class="" scope="col">제목</th>
            <th class="" scope="col">작성자</th>
            <th class="" scope="col">작성일</th>
          </tr>
        </thead>
        <tbody class="listbody">
          <!-- db연결 후 적용 -->
          <c:forEach var="Service" items="${Service}">
            <tr>
              <td>${Service.helpNum}</td>
              <td>${Service.helpTitle}</td>
              <td>${Service.memberID}</td>
              <td>${Service.helpWritedate}</td>
            </tr>
          </c:forEach>
          <!-- <tr>
            <th scope="row">3</th>
            <td>제목3</td>
            <td>작성자3</td>
            <td>2021-02-10</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>제목2</td>
            <td>작성자2</td>
            <td>2021-02-06</td>
          </tr>
          <tr>
            <th scope="row">1</th>
            <td>제목1</td>
            <td>작성자1</td>
            <td>2021-02-03</td>
          </tr> -->
        </tbody>
      </table>
    </div>
    <div class="text-right">
      <button id="button_writing" type="button" class="btn btn-outline-secondary">글쓰기</button>
    </div>
  </div>

  <!-- Optional JavaScript; choose one of the two! -->

  <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>

  <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>

</html>