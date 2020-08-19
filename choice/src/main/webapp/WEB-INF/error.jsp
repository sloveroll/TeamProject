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

<!-- 제이쿼리  -->
<script src="./resources/js/jquery-2.2.4.min.js"></script>
<!-- 제이쿼리 슬라이드  -->
<script src="./resources/js/jquery.bxslider.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">




</head>

<body>


 <div style="margin: 0 auto;
    width: 300px;
    margin-top: 11%;">
 <h2>잘못된 페이지입니다</h2>
    <h1>Error Page</h1>
    error code : <span> "${code}"</span>
    <br>error msg : <span> "${msg}"</span>
    <br>timestamp : <span >"${timestamp}"</span><!--  에러발생시간-->
    <hr>
    <a class="btn btn-primary"  href="/">메인페이지로 가기 </a>
  </div>



</body>

</html>