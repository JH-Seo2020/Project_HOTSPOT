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
        <div class="adminNotice" style="width:1000px; margin:auto;">
            <form action="insert.fad">
                <select name="faqType" id="">
                    <option value="이용후기 및 작성">이용후기 및 작성</option>
                    <option value="예약 및 결제">예약 및 결제</option>
                    <option value="취소 및 환불">취소 및 환불</option>
                    <option value="기타">기타</option>
                </select>
                
                
                <input type="text" name="faqTitle" style="width: 100%; margin-bottom:20px;"
                placeholder="제목입력" class="form-control" required> 
                <input type="hidden" name="faqWriter" value="${ loginUser.userId }">
                <textarea  id="summernote" name="faqContent" required></textarea>
                <br>
                <button type="reset" class="btn btn-secondary" style="margin-left:380px;">취소하기</button>
                <button type="submit" class="btn btn-primary" style="margin-left:50px;">등록하기</button>
            </form>
        </div>
            <script>
            $(function(){
                $('#summernote').summernote({
                        tabsize : 2,
                        maxHeight : 500,
                        minHeight: 500
                    });

            }) 
        </script>
    </div>
</body>
</html>