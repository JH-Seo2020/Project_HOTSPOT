<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/sidebar.jsp"/>
	<div class="outer">
        
        <br>
        <div style="font-size:20px; margin-left:20px;">공지사항</div>
        <hr style="background:ligthgrey;">
        <br><br>

        <div style="margin:auto; width:1000px;">
            <fieldset style="width:1000px; height:300px; border:1px solid">
                <div style="font-size:22px; margin:10px; font-weight:bold;">${ n.noticeTitle }</div>
                <c:choose>
                	<c:when test="${ empty n.modifyDate  }">
	                	<div style="float:right; margin-right:20px;">${ n.createDate }</div>
	                </c:when>
	                <c:otherwise>
	                	<div style="float:right; margin-right:20px;">${ n.modifyDate }</div>
	                </c:otherwise>
                </c:choose>
	                <div style="margin:10px;">${ n.noticeWriter }</div>
                <hr>
                <div style="font-size:15px; margin:10px;">
					${ n.noticeContent }
                </div>
            </fieldset>
            
            <hr style="width:1000px;">
            <button style="float:right;" class="btn btn-secondary">목록으로</button><br>
            <button style="margin-left:450px;" class="btn btn-danger">삭제</button>
            <button style="" class="btn btn-primary">수정</button>
        </div>
    </div>
</body>
</html>