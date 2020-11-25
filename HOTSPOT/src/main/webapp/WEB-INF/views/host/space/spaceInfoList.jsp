<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/host/spaceEnrollForm.css" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
   label{
       font-weight: bolder;
   }
        #hostSpaceList{
            width: 100%;
            height: 100%;
            
        }
        #hostSpaceGroup{
            width: 1200px;
            height: 90%;
            padding-top: 6%;
            text-align: center;
            margin: auto;
        }
        .todaySpace{
            display: inline-block;
            padding: 0 0 4% 4%;
            width: 30%; 
            height: 80%;
        }
        .todaySpace>img{
            width: 100%;
            height: 90%;
            border: 5px solid lightgray;
           -webkit-transition: all 1s ease;
		   -moz-transition: all 1s ease;
		   -o-transition: all 1s ease;
		   -ms-transition: all 1s ease;
		   transition: all 1s ease;
		   margin-bottom:5%;
        }
        .todaySpace>img:hover{
		   -webkit-filter: brightness(50%);
		   filter: brightness(50%);
		    transform: scale(1.03);
        } 
        .img_hotspotLogo{
			width: 15px;
			height: 15px;
			margin-right: 5px;
		}
		#spaceInsert{
			position: absolute;
			right:100px;
            width: 200px;
            height: 40px;
			
		}
		
</style>
<body>

	<jsp:include page="../common/hostMenubar.jsp"/>
	<jsp:include page="../common/subMenubar.jsp"/>
	
	<div style="position: absolute; top:50px; left:50px">
    	<div align="left" id="noticebar" style="margin-left: 300px;">
        	<img src="resources/images/logo_letter_1.png">
        	<label style="color: yellowgreen; font-size: large ;">내 공간 정보</label><hr>
    	</div>
		
    	<div id="hostSpaceList">
        	<div id="hostSpaceGroup">
        		<c:forEach var="b" items="${spaceList }">
        		
        			<!-- 위치 자르기 (앞에서 두글자) -->
        		<c:set var="location" value="${b.location}" />
        		<c:set var="location2" value="${fn:substring(location,0,2)}" />
        		
		           <div class="todaySpace">        	
		            	<img src="${b.spcChimg }" onclick="move(${b.spcNo})">	
		               	<div style="font-weight: bold; font-size: 20px;">[${b.spcName }]</div>
		               	<div style="color:gray;">${location2} | #${b.spcTag }</div>
		            	<div>
		                	<span style="color: rebeccapurple; font-weight: bold;">${b.spcPrice }원/시간</span>
		                	<span class="badge badge-pill badge-warning"><img class="img_hotspotLogo" src="resources/images/common/main_reviewIcon.png">후기 ${b.reviews }개</span>
		                	<span class="badge badge-pill badge-warning"><img class="img_hotspotLogo" src="resources/images/common/main_wishIcon.png">관심 ${b.wishes }개</span>
		            	</div>
		            	<br>
		            	<button class="btn btn-primary" id="spaceModify"  onclick="location.href='ㅁㄴㅇ'">공간 정보 변경</button>
		            	<button class="btn btn-danger" id="spaceDelete" style="margin-left: 30px;" onclick="location.href='ㅁㄴㅇ'">공간 정보 삭제</button>
		            </div>
		            
        		</c:forEach>
        	</div>
        	
        	<button class="btn btn-primary" id="spaceInsert"  onclick="location.href='ㅁㄴㅇ'">공간 정보 등록</button>
    	</div>
	</div>


<body>

</body>
</html>