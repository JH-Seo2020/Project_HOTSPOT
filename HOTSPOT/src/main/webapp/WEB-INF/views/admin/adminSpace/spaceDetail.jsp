<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .slide{
        width:490px;
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
    #back img{
        position:absolute;
        top:150px;
        margin-left:40px;
        cursor: pointer;
        z-index:1;
        width:40px;
        opacity:0.7;
    }
    #next img{
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
	
	<jsp:include page="../../common/sidebar.jsp"/>
	<div class="outer">
        
        <br>
        <div style="font-size:20px; margin-left:20px;">공간관리</div>
        <hr style="background:ligthgrey;">
        <br><br>

        <div>
            <fieldset style="margin:auto; overflow:auto; width:1000px;  border:1px solid">
                <div style="font-size:22px; margin:10px;font-weight:bold;">${ s.spcName }</div>
                <div style="float:right; margin-right:20px;">${s.enrollDate}</div>
                <div style="margin:10px;">
                    user01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;${ s.mapLocation }
                </div>
                <hr>
                <div style="font-size:15px; margin:10px;">
                    <div style= "width:452px; height:300px; display:inline-block; position:absolute;" >
                         <img  width="450" height="290" src="${ s.spcChimg }" alt="">
                    </div>    
                </div>
                <div class="slide">
                    <div id="back"><img src="resources/images/admin/left.png" alt=""></div>
	                    <ul>
                    <c:forEach var="s" items="${ list }">
	                        <li>
	                                <img src="${ s.spcImg }"  width="490" height="300">
	                        </li>
                    </c:forEach>
	                    </ul>
                    <div id="next"><img src="resources/images/admin/right.png" alt=""></div>
                </div>
                <br>
                <ul>
                    <li>공간 유형 : ${ s.spcType }</li>
                    <li>수용 인원 :${s.spcMin} ~ ${ s.spcMax }명</li>
                    <li>주의사항 :
                    	<ol>
                    		<c:forEach var="n" items="${ nList }">  
                    			<li>${ n.spcTag }</li>
                    		</c:forEach>
                    	</ol>
                    </li>
                    
                    <c:choose>
                    	<c:when test="${ empty s.spcHoliday }">
                    		<li>휴무일 : 없음</li>
                    	</c:when>
                    	<c:otherwise>
                    		<li>휴무일 : ${ s.spcHoliday }</li>
                    	</c:otherwise>
                    </c:choose>
                    <li>편의시설 : ${ s.spcCon }</li>
                    <li id="hours">영업시간 : ${ s.spcHours.replace(",", "~") }</li>
                    <li>기본가격 : 시간당 <fmt:formatNumber value="${ s.spcPrice }" groupingUsed="true"/>원</li>
                    
                    <li>공간 소개 : ${s.spcLong }</li>
               
                    
                </ul>
                
            </fieldset>
           
            <div style="width:1000px; margin:auto">
                <hr>
                    <button style="float:right" class="btn btn-secondary">목록으로</button>
                    <br>
                    <button style="margin-left:470px;" class="btn btn-danger" onclick="location.href='delete.sad?sno=${s.spcNo}'">삭제</button>
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

            $("#back img").click(function(){
                back();
            });
            $("#next img").click(function(){
                next();
            });
            function back(){
                if(1<img_position){
                    imgs.animate({
                        left:'+=528px'
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