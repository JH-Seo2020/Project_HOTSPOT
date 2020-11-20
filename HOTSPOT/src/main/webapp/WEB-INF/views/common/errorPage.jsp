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
}
</style>
</head>
<body>

    <jsp:include page="menubar.jsp"/>

    <br>
    <div align="center">	
        <h1>죄송합니다!</h1><br>
        <img src="resources/images/errorPage.jpg" width="70%">
        <br><br>
        <h1 style="font-weight:bold">${ errorMsg }</h1><br>
        <button type="button" id="gotoHomepage" class="btn btn-warning">메인페이지로 이동</button>
    </div>
    <br>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>