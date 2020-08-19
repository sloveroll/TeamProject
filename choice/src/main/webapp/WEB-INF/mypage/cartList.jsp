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

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>장바구니페이지</title>


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
			<a class="navbar-brand" href="#">장바구니</a>

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
					<li class="nav-item active"><a class="nav-link"
						href="http://localhost:8081/">메인가기</a></li>



				</ul>
			</div>
		</nav>
		<!-- 네비바 종료  -->
	</div>
	<!-- header 종료  -->



	<!-- 상품 설명   -->

	<div class="box-padding-big grey-bg"
		style="margin-top: -50px; padding-top: 80px; padding-bottom: 180px;">

		<div class="container ">
			<!-- 컨텐츠복사 -->
			<!-- 12grid system -->

			<div class="row bg-grey" style="margin-top: 100px;">
				<!-- 브랜드 반찬초잇 로고-->
				<div class="col-md-3 col-sm-12">
					<div style="background: white; width: 180px; height: 130px;">
						<img src="./resources/images/brandlogo.png" width="100%"
							height="100%">
					</div>
				</div>
				<!--  검색창-->
				<%@include file="/WEB-INF/item/searchbar.jsp"%>


				<style>
#sub-menu li {
	float: left;
	margin: 35px 5px 0px 5px;
}
</style>

				<!-- 로그인 로그아웃 섹션 -->
				<div class="col-md-4 col-sm-12" style="height: 100px;">
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
			<!--  장바구니 테이블 css -->
			<style>
.table td, .table th {
	vertical-align: middle;
	padding: 10px;
}

.table {
	border-bottom: 1px solid black;
}
</style>

			<!-- 장바구니 div 및table  -->
			<div class="col-md-12 col-sm-12 mt-5  mb-5">
				<h1 class="mb-5">장바구니</h1>


				<form action="itemBuy" method="post" onsubmit="return noneItem()">

					<input type="hidden" name="cart" value="true">

					<div class="table-responsive mb-5">
						<table class="table text-center ">
							<tr>
								<th>제품정보</th>
								<th>판매금액</th>
								<th>수량</th>
								<th>구매금액</th>
								<th></th>
							</tr>


							<!-- 유저 장바구니에 들어있는 리스트 갯수를 if문에 대입-->

							<c:forEach items="${cartlist}" var="cr">

								<tr>

									<!--td: nowrap ; 특정셀안 내용 지정된 테이블 폭 상관없이  줄바꿈 안일어나게 -->
									<td nowrap width="280" class="text-left"><input
										name="cart_idx${cr.cart_idx }" type="checkbox"
										value="${cr.cart_totalsum}" id="chkbox" checked> <img
										src="../resources/itemUpload/${cr.item_thumbnail}"
										alt="${cr.item_thumbnail}" height="50" width="70">
										${cr.item_name}</td>

									<!-- 판매금액 -->
									<td nowrap>${cr.cart_item_sellprice}</td>
									<!-- 수량 -->
									<td nowrap>${cr.cart_item_count}</td>
									<!-- 구매금액 -->
									<td nowrap>${cr.cart_totalsum}</td>

									<td nowrap><a href="cartDelete?cart_idx=${cr.cart_idx}">삭제</a></td>


								</tr>

							</c:forEach>

							<!-- 장바구니가 다 비어있을경우  -->
							<%
								if (request.getAttribute("msg") == "1") {
							%>
							<!--NOWRAP 모바일 화면시 글씨가 세로로 안떨어지게 -->
							<tr>
								<td colspan="4">장바구니에 담긴 상품이 없습니다
								<td>
							</tr>
							<%
								} ;
							%>
						</table>
					</div>
					<%
						if (request.getAttribute("msg") != "1") {
					%>
					<td height="25">&nbsp;<input name="allcheck" id="allCheck"
						type="checkbox" checked>&nbsp;모두선택 &nbsp; <!--  장바구니 상품 선택삭제버튼 -->
						<button type="submit" formaction="/cartDelete2">선택삭제</button> </a></td>
					<%
						} ;
					%>
				
			</div>
			<!-- 장바구니 div닫음 -->



			<!-- 선택제품상품금액 계산 란  -->
			<style>
.list-group-item {
	border: none;
}

.list-group {
	width: 63%;
	margin: 0 auto;
}

.list-group-item b {
	color: orange;
	font-size: 2em;
}
</style>
			<!-- 상품금액 계산란  -->
			<div class="col-md-12 col-sm-12">
				<ul class="list-group list-group-horizontal-md text-center">
					<li class="list-group-item" style="border: none;">제품금액<br>
						<span id="itemPrice"> </span></li>
					<li class="list-group-item"><b>-</b></li>
					<li class="list-group-item">배송비<br> <span id="sale">2500
					</span></li>
					<li class="list-group-item"><b>=</b></li>
					<li class="list-group-item">주문 합계금액<br> <span id="total">
							<li class="list-group-item"><button type="submit"
									class=" btn btn btn-warning"
									style="height: 100%; color: white;">선택제품주문</button></li>
				</ul>
			</div>

			<!-- 상품금액 계산 div 닫음 -->

			</form>
			<!--  form닫음 itembuy로 전송 -->


			<script>
				/*장바구니 담긴 제품 아무것도 선택 안되었을때   */
				function noneItem() {
					if ($('input:checkbox[id=chkbox]:checked').length < 1) {
						alert("상품을 선택, 추가해주세요");
						return false;
					} else {
						return true;
					}

				}

				/*주문합계금액 계산란   */
				var total = 0;
				//체크된 제품 금액 계산 .each() 선택요소가 여러개일때 각각 반복하여 함수 실행 
				//특정 조건 만족시 반복작업에서 벗어날떄 return false사용 
				$("input[id=chkbox]:checked").each(function() {
					//val() 선택 폼 속성값 설정이나 반환
					total = Number(total) + Number($(this).val());
				});

				//제품금액 
				$("#itemPrice").text(total);
				//주문 합계금액 2500은 배송비 
				$("#total").text(total + 2500);

				//체크박스 전체선택
				$(function() {
					//전체선택 체크박스 클릭 
					$("input[name=allcheck]").click(function() {
						//만약 전체 선택 체크박스가 체크된상태일 때 
						if ($("input[name=allcheck]").prop("checked")) {
							//전체 checkbox들을 체크해준다
							$("input[type=checkbox]").prop("checked", true);
							// 전체선택 체크박스가 해제된 경우 
						} else {
							//아니라면 모든 checkbox들의 체크를해제시킨다. 
							$("input[type=checkbox]").prop("checked", false);
						}
						total = 0;
						$("#itemPrice").text(0);
						$("#total").text(0);
						$("input[id=chkbox]:checked").each(function() {

							total = Number(total) + Number($(this).val());
							$("#itemPrice").text(total);
							$("#total").text(total + 2500);
						});

					})
				});

				//체크박스 클릭시 체크된 박스들 다시 계산

				$("input[id=chkbox]").click(function() {
					total = 0;
					$("input[id=chkbox]:checked").each(function() {

						total = Number(total) + Number($(this).val());
					});
					$("#itemPrice").text(total);
					$("#sum").text(total);
					$("#total").text(total + 2500);
				});
			</script>


			<!-- row 끝 -->
		</div>
		<!--container 종료 -->
	</div>
	<!-- box-padding-big grey-bg  -->

	<footer class="footer"
		style="background-color: #ffc107; text-align: center; padding-top: 30px; padding-bottom: 50px; padding-left: 50px; padding-right: 50px; width: 100%;">
		<!-- 푸터 : 회사방침 -->


		<a href="#" style="color: white;">회사소개 |</a> <a href="#"
			style="color: white;">이용약관 |</a> <a href="#" style="color: white;">개인정보처리
			방침 |</a> <a href="#" style="color: white;">이용안내</a>

	</footer>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->



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