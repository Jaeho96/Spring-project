<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <title>로그인 화면</title>
  
  <link rel="stylesheet" href="css/signin.css">

</head>

<body class="text-center">

  <main class="form-signin">
    <form action="login.do" accept-charset="utf-8">
      <img class="mb-4" src="img/kabookja.png" alt="" width="150" height="100">
      <h1 class="h3 mb-3 fw-normal">로그인 해주세요</h1>
      <input type="text" name="memberID" id="inputId" class="form-control" placeholder="아이디를 입력해주세요" required autofocus>
      <input type="password" name="memberPW" id="inputPassword" class="form-control" placeholder="비밀번호를 입력해주세요" required>
      <button class="w-100 btn btn-lg btn-primary" id="login" type="submit">로그인</button>
      <p class="mt-5 mb-3 text-muted">&copy; Bootstrap</p>
    </form>
  </main>
</body>

</html>