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
          


         </ul>
      </div>
   </nav>
   <!-- 네비바 종료  -->
</div>
<!-- header 종료  -->



<!-- 상품 설명   -->

<div class="box-padding-big grey-bg" style="margin-top: -50px; padding-top: 80px; padding-bottom: 180px;">

   <div class="container ">
      <!-- 컨텐츠복사 -->
      <!-- 12grid system -->

      <div class="row bg-grey" style="margin-top: 100px; ">

          <div class="col-md-3 col-sm-12">
           <div  style="background: white; width: 180px; height: 130px;"><img src="./resources/images/brandlogo.png"  width="100%" height="100%"></div>
          </div>
         
        <%@include file="/WEB-INF/item/searchbar.jsp"%>


            
            
            
            <style>
             #sub-menu li { float: left;  margin: 35px 5px 0px 5px; }
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
        
         .top-menu a {  color: black; font-weight: bold;}
         .top-menu a:hover{text-decoration: none; color:orange;}
         #bottom-menu {border-bottom: 1px solid black; padding: 15px 0 15px 0; border-top: 1px solid grey;}
      </style>
     
      <div class="row mt-5" id="bottom-menu"  style="border-radius: 10px;border: 1px solid orange;box-shadow: 7px 7px 8px 0px orange inset;">
         
         <div  class="top-menu col-md-12 col-sm-12 text-center" >
           <a href="sort1">메인  <small>|</small></a>
            <a href="sort2">반찬  <small>|</small></a>
            <a href="sort3">김치&샐러드  <small>|</small></a>
            <a href="sort4">정육&양념육  <small>|</small></a>
         </div>
      </div>
      <!-- row end  메인메뉴 끝 -->
      <!-- 주문 완료창 row -->
      <style>
         .table tr td{ vertical-align: middle; text-align: center;}
      </style>
      <div class="row mt-5">
         <div class="col-md-12 col-sm-12 mt-5 mb-5">
            <h1 class="text-center mt-5 mb-5">주문이 완료되었습니다.</h1>
            <table class="table table-bordered bg-white" style="width: 60%; margin: 0 auto;">
               
                <tr>
                  <td>주문번호<br>${order.or_idx}</td>
                  <td>주문일자<br>${order.or_date}</td>
                  <td>결제금액<br>${order.or_totalsum}원</td> 
                </tr>
           
                
         </table>

         <!-- col 닫음 -->
         </div>

         <!-- col 열음 링크 설정할 것  -->
         <div class="col-md-12 col-sm-12 mt-2 text-center text-white mb-5">
         <a class="btn btn-warning  mr-3" style="width: 30%;" href="/">계속쇼핑하기</a>
         <a class="btn btn-danger  ml-3" style="width: 30%;" href="orderList">구매내역확인</a> 
      </div>
</div>
<!-- row 끝 -->
</div>
   <!--container 종료 -->
</div>
<!-- box-padding-big grey-bg  -->

<footer class="footer" style="background-color: #ffc107; text-align: center;
    padding-top: 30px;
    padding-bottom: 50px;
    padding-left: 50px;
    padding-right: 50px;
    ">
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