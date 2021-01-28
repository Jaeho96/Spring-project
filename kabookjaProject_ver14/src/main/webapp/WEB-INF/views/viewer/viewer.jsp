<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous">
	
</script>

<title>Insert title here</title>
<link rel="stylesheet" href="css/viewer.css">

<script>
	$(document).ready(function() {

		function getSize() {
			size = $(".text-left").css("font-size");
			size = parseInt(size, 10);
			$("#font-size").text(size);
		}

		//get inital font size
		getSize();

		$("#up").on("click", function() {

			// parse font size, if less than 50 increase font size
			if ((size + 2) <= 100) {
				$(".text-left").css("font-size", "+=2");
				$("#font-size").text(size += 2);
			}
		});

		$("#down").on("click", function() {
			if ((size - 2) >= 12) {
				$(".text-left").css("font-size", "-=2");
				$("#font-size").text(size -= 2);
			}
		});
	});
</script>

</head>
<body>

	<!-- main -->
	<div class="container">
		<div class="row">
			<div class="col">
				<c:forEach var="ebooks" items="${ebooks}">
					<h1>
						<td>${ebooks.bookName}</td>
					</h1>
			</div>
		</div>
		<div class="row">

			<div class="col">
				<div class="badge text-wrap" style="width: 60rem;">
					<p class="text-left">${ebooks.ebookContent}</p>
				</div>

			</div>
		</div>
	</div>
	</c:forEach>



	<!-- footer -->
	<nav class="navbar fixed-bottom navbar-dark bg-dark">

		<div>
			<button onclick=" window.close();">Back</button>
		</div>

		<!-- <div class="btn-group" role="group" aria-label="Basic example"
			style="margin: 0 auto;">
			<button type="button" class="btm_image" id="img_btn1">
				<img src="./left.png">
			</button>
			<button type="button" class="btm_image" id="img_btn2">
				<img src="./right.png">
			</button>
			 -->

		</div>

		<div class="btn-group" role="group" aria-label="Basic example"
			style="margin: right">
			<button type="button" id="down">-</button>
			<p id="font-size" style="color: white;"></p>
			<button type="button" id="up">+</button>
		</div>


	</nav>

</body>
</html>