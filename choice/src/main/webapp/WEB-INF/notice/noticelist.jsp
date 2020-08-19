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
<title>공지사항</title>

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
			<a class="navbar-brand" href="http://localhost:8081/noticelist">공지사항페이지-공지사항</a>
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
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8081/csList">고객상담센터</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8081/reviewlist">제품리뷰</a></li>


				</ul>
			</div>
		</nav>
		<!-- 네비바 종료  -->
	</div>
	<!-- header 종료  -->





	<!--고객센터 상담원   -->

	<div class="box-padding-big grey-bg" style="margin-top: -15px;">

		<div class="container">
			<!-- 컨텐츠복사 -->
			<!-- 12grid system -->

			<div class="row" style="margin: 70px 0 20px 0;">

				<div class="row">
					<div class="col-sm-12 col-md-10">
						<div class="thumbnail">
							<img src="./resources/images/counselor.png" class="mr-3"
								alt="상담원이미지" style="width: 150px;">
							<div class="caption">
								<h3>무엇을 도와 드릴까요?</h3>
								<p>궁금한 사항이나 불편한 사항은 저희 고객센터로 전화 주시거나 1:1 문의로 남겨주세요. 친절히 안내해
									드립니다.</p>
								<p>
									<a href="#" class="btn btn-success" style="color: white;"
										role="button">대화하기</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- row종료 -->


			</div>
			<!-- row종료 -->

		</div>
		<!--container 종료 -->
	</div>
	<!-- box-padding-big grey-bg 종료 -->



	<!-- 공지사항과 게시판 row열   -->
	<div class="box-padding-big4 grey-bg" style="margin-top: -20px;">

		<div class="container">
			<div class="row">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->
				<!--좌측 공지사항   -->
				<div class="col-md-2 col-sm-12" style="height: 190px;">

					<ul class="list-group" style="text-align: center;">

						<a href="http://localhost:8081/noticelist"><li
							class="list-group-item active bg-warning">공지사항</li></a>
						<a href="http://localhost:8081/csList"><li
							class="list-group-item">고객상담센터</li></a>
						<a href="http://localhost:8081/reviewlist"><li
							class="list-group-item">제품리뷰</li></a>


					</ul>

				</div>
				<!--좌측 공지사항  종료 -->

				<!--공지사항 게시판  -->
				<div class="col-md-10 col-sm-12" style="height: 200px;">


					<!--  우측 페이지 갯수별 보기란 -->
					<div id="outter" style="float: right;">
						<div style="float: right;">
							<select id="cntPerPage" name="sel" onchange="selChange()">
								<option value="10"
									<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
									보기</option>
								<%--                         <option value="20"
                           <c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
                           보기</option> --%>

							</select>
						</div>
					</div>
					<!--  outter-->

					<!-- 옵션선택 끝 -->


					<table cellpadding="0" cellspacing="0" border="1"
						style="text-align: center; border: 1px solid gray;">

						<tr height="50px" style="background-color: rgb(255, 190, 0);">
							<td style="width: 100px;">번호</td>
							<td style="width: 500px;">제목</td>
							<td style="width: 200px;">작성자</td>
							<td style="width: 200px;">작성일</td>
							<td style="width: 200px;">조회수</td>
						</tr>



						<c:forEach items="${viewAll }" var="list">
							<tr>
								<td>${list.notice_idx }</td>
								
								<!-- ?notice_idx=${list.notice_idx }로 idx값 get방식으로 보내줌.  -->
								<td><a href='noticeview?notice_idx=${list.notice_idx }'>${list.notice_title }</a></td>
								<td>${list.notice_writer }</td>
								<td>${list.notice_date }</td>
								<td>${list.notice_hit }</td>
							</tr>
						</c:forEach>

					</table>
					
					<!-- onclick으로 아래쪽 noticeWrite_ok()함수로 이동. -->
					<input type="submit"
					   class="btn btn-success pull-right" value="글쓰기"
					   style="float: right;" onclick="noticeWrite_ok()" />

					<!-- 게시판 페이징처리  부분 -->
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
						<li class="page-item">
						<c:if test="${paging.endPage != paging.lastPage}">
								<a class="page-link"
									href="/noticelist?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}">Next</a>

							</c:if>
							</li>
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


	<!--좌측하단 고객센터  (모바일뷰에선 사라짐)-->
	<div class="box-padding-big5 grey-bg" style="height: 400px;">

		<div class="container">
			<div class="row">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->
				<!--좌측 공지사항   -->
				<div class="col-md-2 col-sm-12" style="height: 190px;">

					<ul class="list-group" style="text-align: center;">

						<li class="list-group-item active bg-warning">고객센터</li>
						</a>
						<li class="list-group-item">평일10~18시</li>
						</a>
						<li class="list-group-item">공휴일 및 주말휴무</li>
						</a>


					</ul>

				</div>
			</div>
		</div>
	</div>
	<!--box-padding-big5종료   -->
<script>
/* 로그인ID가 관리자ID인 'admin'이여야 글쓰기 가능하게 함. 
   글수정,글삭제같은경우 작성자ID와 로그인ID가 같아야 수정,삭제 가능
   따라서 글은 관리자만 쓸 수 있으므로 작성자는 곧 관리자ID(admin)이고 로그인ID가
   관리자ID(admin)여야만 수정,삭제 가능하다.*/
function noticeWrite_ok(){
	<%String user_id = (String) session.getAttribute("login");%>
	
	/* 글쓰기 폼으로 이동 */
	if("<%=user_id%>" == "admin") {
		location.href="noticewriteForm"
	} else {
		alert("관리자만 글쓰기가 가능합니다.")
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