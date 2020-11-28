<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#gotoHomepage{
    background: rgb(255, 230, 0);
    border: 0;
    font-weight: bold;
    width: 300px;
    height: 60px;
    border-radius: 100px;
    box-shadow: 3px 3px 3px 3px rgba(39, 39, 39, 0.582);
}
</style>
</head>
<body>

    <jsp:include page="menubar.jsp"/>

    <br>
    <div align="center">
    	<br>
        <h1 style="color: gray;">&nbsp;${ errorMsg }</h1><br>
        <img src="resources/images/404error.jpg" width="90%">
        <br><br>
        <button type="button" id="gotoHomepage" class="btn btn-warning" onclick="location.href='/hotspot'">메인페이지로 이동</button>
    </div>
    <br><br><br><br>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>