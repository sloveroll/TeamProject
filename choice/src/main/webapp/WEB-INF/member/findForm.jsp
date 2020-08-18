<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
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
    <title>아이디/비밀번호찾기</title>
    
    <style>
        input {
            width: 280px;
            height: 30px;
            margin: 40px 0px 20px 15px;
        }
        #findPw{
            display: none;
        }
        .subBtn{
            height: 40px;
            width: 180px;
        }
        .btnMenu{
            width: 45%;
            height: 40px;
        }
        #btnId{ background-color: skyblue; color: white;}
        form {margin: 0 auto;}
    </style>
    
</head>
<body>
    <div class="container">
    <div class="row mt-3">
            <div class="col-12 ml-3" >
            <button id="btnId"  class=" btnMenu" onclick="displayId()">아이디 찾기</button>
            <button id="btnPw" class=" btnMenu" onclick="displayPw()">비밀번호 찾기</button>
        </div>
   
        <form action="find" id="findId" method="POST" onsubmit="return checkValueId()">
            
    
            이름  <input type="text" name="user_name" id="user_name" placeholder="가입시 입력한 이름을 입력해주세요"  style="margin-left: 30px;"> 
            <br>
            이메일  <input type="email" name="user_email" id="user_email" placeholder="가입시 입력한 이메일을 입력해주세요">
            <br>
            <input type="hidden" name="findCheck" value="id">
            <input type="submit" value="아이디찾기"  class="subBtn btn btn-warning">
            <input type="button" value="취소" onclick="window.close()" class="subBtn btn btn-primary">
    
         </form>

    <form action="find" method="POST" id="findPw" onsubmit="return checkValuePw()">
   
    아이디  <input type="text" name="user_id" id="user_id"  placeholder="가입시 입력한 아이디을 입력해주세요"> 
    <br>
    이메일  <input type="email" name="user_email" id="user_email2"  placeholder="가입시 입력한 이메일을 입력해주세요">
    <br>
    <input type="hidden" name="findCheck" value="pw">
    <input type="submit" value="아이디찾기"  class="subBtn btn btn-warning">
    <input type="button" value="취소" onclick="window.close()" class="subBtn btn btn-primary">
    </form>    

</div>
</div>
<script>
     
  
    //아디찾기, 비번찾기 폼 띄우고 감추기
    var id = document.getElementById("findId");
    var pw = document.getElementById("findPw");
function displayId(){  
        document.getElementById("btnId").style.backgroundColor="skyblue";
        document.getElementById("btnId").style.color="white";
        document.getElementById("btnPw").style.backgroundColor="rgba(255, 255, 255, 0.541)";
        document.getElementById("btnPw").style.color="black";
        id.style.display = 'block';
        pw.style.display = 'none';
    }
function displayPw(){
        document.getElementById("btnPw").style.backgroundColor="skyblue";
        document.getElementById("btnPw").style.color="white";
        document.getElementById("btnId").style.backgroundColor="rgba(255, 255, 255, 0.541)";
        document.getElementById("btnId").style.color="black";
            pw.style.display = 'block';
            id.style.display = 'none';    
 }

//폼에 값이 입력됐는지 확인
 function  checkValueId(){

 var user_name = document.getElementById("user_name").value;
 var user_email = document.getElementById("user_email").value;
    if(user_name == null || user_name==""){ 
        alert("이름을 입력해주세요");
        return false;
    }
    if(user_email == null || user_email==""){ 
        alert("이메일을 입력해주세요");
        return false;
    }
}
 function  checkValuePw(){

 var user_id = document.getElementById("user_id").value;
 var user_email = document.getElementById("user_email2").value;
    if(user_id == null || user_id==""){ 
        alert("아이디를 입력해주세요");
        return false;
    }
    if(user_email == null || user_email==""){ 
        alert("이메일을 입력해주세요");
        return false;
    }
}


</script>

</body>
</html>
