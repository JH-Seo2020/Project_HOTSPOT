<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--부트스트랩-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<!--제이쿼리-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 메뉴바 css -->
<link rel="stylesheet" href="resources/css/guest/menubar.css" type="text/css"/>
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
</head>
<body>
	    <div id="menubar">
        <div id="logoSpace"><a href=""><img src="resources/images/logo_letter_1.png" width="100%" height="100%"></a></div>
        <div id="search">
            <form action="" method="">
                <input type="search" placeholder="검색어를 입력하세요!">
                <div><a href=""><img src="resources/images/serarch_icon.png" width="100%" height="100%"></a></div>
            </form>
        </div>
        <div id="menuOptions">
            <div><a></a></div>
            <!-- 로그인 버튼 -->
            <div><a id="loginBtn" style="cursor: pointer;">로그인</a></div>

            <!-- 로그인 모달  -->
            <div class="login_popup">
                <div>
                    <span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em; float:right" title="닫기">X</span>
                </div>
                <form action="" method="POST">
                    <br>
                    <img src="resources/images/hospot_logo.png" width="60px" height="60px">
                    <label style="font-size: 25px; font-weight: bold;">로그인</label><br>
                    <br>
                        <input type="text" name="userId" id="userId" placeholder="아이디" style="width: 280px;"><br><br>
                        <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호" style="width: 280px;">
					<br><br>
                    	<button type="submit" id="loginInputBtn">로그인 하기</button> 
                    <br><br>
                    <div style="font-size: 12px;">
	                    <input type="checkbox" id="idSaveCheck">
	                    <label for="idSaveCheck">아이디 기억하기</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                        <a href="">비밀번호 찾기</a>
	                <br>
                    </div>
                </form>
                <br><br>
            </div>

       
            <script>
                function closeLayer( obj ) {
	            $(obj).parent().parent().hide();
            }

                $(function(){

                    $('#loginBtn').click(function(e)
                    {
                        var sWidth = window.innerWidth;
                        var sHeight = window.innerHeight;

                        var oWidth = $('.login_popup').width();
                        var oHeight = $('.login_popup').height();

                        var divLeft = e.clientX + (-200);
                        var divTop = e.clientY + 30;

                        $('.login_popup').css({
                            "top": divTop,
                            "left": divLeft,
                            "position": "absolute"
                        }).show();
                    });

                });
            </script>
            <div id="signUp"><a href="test.ho">회원가입</a></div>

            <!--로그인 후 보여질 부분들-->
            <!--<div id="GoToHostPage"><a href="">🏚&nbsp;호스트페이지</a></div>-->
            <!--<div><a href="">로그아웃</a></div>-->
            <!-- <div><a id="myPageBtn" style="cursor: pointer;">마이페이지</a></div>
                       

            <div class="myPage_popup">
                <div>
                    <span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em; float:right" title="닫기">X</span>
                </div>
                <div id="myPage_Content">
                    <img src="resources/images/hospot_logo.png" width="60px" height="60px">
                    <label style="font-size: 25px; font-weight: bold;">USER01</label><br>
                    <a href=""><span>프로필 관리</span></a>
                    <br><hr>
                    <ul>
                        <li>
                        <div id="myPage_ReservationBtn">
                            <img src="resources/images/Calendar.png" width="25px" height="25px">&nbsp;&nbsp;&nbsp;
                            <a href=""><span>나의 예약 리스트</sapn></a>
                        </div>
                        <br>
                        </li>
                        <li>
                            <div id="myPage_ReservationBtn">
                                <img src="resources/images/list.png" width="25px" height="25px">&nbsp;&nbsp;&nbsp;
                                <a href=""><span>이용후기 / 문의 관리</sapn></a>
                            </div>
                            <br>
                        </li>
                        <li>
                        <div id="myPage_ReservationBtn">
                            <img src="resources/images/heart.png" width="25px" height="25px">&nbsp;&nbsp;&nbsp;
                            <a href=""><span>찜한공간</sapn></a>
                        </div>
                        <br>
                        </li>
                    </ul>    
                </div>
            </div>


            <script>
                function closeLayer( obj ) {
	            $(obj).parent().parent().hide();
            }

                $(function(){

                    $('#myPageBtn').click(function(e)
                    {
                        var sWidth = window.innerWidth;
                        var sHeight = window.innerHeight;

                        var oWidth = $('.myPage_popup').width();
                        var oHeight = $('.myPage_popup').height();

                        var divLeft = e.clientX + (-200);
                        var divTop = e.clientY + 30;

                        $('.myPage_popup').css({
                            "top": divTop,
                            "left": divLeft,
                            "position": "absolute"
                        }).show();
                    });

                });
            </script>
            -->
            
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                 	 고객센터
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">공지사항조회</a>
                  <a class="dropdown-item" href="#">자주묻는질문(챗봇,1:1문의)</a>
                </div>
            </div> 
        </div>
    </div>

</body>
</html>