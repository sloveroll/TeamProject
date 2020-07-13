<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- my css -->
    <link rel="stylesheet" href="./resources/css/style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>부트스트랩으로 홈피만들기</title>
</head>

<body>

    <!-- header -->
    <div class="header">
        <!-- navbar: bootstrap navbar 예약어  -->
        <!-- navbar-expand-md : 중간크기화면에서 펼치기 스타일  -->
        <!-- navbar-dark:어두운 배경 스타일 적용 -->
        <!-- fixed-up: 네비바를 항상 화면 윗쪽에 고정 -->
        <!-- bg-dark: 네비바 배경을 어둡게 지정  -->
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <!-- navbar-brand=:로고나 텍스트 지정. -->
            <a class="navbar-brand" href="#">나의홈피</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">사업설명</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">판매제품</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">회원가입</a>
                    </li>

                </ul>
            </div>
        </nav>

        <!-- 네비바 종료  -->

        <div class="container align-center">

            <h1><strong>Display your web design</strong><br>in a web browser</h1>
            <h4 class="silver hidden-xs">Fastest way to present your design and get feedback from your clients!</h4>
            <div class="btn btn-primary btn-lg col-md-5 ">

                Upload Project

            </div>
      

            <div class="silver small-info margin-top-big d-none d-md-block"></div>
            <img src="images/drop-icon.png">
            Drop here or select your project<br>prepared in the PNG or JPG format
        </div>



    </div>

    </div>
    <!-- 1.section -->

    <div class="box-padding-big grey-bg">

        <div class="container">
            <div class="row">
                <!-- 컨텐츠복사 -->
                <!-- 12grid system -->
                <div class="col-md-5 info-big">
                    <h2>Fastest way to<br><strong>present your design</strong></h2>
                    <p>Symu is an easy to use tool for web designers. With the help of our system you can present your
                        projects in a browser for free. It is all very easy!</p>
                    <p><strong>Drop your project anywhere</strong><br>Symu will prepare a mockup of your website for
                        you!</p>

                </div>

                <div class="col-md-7">
                    <img src="images/symu-panel-1.png">
                </div>


            </div>

        </div>

    </div>
    <!-- 2.section white background-->
    <div class="box-padding-big white-bg">

        <div class="container">
            <div class="row">
                <!-- 콘텐츠복사 -->
                <div class="col-md-7">
                    <img src="images/symu-panel-2.png">
                </div>

                <div class="col-md-5 info-big">


                    <h2>The simplest way to<br><strong>get feedback from your clients!</strong></h2>
                    <p><strong>You can add a comment anywhere</strong> on a project, this is a fast and easy way thoughts
                        gather input and proposed changes from your client. Click anywhere on a project and leave your
                        thoughts.</p>
                    <p><strong>Every added comment becomes a task! </strong> Thanks to this solution you can easily mark
                        the changes you have made.</p>

                </div>

            </div>

        </div>

    </div>
    <!-- 3.section mobile hide-->
    <div class="box-padding-big grey-bg">

        <div class="container">
            <div class="row">
                <!-- 콘텐츠복사 -->
                <div class="col-md-5 info-big">

                    <h2>Support for<br><strong>Responsive projects</strong></h2>
                    <p>Projects added to Symu are automatically checked whether they are mobile ready.</p>
                    <p>The program will divide your files into responsive versions on its own! You have the option to
                        view the projects in either normal or responsive modes!</p>
                </div>

                <div class="col-md-7">
                    <img src="images/home-panel-3.jpg">
                </div>

            </div>

        </div>

    </div>
    <!-- 4.section white background , mobile hide-->
    <div class="box-padding-big grey-bg">

        <div class="container">
            <div class="row">
                <!-- 콘텐츠복사 -->
                <div class="col-md-6">
                    <img src="images/envelope-icon.jpg" style="float:left">
                    <h2 class="icon-title">Email<br><strong>notifications</strong></h2>
                    <p>An email notification will be sent when your client comments or opens a project. You will know
                        when a client recieves the projects and if he has seen it!</p>


                </div>

                <div class="col-md-6">

                    <img src="images/lock-icon.jpg" style="float:left">　　
                    <h2 class="icon-title">Project<br><strong>protection</strong></h2>
                    <p>Your projects will be perfectly safe, Symu uses SSL encryption and every project added receives a
                        unique link. Additionally you have the option to secure your project with a password.</p>


                </div>

            </div>

        </div>

    </div>
    <!-- 5.section dark background . mobile hide-->
    <div class="box-padding-big dark-bg-stat">

        <div class="container">
            <div class="row">
                <!-- 콘텐츠복사 -->
                <div class="col-md-2">

                    <div class="info-box align-center">
                        <h3>253</h3>
                        Todays uploads
                    </div>

                </div>

                <div class="col-md-2">
                    <div class="info-box align-center">
                        <h3>171092</h3>
                        Projects uploaded
                    </div>


                </div>

                <div class="col-md-4 align-center">
                    <a href="#registerModal" role="button" data-toggle="modal" class="btn btn-danger btn-lg">Sign Up <strong>now</strong></a>


                </div>

                <div class="col-md-2">

                    <div class="info-box align-center">
                        <h3>931523</h3>
                        Project views
                    </div>

                </div>

                <div class="col-md-2">

                    <div class="info-box align-center">
                        <h3>100867</h3>
                        Comments posted
                    </div>


                </div>

            </div>

        </div>

    </div>
    <!-- footer -->

<footer class="footer">
    <!-- 콘텐츠복사 -->


    The site owner is not responsible for uploaded images. You can only upload images for which you own the copyright.

</footer>


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