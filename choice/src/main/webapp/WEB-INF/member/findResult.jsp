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
<link rel="shortcut icon" href="../resources/images/favicon.ico"
type="image/x-icon">

<title>아이디/비밀번호 찾기 결과</title>

</head>
<body>

<%if(request.getAttribute("find").equals("fail")){%>
	<script>
	alert("가입된 정보가 없습니다\n다시 확인해주세요");
	location.href="/findForm";
	</script>
<% }; if(request.getAttribute("find").equals("id")) { %><!-- //window.close() 팝업창 닫는다. -->
	<script>alert( "'${user_info.user_name}" +"'님의 아이디는 " + "'${user_info.user_id}'" + "입니다" ); window.close();</script>
	
<% } else if(request.getAttribute("find").equals("pw")){ %>
	<script>alert("'${user_info.user_name}'" + "님의 비밀번호는 " + "'${user_info.user_pw}'" + "입니다" ); window.close();</script>
	<% }; %>
	
</body>
</html>