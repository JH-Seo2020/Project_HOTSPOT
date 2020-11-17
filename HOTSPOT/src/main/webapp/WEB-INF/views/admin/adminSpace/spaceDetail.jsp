<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .slide{
        width:500px;
        height:300px;
        position:relative;
        margin-left:480px;
        overflow:hidden;
        
    }
    .slide ul{
        width:3000px;
        position:absolute;
    }
    .slide li{
        display:inline-block;
        list-style:none;
        overflow:hidden;
    }
    #back{
        position:absolute;
        top:150px;
        margin-left:40px;
        cursor: pointer;
        z-index:1;
        width:40px;
        opacity:0.7;
    }
    #next{
        position:absolute;
        top:150px;
        margin-left:450px;
        cursor:pointer;
        z-index:1;
        width:40px;
        opacity:0.7;
        
    }

    </style>
</head>
<body>
	<div class="outer">
        
        <br>
        <div style="font-size:20px; margin-left:20px;">공간관리</div>
        <hr style="background:ligthgrey;">
        <br><br>

        <div>
            <fieldset style="margin:auto; width:1000px; height:700px; border:1px solid">
                <div style="font-size:22px; margin:10px;font-weight:bold;">[경복궁역] 한옥카페'그리다꿈'</div>
                <div style="float:right; margin-right:20px;">2020-11-10</div>
                <div style="margin:10px;">
                    user01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;종로구
                </div>
                <hr>
                <div style="font-size:15px; margin:10px;">
                    <div style= "width:452px; height:300px;  position:absolute" >
                         <img  width="450" height="290" src="resources/예시3.jpg" alt="">
                    </div>    
                </div>
                <div class="slide">
                    <div id="back"><img src="resources/images/admin/left.png" alt=""></div>
                    <ul>
                        <li>
                                <img src="resources/예시3.jpg"  width="490" height="300">
                        </li>
                        
                        <li>
                                <img src="resources/예시3.jpg"  width="490" height="300">
                        </li>
                        <li>
                            <img src="resources/예시3.jpg"  width="490" height="300">
                        </li>
                    </ul>
                    <div id="next"><img src="resources/images/admin/right.png" alt=""></div>
                </div>
                <br>
                <ul>
                    <li>공간 유형 : 스터디룸</li>
                    <li>예약 시간 : 최소 1시간부터</li>
                    <li>수용 인원 : 방별로 다름</li>
                    <li>장비 및 주의사항 :  </li>
                    <li>휴무일 : 월, 화</li>
                    <li>편의시설 : 컴퓨터, 와이파이, 에어컨</li>
                    <li>영업시간 : 00 : 00 ~ 23 : 00</li>
                    <li>기본가격 : 시간당 7000원</li>
                </ul>
                
            </fieldset>
            <div style="width:1000px; margin:auto">
                <hr>
                    <button style="float:right" class="btn btn-secondary">목록으로</button>
                    <br>
                    <button style="margin-left:470px;" class="btn btn-danger">삭제</button>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            var imgs;
            var img_count;
            var img_position = 1;

            imgs = $(".slide ul");
            img_count =imgs.children().length;

            $("#back").click(function(){
                back();
            });
            $("#next").click(function(){
                next();
            });
            function back(){
                if(1<img_position){
                    imgs.animate({
                        left:'+=530px'
                    });
                    img_position--;
                    console.log(img_position)
                }
            }
            function next(){
                if(img_count>img_position){
                    imgs.animate({
                        left:'-=530px'
                    });
                    img_position++;
                    console.log(img_position)
                }
            }
        });
    </script>
</body>
</html>