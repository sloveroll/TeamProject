<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 메뉴  -->
<link rel="shortcut icon" href="./resources/images/favicon.ico"
	type="image/x-icon">
<!-- JQuery -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!--  폰트구글 CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<!-- my css -->
<link rel="stylesheet" href="./resources/css/noticewritetable.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<title>공지사항 글쓰기게시판</title>

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
			<a class="navbar-brand" href="http://localhost:8081/noticelist">고객센터페이지-공지사항</a>
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

	<div class="box-padding-big grey-bg" style="margin-top: -20px;">

		<div class="container">
			<!-- 컨텐츠복사 -->
			<!-- 12grid system -->

			<div class="row" style="margin: 20px 0 20px 0;">

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
									<a href="#" class="btn btn-warning" style="color: white;"
										role="button">상담신청</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- row종료 -->


			</div>
			<!-- row종료 -->

		</div>
		<!-- container 종료 -->
	</div>
	<!-- box-padding-big grey-bg 종료 -->



	<!-- 공지사항과 게시판 row열   -->
	<div class="box-padding-big grey-bg"
		style="margin-top: -20px; height: 800px;">

		<div class="container" style="height: 400px;">
			<div class="row" style="height: 400px;">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->
				<!--좌측 공지사항   -->
				<div class="col-md-2 col-sm-12" style="height: 190px;">

					<ul class="list-group" style="text-align: center;">

						<a href="#"><li class="list-group-item active bg-warning">글쓰기</li></a>
						<a href="#"><li class="list-group-item">제품후기</li></a>
						<a href="#"><li class="list-group-item">주문취소방법</li></a>


					</ul>

				</div>
				<!--좌측 공지사항  종료 -->

				<!--공지사항 글수정 폼  -->
				<div class="col-md-10 col-sm-12" style="height: 200px;">
					<!--  submitContents: TEXT란 ,  공백문자 확인 -->
					<!--  onsubmit: action이 실행되기전에 확인함수로 이동시켜 확인후 리턴값이 false면 action이 실행안된다. -->
					<form onsubmit="return submitContents()"
						action="noticemodify_ok?notice_idx=${dto.notice_idx }"
						method="post" name="noticeInfo">

						<table cellpadding="0" cellspacing="0" border="1"
							style="text-align: center; border: 1px;" class="noticewritetable">


							<thead>
								<tr>
									<th colspan="2"
										style="background-color: #eeeeee; text-align: center;">글쓰기수정게시판
									</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td><input type="text" class="form-control"
										placeholder="글 제목" name="notice_title" maxlength="50"
										value="${ dto.notice_title }"></td>
								</tr>
								<tr>
									<td><textarea class="form-control" placeholder="글 내용"
											id="text_content" name="notice_content" maxlength="2048"
											style="height: 350px;">${ dto.notice_content }</textarea></td>
								</tr>
							</tbody>


						</table>


						<input type="submit" class="btn btn-success pull-right"
							value="글수정" style="float: right;" onClick="noticeModify_ok()" />

					</form>


				</div>

				<!--공지사항 게시판종료  -->

			</div>

		</div>
		<!--container 종료  -->

	</div>
	<!-- box-padding-big grey-bg 종료 -->


	<!--좌측하단 고객센터  -->
	<div class="box-padding-big grey-bg">

		<div class="container">
			<div class="row">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->
				<!--좌측 공지사항   -->
				<div class="col-md-2 col-sm-12" style="height: 190px;">

					<ul class="list-group" style="text-align: center;">

						<a href="#"><li class="list-group-item active bg-warning">고객센터</li></a>
						<a href="#"><li class="list-group-item">평일10~18시</li></a>
						<a href="#"><li class="list-group-item">공휴일 및 주말휴무</li></a>


					</ul>

				</div>
			</div>
		</div>
	</div>

	<!-- 자바 스크립트란  -->
	<!-- 글쓰기,글수정에 공백,띄어쓰기뿐일때 값없음 처리  -->
	<script>
		/* 둘중에 아무거나 쓰면 됨 
		var cont = $('#texta').val();
		var cong = document.getElementById("texta"); */
		function submitContents() {
			/* 위에 폼 name = noticeInfo로 설정. 글제목 td name = notice_title,글내용 td name = text_content로 설정. */
			var title = document.noticeInfo.notice_title.value;
			var cont = $('#text_content').val();

			/* var cont = document.getElementById('#texta'); */
			/* var cont = $("#texta").val(); */

			// 값이 들어간 길이 만큼 제목과 본문의 공백을 제거
			for (var i = 0; i < 100; i++) {
				title = title.replace(" ", "");
				cont = cont.replace(" ", "");
			}
			// 내용이 작성되어 있는 경우(띄어쓰기 아닌 경우) submit() 한다. 
			if (title != "" && cont != "") {
				return noticeModify_ok();

			} else { // 작성 된 내용이 하나도 없을 경우(띄어쓰기인경우) 안내 메세지 창 출력

				alert("제목이나 내용에 값이 없습니다.");
				return false;
			}
		}

		function noticeModify_ok() {

			var modify = confirm("정말로 수정하시겠습니까?");

			//수정버튼 물음 확인 클릭시 이동
			if (modify == true) {
				document.forms[0].submit();

			} else {
				//수정버튼  물음취소 클릭시 false값 return.
				return false;
			}

		}
	</script>

	<!--좌측하단 고객센터 종료 -->

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