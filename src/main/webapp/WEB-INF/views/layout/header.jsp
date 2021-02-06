<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <!-- header -->
<nav class="navbar navbar-expand w-100 navbar-dark bg-dark">
            <div class="container-fluid">
                <img class="mr-2" src=img/kabookja.png alt="" width="80" height="50" onclick="location.href='main.do'" style="cursor: pointer;">
                <div class="searchform">
                    <form class="d-flex" action="search.do" accept-charset="utf-8" method="post">
                        <div class="combobox d-flex">
                            <select name="job">
                                <option value="all">도서통합검색</option>
                                <option value="domestic">국내도서</option>
                                <option value="overseas">해외도서</option>
                                <option value="ebook">e-book</option>
                            </select>
                        </div>

                        <input name="bookName" class="form-control" id="searchbox" type="text" placeholder="Search" aria-label="Search">
                        <button type="submit" class="btn btn-primary btn-sm" id="searchbtn">검색</button>
                    </form>
                </div>

                <div class="navbar-collapse justify-content-end" id="navbarsExample02">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                        	<%if(session.getAttribute("Smember")!=null){ %>
                        			<a class="nav-link" aria-current="page" href="logout.do">로그아웃</a>
                        		</li>
                        		<li class="nav-item">
                            		<a class="nav-link" href="myinfo.do">내정보</a>       
                        	<%}else{ %>
                            	<a class="nav-link" aria-current="page" href="signin.do">로그인</a>
                            	<li class="nav-item">
                            		<a class="nav-link" href="goSignup.do">회원가입</a> 
                            <%} %>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="cart.do?memberID=${Smember.memberID}">장바구니</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cslist.do">고객센터</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- header-end -->