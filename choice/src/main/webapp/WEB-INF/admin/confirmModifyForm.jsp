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

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<title>관리자페이지-주문관리</title>

</head>
<!-- 페이징뷰 css  -->
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

a {
	text-decoration: none;
}
</style>


<body>

	<!--페이징 이동 뷰 selChange  -->
	<script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href = "noticelist?nowPage=${paging.nowPage}&cntPerPage="
					+ sel;
		}
	</script>


	<!-- header-->
	<div class="header">
		<!-- navbar: bootstrap navbar 예약어  -->
		<!-- navbar-expand-md : 중간크기화면에서 펼치기 스타일  -->
		<!-- navbar-dark:어두운 배경 스타일 적용 -->
		<!-- fixed-up: 네비바를 항상 화면 윗쪽에 고정 -->
		<!-- bg-dark: 네비바 배경을 어둡게 지정  -->

		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-warning">
			<!-- navbar-brand=:로고나 텍스트 지정. -->
			<a class="navbar-brand" href="http://localhost:8081/adminMain">관리자페이지-주문관리</a>
			<!--  admin -->
			<%
				if (session.getAttribute("admin") != null) {
				String admin = (String) session.getAttribute("admin");
			%>
			<div class="admin">
				<h5>
					<a href="orderList"><i class="fas fa-address-card"
						style="color: red; font-size: 2rem;"></i>&nbsp<%=admin%></a>&nbsp관리자님
					환영합니다.
				</h5>
			</div>

			<%
				}
			%>
			<!-- admin logprofile 종료 -->
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


	<!-- 공지사항과 게시판 row열   -->
	<div class="box-padding-big4 grey-bg"
		style="margin-top: 56px; height: 2000px;">

		<div class="container">
			<div class="row">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->
				<!--좌측 공지사항   -->
				<div class="col-md-2 col-sm-12" style="height: 250px; top: 55px;">

					<ul class="list-group" style="text-align: center;">

						<a href="http://localhost:8081/member">
							<li class="list-group-item bg-warning"
							style="color: white; border-radius: 10px;"><i
								class="fas fa-address-card"></i>회원관리</li>
						</a>
						<a href="http://localhost:8081/product">
							<li class="list-group-item bg-warning"
							style="color: white; border-radius: 10px;"><i
								class="fas fa-box-open"></i>상품관리</li>
						</a>
						<a href="http://localhost:8081/customer">
							<li class="list-group-item bg-warning"
							style="color: white; border-radius: 10px;"><i
								class="fab fa-facebook-messenger"></i>고객문의관리</li>
						</a>
						<a href="http://localhost:8081/order">
							<li class="list-group-item bg-warning"
							style="color: white; border-radius: 10px;"><i
								class="fab fa-cc-amazon-pay"></i>주문관리</li>
						</a>



					</ul>

				</div>
				<!--좌측 공지사항  종료 -->

				<!--공지사항 게시판  -->
				<div class="col-md-10 col-sm-12" style="height: 200px;">

					<br> <br> <br>
					<form action="confirm_ok?or_idx=${dto.or_idx }" method="post"
						name="productInfo">
						<table cellpadding="0" cellspacing="0" border="1"
							style="text-align: center; border: 1px solid gray;">

							<tr height="100px" style="background-color: rgb(255, 190, 0);">
								<td style="width: 100px;">아이디</td>
								<td style="width: 100px;">주문번호</td>
								<td style="width: 100px;">이름</td>
								<td style="width: 200px;">핸드폰번호</td>
								<td style="width: 200px;">주소1</td>
								<td style="width: 100px;">주소2</td>
								<td style="width: 200px;">이메일</td>

							</tr>



							<tr>
								<td>${dto.user_id }</td>
								<td>${dto.or_idx }</td>
								<td>${dto.or_receiver }</td>
								<td>${dto.or_phone }</td>
								<td>${dto.or_address }</td>
								<td>${dto.or_address2  }</td>
								<td>${dto.or_email }</td>

							</tr>


							<br>
							<br>
							<tr height="100px" style="background-color: rgb(255, 190, 0);">
								<td style="width: 150px;">주문금액</td>
								<td style="width: 150px;">할인쿠폰</td>
								<td style="width: 100px;">배송비</td>
								<td style="width: 100px;">주문총금액</td>
								<td style="width: 100px;">주문날짜</td>
								<td style="width: 100px;">상품현황</td>
								<td style="width: 100px;">기타</td>

							</tr>


							<tr>
								<td>${dto.or_buysum }</td>
								<td>${dto.or_coupon }</td>
								<td>${dto.or_delivery }</td>
								<td>${dto.or_totalsum }</td>
								<td>${dto.or_date }</td>
								<td><input type="text" type="submit" placeholder="상품현황"
									name="or_confirm" value="${dto.or_confirm }" /></td>
								<td>/</td>
							</tr>

						</table>
						<br> <br> <br> <input type="submit"
							class="btn btn-success pull-right" value="주문수정"
							style="margin-left: 450px" />
					</form>
					<!-- 페이징 부분 -->
					<!-- 하단페이지이동 -->
					<ul class="pagination">

						<!--이전페이지로이동  -->
						<li class="page-item"><c:if test="${paging.startPage != 1 }">
								<a class="page-link"
									href="/noticelist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>

							</c:if></li>

						<!-- 페이지 넘버 -->
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">

							<!--     < c :choose> : switch문 선언 
                                    < c :when> : switch의 case에해당  
                                    < c :otherwise> : switch문의 default값 해당-->
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<li class="page-item"><b class="page-link">${p }</b></li>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<li class="page-item"><a class="page-link"
										href="/noticelist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
								</c:when>
							</c:choose>

						</c:forEach>
						<!-- 페이지 넘버종료 -->

						<!-- 다음페이지로 이동 -->
						<li class="page-item"><c:if
								test="${paging.endPage != paging.lastPage}">
								<a class="page-link"
									href="/noticelist?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}">Next</a>

							</c:if></li>
					</ul>
					<!--ul pagination 종료  -->
					<!-- 페이지 종료  -->

					<!-- <!-- 하단페이지이동뷰 -->

				</div>
				<!--공지사항 게시판종료  -->

			</div>
			<!-- row 열 종료  -->

		</div>
		<!--container 종료  -->

	</div>
	<!-- box-padding-big grey-bg 종료 -->


	<script>
/* 로그인ID가 관리자ID인 'admin'이여야 글쓰기 가능하게 함. 
   글수정,글삭제같은경우 작성자ID와 로그인ID가 같아야 수정,삭제 가능
   따라서 글은 관리자만 쓸 수 있으므로 작성자는 곧 관리자ID(admin)이고 로그인ID가
   관리자ID(admin)여야만 수정,삭제 가능하다.*/
function orderDelete_ok(){
	<%String user_id = (String) session.getAttribute("login");%>
	
	/* 글쓰기 폼으로 이동 */
	if("<%=user_id%>
		" == "admin") {
				location.href = "order"
			} else {
				alert("관리자만 주문삭제가 가능합니다.")
			}

		}
	</script>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../resources/js/jquery-2.2.4.min.js"></script>
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