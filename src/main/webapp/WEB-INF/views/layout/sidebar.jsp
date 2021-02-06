<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <nav id="sidebarMenu" class="col-3 d-md-block bg-light sidebar collapse">
	<div class="sidebar sticky-top pt-3">
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed" type="button"
							data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne">국내도서</button>
					</h2>
				</div>

				<div id="collapseOne" class="collapse"
					aria-labelledby="headingOne" data-parent="#accordionExample">
					<div class="card-body">
						<ul>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=국내&bookCategory=소설">소설</a></li>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=국내&bookCategory=SF">SF</a></li>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=국내&bookCategory=에세이">에세이</a></li>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=국내&bookCategory=자기개발">자기개발</a></li>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=국내&bookCategory=전문서적">전문서적</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">해외도서</button>
					</h2>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionExample">
					<div class="card-body">
						<ul>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=해외&bookCategory=소설">소설</a></li>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=해외&bookCategory=SF">SF</a></li>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=해외&bookCategory=에세이">에세이</a></li>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=해외&bookCategory=자기개발">자기개발</a></li>
							<li><a class="accordion-menu" href="sidebarMenu.do?bookRegion=해외&bookCategory=전문서적">전문서적</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingThree">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							ebook</button>
					</h2>
				</div>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionExample">
					<div class="card-body">
						<ul>
							<li><a class="accordion-menu" href="membershipRegistration.do">멤버십가입</a></li>
							<li><a class="accordion-menu" href="sidebarEbookMenu.do?bookRegion=Ebook&bookCategory=소설">소설</a></li>
							<li><a class="accordion-menu" href="sidebarEbookMenu.do?bookRegion=Ebook&bookCategory=SF">SF</a></li>
							<li><a class="accordion-menu" href="sidebarEbookMenu.do?bookRegion=Ebook&bookCategory=에세이">에세이</a></li>
							<li><a class="accordion-menu" href="sidebarEbookMenu.do?bookRegion=Ebook&bookCategory=자기개발">자기개발</a></li>
							<li><a class="accordion-menu" href="sidebarEbookMenu.do?bookRegion=Ebook&bookCategory=전문서적">전문서적</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>