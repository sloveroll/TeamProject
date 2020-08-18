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

<!-- my css -->
    <link rel="stylesheet" href="../resources/css/style.css">
 <!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
   integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
   crossorigin="anonymous">
   
<title>회원가입 페이지 </title>

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
         <a class="navbar-brand" href="#">반찬초잇</a>
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
               <li class="nav-item"><a class="nav-link" href="loginForm">로그인</a></li>
              


            </ul>
         </div>
      </nav><!-- 네비바 종료  -->
   </div><!-- header 종료  -->
   


   <!-- 로그인폼  -->
   <div class="box-padding-big grey-bg" style="margin-top: 56px;">

      <div class="container">
         <div class="row">
         
         <div class="col-md-12">
               <img src="./resources/images/member.png">

            </div>

            <div class="col-md-12">

               <!-- 점보트론 -->

               <div class="jumbotron" style="padding-top: 20px;">

                  <!-- 로그인 정보를 숨기면서 전송post -->

                  <form method="post" action="join_ok" 
            			name="userInfo" onsubmit="return checkValue()" id="userInfo" >

                     <h3 style="text-align: center;">회원가입</h3>
               
                     <div class="input-group form-group">

                        <input type="text" class="form-control" placeholder="아이디"
                           name="id" id="id" maxlength="20" onkeyup="characterCheck()" onkeydown="characterCheck()">
                         <input type="hidden" id="hidden" name="hidden" readonly>
                          <button type="button" class="input-group-addon" onclick="idCheck()"  >중복확인</button>
                          

                 	    </div>



                     <div class="form-group">

                        <input type="password" class="form-control" placeholder="비밀번호"
                           name="pw" id="pw" maxlength="20" onkeyup="nospace()" onkeydown="nospace()">
                           

                     </div>
                     
                     <div class="form-group">

                      
                             <input type="password" class="form-control" placeholder="비밀번호확인"
                           name="pwok" id="pwok" maxlength="20" onkeyup="nospace()" onkeydown="nospace()">

                     </div>

                
                      
                       
                       
                       <!-- 주소 주석처리함 -->
              <!--          <div class="form-group">
                       
                  <input type="text" id="sample6_postcode" placeholder="우편번호">
                  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                  <input type="text" id="sample6_address" placeholder="주소"><br>
                  <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                  <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                                         
                       
                       </div> -->
                       
               <div class="form-group">

                  <input type="text" class="form-control" placeholder="이름"
                     name="name" id="name" maxlength="20" onkeyup="characterCheck()" onkeydown="characterCheck()">

               </div>

         
               <div class="form-group">

                  <input type="email" class="form-control" placeholder="이메일"
                     name="email" maxlength="50" onkeyup="nospace()">

               </div>

				<div class="form-group">
               <input type="submit" id="submit" class="btn btn-primary form-control"
                  value="회원가입"> 
             
             </div>
            
             <div class="form-group">  
               <a href="/" class="btn btn-danger form-control">취소</a>  
                </div>
                  </form><!-- form종료  -->

             
				</div>
            </div>

         </div>

      </div>

   </div>
   <!-- 로그인폼종료  -->
   <script type="text/javascript">
   /* ID 중복확인 ajax */
 function idCheck(){
	    var query = {id : $("#id").val()};
	    var hidden = $("#id").val();
	    $.ajax({
	     url : "/idCheck",
	     type : "post",
	     data : query,
	     success : function(data) {
	     
	      if(data == 1) {
	       alert("사용 불가능한 아이디입니다");
	       $("#submit").attr("disabled", true);    
	      } else {
	      alert("사용 가능한 아이디입니다");
	       $("#hidden").val(hidden);
	       $("#submit").attr("disabled", false); 
	      }
	     }
	    });  // ajax 끝
	   }//idcheck끝 
   
      // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
      function checkValue()
      {
         if(!document.userInfo.id.value){
            alert("아이디를 입력하세요.");
            return false;
         }
         if(document.userInfo.id.value != document.userInfo.hidden.value ){
             alert("아이디 중복확인을 눌러주세요");
             $("#submit").attr("disabled", true); 
             return false;
          }
         
         if(!document.userInfo.pw.value){
            alert("비밀번호를 입력하세요.");
            return false;
         }
         
         // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
         if(document.userInfo.pwok.value != document.userInfo.pw.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
         }

         if(!document.userInfo.name.value){
            alert("이름을 입력하세요.");
            return false;
         }
         if(!document.userInfo.name.value){
            alert("이메일을 입력하세요.");
            return false;
         }
      }
      
      // 취소 버튼 클릭시 첫화면으로 이동
      function goFirstForm() {
         location.href="/";
      }
      
      
      //특수문자 및 스페이스바 입력금지
         function characterCheck() {
               var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;//정규식 구문
			   				/* ▲ 스페이스바 */ 
			   var spaceok = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;  	
			   				
               var obj = document.getElementsByName("id")[0]
               var obj2 = document.getElementsByName("name")[0]
               
               if (RegExp.test(obj.value)) {
                   alert("특수문자는 입력하실 수 없습니다.");
                   obj.value = obj.value.substring(0, obj.value.length - 1);//특수문자를 지우는 구문
               }
               if ( spaceok.test(obj2.value)) {
                   alert("특수문자는 입력하실 수 없습니다.");
                   obj2.value = obj2.value.substring(0, obj2.value.length - 1);//특수문자를 지우는 구문
               }
          
           }
   function nospace() {
               
               if(event.keyCode == 32) event.returnValue = false;
             }


   
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


	<script src='https://code.jquery.com/jquery-3.4.1.js'></script>

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