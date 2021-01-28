<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
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
  

  <title>Signup</title>


  <link rel="stylesheet" href="css/signup.css">
  <script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="js/signup.js"></script>
</head>

<body class="bg-light">
  <div class="container">
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="" alt="로고(이미지 넣기)" width="72" height="72">
      <h2>회원가입을 환영합니다!</h2>
      <p class="lead">빈칸없이 모두 작성해주세요.</p>
    </div>

    <div class="row">
      <div class="col-md-12">
        <form id="signupForm" action="signup.do">
          <div class="row d-flex justify-content-center mb-3">
            <div class="col-md-6">
              <label for="mamberID">ID</label>
              <label for="">(최소 6자 이상)</label>
              <label class = d-block id="idlb" for="">[영문자,숫자 4~12자로 입력해주세요]</label>
              <input type="text" class="form-control" id="memberID" name="memberID" placeholder="ID를 입력하세요" value="" required>
          </div>
          </div>

          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-3">
              <label for="mamberName">이름</label>
              <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력하세요" value="" required>
            </div>
          </div>

          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-3">
              <label for="mamberPW">PW</label>
              <label id="pwlb" for=""></label>
              <input type="text" class="form-control" id="memberPW" name="memberPW" placeholder="PW를 입력하세요" value="" required>
            </div>
          </div>

          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-3">
              <label for="mamberPW2">PW 확인</label>
              <input type="text" class="form-control" id="memberPW2" placeholder="PW를 한번 더 입력하세요" value="" required>
            </div>
          </div>

          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-3">
              <label for="mamberPhoneNumber">연락처</label>
              <input type="text" class="form-control" id="memberPhoneNumber" name="memberPhoneNumber" placeholder="연락처를 입력하세요(000-0000-0000)"
                value="" required>
            </div>
          </div>

          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-3">
              <label for="mambernickname">닉네임</label>
              <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요" value="" required>
            </div>
          </div>

          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-3">
              <label for="mamberBirth">생년월일</label>
              <input type="text" class="form-control" id="memberBirth" name="memberBirth" placeholder="생년월일을 입력하세요(0000-00-00)" value=""
                required>
            </div>
          </div>

          <!-- Daum 우편번호 API -->
          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-3">
              <label for="mamberAddress">주소</label>
              <input type="text" class="form-control" id="sample3_postcode" placeholder="우편번호" required readonly>
              <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
              <div id="wrap"
                style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
                  style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()"
                  alt="접기 버튼">
              </div>
            </div>
          </div>

          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-0">
              <input type="text" class="form-control" id="sample3_address" name="firstAddress" placeholder="주소" required readonly><br>
            </div>
          </div>

          <div class="row d-flex justify-content-center">
            <div class="col-md-6 mb-3">
              <input type="text" class="form-control" id="sample3_detailAddress" name="lastAddress" placeholder="상세주소" required>
              <input type="text" class="form-control" id="sample3_extraAddress" name="extraAddress" placeholder="참고항목" readonly>
            </div>
          </div>



          <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
          <script>
            // 우편번호 찾기 찾기 화면을 넣을 element
            var element_wrap = document.getElementById('wrap');

            function foldDaumPostcode() {
              // iframe을 넣은 element를 안보이게 한다.
              element_wrap.style.display = 'none';
            }

            function sample3_execDaumPostcode() {
              // 현재 scroll 위치를 저장해놓는다.
              var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
              new daum.Postcode({
                oncomplete: function (data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                      extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                      extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample3_extraAddress").value = extraAddr;

                  } else {
                    document.getElementById("sample3_extraAddress").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample3_postcode').value = data.zonecode;
                  document.getElementById("sample3_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample3_detailAddress").focus();

                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_wrap.style.display = 'none';

                  // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                  document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize: function (size) {
                  element_wrap.style.height = size.height + 'px';
                },
                width: '100%',
                height: '100%'
              }).embed(element_wrap);

              // iframe을 넣은 element를 보이게 한다.
              element_wrap.style.display = 'block';
            }
          </script>
          <!-- Daum 우편번호 API-end -->
          <hr class="mb-4">
          <button class="btn btn-primary btn-lg btn-block">회원가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-5 pt-5 text-muted text-center text-small">
      <p class="mb-1">&copy; 2017-2020 Company Name</p>
      <ul class="list-inline">
        <li class="list-inline-item"><a href="#">Privacy</a></li>
        <li class="list-inline-item"><a href="#">Terms</a></li>
        <li class="list-inline-item"><a href="#">Support</a></li>
      </ul>
    </footer>
  </div>
</body>

</html>