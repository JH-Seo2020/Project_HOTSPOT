<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .btn-purple{
        background-color: rebeccapurple !important; 
        border: none; 
        color: white !important; 
    }
    #successWrap{
        margin: auto;
        width: 1200px;
        height: auto;
        text-align: center;
        padding: 10%;
    }
    p{
        font-size: 50px;
    }
</style>
</head>
<body>
	<!-- 메뉴바 -->
    <jsp:include page="../../common/menubar.jsp"/>

    <div id="successWrap">
        <p>성공적으로 결제 완료되었습니다! <br>
        마이페이지에서 확인하실래요?</p>
        <br>
        <a href="myReserv.re?currentPage=1" class="btn btn-purple btn-lg btn-block">나의 예약 리스트 확인하기</a>
    </div>
    
    <!-- 푸터 -->
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>