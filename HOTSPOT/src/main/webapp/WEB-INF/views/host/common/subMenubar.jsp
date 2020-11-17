<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/hostmenubar.css" type="text/css"/>
<style> 
       #floatMenu{
            position: absolute;
            top:120px;
            left:80px;
        }
        #floatMenu img{
            width:25px; height:25px;
            margin-left: 10px;
            margin-right: 5px;
            margin:10px 5px 5px 20px;
            transition: all var(--animation-duration) ease;
            
        }
        #floatMenu img:hover{
            transform: rotate(-30deg) scale(1.1);
            
        }
        #floatMenu li{
            width:180px;
            height:50px;
            border: 0.5px solid #dad1db;
            border-radius: 20px;
            cursor: pointer;
        }
        #floatMenu li:hover{
            background-color: rgb(243, 243, 243);
            color: var(--color-purple);
            transform: scale(1.02);
            border: 1.5px solid gray;
        }
    
    </style>
    <script>
        //floatMenu 
        $(window).scroll(function(){
        var scrollTop = $(document).scrollTop();
        if (scrollTop < 100) {
        scrollTop = 100;
        }
        $("#floatMenu").stop();
        $("#floatMenu").animate( { "top" : scrollTop });
        });
    </script> 
</head>
<body>
	<div id="floatMenu">
        <ul>
            <li class="f_profile"><img src="resources/images/host_images/reservation.png">  프로필 관리</li>
            <li class="f_space"><img src="resources/images/host_images/hosthome.png">  공간정보 관리</li>
            <li class="f_reservation"><img src="resources/images/host_images/clipboard-regular.png">  예약리스트</li>
            <li class="f_qna"><img src="resources/images/host_images/comment.png">  Q&A</li>
            <li class="f_review"><img src="resources/images/host_images/camera.png">  이용후기</li>
            <li class="f_question"><img src="resources/images/host_images/person.png">  1:1 문의</li>
            <li class="f_notice"><img src="resources/images/host_images/volume.png" style="width:20px">  공지사항</li>
            <li class="f_calculate"><img src="resources/images/host_images/money.png">  정산</li>
        </ul>

    </div>
        <!-- <div id="brr" style="height:1000px;"></div> <!--스크롤 테스트--> 
</body>
</html>