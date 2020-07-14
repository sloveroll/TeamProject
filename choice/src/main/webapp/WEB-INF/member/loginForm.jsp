<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- my css -->
    <link rel="stylesheet" href="../resources/css/style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


<title>로그인</title>
<<<<<<< HEAD
  <script>
  	function checkValue()
		{
			inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{
				alert("아이디를 입력하세요");	
				inputForm.id.focus(); //자기 텍스트 상자로 포커스
				return false;
			}
			if(!inputForm.pw.value)
			{
				alert("비밀번호를 입력하세요");	
				inputForm.pw.focus();
				return false;
			}
		}
	
		// 취소 버튼 클릭시 첫화면으로 이동
		function goFirstForm() {
			location.href="/";
		}
		</script>
</head>
<body>
 	<div id="wrap">
	
		<br><br>
		<b><font size="6" color="gray">로그인</font></b>
		<br><br><br>
	
		<form name="loginInfo" method="post" action="login_ok" 
				onsubmit="return checkValue()"> <!-- 입력값 체크함수 -->

			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" name="user_id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="user_pw" maxlength="50"></td>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인"/>
			<input type="button" value="취소" onclick="goFirstForm()">
		</form>
		
		<% 
			// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
			String loginMsg = (String)request.getAttribute("fail");
				
			if(loginMsg!=null && loginMsg.equals("0")) 
			{
				out.println("<br>");
				out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
			}
			else if(loginMsg!=null && loginMsg.equals("-1"))
			{	
				out.println("<br>");
				out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
			}
		%>	
	</div>	
   


=======
 
   
</head>
<body>
>>>>>>> refs/remotes/origin/master
     
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>
</html>