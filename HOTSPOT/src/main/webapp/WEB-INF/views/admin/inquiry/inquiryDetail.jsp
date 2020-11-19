<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
         #inquireForm>form{
             display:inline
         }
     </style>
</head>
<body>
	<jsp:include page="../../common/sidebar.jsp"/>
<div class="outer">
        
        <br>
        <div style="font-size:20px; margin-left:20px;">1:1문의</div>
        <hr style="background:ligthgrey;">
        <br><br>

        <div>
            <fieldset style="margin:auto; width:1000px; height:300px; border:1px solid">
                <div style="font-size:22px; margin:10px;font-weight:bold;">${ i.inquiryTitle }</div>
                <div style="float:right; margin-right:20px;">${ i.enrollDate }</div>
                <div style="margin:10px;">${ i.inquiryWriter }</div>
                <hr>
                <div style="font-size:15px; margin:10px;">${ i.inquiryContent }</div>
            </fieldset>
            <br><br>
            <div style="width:1000px; margin:auto;" id="inquireForm">
                <form action="">
                    <textarea name="" id="" cols="140" rows="10" style="resize:none; font-size:15px;" >
${ i.inquiryReply }
                    </textarea>
                    <hr>
                    <button style="float:right" class="btn btn-secondary">목록으로</button>
                    <br>
                    <button style="margin-left:420px;" class="btn btn-danger">삭제</button>
                    <button style="margin-left:30px;"class="btn btn-primary">답변하기</button>
                    
                </form>
            </div>
        </div>
    </div>
</body>
</html>