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
			<a class="navbar-brand" href="http://localhost:8081/">주문완료</a>
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
						href="http://localhost:8081/loginForm">로그인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8081/joinForm">회원가입</a></li>


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
	border-right: solid 1px grey;
	margin: 35px 5px 0px 5px;
	padding-right: 10px;
}
</style>


				<div class="col-md-5 col-sm-12 mt-3" style="height: 100px;">
					<ul id="sub-menu" style="list-style: none;">
						<li><a>고객센터</a></li>
						<li><a>장바구니</a></li>
						<li><a>공지사항</a></li>
						<li style="border-right: none;"><a>제품리뷰</a></li>						
						
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


			<ul class="nav justify-content-center mb-5">
  <li class="nav-item">
    <a class="nav-link active" href="#">Active</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">Disabled</a>
  </li>
</ul>
			
			<!-- row end  메인메뉴 끝 -->
			<div class="row">
				<div class="col-md-12 col-sm-12 mt-5 mb-5   text-center">

					<h1>주문서</h1>
					<p style="color: #999;">주문하실 상품명 및 수량을 정확하게 확인해 주세요.</p>

				</div>

				<div class="col-md-12 col-sm-12 mt-2 mb-5">
					<div class="table table-responsive">

						<table class="table bg-white">
							<thead>
								<tr>

									<!-- nowrap 해상도 작아졌을때  글씨가 세로로 안떨어지게-->
									<td nowrap>상품정보</td>
									<td nowrap>판매금액</td>
									<td nowrap>수량</td>
									<td nowrap>결제금액</td>
								</tr>
							</thead>

							<tr>
								<td nowrap style="padding: 1px;">&nbsp <img
									src="../resources/itemUpload/${i.item_thumbnail}"
									alt="${i.item_thumbnail}" height="50" width="70">&nbsp${i.item_name}
								</td>
								<td nowrap>&nbsp${i.item_price}</td>
								<td nowrap>&nbsp<%=request.getParameter("count")%></td>
								<td nowrap id="total"></td>
							</tr>



							<!-- 고객이 고른 숫자 -->


						</table>

					</div>
				</div>

				<!-- buy 2번째  -->
				<div class="col-md-12 col-sm-12 mt-2 mb-5  ">
					<h6>
						<b>1.할인 및 혜택</b>
					</h6>
					<div class="table table-responsive">
						<table class="table bg-white">
							<thead>
								<tr>
									<td nowrap>쿠폰명</td>
									<td nowrap>할인금액</td>
									<td nowrap>기간</td>

								</tr>
							</thead>
							<c:forEach items="${cp}" var="c">
								<tr>
									<td nowrap><input id="price" name="cp_idx" type="checkbox"
										value="${c.cp_idx}">${c.cp_name}</td>
									<td nowrap><p id="cp_idx${c.cp_idx}">${c.cp_saleprice}</p></td>
									<td nowrap>${c.cp_date}</td>
								</tr>
							</c:forEach>

						</table>

					</div>
				</div>

				<style>
.row-bg-grey {
	background: #d1d3d4;
}
</style>
				<!-- 주문자정보  -->
				<div class="col-md-12 col-sm-12 mt-2 mb-5  ">
					<form>
						<h6>
							<b>2.주문자정보</b>
						</h6>

						<div class="table table-responsive">
							<table class="table">
								<tr>
									<td class="row-bg-grey" style="width: 200px" nowrap>주문자</td>
									<td class="bg-white" nowrap>${order.user_name }</td>

								</tr>
								<tr>
									<td class="row-bg-grey">이메일</td>
									<td class="bg-white">${order.user_email }</td>

								</tr>
							</table>

						</div>
					</form>
				</div>
				<!-- 주문자정보끝  -->
				<form action="orderList_ok" id="push1" method="post"
					name="orderListInfo" style="width: 1200px">
					<!-- 배송지정보  -->
					<div class="col-md-12 col-sm-12 mt-2 mb-5  ">

						<h6>
							<b>3.배송지정보</b>
						</h6>

						<div class="table table-responsive">

							<table class="table">

								<tr>
									<td class="row-bg-grey">수령인</td>
									<td class="bg-white"><input type="text"
										placeholoder="수령인을 입력해주세요" name="or_receiver"></td>
								</tr>
								<tr>
									<td class="row-bg-grey" nowrap>휴대전화</td>
									<td class="bg-white"><input type="text" value="휴대전화"
										name="or_phone"></td>
								</tr>
								<tr>
									<td class="row-bg-grey" nowrap>배송지</td>
									<td class="bg-white"><input type="button"
										onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_postcode" placeholder="우편번호"
										name="or_address" style="width: 450px;" readonly> <br>
										<input type="text" id="sample6_detailAddress"
										placeholder="상세주소" name="or_address2"></td>
								</tr>
								<tr>
									<td class="row-bg-grey">이메일</td>
									<td class="bg-white"><input type="email" placeholder="이메일"
										name="or_email"></td>
								</tr>
							</table>


						</div>
					</div>
					<!-- 배송지정보  -->



					<!-- 최종결제-->
					<div class="col-md-12 col-sm-12 mt-2 mb-1  ">

						<h6>
							<p class="text-center">
								<b>4.최종결제정보</b>
							</p>
						</h6>
						<div class="table table-responsive"
							style="width: 300px; margin: 40px auto;">
							<table class="table bg-white" style="border: 1px solid orange;">
								<tr>
									<td nowrap>주문 합계 금액</td>
									<td nowrap id="buySum"></td>

								</tr>

								<tr>
									<td nowrap>할인적용금액</td>
									<td><b id="coupon"></b>원</td>

								</tr>
								<tr>
									<td>배송비</td>
									<td>2500원</td>

								</tr>

								<tr>
									<td class="text-warning"><b>최종결제금액</b></td>
									<td><p>
											<b id="totalSum" class="text-warning"></b>원
										</p> <input type="hidden" id="hBuySum" name="hBuySum"> <input
										type="hidden" id="hCoupon" name="hCoupon"> <input
										type="hidden" id="hTotalSum" name="hTotalSum" value="">

										<input type="hidden" id="hCouponIdx" name="hCouponIdx"
										value="0"> <!-- itemDetail에서 get방식으로 받아온 count와 item_idx를 hidden으로 보냄. -->
										<input type="hidden" id="hCount" name="hCount"
										value=<%=request.getParameter("count")%>> <input
										type="hidden" id="item_idx" name="item_idx"
										value="${i.item_idx}"></td>
								</tr>


							</table>


							<!-- DetailPage에서 선택한 수량과 상품의 금액 합계를 구함 -->
							<script>
                     
                  
							$(document).ready(function(){
		                         $("input[id=price]").change(function(){
		                            //체크할시
		                             if($("input[id=price]").is(":checked")){
		                                //체크가 2개될시
		                                if( $('input:checkbox[id=price]:checked').length>1 ) {
		                                      //false값을 줘서 전체해제시킨다.
		                                      $("input[id=price]").prop("checked",false);
		                                      alert("한개만 선택하세요")
		                                      //새로고침 - 왜냐면 전체 해제가되었음에도 html에는 새로고침이안되어있어서
		                                      //그 전에 가격이 보인다.
		                                      location.reload(true);
		                                   } else {
		                                      //체크된것의 가격값을 가져온다
		                                      var cp_idx = $('input:checkbox[name=cp_idx]:checked').val();

		                                      var price = document.getElementById('cp_idx'+cp_idx).innerHTML;
		                                      
		                                      var hCouponIdx = document.getElementById('hCouponIdx');
		                                      hCouponIdx.value = cp_idx;
		                                      
                                      //할인적용금액란에 들어가는 가격.
                                      var saleprice = document.getElementById('coupon');
                                      saleprice.innerHTML= price;
                                      
                                      //총금액에 할인가 빼줌
                                   var totalSum = document.getElementById('totalSum');
                                     totalSum.innerHTML = (delivery + (Number(total.innerHTML)) - price);
                                     
                                   //hidden form으로 보낼것들
                                     //결제금액
                                     var hBuySum = document.getElementById('hBuySum');
                                     hBuySum.value = Number(total.innerHTML);
                                     //쿠폰
                                     var hCoupon = document.getElementById('hCoupon');
                                     hCoupon.value = Number(saleprice.innerHTML);
                                     //최종결제금액
                                     var hTotalSum = document.getElementById('hTotalSum');
                                     hTotalSum.value = Number(totalSum.innerHTML);
                                    
                                   }
                                
                             //체크된거 풀시
                             } else {
                                //새로고침 해줘야 값이 정상적으로 들어옴. 아니면 가격 이상하게뜸.
                                location.reload(true); 
                             }
                         });
                     });
                     
                     //위에 결제금액
                     var total = document.getElementById('total'); 
                     total.innerHTML= ${i.item_price} * <%=request.getParameter("count")%>
                     //배송비
                     var delivery = 2500;
                     //할인금액
                     var saleprice = document.getElementById('coupon'); 
                     saleprice.innerHTML= 0;
                     //주문합계금액
                     var buySum = document.getElementById('buySum').innerHTML = total.innerHTML 
                     //최종결제금액
                     var totalSum = document.getElementById('totalSum');
                            totalSum.innerHTML = (delivery + (Number(total.innerHTML)));
                            
                           
                     //hidden form으로 보낼것들
                     //결제금액
                     var hBuySum = document.getElementById('hBuySum');
                     hBuySum.value = Number(total.innerHTML);
                     //쿠폰
                     var hCoupon = document.getElementById('hCoupon');
                     hCoupon.value = Number(saleprice.innerHTML);
                     //최종결제금액
                     var hTotalSum = document.getElementById('hTotalSum');
                     hTotalSum.value = Number(totalSum.innerHTML);
                     
                     
                     
                     </script>
						</div>

					</div>
					<!-- 최종결제정보 끝 -->
				</form>

				<!--  결제하기 -->
				<div class="col-md12 col-sm-12 mb-5">
					<div style="margin: 0 auto; width: 50%;">
						<button class="btn btn-primary mr-3 " style="width: 40%;"
							onClick="history.back()">취소</button>

						<!-- form안에서가 아닌 바깥에서 결제하기버튼을 눌렀을때 submit하기 위해 form에 id값을 주고
						결제하기버튼에서 form="push1"로 form의id를 입력하고 type="submit"를 해주었다.-->
						<button type="submit" form="push1" id="submit"
							class="btn btn-warning ml-3 text-white" style="width: 40%;">결제하기</button>
					</div>
				</div>
				<!--  결제하기끝 -->

				<!-- row 끝 -->
			</div>

			<!-- 다중폼을 한번에 전송하기 -->
			<!-- 미구현 -->

			<script>
            $(function() {
               $("#btn_submit").click(function() {
                  $.post("경로", $(".sform").serialzie(), function(data) {

                  });
               });
            });
         </script>

			<form class="sform" action="abc"></form>

			<form class="sform" action="abc"></form>

			<!-- 끝 -->

		</div>
		<!-- row 끝 -->
	</div>
	<!--container 종료 -->
	</div>
	<!-- box-padding-big grey-bg  -->

	<!-- 주소입력창 관련 스크립트  -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
               function sample6_execDaumPostcode() {
                  new daum.Postcode(
                        {
                           oncomplete : function(data) {
                              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                              var addr = ''; // 주소 변수
                              var extraAddr = ''; // 참고항목 변수

                              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                 addr = data.roadAddress;
                              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                 addr = data.jibunAddress;
                              }

                              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                              if (data.userSelectedType === 'R') {
                                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                 if (data.bname !== ''
                                       && /[동|로|가]$/g
                                             .test(data.bname)) {
                                    extraAddr += data.bname;
                                 }
                                 // 건물명이 있고, 공동주택일 경우 추가한다.
                                 if (data.buildingName !== ''
                                       && data.apartment === 'Y') {
                                    extraAddr += (extraAddr !== '' ? ', '
                                          + data.buildingName
                                          : data.buildingName);
                                 }
                                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                 if (extraAddr !== '') {
                                    extraAddr = ' (' + extraAddr
                                          + ')';
                                 }
                                 // 조합된 참고항목을 해당 필드에 넣는다.

                              }

                              // 우편번호와 주소 정보를 해당 필드에 넣는다.
                              document
                                    .getElementById('sample6_postcode').value = "("
                                    + data.zonecode
                                    + ")"
                                    + " "
                                    + addr + " " + extraAddr;

                              // 커서를 상세주소 필드로 이동한다.
                              document.getElementById(
                                    "sample6_detailAddress")
                                    .focus();
                           }
                        }).open();
               }
            </script>
	<!-- 뒤로가기를 눌렀을때 이 페이지로 오는걸 방지. 
         itemEnd에서 뒤로가기눌러 이 페이지로 오고나서 다시 결제하기를 누르면 데이터에 값이 
         입력되기때문에 방지해야한다. -->
	<script type="text/javascript">
       window.history.forward();
       function noBack(){window.history.forward();}
       </script>
	<footer class="footer"
		style="background-color: #ffc107; text-align: center; padding-top: 80px; padding-bottom: 50px; padding-left: 50px; padding-right: 50px;">
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