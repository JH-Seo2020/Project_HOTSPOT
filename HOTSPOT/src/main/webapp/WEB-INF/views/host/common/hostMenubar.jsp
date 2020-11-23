<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<!-- 구글폰트  -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&amp;display=swap" rel="stylesheet">
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 <!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
#hostMenubar a{
 text-decoration:none;
 color:var(--color-yellow);
}
:root {
  /* Color */
  --color-dark-white: rgb(224, 224, 224);
  --color-purple: #512da8;
  --color-yellow: rgb(241, 196, 15);
  
  /* Annimation */
  --animation-duration: 300ms;
}
* {
  box-sizing: border-box;
  font-family: "Nanum Gothic", sans-serif;
}
body {
  margin: 0;
}
table {
  margin: 0;
}
ul {
  padding-left: 0;
  list-style: none;
}

.logo1 {
  width: 82px;
  height: 29px;
  margin-left: 20px;
  margin-right: 5px;
  cursor: pointer;
}
.logo2 {
  color: var(--color-yellow);
}
p {
  display: inline;
}
#logo2 p{
	font-size:17px;
}
.navbarMenu {
  margin-left: auto;
}

.navbarMenu {
  display: flex;
}
#hostMenubar {
  display: flex;
  background-color: var(--color-purple);
  align-items: center;
  color: var(--color-yellow);
  height: 54px;
}
.navItem {
  padding: 8px 20px;
  margin: 13px 5px 0px;
  cursor: pointer;
  font-size: 16px;
}
.navItem:hover {
  background-color: #673ab7;
  border-radius: 4px;
}
 /*부트스트랩 변경*/
.btn-primary {
    color: #fff;
    background-color:var(--color-purple)!important ;
    border-color:var(--color-purple) !important;}
 .btn-primary:hover{
 	 background-color:rgb(61, 8, 77)!important;
 }
 .btn{
  border:0px!important;
  outline:0px!important;
  font-size:16px;
 }
 .btn-secondary{
 	color:white;
 	background-color:#9e9e9e!important ;
 }
 .btn-secondary:hover{
 	background-color:#707070!important ;
 	color:white;
 }
</style>
</head>
<body>
<nav id="hostMenubar">
        <div id="logo1">
            <img src="resources/images/host_images/logo1.png" class="logo1">
        </div>  
        <div id="logo2">
            <p href="#" class="logo2">호스트센터</p>
        </div>
        
        <div class="navbarMenu">
            <ul class="navbarMenu">
                <li class="navItem"><a href="">Home</a></li>
                <li class="navItem"><a href="hostMyPage.ho">Mypage</a></li>
            </ul>
        </div>
    </nav>
 </body>