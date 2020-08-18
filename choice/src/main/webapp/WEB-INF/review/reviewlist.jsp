
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
<link rel="stylesheet" href="./resources/css/style.css">


<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
   integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
   crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

   
   <!--별점후기 작동 JS  폰트어썸과 부트스트랩 별점후기 작동 JS폴더에 , 이두가지가있어야한다.   -->
  
    <script src="https://use.fontawesome.com/5ac93d4ca8.js"></script>
    <script src="../resources/js/bootstrap4-rating-input.js"></script>
    
<title>제품후기리스트</title>

</head>
<body>

   <!--페이징 이동 뷰 selChange  -->
   <script>
      function selChange() {
         var sel = document.getElementById('cntPerPage').value;
         location.href = "reviewlist?nowPage=${paging.nowPage}&cntPerPage="
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
         <a class="navbar-brand" href="http://localhost:8081/noticelist">고객제품후기-제품후기</a>
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
                  href="http://localhost:8081/csList">고객센터</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="http://localhost:8081/noticelist">공지사항</a></li>
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
   <!-- box-padding-big grey-bg  -->


   <!-- 제품리뷰 게시판 row열   -->
   <div class="box-padding-big grey-bg"
      style="height: 2000px; margin-top: -20px;">

      <div class="container">
         <div class="row">
            <!-- 컨텐츠복사 -->
            <!-- 12grid system -->
            <!--좌측 공지사항   -->
            <div class="col-md-2 col-sm-12" style="height: 300px;">

               <ul class="list-group" style="text-align: center;">

                  <a href="#"><li class="list-group-item active bg-warning">제품후기</li></a>
                  <a href="/"><li class="list-group-item">메인가기</li></a>
                  <a href="csList"><li class="list-group-item">고객센터</li></a>
                  <a href="noticelist"><li class="list-group-item">공지사항</li></a>



               </ul>

            </div>
            <!--좌측 공지사항  종료 -->

            <!--리뷰사항 게시판  -->
            <div class="col-md-10 col-sm-12" style="height: 300px;">

               <!--  우측 페이지 갯수별 보기란 -->
               <div id="outter">
                  <div>
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

               <!-- 후기제목과 후기내용테이블  -->

               <table cellpadding="0" cellspacing="0" border="1"
                  style="text-align: center; border: 1px solid gray;">

                  <tr height="50px" style="background-color: rgb(255, 190, 0);">
                     <td style="width: 275px;">게시물번호</td>
                     <td style="width: 810px;">타이틀</td>
                     <td style="width: 200px;">별점후기</td>
                     <td style="width: 200px;">작성자</td>
                     <td style="width: 300px;">작성일</td>

                  </tr>
      
	

                  <c:forEach items="${ viewAll }" var="dto">
                     <tr height="50px">

                        <td>${dto.review_idx}</td>
                        <td><i class="fas fa-file-signature" style="color:orange;"></i>리뷰제목:<a href='reviewview?review_idx=${dto.review_idx }'>${dto.review_title }</a><br>
                        <hr>제품명:${dto.review_item_idx}<br>
                       

                        <img src="../resources/upload/${dto.review_thumbnail}" width="50" height="50"  onclick="OnloadImg(this.src)"><hr>
                     리뷰내용:${dto.review_content}</td>
                     
                        <td class="text-center">
                        
                       <div class="rating text-warning "> ${dto.review_score}</div> <div >(${dto.review_score} 점)</div>	
						</td>
                        <td>${dto.review_writer}</td>
                        <td>${dto.review_date}</td>

                     </tr>
                  </c:forEach>

			
               </table>
               <!-- 후기제목과 후기내용종료  -->

            <input type="submit"
                  class="btn btn-success pull-right" value="리뷰쓰기"
                  style="float: right;" onclick="reviewWrite_ok()"/>
            </div>

            <!--제품리뷰 게시판종료  -->

         </div>

      </div>
      <!--container 종료  -->

   </div>
   <!-- box-padding-big grey-bg 종료 -->

   <!--하단 페이지이동  -->

   <div class="box-padding-big8 grey-bg">

      <div class="container">
         <div class="row"
            style="margin-top: 10p; padding-top: 39px; padding-left: 0px;">
            <!-- 컨텐츠복사 -->
            <!-- 12grid system -->
            <nav aria-label="Page navigation example" style="margin: auto;">
               <ul class="pagination">

                  <!--이전페이지로이동  -->
                  <li class="page-item"><c:if test="${paging.startPage != 1 }">
                        <a class="page-link"
                           href="/reviewlist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a>

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
                              href="/reviewlist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
                        </c:when>
                     </c:choose>

                  </c:forEach>
                  <!-- 페이지 넘버종료 -->

                  <!-- 다음페이지로 이동 -->
                  <li class="page-item"><c:if
                        test="${paging.endPage != paging.lastPage}">
                        <a class="page-link"
                           href="/reviewslist?nowPage=${paging.endPage + 1 }&cntPerPage=${paging.cntPerPage}">Next</a>

                     </c:if></li>
               </ul>
               <!--ul pagination 종료  -->
            </nav>


         </div>

      </div>
   </div>
   <!--하단페이지 종료 -->

   <!-- 자바스크립트란 -->
  
   
   <script type="text/javascript">
   
   function OnloadImg(url){
    var img=new Image();
    img.src=url;
    var img_width=img.width;
    var win_width=img.width+25;
    var height=img.height+30;
    var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+height+', menubars=no, scrollbars=auto');
    OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
   
   }
   

/* 로그인회원은 , 작성자로 리뷰제품후기 남기고 , 로그인후 해당아이디만 리뷰쓰기가 가능하여야 한다.  */
function reviewWrite_ok(){
   
   /* 리뷰글쓰기 폼으로 이동 */
   <%if(session.getAttribute("login")!=null) { %>
            location.href = "reviewwrite"
         <%} else {%>
            alert("로그인한 회원만 리뷰쓰기가 가능합니다.")
         <%}%>

      }
 
</script>

   <!-- Optional JavaScript -->
   <!-- jQuery first, then Popper.js, then Bootstrap JS -->


   <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossor
igin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"></script>


	
</body>

</html>