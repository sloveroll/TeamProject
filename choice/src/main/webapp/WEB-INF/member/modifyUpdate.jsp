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

           <% 
			// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
			
			if((String)request.getAttribute("updateMsg") != null){
			String updateMsg =  (String)request.getAttribute("updateMsg");
				
           
			if(updateMsg.equals("실패")) {
			%>
			<script> alert("회원정보수정 실패! 관리자에 문의해주세요"); history.back();	</script>
			 
			
			<% } else if(updateMsg.equals("성공")){ session.invalidate(); %>	 
				
				<script>
			  alert("회원정보수정 완료! 다시 로그인 해주세요.");
		       location.href = "/"
			</script>
		   <% 
			}
           };
		%>	
		
		
		
			<% 
			// 탈퇴 메세지
				if((String)request.getAttribute("deleteMsg") != null){
			String deleteMsg =  (String)request.getAttribute("deleteMsg");
		
			if(deleteMsg.equals("실패")) {
			%>
			<script> alert("비밀번호를 다시 확인해주세요"); history.back();	</script>
			 
			
			<% } else if(deleteMsg.equals("성공")){ session.invalidate(); %>	 
				
				<script>
			  alert("탈퇴 완료.");
		       location.href = "/"
			</script>
		   <% 
			}
			};
		%>	
		
			
			  <%
			  if((String)request.getAttribute("full") != null){
			  String asd =  (String)request.getAttribute("full") ; 
		
			 if(asd.equals("fail")) {  %>
			  <script>alert("장바구니에 3개 이하만 주문가능.");location.href = "/";</script>
		    <%} }; %>   
			
     
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