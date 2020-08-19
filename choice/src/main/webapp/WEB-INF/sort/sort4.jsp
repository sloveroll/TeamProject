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

<!--  bxslide css-->
<link rel="stylesheet" href="./resources/css/jquery.bxslider.css">
<!-- my css -->
<link rel="stylesheet" href="./resources/css/style.css">

<!-- 제이쿼리  -->
<script src="./resources/js/jquery-2.2.4.min.js"></script>
<!-- 제이쿼리 슬라이드  -->
<script src="./resources/js/jquery.bxslider.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<title>반찬초잇 메인페이지</title>


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
			<a class="navbar-brand" href="/">반찬초잇</a>
			<!-- 로그인 프로필 logprofile -->
			<%
				if (session.getAttribute("login") != null) {
				String user_id = (String) session.getAttribute("login");
			%>
			<!-- 회원모드 -->
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
						<li class="nav-item "><a class="nav-link" href="sort1">메인</a></li>
					<li class="nav-item "><a class="nav-link" href="sort2">반찬</a></li>
					<li class="nav-item "><a class="nav-link" href="sort3">김치&샐러드</a></li>
					<li class="nav-item active"><a class="nav-link" href="sort4">정육&양념육</a></li>

				</ul>
			</div>

			<!-- 관리자모드 -->
			<div class="admin">
				<h5>
					<a href="adminMain"><i class="fas fa-address-card"
						style="color: red; font-size: 2rem;"></i>관리자모드</a>

				</h5>
			</div>
			<!-- 관리자 아이디  -->
		</nav>
		<!-- 네비바 종료  -->
	</div>
	<!--header종료   -->

	<!-- 배너띠 box-padding-big2로 class명 변경-->

	<div class="box-padding-big2 grey-bg" style="padding-top: 64px;">

		<div class="container">
			<div class="row">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->

				<div class="col-md-12">
					<img src="./resources/images/bannerimg.jpg">
				</div>


			</div>

		</div>

	</div>
	<!--로그인/회원가입   -->

	<div class="box-padding-big3 grey-bg">

		<div class="container">
			<div class="row">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->

				<div class="col-md-2">
					<img src="./resources/images/brandlogo.png" width="200px"
						height="100px">
				</div>

				<!-- 검색창 인클루드용 -->
				<div class="col-md-4 col-sm-12">
					<form action="/search" method="GET">
						<div class="input-group" style="width: 355px; border-bottom: 4px solid orange;">
							<input type="text" class="form-control" name="searchWord"
								placeholder="Search" id="txtSearch "
								style="width: 50px; border: none; margin-top: 30px;" />

							<button class="btn input-group-addon" type="submit"
								style="margin-top: 25px;">
								<span class="input-group-addon"> <i class="fas fa-search"
									style="color: orange; font-size: 30px;"></i></span>
							</button>
						</div>
					</form>

				</div>
				<div class="col-md-6">
					<nav class="navbar navbar-expand-md navbar-dark"
						 style="position: absolute;top: 25px;right: 1px; ">

						<ul class="navbar-nav ml-auto">
							<!-- active: 현재 선택된 요소  -->
							<!-- nav-item : 메뉴 아이템  -->
							<!-- nav-link : 메뉴링크(클릭가능 ) -->

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

							<li class="nav-item"><a class="nav-link" href="csList"
								style="color: black;">고객센터 |</a></li>
							<li class="nav-item"><a class="nav-link" href="cartList"
								style="color: black;">장바구니 |</a></li>
							<li class="nav-item"><a class="nav-link" href="noticelist"
								style="color: black;">공지사항 |</a></li>
							<li class="nav-item"><a class="nav-link" href="reviewlist"
								style="color: black;">제품리뷰 </a></li>
	

						</ul>
					</nav>
				</div>

			</div>


		</div>

	</div>
	<!--  로그인/회원가입 종료-->


	<!-- bxslider -->
	<div class="box-padding-big grey-bg">

		<div class="container">
			<div class="row">

				<!-- 12grid system -->

				<div class="col-md-12"
					style="padding-left: 48px; padding-top: 20px;">
					<div class="bxslider">
						<div>
							<img src="./resources/images/mainslide1.jpg" title="슬라이더1">
						</div>
						<div>
							<img src="./resources/images/mainslide2.jpg" title="슬라이더2">
						</div>
						<div>
							<img src="./resources/images/mainslide3.jpg" title="슬라이더3">
						</div>

						<div>
							<!-- 임시 이미지 a태그 링크로 클릭시 쿠폰을 발급할 수 있도록 함 
						 -->
							<a href="/takeCoupon?cp_idx=1&cp_name=더반찬할인쿠폰&cp_saleprice=5000"><img
								src="./resources/images/mainslide4.jpg" title="슬라이더4"></a>
						</div>


					</div>
				</div>


			</div>

		</div>

	</div>


	<!-- 1.section 음식메뉴섹션-->

	<div class="box-padding-big grey-bg foodmenu"
		style="border-top: 1px solid lightgray; padding-top: 20px;">

		<div class="container">
			<div class="row">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->

				<!--메뉴섹션 8가지메뉴 -->
				<c:forEach items="${item}" var="i">
					<div class="col-md-3 col-sm-6 col-xs-12">

						<div class="card" style="width: 15rem; margin-bottom: 30px;">
							<!-- 썸네일 -->
							<img src="../resources/itemUpload/${i.item_thumbnail}"
								class="card-img-top" alt="${i.item_thumbnail }">
							<div class="card-body">
								<!-- 상품명 -->
								<h5 class="card-title">${i.item_name}</h5>
								<!-- 상품가격 -->
								<p class="card-text">
									<b>${i.item_price}</b>원
								</p>
								<!-- 상품상세 페이지로 이동 -->
								<a href="itemDetail?item_idx=${i.item_idx}"
									class="btn btn-warning" style="color: white;">메뉴상세</a>
								<!-- 장바구니 추가  -->
								<a
									href="/cartInsert?item_idx=${i.item_idx}&item_price=${i.item_price}&count=1"
									class="btn btn-warning" style="width: 82px; margin-left: 14px;"><i
									class="fas fa-shopping-cart " style="color: white;"></i></a>
							</div>
						</div>

					</div>
				</c:forEach>
				<!-- 메뉴섹션 8가지메뉴 끝 -->

			</div>
			<!-- 음식메뉴 row -->

		</div>

	</div>
	<!-- 1.section 음식메뉴8가지 섹션-->

	<!-- 4.section white background , mobile hide-->
	<div class="box-padding-big grey-bg"
		style="border-top: 1px solid lightgray; padding-top: 20px;">

		<div class="container">
			<div class="row">
				<!-- 콘텐츠복사 -->
				<div class="col-md-6">
					<img src="./resources/images/mobilechoit.png"
						style="float: left; width: 313px; height: 337px;">
					<h2 class="icon-title">
						반찬초잇 앱 <br>다운로드.<br> <strong>구글플레이에 접속.</strong>
					</h2>
					<p>
						구글플레이에 앱검색후 <br>다운로드해보세요.
					</p>


				</div>

				<div class="col-md-6">

					<img src="./resources/images/social.png" style="float: right">

					<ul class="bottom">
						<li><a href="https://www.facebook.com/choichul0213"
							target="_blank" class="sns"><i class="fab fa-facebook"
								id="facebook"></i></a></li>
						<li><a href="https://www.instagram.com/c.c0213/"
							target="_blank" class="sns"><i class="fab fa-instagram"
								id="insta"></i></a></li>

						<li><a href="https://blog.naver.com/qodhr222" target="_blank"
							class="sns"><i class="fas fa-blog" id="blog"></i></a></li>
					</ul>
					<h2 class="icon-title">
						반찬초잇 SNS.<br> <strong>다양한소셜네트워크교류.</strong>
					</h2>

					<p>반찬초잇은 소셜네크워크와 커뮤니티를 통해 더욱 적극적인 방법으로 고객들과의 커뮤니케이션을 강화하고있습니다.
						다양한 채널서 많은고객들과 소통하며 빠른피드백과 다양한의견을 듣기 위해 끊임없이 노력하겠습니다.</p>


				</div>

			</div>

		</div>

	</div>


	<!-- footer -->

	<footer class="footer"
		style="background-color: #ffc107; text-align: center; padding-top: 30px; padding-bottom: 50px; padding-left: 50px; padding-right: 50px;">
		<!-- 푸터 : 회사방침 -->


		<a href="#" style="color: white;">회사소개 |</a> <a href="#"
			style="color: white;">이용약관 |</a> <a href="#" style="color: white;">개인정보처리
			방침 |</a> <a href="#" style="color: white;">이용안내</a>

	</footer>



	<!-- Optional JavaScript -->
	<!-- bx slider 스크립트 -->
	<script>
		$(function() {
			$('.bxslider').bxSlider({
				slideWidth : 1460,
				/* captions: true, *///주석 
				auto : true, //자동재생
				autoControls : false, //Start/Stop 버튼 사용
				stopAutoOnClick : true,
				mode : "horizontal", //vertical, fade 전환효과
				speed : 100, //슬라이딩 속도
				adaptiveHeight : true, //이미지 높이에 따라 슬라이드 높이 결정

				touchEnabled : (navigator.maxTouchPoints > 0), //터치 스와이프 사용 결정
				controls : true, //Prev/Next 버튼 사용 여부
				prevText : "Prev", //이전버튼 문구
				nextText : "Next", //다음버튼 문구
				autoHover : false,//마우스 올리면 일시 정지 
				autoDelay : 100
			});
		});

		if ("${fail}" == "coupon") {
			alert("이미 수령한 쿠폰입니다");
		}
	</script>


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