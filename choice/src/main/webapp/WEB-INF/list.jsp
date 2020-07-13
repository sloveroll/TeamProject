<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--search 에서   File 클릭후 , 해당 taglib 검색 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시판 목록</title>
</head>
<!-- ex14 list.jsp -->

<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">

		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>삭제</td>
		</tr>

		<c:forEach items="${ list }" var="dto" >

			<tr>
				<td>${dto.user_idx}</td>
				<td>${dto.user_id}</td>
				<td><a href="view?id=${dto.user_idx}">${dto.user_pw}</a></td>
				<td>${dto.user_name}</td>
				<td>${dto.user_email}</td>
			</tr>
			
		</c:forEach>
		
	</table>
	<br>
    <p> <a href="writeForm">글작성</a> </p>








</body>
</html>