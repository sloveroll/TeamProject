<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 메뉴  -->
<link rel="shortcut icon" href="./resources/images/favicon.ico"
	type="image/x-icon">

<!--  폰트구글 CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">


<!-- my css -->
<link rel="stylesheet" href="../resources/css/style.css">


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!-- Jquery -->
<!-- <script src="../resources/js/jquery-2.2.4.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>제품검색페이지</title>


</head>
<body>

	<!-- header-->
	<div class="header">
		<!-- navbar: bootstrap navbar 예약어  -->
		<!-- navbar-expand-md : 중간크기화면에서 펼치기 스타일  -->
		<!-- navbar-dark:어두운 배경 스타일 적용 -->
		<!-- fixed-up: 네비바를 항상 화면 윗쪽에 고정 -->
		<!-- bg-dark: 네비바 배경을 어둡게 지정  -->

		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-warning">
			<!-- navbar-brand=:로고나 텍스트 지정. -->
			<a class="navbar-brand" href="http://localhost:8081/">메인가기</a>
			<!-- 로그인 프로필 logprofile -->
			<%
				if (session.getAttribute("login") != null) {
				String user_id = (String) session.getAttribute("login");
			%>
			<div class="logprofile">
				<h5>
					<a href="orderList"><i class="fas fa-address-card"
						style="color: white; font-size: 2rem;"></i>&nbsp<%=user_id%></a>&nbsp님
					환영합니다.
				</h5>
			</div>

			<%
				}
			%>
			<!-- 로그인 프로필 logprofile 종료 -->

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<!-- 확장 토글 아이콘 : 기본 : 햄버거 아이콘 -->
				<span class="navbar-toggler-icon"></span>

			</button>

			<!-- collapse : 접혔다 폈다 하는 부분 정의  -->
			<!-- navbar-collapse: 접혔다 폈다하는 네비바  -->
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<!-- mr(margin-right)-auto :마진 오른쪽 자동 -->
				<!-- navbar-nav :  네비바 메뉴영역 -->
				<ul class="navbar-nav mr-auto">
					<!-- active: 현재 선택된 요소  -->
					<!-- nav-item : 메뉴 아이템  -->
					<!-- nav-link : 메뉴링크(클릭가능 ) -->
					<li class="nav-item active"><a class="nav-link" href="sort1">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="sort2">반찬</a></li>
					<li class="nav-item"><a class="nav-link" href="sort3">김치&샐러드</a></li>
					<li class="nav-item"><a class="nav-link" href="sort4">정육&양념육</a></li>


				</ul>
			</div>
		</nav>
		<!-- 네비바 종료  -->
	</div>
	<!-- header 종료  -->



	<!-- 상품 설명   -->

	<div class="box-padding-big grey-bg"
		style="margin-top: -50px; padding-top: 80px; padding-bottom: 230px;">

		<div class="container ">
			<!-- 컨텐츠복사 -->
			<!-- 12grid system -->

			<div class="row bg-grey" style="margin-top: 100px;">

				<div class="col-md-3 col-sm-12">
					<div style="background: white; width: 180px; height: 130px;">
						<img src="./resources/images/brandlogo.png" width="100%"
							height="100%">
					</div>
				</div>

				<!--  검색창 -->
				<%@include file="/WEB-INF/item/searchbar.jsp"%>

				<style>
#sub-menu li {
	float: left;
	margin: 35px 5px 0px 5px;
	padding-right: 10px;
}
</style>


				<div class="col-md-4 col-sm-12 mt-3" style="height: 100px;">
					<ul id="sub-menu" style="list-style: none;">

						<%
							/* 로그인전 */
						if (session.getAttribute("login") == null) {
						%>

						<li class="nav-item"><a class="nav-link" href="loginForm"
							style="color: black;">로그인 |</a></li>
						<li class="nav-item"><a class="nav-link" href="joinForm"
							style="color: black;">회원가입 |</a></li>

						<%
							} else {
						%><!-- /* 로그인후 */ -->

						<li class="nav-item"><a class="nav-link" href="logout"
							style="color: black;">로그아웃 |</a></li>
						<li class="nav-item"><a class="nav-link" href="orderList"
							style="color: black;">마이페이지 |</a></li>

						<%
							}
						%>

					</ul>
				</div>

			</div>
			<!-- row  end-->


			<!-- 메인메뉴 -->
			<style>
.top-menu a {
	color: black;
	font-weight: bold;
}

.top-menu a:hover {
	text-decoration: none;
	color: orange;
}

#bottom-menu {
	border-bottom: 1px solid black;
	padding: 15px 0 15px 0;
	border-top: 1px solid grey;
}
</style>

			<div class="row mt-5" id="bottom-menu"
				style="border-radius: 10px; border: 1px solid orange; box-shadow: 7px 7px 8px 0px orange inset;">

				<div class="top-menu col-md-12 col-sm-12 text-center">
					<a href="sort1">메인 <small>|</small></a> <a href="sort2">반찬 <small>|</small></a>
					<a href="sort3">김치&샐러드 <small>|</small></a> <a href="sort4">정육&양념육
						<small>|</small>
					</a>

				</div>
			</div>
			<!-- row end  메인메뉴 끝 -->
			<!-- /search 콘트롤러에서 받은 값을 찾음 -->
			<div class="row" style="margin-top: 180px">
				<!-- 검색결과 없을시 -->
				<%
					if (request.getAttribute("msg") == "none") {
				%>
				<div class="col-md-12 col-sm-12  mb-5   text-center">
					<p>
						<b class="text-warning">"${searchWord}"</b>검색어에 대한 검색결과가 없습니다
					</p>
				</div>
				<!-- 검색결과 있을시 -->
				<%
					} else {
				%>
				<div class="col-md-12 col-sm-12  mb-5   text-center">
					<p>
						검색어 <b class="text-warning"> "${searchWord}" </b> 에 대한 검색결과로 <b
							class="text-warning"> "${searchCount}" </b>건을 찾았습니다
					</p>
				</div>

				<!-- 제품검색결과를 리스트로 끄집어냄 -->
				<c:forEach items="${ searchResult }" var="sr">
					<div class="col-md-3 col-sm-6 ">

						<div class="card" style="width: 15rem; margin-bottom: 30px;">
							<!-- 썸네일 -->
							<img src="../resources/itemUpload/${sr.item_thumbnail}"
								class="card-img-top" alt="${sr.item_thumbnail }">
							<div class="card-body">
								<!-- 상품명 -->
								<h5 class="card-title">${sr.item_name}</h5>
								<!-- 상품가격 -->
								<p class="card-text">
									<b>${sr.item_price}</b>원
								</p>
								<!-- 상품상세 페이지로 이동 -->
								<a href="itemDetail?item_idx=${sr.item_idx}"
									class="btn btn-warning" style="color: white;">메뉴상세</a>
								<!-- 장바구니 추가  -->
								<a
									href="/cartInsert?item_idx=${sr.item_idx}&item_price=${sr.item_price}&count=1"
									class="btn btn-warning" style="width: 82px; margin-left: 14px;"><i
									class="fas fa-shopping-cart " style="color: white;"></i></a>
							</div>
						</div>

					</div>
				</c:forEach>



				<%
					}
				;
				%>

				<!-- row -->


			</div>
			<!-- row 끝 -->
		</div>
		<!--container 종료 -->
	</div>
	<!-- box-padding-big grey-bg  -->


	<footer class="footer"
		style="background-color: #ffc107; text-align: center; padding-top: 30px; padding-bottom: 50px; padding-left: 50px; padding-right: 50px;">
		<!-- 푸터 : 회사방침 -->


		<a href="#" style="color: white;">회사소개 |</a> <a href="#"
			style="color: white;">이용약관 |</a> <a href="#" style="color: white;">개인정보처리
			방침 |</a> <a href="#" style="color: white;">이용안내</a>

	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<!-- <script src="./resources/js/jquery-2.2.4.min.js"></script> -->

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>



</body>

</html>