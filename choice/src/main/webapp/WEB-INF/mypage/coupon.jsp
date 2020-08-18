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
 <!-- <script src="../resources/js/jquery-2.2.4.min.js"></script> --> <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
      <a class="navbar-brand" href="http://localhost:8081/">쿠폰함</a>
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

<div class="box-padding-big grey-bg" style="margin-top: -50px; padding-top: 30px; padding-bottom: 400px;">

   <div class="container ">
      <!-- 컨텐츠복사 -->
      <!-- 12grid system -->

      <div class="row bg-grey" style="margin-top: 100px; ">

          <div class="col-md-3 col-sm-12">
            <div  style="background: white; width: 180px; height: 130px;"><img src="./resources/images/brandlogo.png"  width="100%" height="100%"></div>
          </div>
         
         <div class="col-md-5 col-sm-12" >
            <form action="검색링크" method="GET"> 
               <div class="input-group"  style="border-bottom: 4px solid orange;">
                  <input type="text" class="form-control" placeholder="Search" id="txtSearch " 
                  style="width: 50px; border: none;  margin-top: 30px;"/>
                 
                    <button class="btn input-group-addon" type="submit"  style=" margin-top: 25px;">
                      <span class="input-group-addon">
                        <i class="fas fa-search" style="color: orange; font-size: 30px;"></i></span></button>
               </div>
                     </form>
       
            </div>  
            
            
            
            <style>
               #sub-menu li { float: left; border-right: solid 1px grey; margin: 35px 5px 0px 5px; padding-right: 10px;}
            </style>
            
            
         <div class="col-md-4 col-sm-12 mt-3" style="height: 100px;">
            <ul id="sub-menu" style="list-style: none;">
            <li>메뉴1</li>
            <li>메뉴2</li>
            <li style="border-right: none;">메뉴3 end</li>
         </ul>
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
     
      <div class="row mt-5" id="bottom-menu" >
         
         <div  class="top-menu col-md-12 col-sm-12 text-center" >
            <a href="#">new  <small>|</small></a>
            <a href="#">반찬  <small>|</small></a>
            <a href="#">국  <small>|</small></a>
            <a href="#">메인요리  <small>|</small></a>
            <a href="#">샐러드  </a>
         </div>
      </div>
      <!-- row end  메인메뉴 끝 -->
      <!-- 주문 완료창 row -->
      <!-- row end  메인메뉴 끝 -->
    
          
            <style>
            .table td, .table th{
            vertical-align: middle;
            padding: 10px;
            }
            .table { border-bottom: 1px solid #dee2e6;}
            </style>
      
      
      
      <!-- 쿠폰 리스트 시작 -->
      <div class="row mt-5">
         <div class="col-md-2 col-sm-12" style="margin-top: 12.7%;">

         <ul class="list-group" style="text-align: center; ">
      
            <a href="orderList"><li class="list-group-item ">주문내역</li></a>
         
            <a href="coupon"><li class="list-group-item active bg-warning">할인쿠폰</li></a>
            <a href="deleteMember"><li class="list-group-item">회원탈퇴</li></a>
            <a href="memberModify"><li class="list-group-item">회원정보수정</li></a>
      
         </ul>
      
      </div>
      
      <div class="table-responsive  mt-5  col-md-10">
         <h1 class="mb-5">쿠폰함</h1>
            	<!-- 해당 ID에 쿠폰 갯수가 있는지 없는지 확인 -->
            <% 
         		if(request.getAttribute("cpCount") !=null && request.getAttribute("cpCount") !="" ){ 
         			int cpCount =  (int)request.getAttribute("cpCount");
         		%>
				<!--  있으면 아래꺼  출력 -->	
			<%if(cpCount >0){ %>   
            
            <table class="table text-center bg-white ">
               <tr>
                  <th>쿠폰번호 </th>
                  <th>쿠폰명</th>
                  <th>할인적용가</th>
                  <th>기한 </th>
                  
               </tr>
        	<!-- 쿠폰리스트 갯수를 불러옴 --> 		
         		   
               <c:forEach items="${ coupon }" var="coupon"  >
         	
                  <tr class="mt-3">
                     <td>${coupon.cp_idx}</td>
                     <td>${coupon.cp_name}</td>
                     <td>${coupon.cp_saleprice} 원</td>
                     <td>${coupon.cp_date} ~ ${coupon.cp_dateend }</td>
                   
                </tr>
                
                 </c:forEach>
                
          </table> 
          <!-- 없으면 없다고 <p>태그 작성 -->
           <% } %>
                
                 <%  }else {%>
        			<p>쿠폰이 없습니다!</p>
                  <%} ;%>
       			<!-- 설명부분 -->
               <div class=" col-md-12  col-sm-12 mt-5">
                  <h1>쿠폰관련 사항 입력하는 부분</h1>
               </div>
               <!-- 설명부분 닫음 -->
       </div>
       <!-- 쿠폰함 div 닫음 -->
      </div>
     <!-- row 닫음 -->
      </div>   
  <!-- 쿠폰함 div닫음 -->
       	
     
 
<!-- row 끝 -->
</div>
   <!--container 종료 -->

<!-- box-padding-big grey-bg  -->

<footer class="footer" style="background-color: #ffc107; text-align: center;
   
    padding-top: 30px;
    padding-bottom: 50px;
    padding-left: 50px;
    padding-right: 50px;
    width: 100%;
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