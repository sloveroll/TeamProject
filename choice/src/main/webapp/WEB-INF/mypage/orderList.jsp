
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
<title>회원-마이페이지</title>

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
         <a class="navbar-brand" href="http://localhost:8081/noticelist">회원-마이페이지</a>
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
                  href="http://localhost:8081/coupon">할인쿠폰</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="http://localhost:8081/cartList">장바구니</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="http://localhost:8081/modifyPass">회원탈퇴</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="http://localhost:8081/memberModify">회원정보수정</a></li>


            </ul>
         </div>
      </nav>
      <!-- 네비바 종료  -->
   </div>
   <!-- header 종료  -->





   <!--마이페이지 회원정보란   -->

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
                        <h3>고객성함</h3>
                        <p>반갑습니다. 고객님 즐거운 쇼핑되세요 ~</p>
                        <p>
                           <a href="#" class="btn btn-warning" style="color: white;"
                              role="button">회원정보</a>
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



   <!-- 주문사항과 마이페이지게시판 row열   -->
   <div class="box-padding-big grey-bg"
      style="height: 400px; margin-top: -20px;">

      <div class="container">
         <div class="row">
            <!-- 컨텐츠복사 -->
            <!-- 12grid system -->
            <!--좌측 공지사항   -->
            <div class="col-md-2 col-sm-12" style="height: 265px;">

               <ul class="list-group" style="text-align: center;">

                  <a href="orderList"><li
                     class="list-group-item active bg-warning">마이페이지-주문내역</li></a>
                  <a href="cartList"><li class="list-group-item">장바구니</li></a>
                  <a href="coupon"><li class="list-group-item">할인쿠폰</li></a>
                  <a href="deleteMember"><li class="list-group-item">회원탈퇴</li></a>
                  <a href="memberModify"><li class="list-group-item">회원정보수정</li></a>

               </ul>

            </div>
            <!--좌측 공지사항  종료 -->

            <!--주문사항 게시판  -->
            <div class="col-md-10 col-sm-12" style="height: 300px;">



               <!-- 주문번호 제품이미지, 제품명, 주문자, 주문일, 주문수량, 총금액  -->
               <table cellpadding="0" cellspacing="0" border="1"
                  style="text-align: center; border: 1px solid gray;">

                  <tr height="50px" style="background-color: rgb(255, 190, 0);">
                     <td style="width: 100px;">주문번호</td>
                     <td style="width: 218px;">제품이미지</td>
                     <td style="width: 200px;">제품명</td>
                     <td style="width: 200px;">주문일</td>
                     <td style="width: 100px;">가격</td>
                     <td style="width: 100px;">주문취소</td>
                    <!--  <td style="width: 200px;">수량</td>
                     <td style="width: 200px;">총금액</td> -->
                  </tr>

                  <c:forEach items="${ list }" var="dto">
                     <tr height="50px">
                        <td>${dto.or_idx}</td>
                        <td><img src="../resources/itemUpload/${dto.item_thumbnail}"
								class="card-img-top" alt="${dto.item_thumbnail }" style="height: 100px;"></td>
								<%-- <c:if test="${not empty name}"> --%>

                        <td>${dto.item_name}</td>
                        <td>${dto.or_date}</td>
                        <td>${dto.item_price}</td>
                        
                        <!--주문삭제 기술 안되있음. 추후 수정   -->
                        <td> <a href="notice_ok?notice_idx=${dto.or_idx}"><input type="submit"
		                  class="btn btn-success pull-right" value="주문취소" onclick="return confirm('정말로 삭제하시겠습니까?');"


		                   /></a></td>
                      

                     </tr>
                  </c:forEach>

               </table>
			
               
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
   


   <!--하단페이지 종료 -->

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