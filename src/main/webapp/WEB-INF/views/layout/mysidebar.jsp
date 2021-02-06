<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<nav id="sidebarMenu" class="col-3 d-md-block bg-light sidebar collapse">
	<div class="sidebar sticky-top pt-3">
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left" type="button"
							data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">마이페이지</button>
					</h2>
				</div>

				<div id="collapseOne" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordionExample">
					<div class="card-body">
						<ul>
							<li><a class="accordion-menu" href="myinfo.do">내정보</a></li>
							<li><a class="accordion-menu" href="myPaymentReport.do?memberID=${Smember.memberID }">구매내역</a></li>
							<li><a class="accordion-menu" href="membershipRegistration.do">멤버쉽가입</a></li>
							<li><a class="accordion-menu" href="ebookBuyList.do?memberID=${Smember.memberID }">ebook뷰어</a></li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>