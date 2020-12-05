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
        <div style="font-size:20px; margin-left:20px; margin-top:11px;">FAQ</div>
        <hr style="background:ligthgrey;">
        <br><br>

        <div style="margin:auto; width:1000px;">
            <fieldset style="width:1000px; height:300px; border:1px solid">
                <div style="font-size:22px; margin:10px; font-weight:bold;">${ f.faqTitle }</div>
                <div style="float:right; margin-right:20px;">${ f.enrollDate }</div>
                <div>&nbsp;</div>
                <hr>
                <div style="font-size:15px; margin:10px;">
					${ f.faqContent }
                </div>
            </fieldset>
            
            <hr style="width:1000px;">
            <button style="float:right;" class="btn btn-secondary" onclick="history.back()">목록으로</button><br>
            <button style="margin-left:450px;" class="btn btn-danger" onclick="if(confirm('삭제하시겠습니까?')){location.href='delete.fad?fno=${f.faqNo}'}">삭제</button>
            <button style="" class="btn btn-primary" onclick="updateForm();">수정</button>
        </div>
    </div>
    <form action="" method="post" id="update">
    	<input type="hidden" name="fno" value="${ f.faqNo }">
    </form>
    <script>
    function updateForm(){
    	$("#update").attr("action", "updateForm.fad").submit();
    }
    
    </script>
</body>
</html>