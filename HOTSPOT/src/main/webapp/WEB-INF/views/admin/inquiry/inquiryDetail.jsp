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
                <div style="font-size:22px; margin:10px;font-weight:bold;">환불은 언제쯤 되나요?</div>
                <div style="float:right; margin-right:20px;">2020-11-10</div>
                <div style="margin:10px;">user01</div>
                <hr>
                <div style="font-size:15px; margin:10px;">따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의</div>
            </fieldset>
            <br><br>
            <div style="width:1000px; margin:auto;" id="inquireForm">
                <form action="">
                    <textarea name="" id="" cols="136" rows="10" style="resize:none; font-size:15px;" >
 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의
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