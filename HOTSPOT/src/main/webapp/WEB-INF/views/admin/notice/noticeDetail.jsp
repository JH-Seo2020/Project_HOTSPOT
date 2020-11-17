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
                <div style="font-size:22px; margin:10px; font-weight:bold;">1:1문의 채팅봇 서비스 시작</div>
                <div style="float:right; margin-right:20px;">2020-11-10</div>
                <div style="margin:10px;">관리자</div>
                
                <hr>
                <div style="font-size:15px; margin:10px;">
                    안녕하세요 핫스팟 회원 여러분 관리자입니다.
                    따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의
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