<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="leftSpace">
            <div id="logo">
                <img id="img_hotspotLogo" src="resources/images/admin/hotspotLogo.png">
                <span id="span_name">관리자페이지</span>
            </div>
            <ul>
                <li id="adminUser">
                    <img class="img_icon" src="resources/images/admin/userIcon.png">
                    <span>회원관리</span>
                </li>
                <li id="adminReport">
                    <img class="img_icon" src="resources/images/admin/reportIcon.png">   
                    <span>신고관리</span>
                </li>
                <li id="adminReview">
                    <img class="img_icon" src="resources/images/admin/reviewIcon.png">
                    <span>후기관리</span>
                </li>
                <li id="adminSpace">
                    <img class="img_icon" src="resources/images/admin/spaceIcon.png">
                    <span>공간관리</span>
                    <ul style="display:none; padding: 0px;" id="subAdminSpace">
                        <li style="padding: 5px; margin-left: 68px;"><a href="">공간관리</a></li>
                        <li style="padding: 5px; margin-left: 68px;"><a href="">예약관리</a></li>
                    </ul>
                </li>
                <li id="adminFaq">
                    <img class="img_icon" src="resources/images/admin/faqIcon.png">
                    <span>고객센터</span>
                    <ul style="display:none; padding: 0px;" id="subAdminFaq">
                        <li style="padding: 5px; margin-left: 68px;"><a href="">공지사항</a></li>
                        <li style="padding: 5px; margin-left: 68px;"><a href="">예약관리</a></li>
                        <li style="padding: 5px; margin-left: 68px;"><a href="">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <script>
            $(function(){
            	$("#adminUser").click(function(){
            		location.href="userList.ad"
            	})
            	$("#adminReport").click(function(){
            		location.href="reportList.ad"
            	})
            	$("#adminReview").click(function(){
            		location.href="reviewList.ad"
            	})
				$("#adminSpace").click(function(){
					$("#subAdminSpace").toggle();
				})
				$("#adminFaq").click(function(){
					$("#subAdminFaq").toggle();
				})
            })
        </script>
</body>
</html>