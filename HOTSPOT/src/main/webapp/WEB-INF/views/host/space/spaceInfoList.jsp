<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/hostMenubar.jsp"/>
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
</style>
<body>

	<jsp:include page="../common/hostMenubar.jsp"/>
	<jsp:include page="../common/subMenubar.jsp"/>
	
	<div style="position: absolute; top:50px; left:50px">
    	<div align="left" id="noticebar" style="margin-left: 300px;">
        	<img src="resources/images/logo_letter_1.png">
        	<label style="color: yellowgreen; font-size: large ;">내 공간 정보</label><hr>
    	</div>
		
		<c:forEach var="b" items="test">
    	<div class="MySpaceInfo"> 
        	<img>
        	<label for="">[경복궁역] 한옥카페 '그리다 꿈'</label>
        	<p>종로구|#한옥카페 #그리다꿈 #궁궐뷰카페</p>
        	<span>10,000원/시간</span> 
        	<img src="resources/images/common/main_reviewicon.png" id="reviewIcon"><label for="reviewIcon">10</label> 
        	<img src="resources/images/common/main_wishicon.png" id="wishIcon"><label for="wishIcon">7</label>
        	<br>
        	<button>공간 정보 수정</button>
        	<button>공간 삭제</button>
    	</div>
		</c:forEach>
	</div>


<body>

</body>
</html>