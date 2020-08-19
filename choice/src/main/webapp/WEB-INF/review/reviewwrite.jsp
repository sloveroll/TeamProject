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


<!--  폰트구글 CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://use.fontawesome.com/5ac93d4ca8.js"></script>
<script src="../resources/js/bootstrap4-rating-input.js"></script>
<!-- my css -->
<link rel="stylesheet" href="./resources/css/noticewritetable.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<title>제품후기게시판</title>

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
			<a class="navbar-brand" href="#">제품리뷰글쓰기페이지-제품리뷰</a>

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
						href="http://localhost:8081/noticelist">공지사항</a></li>
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

			<div class="row" style="margin: 70px 0 20px 0; padding-top: 10px;">

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
		<!--container종료  -->
	</div>
	<!-- box-padding-big grey-bg 종료 -->


	<!-- 제품리뷰작성 게시판 row열   -->
	<div class="box-padding-big grey-bg"
		style="height: 600px; margin-top: -20px;">

		<div class="container" style="height: 400px;">
			<div class="row" style="height: 400px;">
				<!-- 컨텐츠복사 -->
				<!-- 12grid system -->
				<!--좌측 공지사항   -->
				<div class="col-md-2 col-sm-12" style="height: 190px;">

					<ul class="list-group"text-align:center;">

						<a href="#"><li class="list-group-item active bg-warning">제품리뷰쓰기</li></a>
						<a href="reviewlist"><li class="list-group-item">제품리뷰게시판</li></a>



					</ul>

				</div>
				<!--좌측 공지사항  종료 -->

				<!--리뷰글쓰기 게시판  -->

				<div class="col-md-10 col-sm-12" style="height: 200px;">
					<form onsubmit="return submitContents()" action="reviewWrite_ok"
						method="post" name="reviewInfo" enctype="multipart/form-data"
						style="width: 76%">

						<table cellpadding="0" cellspacing="0" border="1"
							style="text-align: center; border: 1px;" class="noticewritetable">

							<thead>

								<tr>

									<th colspan="2"
										style="background-color: #eeeeee; text-align: center;">제품후기
										양식</th>

								</tr>

							</thead>


							<tbody>

								<tr>

									<td>
										<div class="form-inline ">
											<input type="text" class="form-control" placeholder="제품번호"
												name="review_item_idx" maxlength="50" />
											<div class="input-group">
												<!-- 별점 -->
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon1"
														style="background-color: #EEEEEE; border-radius: 0 5px 5px 0;">별점</span>
												</div>
												<input type="number" name="reviewScore" id="rating1"
													class="rating text-warning  
				   									border p-2 bg-white form-control"
													value="5" aria-describedby="basic-addon1" />
											</div>


										</div>



									</td>

								</tr>




								<tr>

									<td><input type="text" class="form-control"
										placeholder="제품리뷰 제목" name="review_title" maxlength="30" /></td>

								</tr>

								<tr>

									<td><textarea class="form-control" placeholder="제품리뷰 내용"
											name="review_content" maxlength="2048" style="height: 350px;"></textarea></td>

								</tr>
								<tr>

									<td>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1"
													style="background-color: #EEEEEE;">이미지</span>
											</div>
											<input type="file" name="review_thumbnail"
												class=" form-control" style="line-height: 19px" />
										</div> <!--  파일업로드-->

									</td>



								</tr>

							</tbody>

						</table>

						<div class="float-right">

							<a class="btn btn-primary  mr-1" href="reviewlist">취소</a> <input
								type="submit" class="btn btn-success " value="글쓰기" />
						</div>
					</form>



				</div>

				<!--제품리뷰작성 게시판종료  -->

			</div>

		</div>
		<!--container 종료  -->

	</div>
	<!-- box-padding-big grey-bg 종료 -->






	<!--자바스크립트 공지사항 글쓰기,글수정에 공백,띄어쓰기뿐일때 값없음 처리  -->
	<script>
		function submitContents() {
			var title = document.reviewInfo.review_title.value;
			var cont = document.reviewInfo.review_content.value;
			// 값이 들어간 길이 만큼 제목과 본문의 공백을 제거
			for (var i = 0; i < 100; i++) {
				title = title.replace(" ", "");
				cont = cont.replace(" ", "");
			}
			// 내용이 작성되어 있는 경우(띄어쓰기 아닌 경우) submit() 한다. 
			if (title != "" && cont != "") {
				document.forms[0].submit();
			} else { // 작성 된 내용이 하나도 없을 경우(띄어쓰기인경우) 안내 메세지 창 출력

				alert("리뷰제목이나 리뷰내용에 값이 없습니다.");
				return false;
			}
		}
	</script>




	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="./resources/js/jquery-2.2.4.min.js"></script>
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