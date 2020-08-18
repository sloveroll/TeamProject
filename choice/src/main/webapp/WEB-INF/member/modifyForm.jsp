
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

<title>회원정보수정</title>

</head>

<body>

   <div class="box-padding-big grey-bg" style="margin-top: 56px;">

      <!-- header-->
      <div class="header">
         <!-- navbar: bootstrap navbar 예약어  -->
         <!-- navbar-expand-md : 중간크기화면에서 펼치기 스타일  -->
         <!-- navbar-dark:어두운 배경 스타일 적용 -->
         <!-- fixed-up: 네비바를 항상 화면 윗쪽에 고정 -->
         <!-- bg-dark: 네비바 배경을 어둡게 지정  -->

         <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-warning">
            <!-- navbar-brand=:로고나 텍스트 지정. -->
            <a class="navbar-brand" href="/">반찬초잇</a>
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
                  <li class="nav-item active"><a class="nav-link" href="/">메인가기</a>
                  </li>
                 
					<li class="nav-item"><a class="nav-link" href="cartList">장바구니</a></li>
					<li class="nav-item"><a class="nav-link" href="noticelist">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="reviewlist">제품리뷰</a></li>


               </ul>
            </div>
         </nav>
         <!-- 네비바 종료  -->
      </div>
      <!-- header 종료  -->



      <!-- 회원가입수정  -->


      <div class="container">
         <div class="row">

            <!--  member 이미지-->
            <div class="col-md-12">
               <img src="./resources/images/member.png" style="margin-left: 15%; max-width: 70%;">

            </div>

            <div class="col-md-12">

               <!-- 점보트론 -->

               <div class="jumbotron" style="padding-top: 20px;">

                  <!-- 로그인 정보를 숨기면서 전송post -->

                  <form method="post"  onsubmit="return checkValue()"  id="userInfo" name="userInfo">

                     <h3 style="text-align: center;">회원정보수정</h3>

                     <div class="input-group form-group">

                        <input type="text" class="form-control" placeholder="아이디"
                            maxlength="20" style="text-align: center;" disabled="disabled">
                        <input type="text" class="form-control" value="${login}" disabled="disabled" style="background-color: white;"
                           name="user_id" maxlength="20">


                     </div>



                     <div class="input-group form-group">

                        <input type="text" class="form-control" placeholder="비밀번호"
                           maxlength="20" style="text-align: center;" disabled="disabled">
                        <input type="password" class="form-control" value="${modify.user_pw}"
                           name="user_pw" maxlength="20">


                     </div>
                    
                     <div class="input-group form-group">

                        <input type="text" class="form-control" placeholder="비밀번호 확인"
                           maxlength="20" style="text-align: center;" disabled="disabled">
                        <input type="password" class="form-control" value=""
                           name="pw_ok" maxlength="20">


                     </div>




                     <div class="input-group form-group">

                        <input type="text" class="form-control" placeholder="이름"
                            maxlength="20" style="text-align: center;" disabled="disabled">
                        <input type="text" class="form-control"
                           value="${modify.user_name}" name="user_name" maxlength="20">


                     </div>


                     <div class="input-group form-group">

                        <input type="text" class="form-control" placeholder="이메일"
                           maxlength="50" style="text-align: center;" disabled="disabled">
                        <input type="text" class="form-control"
                           value="${modify.user_email}" name="user_email"  maxlength="20">


                     </div>

                     <div class="input-group form-group">

                        <input type="text" class="form-control" placeholder="주소"
                           maxlength="50" style="text-align: center;" disabled="disabled">
                        <input type="text" class="form-control"
                           value="<%-- ${login.user_address} --%>" name="userAddress" maxlength="20">


                     </div>

                     <div class="input-group form-group" style="margin-right: 10px;">

                        <input type="button" class="btn btn-primary form-control"
                           value="메인가기" style="margin-right: 10px;" onClick="location.href='/'"> 
                        <input type="submit" class="btn btn-primary form-control"
                           value="회원정보변경" style="margin-right: 10px;" formaction="modifyUpdate"> 
                        <input type="submit" class="btn btn-primary form-control"
                           value="회원탈퇴 " onClick="leave()">
                     </div>

                  </form>
                  <!-- 회원가입수정form종료  -->

               </div>

            </div>

         </div>

      </div>

   </div>
   <!-- 회원가입수정 폼종료  -->
<script>
var check = true;
 function checkValue()
      {
	 	
         if(!document.userInfo.user_id.value){
            alert("아이디를 입력하세요.");
            check = false;
            return false;
            
         }
         
         if(!document.userInfo.user_pw.value){
            alert("비밀번호를 입력하세요.");
            return false;
           
         }
         
         // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
         if(document.userInfo.pw_ok.value != document.userInfo.user_pw.value ){
            alert("비밀번호를 동일하게 입력하세요.");
           
            return false;
         }
         if(!document.userInfo.user_name.value){
            alert("이름을 입력하세요.");
            
            return false;
         }
         if(!document.userInfo.user_name.value){
            alert("이메일을 입력하세요.");
       
            return false;
         }
      }
 
 
 //회원탈퇴버튼 클릭시
 function leave(){
	 var check = true;
	 if(!document.userInfo.user_pw.value){
         alert("비밀번호를 입력하세요.");
         return check = false;
      }
      
      if(document.userInfo.pw_ok.value != document.userInfo.user_pw.value ){
         alert("비밀번호를 동일하게 입력하세요.");
      	return check = false;
      
      
      }
      if(check == true){
		 var leave = confirm("정말로 탈퇴하시겠습니까?");
	
			//확인 클릭시 이동
			if(leave == true) {
				document.getElementById("userInfo").action = "/leave";
			} else {
				//취소 클릭시 아무것도 없음
			}
		
	     }
	}

 </script>

   <script src="./resources/js/jquery-2.2.4.min.js"></script>
   <script src="./resources/js/jquery.bxslider.js"></script>


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