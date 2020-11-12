<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--부트스트랩, 제이쿼리 CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <style>
        #menubar{
            width: 1200px;
            height: 80px;
            margin: auto;
        }
        #menubar>div{
            float: left;
            height: 80%;
            margin-left: 2%;
        }
        #logoSpace{width: 15%;}
        #search{width: 30%; height: 50%; }
        #search>form{
            width: 100%; height: 100%;
        }
        #search>form>input{
            margin-top: 20px;
            border:none;
            border-bottom: 2px solid lavender !important;
            width: 80%;
            height: 50%;
        }
        #search>form>div{
            float: right;
            border: none;
            background-color: none;
            width: 20%;
            height: 100%;
        }
        #menuOptions{width: 49%; }
        #menuOptions>div{
            margin: auto;
            text-align: center;
            height: 100%;
            width: 25%;
            float: left;
            padding-top: 25px;
        }
        .nav-item{padding-top: 18px !important;}
        #menuOptions>div>a{
            color: black;
            text-decoration: none;
        }
    </style>
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
            <div id="loginBtn"><a href="">로그인</a></div>
            <div id="signUp"><a href="">회원가입</a></div>

            <!--로그인 후 보여질 부분들-->
            <!--<div id="GoToHostPage"><a href="">🏚&nbsp;호스트페이지</a></div>-->
            <!--<div><a href="">로그아웃</a></div>-->
            <!--<div><a href="">마이페이지</a></div>-->
            
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