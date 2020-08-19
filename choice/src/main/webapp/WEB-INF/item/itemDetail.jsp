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

<!--별점후기 작동 JS  폰트어썸과 부트스트랩 별점후기 작동 JS폴더에 , 이두가지가있어야한다.   -->

<script src="https://use.fontawesome.com/5ac93d4ca8.js"></script>
<script src="../resources/js/bootstrap4-rating-input.js"></script>

<title>제품구매완료</title>


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
			<a class="navbar-brand" href="http://localhost:8081/">제품상세페이지</a>
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

				<div class="col-md-3 col-sm-12">
					<div style="background: white; width: 180px; height: 130px;">
						<img src="./resources/images/brandlogo.png" width="100%"
							height="100%">
					</div>
				</div>

				<%@include file="/WEB-INF/item/searchbar.jsp"%>


				<style>
#sub-menu li {
	float: left;
	margin: 35px 5px 0px 5px;
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
			<!-- low  end-->


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

			<!-- 상품상세페이지 제품사진 -->
			<div class="row" style="margin-top: 150px">
				<div class="col-md-6 col-sm-12">

					<!--  좌측 상품 이미지 -->
					<div style="height: 400px; width: 100%;">
						<img src="../resources/itemUpload/${i.item_thumbnail}"
							alt="${i.item_thumbnail}" style="height: 400px; width: 500px;">
					</div>
				</div>

				<!-- 상품상세페이지 설명표 -->

				<!--  평점: 가로로 나란히 나열 및 별점사이즈 조절  기능 -->
				<style>
.rating-input {
	display: inline-block;
	font-size: 25px;
}

.fa-star {
	font-size: 25px;
}
</style>

				<div class="col-md-6 col-sm-12 mt-3">
					<h5>반찬초잇</h5>
					<h1>제품명:${i.item_name}</h1>

					<div>
						<h3 style="display: inline-block;">평점:</h3>
						<div class="rating text-warning text-lg-left"
							style="display: inline-block;">${i.item_score}</div>
					</div>

					<!-- class="fa fa-star" 차있는거  fa fa-star-o비어있는거         -->

					<hr>
					<!--  수평선 -->
					<!--  가격 표시란 -->
					<p>
						가격&nbsp&nbsp<b id="price" class="warning"
							style="font-size: 2em; margin-left: 40px;">${i.item_price}</b>원
					</p>

					<!-- 수량 버튼, input을 뭉쳐줌 -->
					<div class="input-group ">

						<p style="margin: 10px 40px 0px 0px;">수량</p>
						<!--수량뺴기  -->
						<button id="minus" class="btn btn-primary input-group-addon"
							onclick="minus()">-</button>

						<!-- 제품수량 기본값은 1개 id="count" -->
						<input type="text" id="count"
							style="width: 50px; text-align: center;" value="1">

						<!--수량더하기  -->
						<button id="plus" class="btn btn-primary input-group-addon"
							onclick="plus()">+</button>
					</div>

					<!-- 총금액: id="sum"-->
					<h5 class="text-right mt-3 mb-3 mr-4">
						총금액 :&nbsp <strong id="sum"
							style="font-size: 40px; color: orange;"></strong>원
					</h5>


					<!-- 해당 페이지에서 선택한 수량과 item_idx를 form에 넣는다  -->
					<form method="get">

						<!-- 장바구니 버튼 클릭을 통해 원하는 위치로 form값을 보낸다 장바구니 : id="insertCart" -->
						<a type="button" id="insertCart" class="btn-light btn" href=""
							style="border: 1px solid #b4b6b8; width: 46%; padding: 2%;"><i
							class="fas fa-shopping-cart"></i>&nbsp장바구니</a>

						<!-- 바로구매하기a id="myHref"  -->
						<a id="myHref" onClick="myAnchor()"
							class="btn-warning btn text-white"
							style="border: 1px solid #b4b6b8; width: 46%; padding: 2%;"><i
							class="fas fa-money-check-alt"></i>&nbsp바로구매하기</a>

					</form>

				</div>
				<!-- row종료 -->



				<!-- 상품에 입력한 값들 폼에다 옮겨서 보내는 폼 -->
				<div class="row mt-1">
					<div class="col-md-12 col-sm-12 pull-right"></div>
					<form>
						<!-- form을 통해서 이용자가 고른 값 제출 -->
					</form>

				</div>


				<!-- 상세설명 -->
				<style>
/* 리스트 a태그 밑줄 제거, 폰트컬러 블랙, bg-warning 적용시 폰트컬러 흰색으로 */
.list-group-item a, a:hover {
	text-decoration: none;
	color: black;
}

.list-group-item {
	width: 25%;
}

.bg-warning a {
	color: white;
}
</style>
				<!-- 버튼4개 제품정보 / 정보고시/ 고객후기/ 주의&배송사항 -->
				<div class="row mt-3">

					<div class="col-md-12 col-sm-12 mb-5 mt-5">
						<!-- 리스트를 가로로 하고 싶을 떄 list-group-horizontal    화면마다 적용하고 싶을 때 -md, -sm 등을 붙이면 됨 -->
						<ul class="list-group list-group-horizontal text-center">
							<li class="bg-warning list-group-item"><a name="제품정보"
								href="#제품정보">제품정보</a></li>
							<li class="list-group-item"><a href="#정보고시">정보고시</a></li>
							<li class="list-group-item"><a href="reviewlist">고객후기 </a></li>
							<li class="list-group-item"><a href="#주의&배송사항">주의&배송사항</a></li>
						</ul>
					</div>

					<div class="col-md-12  col-sm-12 " style="margin: 0 auto;"
						id="정보고시">
						<img src="../resources/itemUpload/${i.item_thumbnail2}"
							alt="${i.item_thumbnail2}" width="100%">
					</div>


					<div class="col-md-12  col-sm-12 " style="margin: 0 auto;">
						<img src="../resources/itemUpload/${i.item_thumbnail3}"
							alt="${i.item_thumbnail3}" width="100%">
					</div>


					<div class="col-md-12  col-sm-12 " style="margin: 0 auto;"
						id="제품안내">
						<img src="../resources/itemUpload/${i.item_thumbnail4}"
							alt="${i.item_thumbnail4}" width="100%">
					</div>

					<div class="col-md-12  col-sm-12 " style="margin: 0 auto;"
						id="주의&배송사항">
						<img src="../resources/itemUpload/deliver.png" alt="주의/배송안내"
							width="100%">
					</div>


				</div>
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


	<!-- 수량 계산 script-->
	<script>
	//수량 count 총 금액 sum 
                        var count = document.getElementById("count");
                        var sum = document.getElementById("sum");
                        
                        document.getElementById("sum").innerHTML = (${i.item_price} * count.value) ;
                       
                        
                      
                     $(function(){
                           var a = $('#count');
                           //blur 이벤트: 엘리멘트 포커스 해제시 발생
                           //blur = count에 수량 focus 벗어날 시 자동계산 
                           a.blur(function(){
                           $('#sum').text( ${i.item_price} * count.value );
                           //val() : form양식 값 가져오거나 값 설정 메소드 
                           $('#count').val(a.val());
                           insertCart();  
                           
                           });
                        });
                     
                        //수량뺴기
                        function minus(){
                           var count = document.getElementById("count");
                           count.setAttribute("value",  Number(count.value) - 1); 
                           /* var minus = Number(count.value) - 1;
                           count.value= minus; */
                           //1개 미만일 때 - 눌렀을 때  
                           if(count.value < 1){ 
                           alert("1개 이상으로 선택해주세요");   
                           count.value = 1;
                           insertCart();  
                           }
                           
                           document.getElementById("sum").innerHTML =  ( ${i.item_price} * count.value);
                           insertCart();  
                        }
                        
                        //수량 더하기 
                           function plus(){
                             var count = document.getElementById("count");
                             count.setAttribute("value",  Number(count.value) + 1); 
                           /*  var plus = Number(count.value) + 1
                           count.value= plus;  */
                           document.getElementById("sum").innerHTML = ( ${i.item_price} * count.value);
                           insertCart();  
                        }
                           
                           </script>

	<script>
                        //바로구매하기 버튼 클릭시 주문서(itembuy)로 하이퍼링크 추가.    
                        function myAnchor(){
                           <%if (session.getAttribute("login") != null) {%>
                           
                           //ID가 myHref인 a태그를 가져온다.
                            var myAnchor = document.getElementById("myHref");
                            
                           //href에 추가한다.
                            myAnchor.setAttribute("href", "itemBuy?cart=false&item_idx=${i.item_idx}" + "&count=" + count.value);
                            <%} else {%>
                              alert("로그인 해주세요.");
                              <%}%>
                         } 
                      
                        insertCart();   
                        
                        //장바구니 버튼클릭시 담기 추가
                        function insertCart(){

                        var insertCart = document.getElementById("insertCart");
                        //cartListController /cartInsert
                        	insertCart.href="/cartInsert?item_idx=${i.item_idx}&item_price=${i.item_price}";
                        	insertCart.setAttribute("href", insertCart.href + "&count=" + count.value);// .href += "&hCount=" + 1;
                        }
                        
                        </script>


	<!-- 수량계산 끝 -->

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