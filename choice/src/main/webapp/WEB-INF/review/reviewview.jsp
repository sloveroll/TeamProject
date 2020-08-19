
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

 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <script src="https://use.fontawesome.com/5ac93d4ca8.js"></script>
    <script src="../resources/js/bootstrap4-rating-input.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
   integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
   crossorigin="anonymous">
<title>게시판후기리뷰</title>

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
         <a class="navbar-brand" href="http://localhost:8081/noticelist">고객제품리뷰게시판-제품리뷰</a>
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


   <!--고객센터 상담원   -->

   <div class="box-padding-big grey-bg" style="margin-top: -13px;">

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



   <!-- 제품리뷰공지사항과 게시판 row열   -->
   <div class="box-padding-big grey-bg"
      style="height: 600px; margin-top: -20px;">

      <div class="container">
         <div class="row">
            <!-- 컨텐츠복사 -->
            <!-- 12grid system -->
            <!--좌측 공지사항   -->
            <div class="col-md-2 col-sm-12" style="height: 190px;">

               <ul class="list-group" style="text-align: center;">

                  <a href="http://localhost:8081/reviewlist"><li
                     class="list-group-item active bg-warning">제품리뷰</li></a>
                  <a href="http://localhost:8081/noticelist"><li
                     class="list-group-item">공지사항</li></a>
                  <a href="#"><li class="list-group-item">주문취소방법</li></a>


               </ul>

            </div>
            <!--좌측 제품리뷰공지사항  종료 -->

            <!--제품리뷰 게시판  -->
            <div class="col-md-10 col-sm-12" style="height: 200px;">
               <p>작성일 : ${ dto.review_date}</p>
               <hr>
               <p>제품명 : ${ dto.review_item_idx }</p>
               <hr>
               <p>제품이미지 :<img src="../resources/upload/${dto.review_thumbnail}" width="50" height="50"  onclick="OnloadImg(this.src)">   </p>
                     리뷰내용:${dto.review_content}
                  
               <hr>
               <p>제목 : ${ dto.review_title }</p>
               <hr>
               <p>내용</p>
               <div class="shadow-sm p-3 mb-5 bg-white rounded">${ dto.review_content }</div>
               
                              <!-- 클릭시 reviewViewModify()로 이동 -->
               <input type="submit" class="btn btn-success pull-right" value="리뷰글수정"
                  onClick="reviewModify()" />

               <!-- 클릭시 ReviewDelete()로 이동 -->
               <input type="submit" class="btn btn-success pull-right" value="리뷰글삭제"
                  onClick="reviewDelete()" />

            </div>


            <!--제품리뷰 게시판종료  -->

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


   <!--하단 페이지이동  -->

   <div class="box-padding-big grey-bg" style="padding-top: 50px;">

      <div class="container">
         <div class="row">
            <!-- 컨텐츠복사 -->
            <!-- 12grid system -->
            <nav aria-label="Page navigation example" style="margin: auto;">
               <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="reviewlist">뒤로가기</a></li>

               </ul>
            </nav>


         </div>

      </div>
   </div>
   <!--좌측하단 고객센터 종료 -->


<!-- 자바스크립트란 -->
   <script>


   /* confirm창 띄우기 */
   function reviewDelete() { 
   <%String user_id = (String) session.getAttribute("login");%>
   
   /* 작성자ID와 로그인ID일치시 confirm창 띄움.  */
   /* ""있어야함. equals불가. */
    if("${ dto.review_writer }" == "<%=user_id%>") {
       
          var reviewDelete = confirm("정말로 삭제하시겠습니까?");
            
            //확인 클릭시 이동
            if(reviewDelete == true) {
               location.href="reviewDelete_ok?review_idx=${dto.review_idx}"

            } else {
               //취소 클릭시 아무것도 없음
            }
       /* 로그인ID와 작성자ID불일치시 alert창 띄움.  */
       } else {
          alert("작성로그인회원만 삭제 가능합니다.");
       }  
   
     }
     
     /* 작성자ID와 로그인ID일치시 글수정 폼으로 들어갈 수 있음  */
     function reviewModify() { 
        
   
    if("${ dto.review_writer }" == "<%=user_id%>") {
            //확인 클릭시 이동
            location.href = "reviewModifyForm?review_idx=${dto.review_idx }"
            //취소 클릭시 아무것도 없음

         } else {
            alert("작성로그인회원만 수정 가능합니다.");
         }

      }
     
     function OnloadImg(url){
    	    var img=new Image();
    	    img.src=url;
    	    var img_width=img.width;
    	    var win_width=img.width+25;
    	    var height=img.height+30;
    	    var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+height+', menubars=no, scrollbars=auto');
    	    OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
    	   
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