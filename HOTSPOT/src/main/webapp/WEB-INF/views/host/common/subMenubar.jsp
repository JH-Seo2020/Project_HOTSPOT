<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/hostmenubar.css" type="text/css"/>
<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
        #floatMenu ul{
            width:180px;
            height:50px;
            border: 0.5px solid #dad1db;
            border-radius: 20px;
            cursor: pointer;
            margin:0px;
            font-size:17px;
        }
        #floatMenu ul:hover{
            background-color: rgb(243, 243, 243);
            color: var(--color-purple)!important;
            transform: scale(1.02);
            border: 1.5px solid gray;
        }
         .f_question_{
        display: none;
        font-size: 15px;
    }
    #floatMenu a{
    	text-decoration:none;
    	color:black;
    }
      #floatMenu a:hover{
    	text-decoration:none;
    	color: var(--color-purple)!important;
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
    
          <ul class="f_profile"><img src="resources/images/host_images/reservation.png"><a href="hostMyPage.ho"> 프로필 관리</a></ul>
          <ul class="f_space"><img src="resources/images/host_images/hosthome.png"><a href="space.list"> 공간정보관리 </a></ul>
          <ul class="f_reservation"><img src="resources/images/host_images/clipboard-regular.png"><a href=""> 예약리스트 </a></ul>
          <ul class="f_qna"><img src="resources/images/host_images/comment.png"><a href=""> Q&A </a></ul>
          <ul class="f_review"><img src="resources/images/host_images/camera.png"> <a href=""> 이용후기 </a></ul>
          <ul class="f_question"><img src="resources/images/host_images/person.png"> <a href=""> 1:1문의</a></ul>
          <ul class="f_question_"><img src="resources/images/host_images/next.png"style="width:15px;heigt:6pdx;margin-left:30px;"> <a href="">1:1챗봇 문의</a></ul>
          <ul class="f_question_"><img src="resources/images/host_images/next.png"style="width:15px;heigt:6px;margin-left:30px;">  <a href="">1:1관리자 문의</a></ul>
          <ul class="f_question_"><img src="resources/images/host_images/next.png"style="width:15px;heigt:6px;margin-left:30px;">  <a href="">나의 문의 내역</a></ul>
          <ul class="f_notice"><img src="resources/images/host_images/volume.png" style="width:20px"><a href="notice.ho">공지사항</a></ul>
          <ul class="f_calculate"><img src="resources/images/host_images/money.png"><a href="calculateForm.ho">정산</a></ul>
     

    </div>
      <script>
        $(".f_question").hover(function(){
            $(".f_question_").show();
            $(".f_question_").hover(function(){
            	  $(".f_question_").show();
            });
        	},function(){
            	 $(".f_question_").hide();
            });
    </script>
       <div id="brr" style="height:1000px;"></div>
</body>
</html>